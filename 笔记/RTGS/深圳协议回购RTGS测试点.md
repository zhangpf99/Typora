# RTGS测试点

1. 提前购回业务，逆回购方委托后，entrust_balance取计算后的real_back_balance值，录入到cbpentrust表中

2. 清算数据导入，到期续做变更对手方-原逆回购方与到期购回-逆回购方，branch_no、fund_account、client_id数据导入时数据是否正常？

   1. 正回购方BPR委托成交回报，质押券只有一支

   2. 清算数据录入

   3. 

3. RTGS回报处理：资金、股份处理是否正常？cbprealtime表数据是否正常





对于到期续做原逆回购方和到期购回逆回购方，清算导入时，因为没有委托，以下字段为正回购方数据：

<ExctnId> ：csdc_execute_no

<TradOrdrId>：order_id

<SttlmUnt> ：square_seat结算账号

<SttlmAcct> ：备付金账户

<ClrBizTp>：XYDQ/XYXB
<SctyID> ：stock_code



重新编译：

原子_股票质押融资申购(存管)：AP

原子_股票质押式回购：AP和AS

原子_综合业务回报:AS

原子_新股票质押：AP和AS

原子_债券质押协议回购：AP

