
<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<title>我的LINEFRIEND</title>
		<link rel="stylesheet" href="assets/css/User.css" charset="utf-8" />
		<link rel="stylesheet" href="assets/css/UserOrder.css" charset="utf-8" />
		<link rel="stylesheet" href="assets/css/UserFavorite.css"
			charset="utf-8" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Personality.css"
			type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css"
			charset="utf-8" />
			<link rel="stylesheet" href="assets/css/payWay.css" type="text/css"
			charset="utf-8" />
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/AdminEmail.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="javascript" src="assets/js/windowOpen.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/backTop.js"
			type="text/javascript" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		
	</head>
	<body>
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onclick=addToFavorite();href="#"><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏LINE
					FRIEND</a>
			</div>
			<div class="header2">
				<nav class="nav">
				<ul class="nav__menu">
					<%
						String email = (String) session.getAttribute("email");
						if (email == null) {
					%>
					<li class="nav__menu-item">
						<a href="UserLogin.jsp">你好！请登录</a>
					</li>
					<li class="nav__menu-item">
						<a href="UserRegister.jsp">免费注册</a>
					</li>
					<%
						} else {
					%>
					<li class="nav__menu-item">
						你好！${email}
					</li>
					<li class="nav__menu-item">
						<a href="logout.action">退出登录</a>
					</li>
					<li class="nav__menu-item">
						<a href="myorderlist">我的订单</a>
					</li>
					<%
						}
					%>


					<li class="nav__menu-item">
						客户服务^
						<ul class="nav__submenu">
							<li class="nav__submenu-item">
								<a href="UserQuestion.html">常见问题</a>
							</li>
							<li class="nav__submenu-item">
								<a href="javascript:AdminEmail()">客服邮箱</a>
							</li>
						</ul>
					</li>
					<li class="nav__menu-item">
						网站导航^
						<ul class="nav__submenu">
							<li class="nav__menu-item">
								<a href="home.jsp">网站主页</a>
							</li>
							<li class="nav__menu-item">
								<a href="GoodsSearch.html">商品检索</a>
							</li>
							<li class="nav__menu-item">
								<a href="User.html">用户管理</a>
							</li>
							<li class="nav__menu-item">
								<a href="userCart.html">购物车</a>
							</li>
							<li class="nav__menu-item">
								<a href="userOrder.action">我的订单</a>
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

		<div id="con">
			<div id="Content">
				<img src="assets/homeImages/ban2.jpg" width="1200" height="100" />
				<!--  <form action="${pageContext.request.contextPath}/toSure.do" method="post"> -->
				<form action="toSure.action" method="get">
					<br />
					<br />
					<br />
					<br />
					<br />
					<table id="payTable">
						<tr>
							<td  colspan="4">
								<!-- 订单号：<INPUT TYPE="text" NAME="ordernum" value="201608080000002"> 
				支付金额：<INPUT TYPE="text" NAME="money" size="6" value="0.01">元 -->

							<div class="orderDiv">订单编号:${orderId} </div>
										
							<div class="orderDiv">支付金额:${totalPrice}元 </div>			
							<div class="orderDiv">收货人:${username} </div>			 
							<div class="orderDiv">收货地址:${address}</div>			
							<div class="orderDiv">联系方式:${phone}</div>		 
							<input type="hidden" name="orderId"
									value="${orderId}  " /> <input type="hidden" name="totalPrice"
									value="${totalPrice}" />
							</td>
							
						</tr>
						<tr >
							<td colspan="4">
								<br>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="backDiv">
								请您选择在线支付银行
							</td>
						</tr>
						<tr class="backDiv">
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="BOC-NET">
									中国银行 
								<img src="assets/homeImages/Bank/zh.png">
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET">
									工商银行 
								<img src="assets/homeImages/Bank/gs.png">
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET">
									农业银行 
								<img src="assets/homeImages/Bank/ny.png">
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET">
									建设银行
								<img src="assets/homeImages/Bank/jh.png"> 
							</td>
						</tr>
						<tr class="backDiv">
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET">
									民生银行
								<img src="assets/homeImages/Bank/ms.png"> 
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET">
									光大银行 
								<img src="assets/homeImages/Bank/gd.png">
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET">
									交通银行
								<img src="assets/homeImages/Bank/jt.png"> 
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET">
									深圳银行 
								<img src="assets/homeImages/Bank/sz.png">
							</td>
						</tr>
						<tr class="backDiv">
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET">
									北京银行
								<img src="assets/homeImages/Bank/bj.png"> 
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET">
									兴业银行
								<img src="assets/homeImages/Bank/xy.png"> 
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET">
									浦东银行 
								<img src="assets/homeImages/Bank/pd.png">
							</td>
							<td>
								<INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET">
									中信银行
								<img src="assets/homeImages/Bank/zx.png"> 
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<br>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<INPUT TYPE="submit" value="确认支付" id="payBotton">
							</td>
						</tr>
					</table>
				</form>

			</div>

			<div id="footer">
				<hr />
				<br />
				<div class="footer1">
					<a href="ShoppingProcess.html"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">LINEFRIEND社区</a>
				</div>
				<div class="footer2">
					<div class="copyright">
						Copyright&copy;&nbsp;&nbsp;2016-2017&nbsp;&nbsp;LINEFRIEND&nbsp;SC.com&nbsp;&nbsp;版权所有
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
