# Line_friend
基于JavaEE ssm框架的电子商务购物平台

包含：
源代码工程
SQL文件
资源文件 (因图片过多已经去掉)
等

Include：
project
sql
assets 
etc.

------

其中邮件发送工具类，要替换自己的邮箱和密码，我把我写的去掉了(为了防止我的邮箱帐号泄漏。。。)
在MailSendUtil中,写上你要用来发送验证邮件的邮箱即可，建议sina邮箱：
```java
public class MailSendUtil {
	private final static String host = "smtp.sina.com"; // sina服务器
	private final static String formName = "";// 你的邮箱
	private final static String password = ""; // 授权码
	private final static String replayAddress = ""; // 你的邮箱
```

-----

配置文件SpringMVC.xml中配置数据源也要根据你的数据库设置来进行相应更改：
```
	<!-- 配置数据源 -->
	<bean id="ds" class="org.apache.commons.dbcp.BasicDataSource">
		<property name="driverClassName" value="com.mysql.jdbc.Driver" />
		<property name="url"
			value="jdbc:mysql://localhost:3306/ls?useUnicode=true&amp;characterEncoding=utf-8" />
		<property name="username" value="root" />
		<property name="password" value="" />
		<property name="maxActive" value="20" />
		<property name="maxIdle" value="10" />
	</bean>
```
数据库的用户名 密码 url 数据库名都要改成你的，或者你按照这个建库。

----

需要在Line_friend\WebRoot\assets下创建upload文件夹，用来上传文件。
