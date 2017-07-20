<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache,must-revalidate" />
		<title>个人注册</title>
		<link rel="stylesheet"
			href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
		<script
				src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
				<script type="text/javascript" src="assets/js/jQuery1.9.1.js"></script>
		<style>
		body {
			cursor: url('assets/picture/cursor.ico'), auto;
		}
		</style>
			
		<link rel="shortcut icon" href="assets/picture/LOG0-2.png" />
		<link href="assets/css/UserRegist.css" rel="stylesheet"
			type="text/css" />
		<!--<link href="assets/css/buttons.css" rel="stylesheet"
			type="text/css" />
		-->
		
		<script type="text/javascript" src="assets/js/jquery-3.2.1.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.js"></script>
		<script type="text/javascript" src="assets/js/checkUser.js"></script>
		<!-- Ajax异步提交 检测用户名邮箱是否存在 -->
		<script type="text/javascript" src="assets/js/checkEmpty_test.js"></script>
		<!-- 检测是否为空 -->

		<script type="text/javascript" src="assets/js/checkbox.js"></script> <!-- checkbox选择 -->
		<script type="text/javascript" src="assets/js/imageVerifyCode.js"></script>
		<script type="text/javascript" src="assets/js/smsVerifyCode.js"></script>
		
		
		<!-- ......................................... -->
		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<!-- ....................................... -->
		<script type="text/javascript">
        function open(){
          window.location.href="UserDeal.jsp";
           }
        </script> 
		</head>
	<body>
		<div align="center">
			<div id="head">

				<div class="head1">

					<a rel="sidebar" onclick=addToFavorite(); href="">
						<img style="position: relative; top: 1px;"
							src="assets/picture/love2.jpg" height="13" width="15" />

						&nbsp;&nbsp;收藏Line friend</a>
				&nbsp;<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
				</div>

				<div class="head2">

					<nav class="nav">

					<ul class="nav__menu">

						<li class="nav__menu-item">
							<a href="UserLogin.jsp">你好！请登录&nbsp;</a><a>|</a>
						</li>

						<li class="nav__menu-item">
							<a href="UserRegister.jsp">&nbsp;免费注册&nbsp;</a><a>|</a>
						</li>

						<li class="nav__menu-item">
							<a href="userCart.html">&nbsp;购物车&nbsp;</a><a>|</a>
						</li>

						<li class="nav__menu-item">
							&nbsp;我的Lineˇ

							<ul class="nav__submenu">

								<li class="nav__submenu-item">
									<a href="order.jsp">我的订单</a>
								</li>

								<li class="nav__submenu-item">
									<a href="javascript:AdminEmail()">我的关注</a>
								</li>

							</ul>

						</li>

						<a>|</a>
						<li class="nav__menu-item">
							&nbsp;&nbsp; 网站导航^

							<ul class="nav__submenu">

								<li class="nav__menu-item">
									<a href="home.jsp">网站主页</a>
								</li>

								<li class="nav__menu-item">
									<a href="GoodsSearch.jsp">商品检索</a>
								</li>

								<li class="nav__menu-item">
									<a href="User.html">用户管理</a>
								</li>

								<li class="nav__menu-item">
									<a href="userCart.html"> 购物车</a>
								</li>

								<li class="nav__menu-item">
									<a href="order.jsp">我的订单</a>
								</li>

								<li class="nav__menu-item">
									<a href="../UserFavorite.html">我的收藏</a>
								</li>

							</ul>
						</li>
					</ul>
					</nav>
				</div>

			</div>
		</div>
		<div class="logo">
			<a href="UserRegister.jsp"><img
					src="assets/picture/LOGO-2.png" /> </a>
			<div class="welcome">
				<font size="+2">欢迎注册</font>
			</div>
		</div>

		<div id="container">
			<div class="content1">
				<img src="assets/picture/登陆注册.png" height="500" width="1200" />
			</div>
			<div class="content2">
				<div class="content2-line">
					<font
						style="position: relative; top: 15px; left: 25px; float: left;"
						size="+2">用户注册</font>
				</div>

				<form name="register" id="register" action="register.action"
					method="post" onsubmit="return myCheck();">
					<div class="content2-line">
						<label class="form-content">
							注&nbsp;册&nbsp;邮&nbsp;箱:
						</label>
						<input class="form-input" type="text" id="email" name="email" />
						<!--<input  type="hidden"  />-->
						<span class="form-span" id="checkUN"></span>
						<!--<span class="form-span" id="userNameMessage"></span>-->
					</div>
					<div class="content2-line">
						<label class="form-content">
							请设置密码:
						</label>
						<input class="form-input" type="password" name="password"
							id="password" />
						<span class="form-span" id="userPasswordMessage"></span>
					</div>
					<div class="content2-line">
						<label class="form-content">
							请确认密码:
						</label>
						<input class="form-input" type="password" name="password2"
							id="userPassword2" />
						<span class="form-span" id="userPassword2Message"></span>
					</div>
					<!--<div class="content2-line">
						<label class="form-content">
							验证邮箱:不用
						</label>
						<input class="form-input" type="text" name="userEmail"
							id="userEmail" />
						<span class="form-span" id="userEmailMessage"></span>
					</div>
					-->
					<div class="content2-line">
						<label class="form-content">
							验&nbsp;&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;码:
						</label>
						<input class="form-input2" type="text" name="checkcode" id="checkcode" onblur="verificationcode()"/>
						<label class="getyzm">
							<a href="#" onclick="reload()"><img src="<%=request.getContextPath() %>/imageVerifyCode.action" alt="验证码" id="image" style="margin-top: -15px;"/></a>
							<!--button onclick="return reload();"><label>换一张</label></button--> 
							<span id="span"></span>
						</label>
					</div>
					<div class="content2-line">
						<label class="form-content">
							手&nbsp;机&nbsp;验&nbsp;证:
						</label>
						<input id="mobile" name="mobile" type="text" size="25" class="form-input2" />
						<label class="getyzm" >
						<input id="zphone" type="button" value="获取短信验证码" onclick="get_mobile_code();" class="btn btn-primary"  style="margin-top: -15px;" />
					
						 <!--<input id="zphone" type="button" value="获取短信验证码" onclick="get_mobile_code();" class="button button-pill button-primary"/>
						--></label>
						
					</div>
					
					<div class="content2-line">
					<label class="form-content">
					短信验证码:
					</label>
					<input type="text" size="8" name="smscode" id="smscode" class="form-input2" onblur="smsverificationcode()"/>
						<label class="getyzm">	
							<span id="spansms"></span>
						</label>
					</div>
					
					<div class="content2-line" align="center">
						<input type="checkbox" checked="checked" id="agree" name="checkBox"/>
						<font size="2" class="toxy"> 我已阅读并同意 <a
							href="javascript:openxy()" onclick="location.href='UserDeal.jsp';">《Line friend用户注册协议》</a> </font>
						<br />
						<br />

						<div class="content2-line">
							<div class="toregister" align="center">
								<!-- input type="submit"/> -->
								<!-- <a href="javascript:void(0);"
									onclick= document.register.submit();>
									<img src="assets/picture/捕获.PNG" /> </a> -->
								<!-- input id="submit1" type="image" src="../assets/picture/捕获.PNG" /-->
								<button id="submit1" type="submit" class="btn btn-default" >
									点我注册
								</button>
							</div>
						</div>
				</form>
			</div>
		</div>




	
		<div id="footer">
			<div class="footer1">
				<a href="http://www.nwafu.me"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="http://www.nwafu.me">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="http://www.nwafu.me">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">Line friend</a>
			</div>
			<div class="footer2">
				<div class="copyright">
					Copyright&copy;&nbsp;&nbsp;2015-2016&nbsp;&nbsp;@Line
					friend&nbsp;&nbsp;版权所有
				</div>
			</div>
		</div>

	</body>
</html>