<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Line friend零食铺-用户注册</title>
		
		<link href="assets/css/login.css" rel="stylesheet" type="text/css" />
		<link href="assets/css/page_bottom.css" rel="stylesheet" type="text/css" />
		<style>body {
			cursor: url('assets/picture/cursor.ico'), auto;
		}
		</style>
		<script type="text/javascript" src="assets/js/jquery-1.5.1.min.js"></script>
		<!--
		<script type="text/javascript">
			
			$(function(){
				$('#validatecode').click(function(){
					$('#errorMsg').html("");
				});			
			});
			
			$(function(){
				$('#fo').submit(function(){
					var code=$('#validatecode').val();
					var reg=/-[0-9]+$/;
					if(reg.test(code)){
						return true;
					}else{
						$('#errorMsg').html("验证码错误!");
						return false;
					}
				});
			});
		
		</script>
	-->
	</head>
	<body>
	<div id="imgLogo"> 
	<img src="assets/homeImages/logo.png"/>
	</div>
	<div id="check">
		
		<div class="login_step">
			注册步骤: 1.填写信息 >
			<span class="red_bold">2.验证邮箱</span> > 3.注册成功
		</div>
		<form action="emailVerify.action" method="post" id="fo">
			<div class="validate_email">
				<h2>
					感谢您注册Line friend零食铺！现在请按以下步骤完成您的注册!
				</h2>
				<div class="look_email">
					<h4>
						第一步：查看您的电子邮箱
					</h4>
					<div class="mess reduce_h">
						我们给您发送了验证邮件，邮件地址为：
						<span class="red"><span id="lblEmail">${email}</span>
						</span>
						<span class="t1"> 
						请登录您的邮箱收信。
						</span>
						<br/>
						
						<span class="t1"> 
						若没收到，请检查是否在垃圾箱内，或重新获取->
						</span>
						
						<input type="button" value="重新获取" onclick="document.getElementById('reSendEmail').submit();"/>
						
						
					</div>
					<h4>
						第二步：输入验证码
					</h4>
					<div class="mess">
						<span class="write_in">输入您收到邮件中的验证码：</span>
						<!--
						${emailVerifyCode}
						-->
						<input type="hidden" name="email" value=${email } />
						<input name="code" type="text" id="validatecode" class="yzm_text" />
						<input class="finsh" type="submit" value="完 成" id="Button1" />
						<span id="errorMsg" class="no_right">${verifyFail}</span>
					</div>
				</div>
			</div>
		</form>
		
		<form action="reSendEmail.action" id="reSendEmail">
		<input type="hidden" id="email" name="email" value=${email} />
		</form>
		<div id="foot"></div>
		</div>
	</body>
</html>

