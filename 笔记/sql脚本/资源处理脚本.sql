--用户表（唯一索引：operator_no,group_code2）
select a.*,a.rowid from hs_asset.iusertable a where a.operator_no like '43057%' or a.user_name like '%吴兴书%'
select a.*,a.rowid from hs_asset.iusertable a where a.operator_no in('28586', '28549', '42894', '42824', '32923', '38044', '36631')
select a.*,a.rowid from hs_asset.iusertable a where a.group_name  like '%UFT%';
select a.*,a.rowid from hs_asset.iusertable a where a.right_level != '1'

select a.*,a.rowid from hs_asset.iusertable a where a.group_code2 = 'elig' and (right_level = '2' or a.user_name like '张彦明' or a.user_name = '彭雪%')

select operator_no,count(*) from hs_asset.iusertable a group by a.operator_no having count(*) = 2
	123456	2	0	07585	elig	谭军	tanjun07585@hundsun.com	适当性BOP
业务集中运营平台 k
--产品表（唯一索引：product_name,group_code2）
select a.*,a.rowid from hs_asset.grouptoproduct a

--修改流水表(无索引)
select a.*,a.rowid from hs_asset.modrequestpubjour a

select a.*,a.rowid from hs_asset.stdfield a
-- 审核信息表（无唯一索引），
--1.普通客户提交申请时，录入一条数据，right_level为1
--2.一审人员处理后，录入审核意见和要修改的表名，如果申请修改表，则产生多条数据，right_level录入2
--3.二审人员处理后，录入审核意见和要修改的表名，如果申请修改表，则产生多条数据，right_level录入3
--4.执行录入right_level=99的一条数据
select a.*,a.rowid from hs_asset.reviewinfo a where a.mod_no = 'M202103181273';

-- 流水计数器
select a.*,a.rowid from hs_asset.acctserialcounter a where a.serial_counter_no = 182;
--申请流水表(和acctserialcounter表为1:1关系，serial_no一一匹配)
--nextlevel(下一状态)，business_status(当前状态)数据字典：1-初始状态，2-审核状态，3-处理状态
-- 修改单打回：则business_status:4,nextlevel:1
-- 一审状态：business_status:2,nextlevel:2
-- 二审状态: business_status:2,nextlevel:3
-- 待执行状态:business_status:3,nextlevel:-1
-- 执行完成状态:business_status:1,nextlevel:-1

--business_flag:0-新增，1-修改，2-删除，-1-处理完成
select a.*,a.rowid from hs_asset.requestpubjour a where a.mod_no like '%M202105122779%' order by a.serial_no asc;
select a.*,a.rowid from hs_asset.requestpubjour a where a.op_remark like '%菜单功能对照新增%' order by a.serial_no desc;

select a.serial_no,a.mod_no,a.*,a.rowid from hs_asset.menudir a where a.mod_no like '%_1' order by a.serial_no asc;
54883  55558  55559

select a.serial_no,a.mod_no,a.*,a.rowid from hs_asset.menudir a where a.mod_no like 'M202104021235%' order by a.serial_no asc;

select a.*,a.rowid from hs_asset.menudir a where a.serial_no = '55557'



  -- 防止错误剁手执行 --
select *;
-- business_flag：0:删除，1:新增，2:修改，-1:处理完成
--     打回申请人：business_status:4, nextlevel:1
--     一审状态：business_status:2, nextlevel:2
--     二审状态：business_status:2, nextlevel:3
--     待执行状态：business_status:3, nextlevel:-1
--     执行完成状态：business_status:1, nextlevel:-1
-- 实体表：
-- 流水
select c.serial_no,c.* from hs_asset.stdfield c where c.serial_no in (select a.serial_no  from hs_asset.requestpubjour a where mod_no = '&mod_no' ) 

select a.serial_no,a.* from hs_asset.stdfield a where order by a.serial_no desc;

select a.*,a.rowid from hs_asset.datadictionary a where a.dict_kind = 'D'
select a.*,a.rowid from hs_asset.requestpubjour a where mod_no like 'M202105200960%' order by serial_no desc, op_remark;
-- 数据库中列名称不能超过30
select length(field_name),a.*,rowid from hs_asset.stdfield a where length(field_name) > 30
--审核意见表
select a.*,a.rowid from hs_asset.reviewinfo a where a.mod_no = '&mod_no';

-- 所有实体
328182
select a.*,rowid from hs_asset.menufunc a where function_id like '32818_' or function_id like '250288'

select a.*,rowid from hs_asset.requestpubjour a where serial_no = '&mod_no' order by a.curr_date desc;
select a.*,b.operator_no,b.business_status,b.nextlevel,product_name from STDFIELD a, requestpubjour b where a.curr_date = 20210426 and a.serial_no = b.serial_no  and b.business_status = '2' and b.nextlevel = '2';
select a.*,b.operator_no,b.business_status,b.nextlevel,product_name from DATASUBITEM a, requestpubjour b where a.curr_date = 20210426 and a.serial_no = b.serial_no  and b.business_status = '2' and b.nextlevel = '2';
select max(serial_no) from hs_asset.requestpubjour where  OPERATOR_NO = '38887a';
select a.*,rowid from hs_asset.requestpubjour a where mod_no = '&mod_no' order by serial_no desc, op_remark;
select a.*,rowid from hs_asset.menudir a where mod_no =  '&mod_no' order by MENU_SITE ;--菜单
select a.*,rowid from hs_asset.funcdir a where mod_no =  '&mod_no';--功能
select a.*,rowid from hs_asset.menufunc a where mod_no =  '&mod_no';--菜单功能对照
select a.*,rowid from hs_asset.stdfield a where mod_no =  '&mod_no';--标准字段
select a.*,rowid from hs_asset.datasubitem a where mod_no =  '&mod_no';--字典子项
select a.*,rowid from hs_asset.datadictionary a where mod_no =  '&mod_no';--数据字典
select a.*,rowid from hs_asset.busiflag a where mod_no =  '&mod_no';--业务标志
select a.*,rowid from hs_asset.constantlist a where mod_no =  '&mod_no';--常量列表
select a.*,rowid from hs_asset.sysconfigure a where mod_no =  '&mod_no';--系统配置
select a.*,rowid from hs_asset.Standarderror a where mod_no =  '&mod_no';--标准错误号
select a.*,rowid from hs_asset.outsideerror a where mod_no =  '&mod_no';--外部错误号  
select a.*,rowid from hs_asset.auditfunction a where mod_no =  '&mod_no';--内存表

27	62934	20211008	31976	功能目录修改,申请人=31976,模块名称=股票期权因子风险管理(optfactorriskmgr),功能编号=683331,功能名称=期权行情推送更新	3	M202109233052	2	funcdir	-1	0	1	个股期权	AAAVVgAAFAAAtjjAAy
39	股票期权因子风险管理(optfactorriskmgr)	683331	期权行情推送更新	CNST_FUNCID_OPTFACTORRISKMGR_OPTPRICEPUSH_UPDATE	0	1	0	0	0	0	8	12	n	0	0	1	20211008 程松 申请 补齐之前未添加到功能号资源的功能号 修改单：M202109233052	 	0	2	M202109233052	62934	20211008	 	AAAVaiAAFAAABy1AAM

14053
select a.*,rowid from hs_asset.busiflag a where a.flag_no >= 14053 and a.flag_no <=14059

CNST_FUNCID_CBP_SECUBONDTRADE_INQUIRYEXT_QRY

select a.*,rowid from hs_asset.funcdir a where a.function_id in (683331)

select a.*,rowid from hs_asset.requestpubjour a where serial_no = 62831

select a.*,rowid from hs_asset.sysconfigure a where a.config_no = 70566

select a.*,rowid from hs_asset.sysconfigure a where a.config_no = 7753

select a.*,a.rowid from hs_asset.requestpubjour a where a.mod_no = '&mod_no' and mod_table = 'stdfield' and a.serial_no not in (select serial_no from hs_asset.stdfield c where a.mod_no = '&mod_no')

select a.*,rowid from hs_asset.stdfield a where field_name = 'polling_ctrlstr';
select a.*,rowid from hs_asset.sysconfigure a WHERE a.config_no = '7739'

select a.*,rowid from hs_asset.sysconfigure a where a.config_no like '70510'
select a.*,rowid from hs_asset.Standarderror a where a.errorno < 70268 order by errorno desc;
select a.*,rowid from hs_asset.requestpubjour a where a.op_remark like '%70430%'

15	57739	20210602	08329	菜单目录新增,申请人=08329,菜单标题=,菜单号=380906	1	M202105101009	-1	menudir	-1	0	0	多金融2.0	AAAVVgAAFAAAnF4AAU
select a.*,rowid from hs_asset.datadictionary a where a.dict_entry = 1351

select a.*,rowid from hs_user.hsfunction a where FUNCTION_ID like '21266_';
select a.*,rowid from hs_asset.funcdir a where a.function_id like '3328%'
select a.*,rowid from hs_asset.datasubitem a where a.dict_entry = '3094'
select a.*,rowid from hs_asset.menudir a where a.menu_site = '_'
select a.*,rowid from hs_asset.Standarderror a where a.errorno = 89086;
select a.*,rowid from hs_asset.outsideerror a where error_source =  '333002';--外部错误号 

27	62934	20211008	31976	功能目录修改,申请人=31976,模块名称=股票期权因子风险管理(optfactorriskmgr),功能编号=683331,功能名称=期权行情推送更新	3	M202109233052	2	funcdir	-1	0	1	个股期权	AAAVVgAAFAAAtjjAAy



select a.* from requestpubjour a where mod_no = 'M202104192398' and a.serial_no not in (select b.serial_no from menudir b where mod_no = 'M202103101043' )

-- 菜单功能对照
select a.*,rowid from hs_asset.menudir a where mod_no = 'M202101250849';
select a.*,rowid from hs_asset.funcdir a where a.FUNCTION_ID between '336063' and '336069'; 
select a.*,rowid from hs_asset.funcdir a where a.MOD_NO like 'M20210108044%'; 
select a.*,rowid from hs_asset.menufunc a where mod_no like '%M20210108044%' and a.FUNCTION_ID between '285323' and '330415'; 
select a.*,rowid from hs_asset.menufunc a where a.FUNCTION_ID between '51924' and '51924'; 
select a.*,rowid from hs_asset.menudir a where a.menu_id = '101837';
-- 打回
update hs_asset.requestpubjour a set a.business_status = '4', a.nextlevel = '1' where a.mod_no = 'M202101061664';
-- 序列号并发
select a.*,rowid from hs_asset.requestpubjour a where serial_no between 52889 and 52889;
select max(serial_no) from hs_asset.requestpubjour;
select a.* from hs_asset.acctserialcounter a 

--不一致
select a.*,a.rowid from requestpubjour a where mod_no = '&mod_no'  and mod_table = '&table_name';
select a.*,a.rowid  from outsideerror a where a.extern_code = '10258'

-- 标准字段
select a.*,a.rowid from hs_asset.requestpubjour a where mod_no = 'M202104262233' and a.op_remark like '标准字段%' order by serial_no desc;
select a.*,a.rowid from hs_asset.stdfield a where mod_no = 'M202104262233'; 
select a.*,a.rowid from hs_asset.stdfield a where a.field_name = 'tmp_op_query_limits';
-- 内存表
select a.*,rowid from hs_asset.requestpubjour a where   mod_no = 'TEST1119';
select a.*,rowid from hs_asset.auditfunction a where a.mod_no = 'M202011040920';
-- 数据字典 字典子项
select * from hs_asset.requestpubjour where mod_no = 'M202101140168';
select a.*,a.rowid from hs_asset.requestpubjour a where a.mod_no = 'M202012212222' and a.op_remark like '%数据字典子项%' order by serial_no desc;
select a.*,a.rowid from hs_asset.datasubitem a where a.mod_no = 'M202012212222';
select a.*,a.rowid from hs_asset.datadictionary a where mod_no = 'M202101051018';
select a.*,rowid from hs_asset.datasubitem a where a.dict_entry = '47000';

-- 通用数据 --
--business_flag: 0:删除，1:新增，2:修改，-1:处理完成
select a.*,rowid from hs_asset.requestpubjour a where op_remark like '%修改通用数据%' and curr_date >20210801;
select a.*,rowid from hs_asset.requestpubjour a where a.mod_no = 'M202109020850' and op_remark like '%修改通用数据%' and curr_date >20210301;
select t.*,t.rowid from hs_asset.currenthead t where t.mod_no =  'M202109020850' ;
select t.*,t.rowid from hs_asset.currencydata t where t.mod_no = 'M202109020850';
select t.*,t.rowid from hs_asset.currentinfo t where t.mod_no = 'M202109020850';
select a.*,rowid from hs_asset.requestpubjour a where   op_remark like '%修改通用数据%' and curr_date >20210301;
select t.*,t.rowid from hs_asset.currentinfo t where t.col_value = '3.0'
 mod_no = 'M202105170894' and
delete from hs_asset.requestpubjour t where t.mod_no =  '&mod_no' and op_remark = '修改通用数据';
delete from hs_asset.currenthead t where t.mod_no = '&mod_no';
delete from hs_asset.currencydata t where t.mod_no = '&mod_no';
delete from hs_asset.currentinfo t where t.mod_no = '&mod_no';

--

update hs_asset.currenthead t set business_flag = -1 where t.mod_no =  'M202107122850'  and business_flag <> '-1';
update hs_asset.currencydata t set business_flag = -1 where t.mod_no = 'M202107122850'   and business_flag <> '-1';
update hs_asset.currentinfo t set business_flag = -1 where t.mod_no = 'M202107122850'  and business_flag <> '-1';

-- 用户权限问题  elig  统一适当性
select a.*,rowid from hs_asset.requestpubjour a where a.operator_no = '13561' order by a.curr_date desc
select a.*,a.rowid from hs_asset.iusertable a where a.USER_NAME in ('吴巧强','张颂蘅','段雷霞','李国强','林涛', '梁士康') order by user_name;
select a.*,a.rowid from hs_asset.iusertable a where a.USER_NAME like '%杨%良%'; 
select a.*,rowid from hs_asset.iusertable a where a.operator_no like '%27646%'; 
select a.*,rowid from hs_asset.iusertable a where a.operator_no in ('10570', '19057', '07586', '18776', '15034', '27574', 'shenwei', '10565', '12609', '08135', 'yext'); 
select a.*,a.rowid from hs_asset.iusertable a where a.email like '%yext%'; 
select a.*,a.rowid from hs_asset.iusertable a where a.group_name like '%期权%';
-- 产品组名字调整 产品组带out为移出 覃宏念
select a.*,a.rowid from hs_asset.iusertable a where a.USER_NAME like '%翟黄%'; 
select a.*,rowid from hs_asset.iusertable a where a.operator_no like '%c%'; 
select a.* from hs_asset.grouptoproduct a 
select a.* from hs_asset.clobinfoapply a order by a.mod_no desc

-- 业务标志
select a.*,a.rowid from hs_asset.requestpubjour a where mod_no = 'TEST0406' order by serial_no desc, op_remark;
select a.*,rowid from hs_asset.busiflag a where a.mod_no = 'M202012101778';
select a.*,rowid from hs_asset.busiflag a where a.flag_no = '44041';
-- 常量列表
select a.*,a.rowid from hs_asset.requestpubjour a where mod_no = 'M202010292645'  order by serial_no desc, op_remark;
select a.*,rowid from hs_asset.constantlist a where a.MOD_NO = 'M202009100015';
select a.*,rowid from hs_asset.constantlist a where a.constant_value like 'CNST_ASSETSERIALTYPE_SUBESB%';
-- 系统配置 
select a.*,a.rowid from hs_asset.requestpubjour a where a.MOD_NO = 'M202101142444' order by serial_no desc; 
select a.*,a.rowid from hs_asset.sysconfigure a where a.MOD_NO = 'M202101142444';
select a.*,a.rowid from hs_asset.sysconfigure a where a.config_no like '341%';

-- 错误号
select a.*,a.rowid from hs_asset.requestpubjour a where a.MOD_NO = 'M202012220893' order by serial_no desc; 
select a.*,a.rowid from hs_asset.Standarderror a where a.MOD_NO = 'M202012220893';
select a.*,a.rowid from hs_asset.Standarderror a where length(a.errorno)>6;
select a.*,rowid from hs_asset.Standarderror a where a.errorno >= '2010' order by errorno asc;
SELECT a.*,rowid from hs_asset.Standarderror a where a.constant_value = 'ERR_REF_REFPRE_COMPACTPOSTPONE_NOTALLOW';
-- 外部错误号
select a.*,a.rowid from hs_asset.requestpubjour a where a.MOD_NO = 'M202010101623' order by serial_no desc; 
select a.*,rowid from hs_asset.outsideerror a where a.error_source = '0' and a.extern_code > '2010';
select a.*,rowid from hs_asset.outsideerror a where a.extern_code in ('K22','9');
select a.*,rowid from hs_asset.acctserialcounter a where a.MOD_NO = 'M202009190162';

-- 审核信息
select a.*,rowid from hs_asset.reviewinfo a order by MOD_NO desc;
select a.*,rowid from hs_asset.reviewinfo a where MOD_NO = 'M202011190254';

-- train
select a.*,b.*,c.*,a.rowid from hs_asset.traininginfo a, trainingevaluate b, trainingsign c
 where a.training_id = b.training_id(+)
   and a.training_id = c.training_id(+)
order by a.training_id desc;
select a.*,rowid from hs_asset.trainingsign a;
select a.*,rowid from hs_asset.trainingevaluate a;

-- 邮箱返回空问题排查
select b.operator_no,b.rowid from iusertable b where  b.operator_no in (
-- select 2 as mailtype,a.Email,operator_no
select operator_no
                        from iusertable a
                      where group_code2 = &group_code2 
                        and Email not in ( select a.Email
                                              from iusertable a
                                            where right_level = &right_level + 1
                                              and group_code2 = &group_code2 ) and trim(a.email) is null )
    select 1 as mailtype,a.Email
                        from iusertable a
                        where operator_no = &operator_no
                      union
                        select 2 as mailtype,a.Email
                        from iusertable a
                      where (group_code2 = &group_code2 
                        and operator_no <> &operator_no)
                          or group_code2 = 'y'
                          or group_code2 = 'z'
                       
select a.*,a.rowid from hs_asset.requestpubjour a order by a.serial_no desc;


select a.*, a.rowid from hs_asset.requestpubjour a where a.mod_no = 'M202104130099';

仅删除通用数据要删三张表数据:
--select t.*,t.rowid from hs_asset.currenthead t where t.mod_no = 'M202104130099';
--select t.*,t.rowid from hs_asset.currencydata t where t.mod_no = 'M202104130099';
--select t.*,t.rowid from hs_asset.currentinfo t where t.mod_no = 'M202104130099';

-- business_flag：0:删除，1:新增，2:修改，-1:处理完成
-- 打回申请人：business_status:4, nextlevel:1
-- 一审状态：business_status:2, nextlevel:2
-- 二审状态：business_status:2, nextlevel:3
-- 待执行状态：business_status:3, nextlevel:-1
-- 执行完成状态：business_status:1, nextlevel:-1
1	62934	20211008	31976	功能目录修改,申请人=31976,模块名称=股票期权因子风险管理(optfactorriskmgr),功能编号=683331,功能名称=期权行情推送更新	1	M202109233052	-1	funcdir	-1	0	0	个股期权	AAAVVgAAFAAAtjjAAy

select a.*,a.rowid from
hs_asset.requestpubjour a
where a.mod_no = 'M202109233052'
and a.serial_no not in (select a.serial_no from hs_asset.funcdir a where a.mod_no = 'M202109233052')



