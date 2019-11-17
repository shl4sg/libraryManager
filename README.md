# libraryManager

该项目是一个JavaWeb项目， 项目配置：jdk1.8+Mysql5.7+Tomcat9.0 

 系统设计基于MVC模式。Model： JavaBean 封装各类接口(com.actionForm包)；View：Jsp负责网页，与用户显示交互；Control：Servlet实现JavaBean中的接口，与数据库连接读写数据，处理业务。

该管理系统主要实现系统设置，读者管理，图书管理，图书借还，系统查询功能。管理系统主要包括两个页面：系统登录页面，系统管理页面。系统管理页面由4个子模块构成，这其中包括3个公用的子模块。

技术总结：

Properties文件的使用方便程序的移植。

在进行网站开发时，为了避免网站遭到SQL语句的注入式攻击，应该考虑到过滤字符串中的危险字符。 filterStr()方法用来过滤字符串中的危险字符。

页面的构造模块化，通过<%@ include %>实现子页面的加载。

