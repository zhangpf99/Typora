| 序号 | 字段名 | 字段描述     | 类型      | 长度 | 备注                                                         | 后台标准字段                                           |
| ---- | ------ | ------------ | --------- | ---- | ------------------------------------------------------------ | ------------------------------------------------------ |
| 1    | JSBH   | 交收编号     | Character | 20   | 交收编号                                                     | settle_no                                              |
| 2    | JSZT   | 交收状态     | Character | 2    | 01:未交收     02:交收中     03:交收结束                      |                                                        |
| 3    | SCDM   | 市场代码     | Character | 2    | 1                                                            |                                                        |
| 4    | JLLX   | 记录类型     | Character | 3    | 002:交收通知(交收状态为01)     003:交收结果(交收状态为02或03)     102:交收通知冲正     103:交收结果冲正 |                                                        |
| 5    | JYFS   | 交易方式     | Character | 3    | 106(RTGS债券交易)                                            | deal_way                                               |
| 6    | JSFS   | 交收方式     | Character | 3    | 002(非担保交收)                                              |                                                        |
| 7    | YWLX   | 业务类型     | Character | 3    | 业务类型                                                     | busin_kind                                             |
| 8    | QSBZ   | 清算标志     | Character | 3    | 清算标志                                                     | clear_flag                                             |
| 9    | GHLX   | 过户类型     | Character | 3    | 过户类型                                                     | transfer_type                                          |
| 10   | CJBH   | 成交编号     | Character | 20   | 交易所成交序列号                                             | business_id                                            |
| 11   | SQBH   | 申请编号     | Character | 20   | 参考结算明细填写方式                                         | cbp_business_id                                        |
| 12   | WTBH   | 委托编号     | Character | 20   | 参考结算明细填写方式                                         | report_id                                              |
| 13   | JYRQ   | 交易日期     | Character | 8    | YYYYMMDD                                                     | init_date                                              |
| 14   | QSRQ   | 清算日期     | Character | 8    | YYYYMMDD                                                     | clear_date                                             |
| 15   | JSRQ   | 交收日期     | Character | 8    | YYYYMMDD                                                     | settle_date                                            |
| 16   | QTRQ   | 其它日期     | Character | 8    | 参考结算明细填写方式                                         | other_date                                             |
| 17   | CJSJ   | 成交时间     | Character | 6    | #                                                            | business_time                                          |
| 18   | GDSJ   | 勾单时间     | Character | 6    | 本方勾单状态为01 时填写本方勾单时     间;     其他填空       |                                                        |
| 19   | JSSJ   | 交收时间     | Character | 6    | 若日间批次交收状态为03,则显示交收     完成时间;     其他填空 |                                                        |
| 20   | XWH1   | 交易单元1    | Character | 6    | 交易单元,左起5位有效,右补空格                                | seat_no                                                |
| 21   | XWH2   | 交易单元2    | Character | 6    | 结算单元,左起5位有效,右补空格                                | shdc_clear_unit                                        |
| 22   | QSBH1  | 清算编号1    | Character | 6    | 交易单元1对应清算编号,左起5位有效                            |                                                        |
| 23   | QSBH2  | 清算编号2    | Character | 6    | 交易单元2对应清算编号,左起5位有效                            |                                                        |
| 24   | QSBH3  | 清算编号3    | Character | 6    | #                                                            |                                                        |
| 25   | CYRMC  | 参与人名称   | Character | 120  | 结算参与人名称                                               |                                                        |
| 26   | ZQZH   | 证券账户     | Character | 20   | 证券账户                                                     | stock_account                                          |
| 27   | ZQZHMC | 证券账户名称 | Character | 120  | 证券账户名称                                                 |                                                        |
| 28   | ZJZH   | 资金账号     | Character | 25   | 资金账号                                                     |                                                        |
| 29   | ZQDM1  | 证券代码1    | Character | 8    | 左起6位有效,右补空格                                         | stock_code_a                                           |
| 30   | ZQDM2  | 证券代码2    | Character | 8    | 左起6位有效,右补空格                                         | stock_code                                             |
| 31   | ZQLB   | 证券类别     | Character | 2    | 参考结算明细填写方式                                         |                                                        |
| 32   | LTLX   | 流通类型     | Character | 1    | 参考结算明细填写方式                                         | shdc_circulate_type                                    |
| 33   | QYLB   | 权益类别     | Character | 2    | 参考结算明细填写方式                                         | shdc_authority_type                                    |
| 34   | GPNF   | 挂牌年份     | Character | 4    | 参考结算明细填写方式                                         | shdc_market_year                                       |
| 35   | MMBZ   | 买卖标志     | Character | 1    | 参考结算明细填写方式                                         | entrust_bs（特殊处理接口值为B->1,S->2）                |
| 36   | SL     | 交收数量     | Character | 20   | 参考结算明细填写方式                                         | settle_amount                                          |
| 37   | CJSL   | 成交数量     | Character | 20   | 参考结算明细填写方式                                         | business_amount                                        |
| 38   | BZ     | 币种         | Character | 3    | CNY                                                          |                                                        |
| 39   | JG1    | 价格1        | Character | 20   | 99999999. 9999999                                            | business_price                                         |
| 40   | JG2    | 价格2        | Character | 20   | 99999999.9 9999999                                           | entrust_price2                                         |
| 41   | QSJE   | 清算金额     | Character | 20   | 99999999999999. 99                                           | clear_balance                                          |
| 42   | YHS    | 印花税       | Character | 20   | 9999999999999 99                                             | fare1                                                  |
| 43   | JSF    | 经手费       | Character | 20   | 99999999999999 99                                            | sipf_fare2                                             |
| 44   | GHF    | 过户费       | Character | 20   | 1E+12                                                        | fare2                                                  |
| 45   | ZGF    | 证管费       | Character | 20   | 99999999999999. 99                                           | sipf_fare4                                             |
| 46   | SXF    | 手续费       | Character | 20   | 9999999999999 99                                             | sipf_fare0                                             |
| 47   | SJSF   | 实际收付     | Character | 20   | 99999999999999. 99                                           | business_balance                                       |
| 48   | QTJE1  | 其它金额1    | Character | 20   | 99999999999999 99                                            | csdc_other_balance1                                    |
| 49   | QTJE2  | 其它金额2    | Character | 20   | 999999999999999. 99                                          | csdc_other_balance2                                    |
| 50   | JGDM   | 结果代码     | Character | 4    | 0000: 成功;     其他为失败                                   | return_code                                            |
| 51   | JGSM   | 结果说明     | Character | 40   | 结果代码对应的结果说明                                       | result_info                                            |
| 52   | BY1    | 备用1        | Character | 40   | #                                                            | shdc_by                                                |
| 53   | BY2    | 备用2        | Character | 80   | #                                                            |                                                        |
|      |        |              |           |      |                                                              | money_type固定入参为'0'                                |
|      |        |              |           |      |                                                              | record_no为后台处理的成交数+1                          |
|      |        |              |           |      |                                                              | data_id为dwDataID(报盘特殊处理:使用每个节点的唯一标识) |

