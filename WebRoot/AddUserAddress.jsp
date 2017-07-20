<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
		<title>添加收货地址</title>
		<link rel="stylesheet" href="assets/css/User.css" charset="utf-8" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Personality.css"
			type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css"
			charset="utf-8" />
		<link rel="stylesheet" href="assets/css/AddUserAddress.css"
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
		<style>
.inf {
	width: 800px;
	height: 100px;
}

.info-lcol {
	width: 200px;
	text-align: center;
	float: left;
}

.u-pic {
	width: 100px;
	display: inline;
}

.info-m {
	width: 100px;
	display: inline;
}

.u-name a {
	text-decoration: none;
}

.u-level a {
	text-decoration: none;
}

.user-counts {
	float: left;
	width: 480px;
}

.user-counts ul {
	list-style: none;
}

.user-counts li {
	margin-top: 40px;
	float: left;
	width: 100px;
}

.user-counts a {
	text-decoration: none;
}

.right {
	margin-top: 60px;
	float: right;
	margin-right: 10px;
}

.right a {
	text-decoration: none;
}

.right label {
	height: 30px;
}

#AllOrders {
	height: 240px;
}

.horizontalBar {
	background-color: #F3F3F3;
	width: 770px;
	height: 25px;
	font-size: 14px;
	color: #333333;
	font-weight: bold;
	text-align: left;
	padding-top: 5px;
}

.poppup {
	width: 770px;
	height: 550px;
	background-color: #FFF;
	border: 2px solid #E6E6E6;
}

.fillInAddressTable {
	position: relative;
	left: 50px;
	right: 40px;
	top: 20px;
	color: #666666;
}

.fillInAddressTable tr td {
	padding: 5px;
}

.fillInAddressTable tr td a {
	color: #F00;
}

#textfield2,#textfield5 {
	width: 509px;
	border: 1px solid #c8cccf;
	height: 30px;
}

#textfield1,#textfield3,#textfield4,#textfield6 {
	width: 200px;
	border: 1px;
	border: 1px solid #c8cccf;
	height: 30px;
}
#province,#city,#district{
    border: 1px solid #c8cccf;
	height: 30px;
}

.saveAddressButton {
	width: 130px;
	border: 1px solid #999;
	height: 30px;
	position: relative;
	top: 25px;
	left: 57px;
	color: #333333;
}
</style>
	</head>
	<body>
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onclick=
	addToFavorite();;;
href="#"><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏Line
					friend</a>
			</div>
			<div class="header2">
				<nav class="nav">
				<ul class="nav__menu">
				
				
				
					<%
					
						String email=(String)session.getAttribute("email");
						if (email == null) {
					%>
					<li class="nav__menu-item">
						<a href="UserLogin.jsp">你好！请登录</a>
					</li>
					<li class="nav__menu-item">
						<a href="UserRegister.jsp">免费注册</a>
					</li>
					<%
						}else {
							%>
					<li class="nav__menu-item">
						你好！${email}
					</li>
					<li class="nav__menu-item">
						<a href="logout.action">退出登录</a>
					</li>
					<li class="nav__menu-item">
						<a href="userOrder.action">我的订单</a>
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
								<a href="GoodsSearch.jsp">商品检索</a>
							</li>
							<li class="nav__menu-item">
								<a href="User.jsp">用户管理</a>
							</li>
							<li class="nav__menu-item">
								<a href="showCart.action">购物车</a>
							</li>
							<li class="nav__menu-item">
								<a href="userOrder.action">我的订单</a>
							</li>
							<li class="nav__menu-item">
								<a href="gotoFavouriteList.action?email=${email}">我的收藏</a>
							</li>
						</ul>
					</li>
				</ul>
				</nav>
			</div>
		</div>

		<div class="clearfloat"></div>
		<div id="con">
			<div id="Search">
				<div class="Search1">
					<a href="home.html"><img src="assets/homeImages/logo.png"
							width="195" height="60" /> </a>
					<div class="welcome">
						<font size="+6" color="#CCCCCC">|</font><font size="+2">我的LINE</font>
					</div>
				</div>
				<div class="Search2">
					<form action="" method="get">
						<input id="Search21" type="text" name="search"
							placeholder="请输入搜索关键词" size="20" />
						<input id="Search22" type="button" value="搜索" />
					</form>
					<div class="Search3">
						<div class="Search31">
							热门搜索：
							<a href="#">夏威夷果</a>&nbsp;&nbsp;
							<a href="#">芒果干</a>&nbsp;&nbsp;
							<a href="#">肉脯</a>
						</div>
					</div>
				</div>
				<div class="Search4">
					<div class="Search41">
						<img src="assets/homeImages/小人.png" width="20" height="20" />
					</div>
					<div class="Search42" style="width: 135px;">
						<a href="User.jsp">我的LINE FRIEND</a>
					</div>
				</div>
				<div class="Search5">
					<div class="Search51">
						<img src="assets/homeImages/购物车小图标.png" width="20" height="20" />
					</div>
					<div class="Search52">
						<a href="showCart.action">去购物车结算</a>
					</div>
				</div>
			</div>
			<div class="content2">
				<div class="bt">
					<ul class="bt0">
						<li class="bt1" style="width: 224px;">
							<a target="_blank" href="#">全部商品品牌分类</a>
							<ul class="bt2">
								<li class="bt3">
									<a href="nut.html"><img src="assets/homeImages/logo/1.png"
											height="30" />&nbsp;&nbsp;&nbsp;坚果炒货</a>
								</li>
								<li class="bt3">
									<a href="fruit.html"><img
											src="assets/homeImages/logo/2.png" height="30" />&nbsp;&nbsp;&nbsp;果干蜜饯</a>
								</li>
								<li class="bt3">
									<a href="meat.html"><img src="assets/homeImages/logo/3.png"
											height="30" />&nbsp;&nbsp;&nbsp;肉类熟食</a>
								</li>
								<li class="bt3">
									<a href="biscuit.html"><img
											src="assets/homeImages/logo/4.png" height="30" />&nbsp;&nbsp;&nbsp;饼干膨化</a>
								</li>
								<li class="bt3">
									<a href="biscuit.html"><img
											src="assets/homeImages/logo/5.png" height="30" />&nbsp;&nbsp;&nbsp;糕点点心</a>
								</li>
								<li class="bt3">
									<a href="fruit.html"><img
											src="assets/homeImages/logo/6.png" height="30" />&nbsp;&nbsp;&nbsp;素食豆类</a>
								</li>
								<li class="bt3">
									<a href="seafood.html"><img
											src="assets/homeImages/logo/7.png" height="30" />&nbsp;&nbsp;&nbsp;鱿鱼海味</a>
								</li>
								<li class="bt3">
									<a href="#"><img src="assets/homeImages/logo/1.png"
											height="30" />&nbsp;&nbsp;&nbsp;其他食品</a>
								</li>
							</ul>
						</li>
						<li class="bt1">
							<a href="home.html">首页</a>
						</li>
						<li class="bt1">
							<a href="nut.html">坚果/炒货</a>
						</li>
						<li class="bt1">
							<a href="fruit.html">果干/蜜饯</a>
						</li>
						<li class="bt1">
							<a href="meat.html">肉类/熟食</a>
						</li>
						<li class="bt1">
							<a href="biscuit.html">饼干/膨化</a>
						</li>
						<li class="bt1">
							<a href="biscuit.html">糕点/点心</a>
						</li>
						<li class="bt1">
							<a href="fruit.html">素食/豆类</a>
						</li>
						<li class="bt1">
							<a href="seafood.html">鱿鱼/海味</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="Content">
				<div id="Personality">
					<div class="Personality1">
						<a href="User.jsp">我的LINEFRIEND</a>
					</div>
					<div class="Personality2">
						<a href="User.jsp">个人主页</a>
					</div>
					<div class="Personality3">
						<ul>
							<li class="Personality4">
								<a href="">设置</a>
								<ul class="Personality41">
									<li class="Personality42">
										<a href="EditUserMessage.jsp">编辑个人信息</a>
									</li>
									<li class="Personality42">
										<a href="findAllAddress.action">管理收货地址</a>
									</li>
									<li class="Personality42">
										<a href="userOrder.action">查看订单记录</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div class="clearfloat"></div>
				<div id="VerticalBar">
					<div class="VerticalBar1">
						<div class="VerticalBar11">
							<p>
								订单中心
							</p>
						</div>
						<div class="Same">
							<a href="userOrder.action">我的订单</a>
						</div>
						<div class="Same">
							<a href="UserRecommendInfo.html">评价晒单</a>
						</div>
					</div>
					<div class="VerticalBar2">
						<div class="VerticalBar21">
							<p>
								我的收藏
							</p>
						</div>
						<div class="Same">
							<a href="UserFavorite.html">收藏的商品</a>
						</div>
					</div>
					<div class="VerticalBar5">
						<div class="VerticalBar51">
							<p>
								设置
							</p>
						</div>
						<div class="Same">
							<a href="getUserInfo.action">个人信息</a>
						</div>
						<div class="Same">
							<a href="UserAddress.jsp">收货地址</a>
						</div>
						<div class="Same">
							<a href="UserQuestion.html">常见问题</a>
						</div>
					</div>
				</div>
				<div id="mymessage">
					<div class="mymessage">
						<div class="inf">
							<div class="info-lcol">
								<div class="u-pic">
									<img src="assets/homeImages/tx.png" width="66" height="66" />
								</div>
								<div class="info-m">
									<div class="u-name">
										<a href="#">小李</a>
									</div>
									<div class="u-level">
										<span class="rank r1"> <s></s><a href="#">注册会员</a> </span>
									</div>
								</div>
							</div>
							<div class="user-counts">
								<ul>
									<li>
										<div class="count-item">
											<a href="#"><img src="assets/homeImages/fk.png" /> <i
												class="count-icon count-icon01"></i> 待付款 <em id="waitPay">0</em>
											</a>
										</div>
									</li>
									<li>
										<div class="count-item">
											<a href="#"><img src="assets/homeImages/sh.png" /> <i
												class="count-icon count-icon02"></i> 待收货 <em
												id="waitReceive">0</em> </a>
										</div>
									</li>
									<li>
										<div class="count-item">
											<a href="#"><img src="assets/homeImages/zt.png" /> <i
												class="count-icon count-icon03"></i> 待自提 <em id="waitPick">0</em>
											</a>
										</div>
									</li>
									<li>
										<div class="count-item">
											<a href="#"><img src="assets/homeImages/pj.png" /> <i
												class="count-icon count-icon04"></i> 待评价 <em
												id="productCount">0</em> </a>
										</div>
									</li>
								</ul>
							</div>
							<div class="right">
								<div>
									<label>
										余额：
									</label>
									<a href="#">9999.00</a>
								</div>
								<div>
									<label></label>
									<a href="#"></a>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfloat"></div>

					<div class="poppup">
						<form id="form1" name="form1" method="post"
							action="addUserAddress.action">
							<div class="horizontalBar">
								添加收货地址
							</div>
							<div class="fillInAddress">
								<table class="fillInAddressTable" width="800" border="0">
									<tr>
										<td colspan="3">
											<a>*</a>收货人：
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<label for="textfield"></label>
											<input name="receive_name" type="text" class="user-counts" value="${editAddress.receive_name }"
												id="textfield1" />
											</form>
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<a>*</a>所在地区：
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<a></a>
											<input type="text" name="province" id="province" value="${editAddress.province }"/>
											省
											<input type="text" name="city" id="city" value="${editAddress.city }" />
											市
											<input type="text" name="district" id="district" value="${editAddress.district }" />
											区
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<a>*</a>详细地址：
										</td>
									</tr>
									<tr>
										<td colspan="3">

											<label for="textfield2" width="400"></label>
											<input type="text" name="full_address" id="textfield2" value="${editAddress.full_address }" />

										</td>
									</tr>
									<tr>
										<td width="216">
											<a>*</a>手机号码：
										</td>
										<td width="78">&nbsp;
											
										</td>
										<td width="392">
											<a>*</a>邮编：
										</td>
									</tr>
									<tr>
										<td>

											<label for="textfield3"></label>
											<input type="text" name="phone" id="textfield3" value="${editAddress.phone }" />

										</td>
										<td>
											&nbsp;&nbsp;
										</td>
										<td>

											<label for="textfield4"></label>
											<input type="text" name="postal_code" id="textfield4" value="${editAddress.postal_code }" />

										</td>
									</tr>

								</table>
							</div>
							<div>
								<input class="saveAddressButton" name="" type="submit"
									value="保存收货地址" />
							</div>
						</form>
					</div>

				</div>

				<div id="ban">
					<img src="assets/homeImages/ban2.jpg" width="1200" height="100"
						alt="间隔图片" />
				</div>
				<div id="foot_server">
					<dl>
						<dt>
							购物指南
						</dt>
						<dd>
							<a target="_blank" href="#">购物流程</a>
						</dd>
						<dd>
							<a target="_blank" href="#">会员介绍</a>
						</dd>
						<dd>
							<a target="_blank" href="#">生活旅行/团购</a>
						</dd>
						<dd>
							<a target="_blank" href="#">常见问题</a>
						</dd>
						<dd>
							<a target="_blank" href="#">联系客服</a>
						</dd>
					</dl>
					<dl>
						<dt>
							配送方式
						</dt>
						<dd>
							<a target="_blank" href="#">上门自提</a>
						</dd>
						<dd>
							<a target="_blank" href="#">211限时送达</a>
						</dd>
						<dd>
							<a target="_blank" href="#">配送服务查询</a>
						</dd>
						<dd>
							<a target="_blank" href="#">配送费收取标准</a>
						</dd>
						<dd>
							<a target="_blank" href="#">海外配送</a>
						</dd>
					</dl>
					<dl>
						<dt>
							支付方式
						</dt>
						<dd>
							<a target="_blank" href="#">货到付款</a>
						</dd>
						<dd>
							<a target="_blank" href="#">在线支付</a>
						</dd>
						<dd>
							<a target="_blank" href="#">分期付款</a>
						</dd>
						<dd>
							<a target="_blank" href="#">邮局汇款</a>
						</dd>
						<dd>
							<a target="_blank" href="#">公司转账</a>
						</dd>
					</dl>
					<dl>
						<dt>
							售后服务
						</dt>
						<dd>
							<a target="_blank" href="#">售后政策</a>
						</dd>
						<dd>
							<a target="_blank" href="#">价格保护</a>
						</dd>
						<dd>
							<a target="_blank" href="#">退款说明</a>
						</dd>
						<dd>
							<a target="_blank" href="#">退换货</a>
						</dd>
						<dd>
							<a target="_blank" href="#">取消订单</a>
						</dd>
					</dl>
					<div>
						<img src="assets/homeImages/foot.png" />
					</div>
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
				<div class="totop" id="totop" onclick=
	bt();
>
					<img src="assets/homeImages/top.png" width="21" height="40" />
				</div>
			</div>
	</body>
</html>
