--深圳协议回购涉及表
--委托表
select a.clear_balance,a.prev_balance,a.cbp_business_id,a.order_id,a.entrust_status,a.*,a.rowid from hs_asset.cbpentrust a where a.init_date = 20210607 order by entrust_no asc;
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
select a.entrust_status,a.*,a.rowid from hs_asset.cbpentrust a order by entrust_no desc;
--合约表
select a.*,a.rowid from hs_asset.brpcontract a;
select a.*,a.rowid from hs_his.his_brpcontract a;
--合约扩展表
select a.*,a.rowid from hs_asset.brpcontractext a;
select a.*,a.rowid from hs_his.his_brpcontractext a;


--
select a.*,a.rowid from hs_asset.fundaccount a where a.branch_no = 211;

select a.*,a.rowid from hs_asset.assetserialcounter a where serial_counter_no = 180

select a.*,a.rowid from hs_fund.funreal
select a.*,a.rowid from hs_fund.fundreal a where a.fund_account = '10013'

200001
2000012

select a.fund_frozen,a.fund_direction,a.*,a.rowid from hs_user.stkcode a where a.stock_code like '51640_'
