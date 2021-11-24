# \[LF\_银行账户\_存管账户_交易控制]

## 1.检查及系统配置获取

> - 如果@action_in == 0,source_flag= ‘0’(券商发起),且@check_synchro不为'1',说明未开通向银行同步的功能,直接**报错返回:该证券发起业务没有开通向银行同步功能**
>
> - 获取系统配置@str_config_1250,获取柜台类型@counter_type
> - 获取账户节点@sysnode_id_u

## 2.如果@trans_type为AB,AX,AC,AU,AF,AW其中之一

> 1. AS\_存管公用_多项银行配置获取,包括获取以下银行配置位:
>    1. @config5371_char,
>    2. @config5357_char,
>    3. @config5372_char,
>    4. @config5376_char
>    5. @config5377_char
>    6. @config5378_char
>    7. @config5381_char
>    8. @config5392_char
>    9. @config5367_char
>    10. @config5408_char
>    11. @config5429_char
>    12. @config5433_char
>    13. @config5434_char
>    14. @config5456_char

## 3.如果@trans_type为AB,AX,AC,AU,AF其中之一

1. 如果source_flag = '1'(银行发起),5378配置为1,@account_type为0-资产账号,@client_account的第一位为0:则**报错:[无此账户,账户带前导0!]**

2. 如果@counter_type 为0,instr(@str_config_1250, @organ_flag) > 0,则进行机构端的数据检查

3. 否则进行:[AS\_银行账户\_存管账户_开户已开通存管账号检查] [char_config = @config5433_char] 的检查

   > [AS\_银行账户\_存管账户_开户已开通存管账号检查]入参char_config = @config5433_char
   >
   > 1. \[AF\_银行账户\_存管账户\_是否已开通存管银行账号校验][rowcount=@rowcount]
   >
   >    > check_kind : '0'检查是否正常 '1'检查是否冻结 '2'检查是否挂失 '3'检查是否销户 '9' 不校验状态
   >    >
   >    > 如果check_kind为' '或不为'1',则查询
   >    >
   >    > ```plsql
   >    > select count(*) into @rowcount 
   >    >                  from bankexchaccount 
   >    >                 where fund_account = @fund_account 
   >    >                   and bank_no      = @bank_no 
   >    >                   and money_type = @money_type
   >    >                   and bkaccount_status != '3'          --不为3(销户)
   >    >                   and ((@trans_type in ('AX','AU','AF') and bkaccount_regflag='2') or 
   >    >                        (@trans_type in ('AB','AC')))
   >    > ```
   >    >
   >    > 如果check_kind为'1',则查询
   >    >
   >    > ```plsql
   >    > select count(*) into @rowcount 
   >    >                  from dual 
   >    >                 where exists (select *
   >    >                                 from bankexchaccount
   >    >                                where fund_account = @fund_account
   >    >                                  and bkaccount_status !='3')
   >    > ```
   >    >
   >    > 查询系统内是否存在有其他银行的银行账户**(疑问: 不用考虑其他银行的状态为3-销户的么,其他银行销户的是否系统内不维护)**
   >    >
   >    > 如果查询到则**报错返回:[该帐号已开通其它银行的转账,不允许再开通存管银行！]**
   >    >
   >    > ```plsql
   >    > select count(*) into @row_count 
   >    >                 from dual
   >    >                where exists(select *
   >    >                               from bankexchaccount 
   >    >                              where fund_account = @fund_account 
   >    >                                and bank_no != @bank_no        
   >    >                                and money_type=@money_type
   >    >                                and @trans_type in ('AX','AU','AB','AC','AF'))
   >    > if (@row_count > 0)
   >    > {
   >    >       [函数报错返回][该帐号已开通其它银行的转账,不允许再开通存管银行！]
   >    > }
   >    > ```
   >    >
   >    > @row_count = 0;
   >    >
   >    > 如果@source_flag为'1',@trans_type为'AX'：（如果是银行发起签约开户，则校验该账户是否存管预指定或者已签约的银行账号）
   >    >
   >    > ```plsql
   >    > select count(*) into @row_count 
   >    >                  from dual
   >    >                 where exists (select 1 
   >    >                                 from bankexchaccount
   >    >                                where fund_account = @fund_account
   >    >                                  and bank_no = @bank_no
   >    >                                  and (money_type = @money_type or money_type = '0')
   >    >                                  and bkaccount_kind = '0'
   >    >                                  and bkaccount_status <> '3')
   >    > if(@row_count > 0)
   >    > {
   >    >   [函数报错返回][ERR_ASSET_BANKEXCHACCOUNT_EXISTS][储蓄银行账户表记录已存在][@fund_account, @bank_no, @money_type]
   >    > }
   >    > ```
   >    >
   >    > 如果@trans_type为('AB,AX,AC,AF')其中之一,char_config 表示5433银行配置位,为0则不允许同一客户不同资产账户在不同银行开立三方存管
   >    >
   >    > ```plsql
   >    > select count(*) into @row_count 
   >    >                  from dual
   >    >                 where exists (select 1 
   >    >                                 from bankexchaccount
   >    >                                where client_id = @client_id
   >    >                                  and fund_account <> @fund_account
   >    >                                  and bank_no = @bank_no
   >    >                                  and ((((bank_account = @bank_account and @trans_type != 'AB') or trim(@bank_account) is null) and @char_config != '1'))
   >    >                                  and (money_type = @money_type or (money_type = '0' and trim(@money_type) is null))
   >    >                                  and bkaccount_kind = '0'
   >    >                                  and bkaccount_status <> '3')
   >    > if(@row_count > 0)
   >    > {
   >    >         [函数报错返回][ERR_ASSET_BANKEXCHACCOUNT_EXISTS][储蓄银行账户表记录已存在]
   >    > }
   >    > 
   >    > if ('0' == @char_config)
   >    > {
   >    >    select count(*) into @rowcount_t
   >    >                    from bankexchaccount a
   >    >                   where a.bank_no = @bank_no
   >    >                     and a.fund_account <> @fund_account
   >    >                     and a.client_id = @client_id
   >    >                     and bkaccount_status <> '3'
   >    >                     and bkaccount_kind = '0'
   >    >                     and (money_type = @money_type or (money_type = '0' and trim(@money_type) is null))
   >    >     if (@rowcount_t > 0)
   >    >     {
   >    >           [函数报错返回][ERR_ASSET_SAMECLIENT_OTHERACCO_OPEND][此客户其他资产账户已在此银行开通存管户，不允许再开]
   >    >     }
   >    > }
   >    > else if ('1' == @char_config)
   >    > {
   >    >    --5435:存管账户开户时是否启用股票质押资金专户特殊控制模式
   >    >    --获取银行配置位@char_config_5435,银行配置位5433配置为1时，继续根据配置位5435检查是否进行股票质押资金专户特殊控制模式
   >    >    if ('1' == @char_config_5435)
   >    >    {
   >    >        [AF_交易账户公用_资产账户信息获取][fund_account = @fund_account, client_rights = @client_rights]
   >    >        if (!(instr(@client_rights, '@') > 0))
   >    >        {
   >    >            select count(*) into @row_count
   >    >                  from bankexchaccount a, fundaccount b
   >    >                 where a.client_id = @client_id
   >    >                   and a.fund_account = b.fund_account
   >    >                   and a.client_id = b.client_id
   >    >                   and a.fund_account <> @fund_account
   >    >                   and instr(b.client_rights, '@') <= 0
   >    >                   and a.bank_no = @bank_no
   >    >                   and a.bkaccount_status <> '3'
   >    >                   and a.bkaccount_kind = '0'
   >    >                   and (money_type = @money_type or (money_type = '0' and trim(@money_type) is null))
   >    >        }
   >    >        if (@row_count > 0)
   >    >           [函数报错返回][ERR_ASSET_SAMECLIENT_OTHERACCO_OPEND][此客户其他资产账户已在此银行开通存管户，不允许再开]
   >    >    }
   >    > }
   >    > ```
   >
   > 2. \[AF\_银行账户\_存管账户\_存管银行账号重复性检查][row_count=@row_count]
   >
   >    > ```plsql
   >    >   --检查是否有一个银行账户对应多个客户编号的情况
   >    >   @row_count = 0;
   >    >   if('1' == @source_flag )
   >    >   {
   >    > 	 [PRO*C语句][select count(*) into @row_count 
   >    > 		          from dual
   >    > 		         where exists (select 1 from bankexchaccount 
   >    > 		            			where client_id <> @client_id
   >    > 		              			and bank_no = @bank_no
   >    > 		              			and bank_account = @bank_account
   >    > 		              			and (money_type = @money_type or money_type = '0') 
   >    > 		              			and bkaccount_kind = '0'
   >    > 		              			and bkaccount_status <> '3')
   >    > 		              		    and @trans_type in ('AX','AU','AF')]
   >    > 	  {
   >    > 	  
   >    > 	  }
   >    > 	  else
   >    > 	  {
   >    > 	    [PRO*C函数报错返回][ERR_ASSET_QRY_BANKEXCHACCOUNT_FAIL][查询储蓄银行账户表失败][@client_id, @bank_no, @money_type]
   >    > 	  }	  
   >    >   }
   >    > ```

4. 检查点

   > ```c++
   > //银行参数配置5408未勾选时，银行发起签约开户才需要校验该客户号下的其他资产账号是否已开通该银行的银行账号
   > if('1' == @source_flag && (hs_strcmp(@trans_type, "AX") == 0 || hs_strcmp(@trans_type, "AF") == 0))
   > {
   >       //20180425 liufei mod 增加row_count_t的判断，支持机构柜台客户操作 修改单：M201804130244
   >       //if(@row_count > 0 && @config5408_char !='1')
   >       if((@row_count > 0 || @row_count_t > 0)  && (@config5408_char !='1'))
   >       {
   >         [函数报错返回][ERR_ASSET_BANKEXCHACCOUNT_EXISTS][储蓄银行账户表记录已存在][@client_id, @bank_no, @money_type]
   >       }
   > }
   > //20070412 liujc 默认不允许银行发起重复签约，除非打开5367配置
   > //20180425 liufei mod 机构柜台客户需要查询机构和零售两边的数据 修改单：M201804130244
   > //if (@rowcount >0 && @config5367_char !='1')
   > if ((@rowcount >0 || @rowcount_t >0) && (@config5367_char !='1'))
   > {
   >       [自定义函数报错返回][ERR_ASSET_BANKEXCHACCOUNT_EXISTS][此账号的存管银行账号已开通!][@fund_account, @bank_no, @trans_type, @bank_account]
   > }
   > ```

5. 如果@counter_type 为0,instr(@str_config_1250, @organ_flag) > 0,则进行机构端的数据检查

6. 否则进行\[AS\_银行账户\_存管账户\_开户已发生业务流水检查]

   >\[AS\_银行账户\_存管账户\_开户已发生业务流水检查]
   >
   >- 判断其它银行号的转账是否存在，如存在，则不允许开户，只判断请求状态为:未报，待报，已报，待冲正的转账流水
   >
   >```plsql
   >select nvl(count(*),0) into @rowcount 
   >               from dual where exists(select * from banktransfer 
   >                                       where (fund_account = @fund_account)  
   >                                         and bank_no != @bank_no 
   >                                         and (money_type = @money_type or @money_type = '!')
   >                                         and trans_type in ('01','02','35','36') 
   >                                         and @bktrans_status in ('0', '1', '4', '7', 'P'))
   >                                         
   >if (@rowcount > 0 )
   >{
   >    [自定义函数报错返回][ERR_ASSET_BANKTRANSFER_OTHERTRANS_EXISTS][该账号当天有其它行的转账流水不允许开户！]
   >}
   >```
   >
   >- 判断是否有其他银行的开户流水信息
   >
   >```plsql
   >--为支持当日同一客户，当日开存管户后再销户，再开其他银行的存管户，此处的判断修改为判断时候存在未确定的不同银行的开户流水,而不是作废的其他银行的开户流水
   >select nvl(count(*),0) into @rowcount 
   >               from dual where exists(select * 
   >                                        from banktransfer 
   >                                        where (fund_account = @fund_account)  
   >                                          and bank_no != @bank_no 
   >                                          and (money_type = @money_type or @money_type = '!')
   >                                          and trans_type in ('AB','AX','AC','AU','AF')
   >                                          and bktrans_status in('0','1','P' ))
   >if (@rowcount > 0 )
   >  {
   >    [自定义函数报错返回][ERR_ASSET_BANKTRANSFER_OTHEROPENEXISTS][该账号当天有其它银行的存管开户流水不允许该账户进行此银行的存管开户！]
   >  }
   >```
   >
   >- 支持多账户存管，判断同一客户下的其他资产账户是否存在同一银行的未回报开户流水, 有则不允许在该银行开存管户
   >
   >```plsql
   >select nvl(count(*),0) into @rowcount 
   >               from dual where exists(select * 
   >                                        from banktransfer 
   >                                        where client_id = @client_id
   >                                          and fund_account != @fund_account  
   >                                          and bank_no = @bank_no 
   >                                          -- 20160425 chenhl mod 允许同一客户签约同一银行的不同银行账户，修改单：M201604220645
   >                                          and (bank_account = @bank_account or (trim(@bank_account) is null))
   >                                          and (money_type = @money_type or @money_type = '!')
   >                                          and trans_type in ('AB','AX','AC','AU','AF') 
   >                                          and bktrans_status in('0','1','P' ))
   >if (@rowcount > 0 )
   >{
   >    [自定义函数报错返回][ERR_ASSET_CUST_IS_OPEN_ASSETOPEN_LMT_REOPEN][当前客户此银行已经申请存管开户，不允许再申请]
   >}
   >```

7. 资金检查

   > ```C++
   > //5357 存管开户不允许带资金签约,默认允许带资金签约
   > //5381 透支账户允许开存管户,默认不允许 0
   > //5392 有支票余额允许开存管户 0 - 否(默认); 1 - 是
   > if ('1' == @config5357_char || '0' == @config5381_char || '0' == @config5392_char)
   > {
   >     if (@counter_type == '0' && instr(@str_config_1250, @organ_flag) > 0)
   >     {
   >       @sysnode_id_o = @sysnode_id;
   >       [AS_机构柜台查询接口_机构柜台数据查询校验][sysnode_id = @sysnode_id_u, function_no = 2102201, current_balance = @current_balance, check_balance = @check_balance]
   >       @sysnode_id = @sysnode_id_o;
   >     }
   >     else
   >     {
   >       //取fund表的current_balance-当前余额和check_balance-支票余额
   >       [AS_存管公用_存管资金信息获取][current_balance = @current_balance, check_balance = @check_balance]
   >     }
   >     if (@current_balance > 0 && '1'==@config5357_char )
   >       [自定义函数报错返回][ERR_ASSET_BALANCENOTNULL_NOTHIRDOPEN][该帐号资金余额不为0,该银行不允许带资金存管开户！]
   >     if (@current_balance < 0 && '0'==@config5381_char )
   >       [自定义函数报错返回][ERR_ASSET_FUNDRUNOUT_NOTHIRDOPEN][该帐号为透支户,不允许存管开户！]
   >     if (@check_balance > 0 && '0' == @config5392_char)
   >       [自定义函数报错返回][ERR_ASSET_CHECKNOTNULL_NOTHIRDOPEN][该账户有支票余额,不允许存管开户！]
   > }
   > ```

8. 银行配置位5375和5456检查

   > ```c++
   > //5375:当天存管销户允许再开存管户,默认不允许
   > //5456:当天存管销户是否允许再存管开户（客户编号维度），0-允许（默认），保持原逻辑；1-不允许
   > if (@counter_type == '0' && instr(@str_config_1250, @organ_flag) > 0)
   > {
   >   @sysnode_id_o = @sysnode_id;
   >   [AS_机构柜台查询接口_机构柜台数据查询校验][sysnode_id = @sysnode_id_u, function_no = 2145210, config_no = 5375, config_value = @config5375_char]
   >   @sysnode_id = @sysnode_id_o;
   >   }
   > else
   > {
   >   [AS_银行账户_存管账户_银证杂项配置校验][config_no = 5375, config_value = @config5375_char]
   >   //20210903 zhangpf mod 增加5456银行配置位校验,当天存管销户是否允许再存管开户（客户编号维度） 修改单:M202107260130
   >   [AS_银行账户_存管账户_银证杂项配置校验][config_no = 5456, config_value = @config5456_char]
   > }
   > ```

9. 获取客户的机构标志-@organ_flag

10. 如果 ('0' == @config5372_char)&&('0' == @id_kind && isnull(trim(@id_no))!=0 && @organ_flag == '0') ,

    5372银行配置位，检查判断证件号（仅指身份证）是否重复

    ```
    select count(*)
    		       into @rowcount  
    		       from dual 
    		      where exists (select fund_account,branch_no
    		                      from bankexchaccount 
    		                     where (fund_account != @fund_account)  
    		                       and (bank_no = @bank_no) 
    		                       and (money_type = @money_type or @money_type = '!')
    		                       and (id_no=@id_no or id_no=@id_no_t ) 
    		                       and (id_kind = '0'))
    if (@rowcount > 0)
    {
      [自定义函数报错返回][ERR_ASSET_ID_USED_NOTHIRDOPEN][该账号有相同证件的其它账号的银行存管开户!请检查身份证重复的账户!]
    }
    ```

11. 银行发起身份确认(trans_type为AU时),检查客户状态,检查5371配置

    > 1. 执行\[AS_银行账户\_资产账户信息获取],检查资产账户状态fundacct_status等内容
    >
    > 2. 执行\[AS\_银行账户\_存管账户\_银证杂项配置校验]
    > 3. 5371银行配置位控制
    >
    > ```plsql
    > --5371 证券发起存管开户不开通存管账号（由签约开通）
    > if (5371==@config_no&& @config_value=='0')--5371配置为1
    > {
    >   select nvl(count(*),0) into @rowcount
    >                          from dual 
    >                          where exists(select * 
    >                                         from bankexchaccount 
    >                                         where fund_account = @fund_account 
    >                                           and bank_no = @bank_no 
    >                                           and (money_type = @money_type or @money_type = '!')  
    >                                           and bkaccount_status!='3')
    > 
    > }
    > 
    > if (0==@rowcount )
    > {
    >   //2013:ERR_BS_FUNDACCTANDBANKACCTNOCREATE 资金帐号与银行帐号未建立对应关系
    >   [自定义函数报错返回][ERR_BS_FUNDACCTANDBANKACCTNOCREATE][该账户还没有预指定，请先预指定开户后再做身份确认交易!
    > }
    > ```

12. 如果5376配置为1(5376：存管开户必需输入银行卡号，默认允许不输) 且为证券端发起,hs_strstr("AB,AX,AC,AU,AF", @trans_type) > 0, organ_flag为0或5377配置为0(5377:机构客户是否允许证券发起签约(含签约开户),默认允许)

    > 当@bank_account入参为空时,报错**返回:该银行配置存管开户不允许输入银行账户为空!**

13. 5377配置为1(5377:机构客户是否允许证券发起签约(含签约开户),默认允许),且organ_flag不为0,且为证券端发起签约业务时,**提示:该客户为机构客户，该银行配置不允许机构客户发起证券签约!**

14. 5429配置为1(5429:外币存管开户是否只允许两步式开户),money_type不为0-人民币&&( trans_type为AX-存管签约开户或为证券端发起的AU-存管身份确认),则**报错返回:该银行配置不允许存管一步式签约开户**

15. 如果5434配置为1(5434 存管账户、转账账户是否检查银行账号含有特殊字符，0-否(默认)，1-是。),且bank_account不为空,则使用hasspechar函数检查@bank_account是否包含特殊字符,包含则**提示报错:字段包含除字母和数字外的特殊字符**

16. 如果客户权限client_rights包括“`-H股全流通”,则获取2556配置(是否启用H股全流通业务),如果@char_config_2556不为1，或@char_config_2556=1但是money_type为2-港币,则**提示:H股全流通专用账户不允许开通存管账户**

17. 如果@source_flag不为1-银行发起，则进行银行开放营业部检查

    ```plsql
    select count(*)
                     into @row_count
                     from dual
                    where exists (select * from bankbranchlist
                                   where bank_no = @bank_no
                                     and ((money_type = @money_type) or (money_type = '!')))
                                     
    if(@row_count > 0)
    {
       [PRO*C语句][select count(*)
                     into @rowcount
                    from dual
                   where exists (select *
                                   from bankbranchlist
                                  where branch_no = @branch_no
                                    and (bank_no = @bank_no)
                                    and ((money_type = @money_type) or (money_type = '!')))]
       {
       }
       else
       {
         [函数报错返回][ERR_ASSET_QRY_BANKBRANCHLIST_FAIL][查询银行开放营业部列表失败]
       }
    
       if(@rowcount <= 0)
       {
          [函数报错返回][ERR_ASSET_BANKBRANCHLIST_NOTEXISTS][银行开放营业部列表记录不存在][@bank_no, @branch_no, @money_type]
       }
    }
    ```

## 4.如果@trans_type为AQ-存管客户结息



