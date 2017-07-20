
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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>我的LINE FRIEND</title>
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

.AllOrders32 {
	float: right;
	margin-right: 40px;
	margin-top: 20px;
}

.p-price {
	margin-bottom: 20px;
}
</style>
	</head>
	<body>
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onclick=
	addToFavorite();
href="#"><img
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
					<a href="home.jsp"><img src="assets/homeImages/logo.png"
							width="195" height="60" />
					</a>
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
							<a href="home.jsp">首页</a>
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
						<a href="User.html">我的LINEFRIEND</a>
					</div>
					<div class="Personality2">
						<a href="findUserInfo.action">个人主页</a>
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
							<a href="#">我的订单</a>
						</div>
						<div class="Same">
							<a href="#">评价晒单</a>
						</div>
						<div class="Same">
							<a href="#">取消订单记录</a>
						</div>
					</div>
					<div class="VerticalBar2">
						<div class="VerticalBar21">
							<p>
								关注中心
							</p>
						</div>
						<div class="Same">
							<a href="gotoFavouriteList.action?email=${email}">关注的商品</a>
						</div>
					</div>
					<div class="VerticalBar3">
						<div class="VerticalBar41">
							<p>
								客户服务
							</p>
						</div>
						<div class="Same">
							<a href="PriceProtect.html">价格保护</a>
						</div>
						<div class="Same">
							<a href="UserIssue.html">意见建议</a>
						</div>
						<div class="Same">
							<a href="UserAdvice.html">购买咨询</a>
						</div>
					</div>
					<div class="VerticalBar5">
						<div class="VerticalBar51">
							<p>
								设置
							</p>
						</div>
						<div class="Same">
							<a href="#">个人信息</a>
						</div>
						<div class="Same">
							<a href="#">收货地址</a>
						</div>
					</div>
				</div>
				
				
				
				
				
				<div id="mymessage">
					<div class="mymessage">
						<div class="inf">
							<div class="info-lcol">
								<div class="u-pic">
									<img src="assets/homeImages/headImage/<%=session.getAttribute("headImage") %>" width="66" height="66" />
								</div>
								<div class="info-m">
									<div class="u-name">
										<a href="#"></a>
									</div>
									<div class="u-level">
										<span class="rank r1"> <s></s><a href="#">${user.trueName}</a> </span>
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
											<a href="#"><img src="assets/homeImages/fk.png" /> <i
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
									<label>
										余额：
									</label>
									<a href="#">99999.00</a>
								</div>
							</div>
						</div>
					</div>
					<div class="clearfloat"></div>
					<div class="mymessage" id="AllOrders">
						<div class="AllOrders1">
							<a href="userOrder.action">我的订单</a>
						</div>
						<div class="AllOrders32">
							<a href="userOrder.action">更多></a>
						</div>
						<div class="clearfloat"></div>
						<div class="AllOrders4">
							<table class="AllOrders41" width="780" cellspacing="0"
								cellpadding="0">
								<tr class="TabControl">
									<td height="30">
										订单信息
									</td>
									<td height="30">
										收货人
									</td>
									<td height="30">
										订单金额
									</td>
									<td height="30">
										<select name="select2">
											<option>
												最近三个月
											</option>
											<option>
												今年内
											</option>
											<option>
												2014年
											</option>
											<option>
												2013年
											</option>
										</select>
									</td>
									<td height="30">
										<select name="select">
											<option>
												全部状态
											</option>
											<option>
												等待付款
											</option>
											<option>
												等待自提
											</option>
											<option>
												等待收货
											</option>
											<option>
												已完成
											</option>
											<option>
												已取消
											</option>
										</select>
									</td>
									<td height="30">
										操作
									</td>
								</tr>
								<tr class="OrdersNumber">
									<td height="30" colspan="6" style="text-align: left">
										订单编号:01010101
									</td>
								</tr>
								<tr class="Canceled">
									<td width="200" height="100" style="text-align: left">
										<img src="assets/homeImages/gg1.jpg" width="50"
											height="50" />
										<img src="assets/homeImages/gg1.jpg" width="50" height="50" />
									</td>
									<td width="73">
										莎莉
									</td>
									<td width="75">
										￥98.00
										<br />
										在线支付
									</td>
									<td width="88">
										2016-06-12 
										<br />
										10:30:07
									</td>
									<td width="76">
										已取消
									</td>
									<td width="82">
										<a href="#">查看</a>|
										<a href="#">删除</a>
										<form id="form1" name="form1" method="post" action="">
											<input type="submit" name="button" id="button" value="还要买" />
										</form>
										<p>&nbsp;
											
										</p>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="clearfloat"></div>
					<div class="mymessage">
						<div class="AllOrders1">
							<a href="UserFavorite.html">关注的商品</a>
						</div>
						<div class="AllOrders32">
							<a href="UserFavorite.html">更多></a>
						</div>
						<div class="clearfloat"></div>
						<table width="780" cellpadding="0" cellspacing="0">
							<div class="goods">
								<div class="p-img">
									<a target="_blank" href="Goods.html"> <img width="160"
											height="160" data-img="1" alt="U100牌菠萝干"
											src="assets/homeImages/gg1.jpg">
									</a>
								</div>
								<div class="p-name">
									<input type="checkbox" value="996967" class="jdcheckbox"
										name="sku" />
									<a alt="U100牌菠萝干" title="U100牌菠萝干" target="_blank" href="">U100牌菠萝干</a>
									<div class="p-price">
										<strong price="10.68">¥10.68</strong>
										<span class="stock"></span>
									</div>
								</div>
							</div>
							<div class="goods">
								<div class="p-img">
									<a target="_blank" href="Goods.html"> <img width="160"
											height="160" data-img="1" alt="U100牌蔓越莓干"
											src="assets/homeImages/gg2.jpg">
									</a>
								</div>
								<div class="p-name">
									<input type="checkbox" value="996967" class="jdcheckbox"
										name="sku" />
									<a alt="U100牌蔓越莓干" title="U100牌蔓越莓干" target="_blank" href="">U100牌蔓越莓干</a>
									<div class="p-price">
										<strong price="10.68">¥10.68</strong>
										<span class="stock"></span>
									</div>
								</div>
							</div>
							<div class="goods">
								<div class="p-img">
									<a target="_blank" href="Goods.html"> <img width="160"
											height="160" data-img="1" alt="U100牌蜜桃干"
											src="assets/homeImages/gg3.jpg">
									</a>
								</div>
								<div class="p-name">
									<input type="checkbox" value="996967" class="jdcheckbox"
										name="sku" />
									<a alt="U100牌蜜桃干" title="U100牌蜜桃干" target="_blank" href="">U100牌蜜桃干</a>
									<div class="p-price">
										<strong price="10.68">¥10.68</strong>
										<span class="stock"></span>
									</div>
								</div>
							</div>
						</table>
					</div>
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
						<a target="_blank" href="foot/MemberIntroduction.html">购物流程</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/MemberIntroduction.html">会员介绍</a>
					</dd>
					<dd>
						<a target="_blank" href="UserQuestion.html">生活旅行/团购</a>
					</dd>
					<dd>
						<a target="_blank" href="UserQuestion.html">常见问题</a>
					</dd>
					<dd>
						<a target="_blank"
							href="http://wpa.qq.com/msgrd?v=3&uin=804194244&site=qq&menu=yes">联系客服</a>
					</dd>
				</dl>
				<dl>
					<dt>
						配送方式
					</dt>
					<dd>
						<a target="_blank" href="UserQuestion.html">上门自提</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/Tingri.html">限时送达</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/DiliveryService.html">配送服务查询</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/DistributionFee%20.html">配送费收取标准</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/OverseasDistribution.html">海外配送</a>
					</dd>
				</dl>
				<dl>
					<dt>
						支付方式
					</dt>
					<dd>
						<a target="_blank" href="http://blog.nwafu.me">货到付款</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/Dilivery3.html">在线支付</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/Dilivery5.html">信用卡支付</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/Dilivery4.html">蚂蚁花呗</a>
					</dd>
					<dd>
						<a target="_blank" href="foot/Dilivery1.html">快捷支付</a>
					</dd>
				</dl>
				<dl>
					<dt>
						售后服务
					</dt>
					<dd>
						<a target="_blank" href="http://www.nwafulive.cn">售后政策</a>
					</dd>
					<dd>
						<a target="_blank" href="PriceProtect.html">价格保护</a>
					</dd>
					<dd>
						<a target="_blank" href="PriceProtect.html">退款说明</a>
					</dd>
					<dd>
						<a target="_blank" href="PriceProtect.html">返修/退换货</a>
					</dd>
					<dd>
						<a target="_blank" href="PriceProtect.html">取消订单</a>
					</dd>
				</dl>
				<div>
					<img src="assets/homeImages/foot.png"/>
				</div>
			</div>
			<div id="footer">
				<hr />
				<br />
				<div class="footer1">
					<a href="ShoppingProcess.html"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a
						href="http://wpa.qq.com/msgrd?v=3&uin=804194244&site=qq&menu=yes">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="ShoppingProcess.html">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="http://www.nwafulive.cn">LINE FRIEND社区</a>
				</div>
				<div class="footer2">
					<div class="copyright">
						Copyright&copy;&nbsp;&nbsp;2016-2017&nbsp;&nbsp;LINE FRIEND&nbsp;
						nwafu.me&nbsp;&nbsp;版权所有
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
