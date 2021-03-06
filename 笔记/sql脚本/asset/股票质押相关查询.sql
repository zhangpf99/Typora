select a.*,a.rowid from hs_asset.client a where a.client_id = '28258'

--委托
select a.*,a.rowid from hs_asset.cbpentrust a 
--合同
select a.srp_special_account,a.srp_kind,a.*,a.rowid from hs_asset.srpcontract a where a.fund_account = '10013'
--合同流水
select a.*,a.rowid from hs_asset.srpcontractjour a where a.fund_account = '10013' order by serial_no desc;
--申请表
select a.srp_apply_status,a.date_clear,a.*,a.rowid from hs_asset.srpapply a where a.fund_account = '10013' and a.init_date = 20210707;

2020112400001479
select a.entrust_balance,a.integral_update,a.repaid_balance,a.last_interest_date,a.batch_unsettle_interest,a.expire_year_rate,a.srp_contract_status,a.prev_status,a.integral_update,a.real_date_back,a.batch_unsettle_interest,a.real_back_balance,a.real_date_back,a.SETTLE_INTEREST,a.srp_contract_status,a.back_type,a.*,a.rowid from hs_asset.srpcontract a where a.fund_account = '10013' and a.contract_id = '2020120100001545'

select a.real_year_rate,a.real_back_balance,a.srp_contract_status,a.batch_unsettle_interest,a.expire_year_rate,a.srp_contract_status,a.prev_status,a.integral_update,a.real_date_back,
a.batch_unsettle_interest,a.real_back_balance,a.real_date_back,a.SETTLE_INTEREST,a.srp_contract_status,a.back_type,a.*,a.rowid 
from hs_asset.srpcontract a where a.fund_account = '10013' and a.join_contract_id = '2020112400001479'

select min_interest_days,interest_cycle
                 from srpquota
                where company_no = 0
                  and exchange_type = '!'  
                  and srp_kind = '0'
                  
select *
   from stkcode
  where (instr(&en_stock_type, stock_type) > 0)
    and (exchange_type = &exchange_type)
order by exchange_type, stock_type, stock_code
hs_his.AP_DSECUSETT_TCPSORGAN_TOTAL
