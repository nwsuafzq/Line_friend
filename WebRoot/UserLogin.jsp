<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="icon" href="assets/picture/LOG0-2.png" mce_href="#"
			type="image/x-ico" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>用户登录</title>
		<link href="assets/css/UserLogin.css" rel="stylesheet"
			type="text/css" />
		<style>body {
			cursor: url('assets/picture/cursor.ico'), auto;
		}
		</style>
		
		
		<!-- ......................................... -->
		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<!-- ....................................... -->
		
	</head>

	<body>
		<div id="head">

			<div class="head1">

				<a rel="sidebar" onclick=addToFavorite(); href="home.jsp">

					<img style="position: relative; top: 1px;"
						src="assets/picture/love2.jpg" height="13" width="15" />

					&nbsp;&nbsp;收藏Line friend</a>
			&nbsp;&nbsp;<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
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
						<a href="../购物车/购物车.html">&nbsp;购物车&nbsp;</a><a>|</a>
					</li>

					<li class="nav__menu-item">
						&nbsp;我的Lineˇ

						<ul class="nav__submenu">

							<li class="nav__submenu-item">
								<a href="../支付与订单/wodedingdan.html">我的订单</a>
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
								<a href="../../支付与订单/PersonTransfer.html">用户管理</a>
							</li>

							<li class="nav__menu-item">
								<a href="../../购物车/购物车.html"> 购物车</a>
							</li>

							<li class="nav__menu-item">
								<a href="../../支付与订单/wodedingdan.html">我的订单</a>
							</li>

							<li class="nav__menu-item">
								<a href="UserFavorite.html">我的收藏</a>
							</li>

						</ul>

					</li>

				</ul>

				</nav>

			</div>

		</div>
		</div>
		<div class="logo">
			<a href="home.jsp"><img
					src="assets/picture/LOGO-2.png" /> </a>
			<div class="welcome">
				<font size="+2">欢迎登陆</font>
			</div>
		</div>

		<div id="container">
			<div class="content1">
				<img src="assets/picture/登陆注册.png" height="460" width="1200" />
			</div>
			<div class="content2">
				<div class="content2-line">
					<font
						style="position: relative; top: 25px; left: 25px; float: left;"
						size="+2">用户登录</font>
					<a href="UserRegister.jsp"><font
						style="position: relative; top: 25px; right: 25px; float: right; color: #F36;"
						size="+1">立即注册</font> </a>
				</div>
				<form name="login" id="login" action="login.action" method="post">
					<div class="content2-line" align="center">
						<label class="form-content">
							用户名:
						</label>
						<input class="form-input" type="text" id="userName" name=email />
						
					</div>
					<span class="form-span" style="color:red;font-size:12px;">${loginError}</span>
					<div class="content2-line" align="center">
						<label class="form-content">
							密&nbsp;&nbsp;&nbsp;码:
						</label>
						<input class="form-input" type="password" name="password"
							id="userPassword" />
					</div>
					<div class="content2-line" align="left">
						<input class="check" type="checkbox" checked="checked" id="agree" />
						<font size="2" class="check">下次自动登录</font>
					</div>
					<br />
					<br />
					<div class="content2-line">
						<div class="toregister" align="center">
							<a href="javascript:void(0);" onclick=document.forms[0].submit();><img
									src="assets/picture/捕获登录.PNG" /> </a>

						</div>
					</div>
				</form>
			</div>
		</div>

		<div id="footer">
			<div class="footer1">
				<a href="#"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="#">Line friend</a>
			</div>
			<div class="footer2">
				<div class="copyright">
					Copyright&copy;&nbsp;&nbsp;2015-2016&nbsp;&nbsp;<@>Line
					friend</@>&nbsp;&nbsp;版权所有
				</div>
			</div>
		</div>


	</body>
</html>
