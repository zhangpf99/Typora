# Exec_Flow函数

function Exec_Flow(iBusiForm:TBusiForm; iFlow_no: Integer; IsErrorShow, IsCheckAudit, ifAuditErrorShow:Boolean): Integer;

1. 第一个参数为TBusiForm窗口类
2. 第二个参数为要触发的后台功能号
3. 第三个参数为报错是否显示
4. 第四个参数为是否支持复核，为True表示如果功能号支持复核，则前台也触发复核，否则不触发

