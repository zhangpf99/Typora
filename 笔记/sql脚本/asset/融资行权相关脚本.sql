
--融资行权合同表
select a.*,a.rowid from hs_asset.finexecontract a where a.fund_account = '10013'
--担保持仓表(客户的担保证券)
select a.*,a.rowid from assurestock a  where a.fund_account = '10013'
--自主行权股东名册表(客户的可行权数量)
select (confirm_amount-used_amount-frozen_amount) as 可用数量,a.*,a.rowid from hs_asset.soptreg a where a.stock_account = '0127619896'
--股票质押额度表(法人维度，所有客户的总额度)
select a.*,a.rowid from hs_asset.srpquota a where a.company_no = 0 and a.srp_kind = '2';
--期限产品表（不止包括股票质押，根据srp_kind区分各个产品，如2-融资可取，3-融资可用）
select a.*,a.rowid from hs_user.srpkind a;
--融出方信息表
select a.*,a.rowid from hs_asset.srpfunder a where a.funder_no = '28258';
--配置参数
select a.config_no,a.config_no,a.remark,a.char_config,a.rowid from hs_user.sysconfig a where a.config_no = 2244;
--股票质押代码表
select a.srp_kind,a.*,a.rowid from srpcode a where a.stock_code = 000002
--融资行权担保标的表
select a.*,a.rowid from hs_user.finexeassurecode a where a.exchange_type = '2' and a.stock_code = '000002';
--融资行权质押还款,生成股票质押合约
select a.*,a.rowid from hs_asset.srpcontract a;



select a.*,a.rowid from hs_asset.client a where a.client_id = '111630'

select b.*,b.rowid from hs_user.hsmenu b where b.menu_id in (select a.menu_id from hs_user.functiontomenu a where a.function_id = '116000')
select holder_rights from hs_secu.stockholderctrl where fund_account = '10013' and exchange_type = '2'
select a.client_group,a.*,a.rowid from hs_asset.fundaccount a where a.fund_account = '31000003';

select a.*,a.rowid from hs_asset.soptentrust a where a.fund_account = '10013' and a.init_date = 20210628


