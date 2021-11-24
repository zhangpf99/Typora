# core问题排查

## 1.自己环境的core文件查看方法

- 进入workspace目录

- find core的名字

- 执行命令: 

  > gdb hsserver core.xxxx 

- 进入后输入where，即可查看报错信息，例如：(最后一行是ls，依次向上是实际问题)

  ![image-20210720193512775](picture/image-20210720193512775.png)

## 2.客户的core文件查看方法

![image-20210720193547153](picture/image-20210720193547153.png)

