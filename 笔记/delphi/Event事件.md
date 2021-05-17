# Event事件

- onEnter和onValidate

  ![image-20210317102349588](\typora-user-images\image-20210317102349588.png)

  想要实现的效果：客户选择“新股申购冻结资金”，“信用债券冻结资金”和“CDR申购冻结资金”三个下拉框不能均选择’0-否‘，如果均为0-否，则提示报错。

  1. 如果控制事件放在CDR申购冻结资金onvalidate事件中，当控件内容变化时才做检查，存在的问题为：三个均为否，则报错，将其中一个设置为1-是，通过onvalidate事件后，重新置为0-否，此时不会触发onvalidate事件，导致点击确定按钮时提示报错
  2. 优化：将控制事件放在”确定“按钮的onEnter事件中，onEnter优于确定按钮的onClick事件，onEnter检查，如果三个都为0-否，则setFocus到第三个控件位置

- 

