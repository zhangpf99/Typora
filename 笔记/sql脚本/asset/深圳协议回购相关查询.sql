--深圳协议回购涉及表
--委托表
select a.entrust_status,a.clear_balance,a.prev_balance,a.cbp_business_id,a.order_id,a.entrust_status,a.*,a.rowid from hs_asset.cbpentrust a where a.fund_account = '10013' order by entrust_no asc;
select a.tradereport_type,a.cbp_business_id,a.orig_business_id,a.order_id,a.entrust_status,a.*,a.rowid from hs_asset.cbpentrust a where a.entrust_no > 10014


select a.business_id,b.cbp_business_id
from cbprealtime a, cbpentrust b
                             where a.init_date = b.init_date(+)
                               and a.entrust_no = b.entrust_no(+)
                               and a.init_date = 20210607

--委托表流水计数器
select a.*,a.rowid from hs_asset.assetserialcounter a where serial_counter_no = 180
--成交表
select a.business_id,a.*,a.rowid from hs_asset.cbprealtime a order by serial_no desc;
select a.seat_no,a.entrust_status,a.*,a.rowid from hs_asset.cbpentrust a where a.init_date = 20210709  order by entrust_no desc;
--合约表

select a.*,a.rowid from hs_asset.brpcontract a;

select a.brp_contract_status,a.*,a.rowid from hs_asset.brpcontract a where a.init_date = 20210709;
2021061510000002  2021061500001293 2021061500001294
4	20210608	1293	211	10013	20016	0127619896	2	117120	a	2	20210608	200.00	2000.00	0.30000000	2004.93	20210615	0.30000000	2004.93	20210615	2021061510000002	 	8	0	20	2021061500001293	1	1	1	1	0.00000000	 	 	1	 	20210608	 	 	02	2	01	1	 	1	0.00	0.00	 	00	AAAjJ9AAIAAAZ/DAAC
5	20210608	1294	1024	31000003	2200135	0414356161	2	117120	a	1	20210608	200.00	2000.00	0.30000000	2004.93	20210615	0.30000000	2004.93	20210615	2021061510000002	 	8	0	20	2021061500001294	1	1	1	1	0.00000000	 	 	1	 	20210608	 	 	01	1	02	2	 	2	0.00	0.00	0	00	AAAjJ9AAIAAAZ/GAAC


select a.*,a.rowid from hs_his.his_brpcontract a;
--合约扩展表
select a.*,a.rowid from hs_asset.brpcontractext a;
select a.*,a.rowid from hs_asset.brpcontractext a 
select a.*,a.rowid from hs_his.his_brpcontractext a;

--资产账户
select a.fare_kind_str,a.*,a.rowid from hs_asset.fundaccount a where a.fund_account = '10013';


--
select a.*,a.rowid from hs_asset.brpcontractjour a where a.branch_no = 211;

select a.*,a.rowid from hs_his.his_brpcontractjour a
select a.*,a.rowid from hs_asset.assetserialcounter a where serial_counter_no = 180

select a.*,a.rowid from hs_fund.funreal
select a.*,a.rowid from hs_fund.fundreal a where a.fund_account = '10013'

--2021062910000002   
2021062900001303  2200135
2021062900001302  10013
select a.real_date_back,a.brp_contract_status,a.*,a.rowid from hs_asset.brpcontract a where a.init_date = 20210628

select a.*,a.rowid from hs_

select a.report_flag,a.contract_id,a.net_balance,a.*,a.rowid from hs_asset.rtgssettinfo a where a.init_date > 20210601 and a.clear_serial_no = '2106250000008746'
select a.settle_no,a.business_id,a.stock_account,a.*,a.rowid from hs_sett.realcorpfunddetail a order by clear_serial_no desc;

select a.*,a.rowid from hs_sett.realcorpfunddetail a order by clear_serial_no desc;


select a.*,a.rowid from hs_asset.cbprealtime a where a.init_date = 20210625

select a.*,a.rowid from hs_fund.fundrealjour a where a.fund_account = '31000003' and a.init_date = 20210625

select a.fund_frozen,a.fund_direction,a.*,a.rowid from hs_user.stkcode a where a.stock_code like '51640_'

select a.*,a.rowid from hs_asset.dataswap a where a.init_date = 20210617 order by  a.serial_no desc;

select a.*,a.rowid from hs_user.etfcode a where a.exchange_type = '1' and a.stock_code_0 = '511770';






























