<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>Line friend零食铺-我的购物车</title>

		<script src="http://code.jquery.com/jquery-1.6.1.min.js"
			type="text/javascript"></script>
		<script language="JavaScript" src="assets/js/cart.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/backTop.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/AdminEmail.js"
			type="text/javascript" charset="utf-8"></script>
			<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<link rel="stylesheet" href="assets/css/buy.css" charset="utf-8" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/UserCart.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="assets/css/cartStyle.css">


	</head>
	<body onload=>
		<div id="header">
			<div class="header1">
				<a rel="sidebar" onclick=addToFavorite();;;;;; href="#"><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏LINE
					FRIEND</a>
				<i class="fa fa-optin-monster"></i>&nbsp;<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
			</div>

			<div class="header2">
				<nav class="nav">
				<ul class="nav__menu">
					<%
						//String email = request.getParameter("email");
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
								<a href="home.html">网站主页</a>
							</li>
							<li class="nav__menu-item">
								<a href="GoodsSearch.html">商品检索</a>
							</li>
							<li class="nav__menu-item">
								<a href="User.html">用户管理</a>
							</li>
							<li class="nav__menu-item">
								<a href="UserCart.html">购物车</a>
							</li>
							<li class="nav__menu-item">
								<a href="UserOrder.html">我的订单</a>
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
							style="height: 80px; width: 195px;" /> </a>
					<div class="welcome">
						<font size="+6" color="#CCCCCC">|</font><font size="+2">购物车</font>
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
							<a href="#">芒果干</a>&nbsp;&nbsp;
							<a href="#">夏威夷果</a>&nbsp;&nbsp;
							<a href="#">蔬菜饼</a>
						</div>
					</div>
				</div>
				<div class="Search4">
					<div class="Search41">
						<img src="assets/homeImages/小人.png" width="20" height="20" />
					</div>
					<div class="Search42" style="width: 200px;">
						<a href="userOrder.action">我的LINE FRIEND</a>
					</div>
				</div>
				<div class="Search5">
					<div class="Search51">
						<img src="assets/homeImages/购物车小图标.png" width="20" height="20" />
					</div>
					<div class="Search52">
						<a href="showCart.action">结算中......</a>
					</div>
				</div>
			</div>
			<div class="clearfloat"></div>
			<div id="content">
				<div class="content1">
					<div class="bt">
						<ul class="bt0">
							<li class="bt1" style="width: 150px;">
								<a target="_blank" href="#">全部商品分类</a>
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
										<a href="meat.html"><img
												src="assets/homeImages/logo/3.png" height="30" />&nbsp;&nbsp;&nbsp;肉类熟食</a>
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
							<li class="bt1" style="width: 100px;">
								<a href="home.jsp">首页</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="nut.html">坚果/炒货</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="fruit.html">果干/蜜饯</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="meat.html">肉类/熟食</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="biscuit.html">饼干/膨化</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="biscuit.html">糕点/点心</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="fruit.html">素食/豆类</a>
							</li>
							<li class="bt1" style="width: 130px;">
								<a href="seafood.html">鱿鱼/海味</a>
							</li>
						</ul>
					</div>
				</div>

				<div id="space"></div>
				<div class="catbox">
					<table id="cartTable">
						<thead>
							<tr>
								<th>
									<label>
										<input class="check-all check" type="checkbox" />
										&nbsp;&nbsp;全选
									</label>
								</th>
								<!--
								<th>
									编号
								</th>

								-->
								<th>
									商品
								</th>
								<th>
									单价
								</th>
								<th>
									数量
								</th>
								<th>
									小计
								</th>
								<th>
									操作
								</th>
							</tr>
						</thead>
						<tbody>


							<script>


	//获取每行的商品id和数量

	function getProductId() {
		var id = "";
		var num = "";
		var table = document.getElementById('cartTable'); // 购物车表格
		var tr = table.children[1].rows; //行
		var all = tr.length;
		for ( var i = 0, len = tr.length; i < len; i++) {
			if (tr[i].getElementsByTagName('input')[0].checked) {
				id += tr[i].getElementsByTagName('input')[2].value+",";
				num +=tr[i].getElementsByTagName('input')[1].value+",";
				//alert(id+"----"+num);
				all=all-1;
			}
		}
		if(all==tr.length){
		alert("您还没有选中要提交的商品，请先选中要提交了的商品");
		}else{
		var action = 'gotoOrder.action?id=' + id + '&num=' + num;
		window.location.href = action;
	}
	}
	
	
</script>


							<!-- 购物车页面开始加载购物车表中的数据 -->

							<c:forEach items="${cartList}" var="cartItem" varStatus="status">
								<tr>
									<td class="checkbox">
										<input class="check-one check" type="checkbox" />
									</td>

									<td class="goods">
										<img
											src="${cartItem.product.product_pic}"
											alt="" />
										<span>${cartItem.product.product_name}</span>
									</td>
									<td class="price">
										${cartItem.product.dangqian_price}
									</td>
									<td class="count">
										<span class="reduce"></span>
										<input id="product_count" class="count-input" type="text"
											name="product_count" value="${cartItem.product_count}" />
										<span class="add">+</span>
									</td>
									<td class="subtotal">
									</td>
									<td class="operation">
										<span class="delete"><a href="deleteCartItem.action?id=${cartItem.product.id}">删除</a></span>
									</td>

									<input id="product_id" type="hidden" name="product_id"
										value="${cartItem.product.id} " size="2" />
								</tr>
							</c:forEach>


						</tbody>
					</table>
					<div class="foot" id="foot">
						<label class="fl select-all">
							<input type="checkbox" class="check-all check" />
							&nbsp;&nbsp;全选
						</label>
						<a class="fl delete" id="deleteAll" href="javascript:;">删除</a>
						<div class="fr closing" onclick=getTotal();>
							<a href="javascript:getProductId();">结 算</a>
						</div>
						<input type="hidden" id="cartTotalPrice" />
						<div class="fr total">
							合计：￥
							<span id="priceTotal">0.00</span>
						</div>
						<div class="fr selected" id="selected">
							已选商品
							<span id="selectedTotal">0</span>件
							<span class="arrow up">︽</span><span class="arrow down">︾</span>
						</div>
						<div class="selected-view">
							<div id="selectedViewList" class="clearfix">
								<div>
									<img src="images/1.jpg">
									<span>取消选择</span>
								</div>
							</div>
							<span class="arrow">◆<span>◆</span> </span>
						</div>
					</div>
				</div>
			</div>
			<div class="clearfloat"></div>

			<div id="ban" >
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
