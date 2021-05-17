# AS无此功能

1. hsadmin工具，在对应AS节点上看功能编号中有无此AS功能
2. 如果没有，需要在中间件的workspace文件夹下的config-as.xml中添加AS功能对应的so
3. 添加完成后，config-as.xml替换原来的
4. 重启节点，hsadmin看业务模块中是否已添加as，添加后可正常使用

