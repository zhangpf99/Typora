# 深圳协议回购优化RTGS

## 日间业务

- 清算数据导入

  交易委托成功后，结算系统会将清算数据实时推送给参与人所有用户（包括D-COM终端与用户技术系统），报盘端处理数据后调用UF20后台的213975- LS_综合业务回报_RTGS清算信息导入功能，将数据录入到rtgssettinfo表。


| 报文要素                                                     | <XML TAG>     | 重复   | 要素类型                | 备注                                                         | 对应213975功能入参 |
| ------------------------------------------------------------ | ------------- | ------ | ----------------------- | ------------------------------------------------------------ | ------------------ |
| Business  Type     业务类别                                  | <BizTp>       | [1..1] | Exact4AlphaNumericText  | RG01                                                         | dcom_busi_type     |
| StatementInformation清 算 数 据                              | <StmtInf>     | [1..1] |                         |                                                              |                    |
| --Pagination     分 页 信 息                                 | <Pgntn>       | [1..1] |                         |                                                              |                    |
| ----Page Count     总 页 数                                  | <PgCnt>       | [1..1] | Number(10)              |                                                              |                    |
| ----Page Number     当 前 页 码                              | <PgNb>        | [1..1] | Number(10)              |                                                              |                    |
| ----Record Count     当前页明细记录数                        | <RcrdCount>   | [1..1] | Number(10)              | 当前页包含的明细记录数                                       |                    |
| --StatementDetails     明 细 记 录                           | <StmtDtls>    | [1..n] |                         |                                                              |                    |
| ----Clearing Serial     Number     清 算 业 务 流 水 号      | <ClrSrINo>    | [1..1] | Exact16AlphaNumericText | RTGS  交 收     的 关 键 字                                  | clear_serial_no    |
| ----ExecutionID     执 行 编 号                              | <ExctnId>     | [1..1] | Max16AlphaNumericText   |                                                              | csdc_execute_no    |
| ---- TradingOrderID     交 易 委 托 序 号                    | <TradOrdrId>  | [1..1] | Max10phaNumericText     | 原  交 易 委 托     中 的 客 户 订     单 编 号              | order_id           |
| ----Settlement Unit     结 算 账 号                          | <SttlmUnt>    | [1..1] | Exact6AlphaNumericText  |                                                              | square_seat        |
| ----Settlement Account     备 付 金 账 户                    | <SttlmAcct>   | [1..1] | Max25AlphaNumericText   |                                                              |                    |
| ----Clearing Business     Type     清 算 业 务 类 别         | <ClrBizTp>    | [1..1] | Exact4AlphaNumericText  |                                                              | clear_busi_type    |
| ----SecurityID     证 券 代 码                               | <SctyID>      | [1..1] | Max8AlphaNumericText    |                                                              | stock_code         |
| ---- Trading PBU     交 易 单 元                             | <TradPbu>     | [1..1] | Exact6AlphaNumericText  |                                                              | csdc_seat_no       |
| ----Custodian Unit     托 管 单 元                           | <CtdnUnt>     | [1..1] | Exact6AlphaNumericText  |                                                              | seat_no            |
| ----Investor Account     证 券 账 户                         | <InvstrAcct>  | [1..1] | Max20AlphaNumericText   |                                                              | stock_account      |
| ----Quantity     成 交 数 量                                 | <Qty>         | [1..1] | DecimalNumber           | 15(2)                                                        | business_amount    |
| ----Price     成 交 价 格                                    | <Prc>         | [1..1] | DecimalNumber           | 13(4)                                                        | business_price     |
| ----Clearing Quantity     清 算 数 量                        | <ClrQty>      | [1..1] | DecimalNumber           | 15(2)                                                        | clear_amount       |
| ----Clearing Price     清 算 价 格                           | <ClrPre>      | [1..1] | DecimalNumber           | 18(9)                                                        | clear_price        |
| ----Currency Code     货 币 代 号                            | <CeyCd>       | [1..1] | Exact3AlphaNumericText  |                                                              | currency_code      |
| ----Trade Amount     清 算 本 金                             | <TradAmt>     | [1..1] | DecimalNumber           | 17(2)                                                        | clear_balance      |
| ----Stamp Duty     印 花 税                                  | <StmpDty>     | [1..1] | DecimalNumber           | 12(2)                                                        | fare1              |
| Transit Fee     交 易 经 手 费                               | <TrnstFee>    | [1..1] | DecimalNumber           | 12(2)                                                        | sipf_fare2         |
| ----Regulatory Fee     监 管 规 费                           | <RgltryFee>   | [1..1] | DecimalNumber           | 12(2)                                                        | regulatory_fee     |
| ----Transfer Fee     过 户 费                                | <TrfFee>      | [1..1] | DecimalNumber           | 12(2)                                                        | fare2              |
| ----Clearing Fee     结 算 费                                | <CirFee>      | [1..1] | DecimalNumber           | 12(2)                                                        | clearing_fee       |
| ----Net Amount                                                                                                                                       收 付 净额 | <NetAmt>      | [1..1] | DecimalNumber           | 17(2)                                                        | net_balance        |
| ----Trade  Date     成 交 日 期                              | <TradDt>      | [1..1] | ISODate                 |                                                              | business_date      |
| ----Clearing Date     清 算 日 期                            | <ClrDt>       | [0..1] | ISODate                 |                                                              | clear_date         |
| ----Settlement Date     交 收 日 期                          | <SttlmDt>     | [0..1] | ISODate                 |                                                              | settle_date        |
| ----Original Trade Date     原 成 交 日 期                   | <OrgnlTradID> | [0..1] | ISODate                 | 对 协 议 回 购，为初始交易日期                               | old_business_date  |
| ----Original Trade ID     合 同 序 号                        | <OrgnlTradID> | [0..1] | Max16AlphaNumericText   | 对 协 议 回 购，为交易 编号； 对 三 方 回 购，为初始交易编号 | contract_id        |
| ----Trade Type      交易方式                                 | <TradTp>      | [1..1] | Exact2AlphaNumericText  | 01= 普通交 易，02=综合 协议平台交 易， 03= 经深交 所申报的非交易业务 | deal_way           |



| 报文要素                                                  | <XML     TAG>         | 重复   | 要素类型                | 备注                                | 后台标准字段     |
| --------------------------------------------------------- | --------------------- | ------ | ----------------------- | ----------------------------------- | ---------------- |
| Business Type      业务类别                               | <BizTp>               | [1..1] | Exact4AlphaNumericText  |                                     |                  |
| Instruction Type     指 令 类 型                          | <InstrTp>             | [1..1] | Exact2AlphaNumericText  |                                     |                  |
| ConfirmationInformation     回 报 数 据                   | <ConfInf>             | [1..1] |                         |                                     |                  |
| --ConfirmationDetails     回 报 明 细                     | <ConfDtls>            | [1..1] |                         |                                     |                  |
| ----Serial Number     业 务 流 水 号                      | <SrINo>               | [1..1] | Exact16AlphaNumericText | 结  算 系 统 为该笔委托分配的流水号 | return_serial_no |
| ----OriginalOrderDetails     原 委 托 明 细               | <Or-     gnlOrdrDtls> | [1..1] |                         |                                     |                  |
| ------ClientOrderID     委 托 序 号                       | <ClntOrdrId>          | [1..1] | Exact10AlphaNumericText |                                     | entrust_no       |
| ------Clearing Serial     Number     清 算 业 务 流 水 号 | <ClrSrINo>            | [1..1] | Exact16AlphaNumericText |                                     | clear_serial_no  |
| ------ExecutionID     执 行 编 号                         | <ExctnId>             | [1..1] | Exact16AlphaNumericText |                                     | csdc_execute_no  |
| ------TradingOrderID     交 易 委 托 序 号                | <TradOrdrId>          | [1..1] | Max10phaNumericText     | 交易委托中的客户订单编号            | order_id         |
| ------SecurityID     证 券 代 码                          | <SctyID>              | [1..1] | Max8AlphaNumericText    |                                     | stock_code       |
| ------Custodian Unit     托 管 单 元                      | <CtdnUnt>             |        | Exact6AlphaNumericText  |                                     | seat_no          |
| ------Investor Account     证 券 账 户                    | <InvstrAcct>          | [1..1] | Max20AlphaNumericText   |                                     | report_account   |
| ------Price     成 交 价 格                               | <Prc>                 | [1..1] | DecimalNumber           | 13(4)                               | business_price   |
| ------Quantity     成 交 数 量                            | <Qty>                 | [1..1] | DecimalNumber           | 15(2)                               | business_amount  |
| ------Clearing Price     清 算 价 格                      | <ClrPrc>              | [1..1] | DecimalNumber           | 18(9)                               | clear_price      |
| ------Clearing Quantity     清 算 数 量                   | <ClrQty>              | [1..1] | DecimalNumber           | 15(2)                               | clear_amount     |
| ------Net Amount  收付净额                                | <NetAmt>              | [1..1] | DecimalNumber           | 17(2)                               | net_balance      |
| ------Clearing Date        清 算 日 期                    | <ClrDt>               | [0..1] | ISODate                 |                                     | clear_date       |
| ------Settlement Date     交 收 日 期                     | <SttlmDt>             | [0..1] | ISODate                 |                                     | settle_date      |
| ------Trade Date     成 交 日 期                          | <TradDt>              | [1..1] | ISODate                 |                                     | business_date    |
| ----Receive Time     受 理 时 间                          | <RevTm>               | [1..1] | ISODateTime             |                                     | return_time      |
| ----Result     处 理 结 果                                | <Rslt>                | [1..1] |                         |                                     |                  |
| ------Code     结 果 代 码                                | <Cd>                  | [1..1] | Exact4AlphaNumericText  |                                     | return_code      |
| ------Description     结 果 说 明                         | <Desc>                | [1..1] | Max100Text              |                                     | return_info      |

### 接口描述

| 数据类型                   | 类型名称               | 格式                                                         | 例子                                                         |
| -------------------------- | ---------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 重复                       | [m..n]                 | [m..n]表示该要素至 少应出现m次，最多出现n次                  | 比如[0..1]表示该要素可以不出现，也可以出现一次；[1..1]表示该要素必须且只能出现一次。 |
| 定长文本数据类型           | ExactNText             | 固定长度的字符                                               | Exact6Text:ABC_DE                                            |
| 不定长文本数据类型         | MaxNText               | 不固定长度的字符串，一个汉字也是一个字符。                   | Max8Text:ABC98TX                                             |
| 定长数字文本数据类型       | ExactNNumericText      | [0-9]{N}                                                     | Exact10NumericText:0899000001                                |
| 不定长数字文本数据类型     | MaxNNumericText        | [0-9]{0,N}                                                   | Max10NumericText:089900000                                   |
| 定长字母数字文本数据类型   | ExactNAlphaNumericText | [a-zA-Z0-9]{N}                                               | Exact4AlphaNumericText:Ab98                                  |
| 不定长字母数字文本数据类型 | MaxNAlphaNumericText   | [a-zA-Z0-9]{0,N}                                             | Max4AlphaNumericText:Ab9                                     |
| 整数数据类型               | Number (N)             | 数字总位数最多为 18 位，对需要特别说明的要素，N为具体位数。  | 123456789                                                    |
| 浮点数数据类型             | DecimalNumber M(N)     | 数字总位数最多为18位，小数位最大长度为17位；M为总位数，N为小数位数。 | 123456789.123456789                                          |
| 日期数据类型               | ISODate                | YYYY-MM-DD                                                   | 2001-01-01                                                   |
| 时间数据类型               | ISOTime                | HH:MM:SS                                                     | 13:10:22                                                     |
| 日期时间数据类型           | ISODateTime            | YYYY-MM-DDThh:mm:ss                                          | 2010-05-01T15:09:05(其中的‘T’为日期和时间的分割符，是必需的)。 |

