<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>用作邮箱验证测试</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>
	<body>
		用作邮箱验证测试
		<br>
		感谢您注册 现在请按以下步骤完成您的注册!
		<br>

		我们给您发送了验证邮件，邮件地址为：${email}
		<br />

		<span style="color: red; font-size: 12px;">${verifyFail}</span>

		<br />
		<form action="emailVerify.action" id="emailVerify">
			<input type="hidden" name="email" value=${email } />
			输入邮箱验证码：
			<input type="text" name="code" />
			<input type="submit" value="完 成" />
		</form>
		<form action="" id="resendVerifyCode">
			<input type="hidden" name="email" value=${email } />	
			<input type="submit" value="重新发送验证码(未完成)" />
		</form>
	</body>
</html>
