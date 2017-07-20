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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>LINE FRIEND</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />


		<link rel="stylesheet" href="assets/css/SC.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />

		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<style>
body {
	cursor: url('assets/picture/cursor.ico'), auto;
}
</style>
		<script language="JavaScript" src="assets/js/jquery-1.11.3.min.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/cbl.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/AdminEmail.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/jquery-1.5.1.min.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/btdw.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/tplz.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/jquery-1.2.6.js.js"
			type="text/javascript" charset="utf-8"></script>


		<script language="JavaScript" type="text/javascript" charset="utf-8">
	window.onload = function() {
		$
				.ajax( {
					"url" : "loadProduct.action",
					"type" : "post",
					"dataType" : "json",
					"success" : function(data) {
						var html = '';
						var ulli_1f_1 = '';
						var ulli_1f_2 = '';
						var ulli_2f_1 = '';
						var ulli_2f_2 = '';
						var ulli_3f_1 = '';
						var ulli_3f_2 = '';
						var result = eval(data);
						var len = result.length;
						for ( var i = 0; i < len; i++) {
							html+='<div id="pics"><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /><div id="detail">'+result[i].product_name+'<br><span>折扣价：'+result[i].dangqian_price+'元</span></div> </a></div>'
						}
						for ( var i = 0; i < 4; i++) {
							ulli_1f_1 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_1f_1 = ulli_1f_1 + '<div class="clearfloat"></div>'
						
						for ( var i = 4; i < 8; i++) {
							ulli_1f_2 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_1f_2 = ulli_1f_2 + '<div class="clearfloat"></div>'
						
						for ( var i = 8; i < 12; i++) {
							ulli_2f_1 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_2f_1 = ulli_2f_1 + '<div class="clearfloat"></div>'
						
						for ( var i = 12; i < 16; i++) {
							ulli_2f_2 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_2f_2 = ulli_2f_2 + '<div class="clearfloat"></div>'
						
						for ( var i = 16; i < 20; i++) {
							ulli_3f_1 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_3f_1 = ulli_3f_1 + '<div class="clearfloat"></div>'
						
						for ( var i = 20; i < 24; i++) {
							ulli_3f_2 += '<li><a href="showProductdetail.action?id='+result[i].id+'"><img src="'+result[i].product_pic+'" /> </a></li>'
						}
						ulli_3f_2 = ulli_3f_2 + '<div class="clearfloat"></div>'

						$("#P1").html(html);
						$("#ulli_1f_1").html(ulli_1f_1);
						$("#ulli_1f_2").html(ulli_1f_2);
						$("#ulli_2f_1").html(ulli_1f_2);
						$("#ulli_2f_2").html(ulli_2f_2);
						$("#ulli_3f_1").html(ulli_3f_1);
						$("#ulli_3f_2").html(ulli_3f_2);
					}
				});
	};
</script>

		<link
			href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
			rel="stylesheet">
	</head>
	<body>
		<div class="cbl1">
			<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
				<a href="showCart.action"><img
						src="assets/homeImages/shopping.png" /> </a>
				<div class="hide_show" style="top: 0px;">
					<a href="showCart.action">购物车</a>
				</div>
			</p>
			<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
				<a href="javascript:IMChat();"> <img
						src="assets/homeImages/heart.png" /> </a>
				<div class="hide_show" style="top: 33px;">
					实时吐槽
				</div>
			</p>
			<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
				<a href="http://wpa.qq.com/msgrd?v=3&uin=804194244&site=qq&menu=yes"><img
						src="assets/homeImages/service.png" /> </a>
				<div class="hide_show" style="top: 66px;">
					联系客服
				</div>
			</p>
		</div>
		<div class="cbl2">
			<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
				<a href="#header"><img src="assets/homeImages/top.png" /> </a>
				<div class="Search4">
					<div class="Search41">
						<img src="assets/homeImages/小人.png" width="20" height="20" />
					</div>
					<div class="Search42" style="width: 135px;">
						<a href="User.jsp">我的LINE FRIEND</a>
					</div>
				</div>
				<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
					<div class="hide_show" style="top: 0px;">
						回到顶部
					</div>
				</p>
				<p class="img_a" onmouseover=
	hide_show_2(this);;;
onmouseout=
	hide_show_1(this);
>
					<a
						href="http://wpa.qq.com/msgrd?v=3&uin=804194244&site=qq&menu=yes"><img
							src="assets/homeImages/manager.png" /> </a>
					<div class="hide_show" style="top: 33px;">
						反馈
					</div>
				</p>
		</div>
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onClick=
	addToFavorite();;;
href=""><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏LINE
					FRIEND</a>
				<i class="fa fa-optin-monster"></i>&nbsp;
				<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
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
							<!--<li class="nav__menu-item">
								<a href="userCart.html">购物车</a>
							</li>
							-->
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


		<div class="banner">
		</div>
		<div id="con">
			<div id="Search">
				<div class="Search1">
					<a href="home.jsp"><img src="assets/homeImages/logo.png"
							width="195" height="80" /> </a>
				</div>
				<div class="Search2">
					<form action="searchProduct.action" method="post">
						<input id="Search21" type="text" name="product_name"
							placeholder="请输入搜索关键词" size="20" />
						<input id="Search22" type="submit" value="搜索" />
					</form>
					<div class="Search3">
						<div class="Search31">
							热门搜索：
							<a href="searchProduct.action?product_name=草莓干">草莓干</a>&nbsp;&nbsp;
							<a href="searchProduct.action?product_name=肉">肉</a>&nbsp;&nbsp;
							<a href="searchProduct.action?product_name=鱿鱼">鱿鱼</a>
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
			<div id="con0">
				<div class="bt">
					<ul class="bt0">
						<li class="bt1" style="width: 222px;">
							<span>全部商品品牌分类</span>
						</li>

						<li class="bt1" style="width: 132px;">
							<a href="searchByCategory.action?keywords=果干蜜饯">果干/蜜饯</a>
						</li>
						<li class="bt1" style="width: 134px;">
							<a href="searchByCategory.action?keywords=坚果炒货">坚果/炒货</a>
						</li>
						<li class="bt1" style="width: 132px;">
							<a href="searchByCategory.action?keywords=肉类熟食">肉类/熟食</a>
						</li>
						<li class="bt1" style="width: 132px;">
							<a href="searchByCategory.action?keywords=饼干膨化">饼干/膨化</a>
						</li>
						<li class="bt1" style="width: 132px;">
							<a href="searchByCategory.action?keywords=糕点点心">糕点/点心</a>
						</li>
						<li class="bt1" style="width: 132px;">
							<a href="searchByCategory.action?keywords=素食豆类">素食/豆类</a>
						</li>
						<li class="bt1" style="width: 135px;">
							<a href="searchByCategory.action?keywords=鱿鱼海味">鱿鱼/海味</a>
						</li>
					</ul>
				</div>
				<div id="con1">
					<ul class="bt4">

						<li class="bt5">
							<a href="searchByCategory.action?keywords=果干蜜饯"><img
									src="assets/homeImages/logo/2.png" height="33" />&nbsp;&nbsp;果干蜜饯</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=坚果炒货"><img
									src="assets/homeImages/logo/1.png" height="34" />&nbsp;&nbsp;坚果炒货</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=肉类熟食"><img
									src="assets/homeImages/logo/3.png" height="34" />&nbsp;&nbsp;肉类熟食</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=饼干膨化"><img
									src="assets/homeImages/logo/4.png" height="34" />&nbsp;&nbsp;饼干膨化</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=糕点点心"><img
									src="assets/homeImages/logo/5.png" height="34" />&nbsp;&nbsp;糕点点心</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=素食豆类"><img
									src="assets/homeImages/logo/6.png" height="33" />&nbsp;&nbsp;素食豆类</a>
						</li>
						<li class="bt5">
							<a href="searchByCategory.action?keywords=鱿鱼海味"><img
									src="assets/homeImages/logo/7.png" height="34" />&nbsp;&nbsp;鱿鱼海味</a>
						</li>
						<li class="bt5">
							<a href="#"><img src="assets/homeImages/logo/1.png"
									height="34" />&nbsp;&nbsp;其他食品</a>
						</li>
					</ul>
				</div>
				<div id="con2">
					<div class="imgsBox">
						<div class="imgs">
							<a href="seafood.html"> <img id="pic"
									src="assets/homeImages/11.jpg" width="720" height="380" /> </a>
						</div>
						<div class="clickButton">
							<div>
								<a class="active" href="">1</a>
								<a class="active" href="">2</a>
								<a class="active" href="">3</a>
							</div>
						</div>
					</div>
				</div>
				<div id="con3">
					<div class="message">
						<span>零食快报<a href="">更多&nbsp;></a> </span>
						<div class="message_div_1">
							<ul>
								<li>
									<a href="Gonggao.jsp?content=LINE FRIEND新成立
										满200减50" target="_blank">
										<b>[特惠]</b> LINE FRIEND新成立 满200减50</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=每日十点新品发布 火热销售中" target="_blank"><b>[热销]</b> 每日十点新品发布 火热销售中</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=订单数量剧增 部分地区配送延迟" target="_blank"><b>[公告]</b> 订单数量剧增 部分地区配送延迟</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=快来！！！！" target="_blank"><b>[公告]</b> 快来！！！！</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=亦可赛艇！？" target="_blank"><b>[消息]</b> 亦可赛艇！？</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=苟利国家生死以" target="_blank"><b>[公告]</b> 苟利国家生死以</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=订单数量剧增 部分地区配送延迟" target="_blank"><b>[通知]</b> 订单数量剧增 部分地区配送延迟</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=Linefriend迎来第一百万个客户！" target="_blank"><b>[公告]</b>
										Linefriend迎来第一百万个客户！</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=订单数量剧增 部分地区配送延迟" target="_blank"><b>[公告]</b> 订单数量剧增 部分地区配送延迟</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=快点买吧！！！！！" target="_blank"><b>[通知]</b> 快点买吧！！！！！</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=免费送奖品！！！" target="_blank"><b>[公告]</b> 免费送奖品！！！</a>
								</li>
								<li>
									<a href="Gonggao.jsp?content=满100送100" target="_blank"><b>[娱乐]</b> 满100送100</a>
								</li>
							</ul>
						</div>

					</div>
				</div>
			</div>
			<div id="picture">
				<div id="P" align="center">
					<div id="inP">
						<div id="P1" align="center">

							<!-- 在上面js中 -->
							<!--<div id="pics"><a href="Goods.html"><img src="assets/homeImages/brandandcategory/bg.jpg" /><div id="detail">日式拉面说番茄豚骨拉面条速食面方便面<br><span>折扣价：23.00</span></div> </a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/brandandcategory/jg2.jpg" /><div id="detail">U100开心果手剥坚果干果休闲炒货<br><span>折扣价：14.45</span></div> </a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/gg3.jpg" /><div id="detail">熊猫有礼什锦果蔬干脆片酥脆休闲小吃<br><span>折扣价：19.90</span></div></a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/gg6.jpg" /><div id="detail">U100牌菠萝干<br><span>折扣价：10.68</span></div></a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/brandandcategory/bg3.jpg" /><div id="detail">正宗广西柳州特产螺蛳粉真空方便面<br><span>折扣价：12.50</span></div> </a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/brandandcategory/rl2.jpg" /><div id="detail">灯影牛肉丝休闲零食特产四川麻辣牛肉干<br><span>折扣价：28.00</span></div> </a></div>
							<div id="pics"><a href="Goods.html"><img src="assets/homeImages/brandandcategory/bg8.jpg" /> <div id="detail">奥莱曼椰子汁鸡蛋卷酥脆饼干水果味<br><span>折扣价：15.80</span></div></a></div>
						-->
						</div>
					</div>
					<script language="JavaScript" src="assets/js/marquee2.js"
						type="text/javascript" charset="utf-8"></script>
				</div>

			</div>
			<div id="idbtdw">
				<div class="btdw">
					<a href="#con5">坚果炒货</a>
					<a href="#con6">果干蜜饯</a>
					<a href="#con7">肉类熟食</a>
					<a href="#con8">饼干膨化</a>
					<a href="#con9">糕点点心</a>
					<a href="#con10">素食豆类</a><a href="#con11">鱿鱼海味</a><a href="#con12">其他</a>
				</div>
			</div>

			<div id="con5" class="content">
				<div class="headerLeft">
					<ul>
						<li class="floorName">
							1F 坚果/炒货
						</li>
					</ul>
				</div>
				<!--headerLeft-->
				<div class="headerRight">
					<ul>
						<li>
							今日精选
						</li>
						<li>
							热卖商品
						</li>
						<li>
							猜你喜欢
						</li>
					</ul>
				</div>
				<!--headerRight-->
				<div class="clearfloat"></div>
				<!--clearfloat-->
				<div class="conContenter">
					<div class="contenterLeft">
						<div class="leftTop">
							<img src="assets/homeImages/jianguo.jpg" />
						</div>
						<!--leftTop-->
						<div class="leftBottom">
							尝鲜价：
							<span>￥29.00</span>
						</div>
						<!--leftBottom-->
					</div>
					<!--contenerLeft-->
					<div class="contenterRight">
						<div class="rightTop">
							<div class="rightTitle">
								今日精选
							</div>
							<!--rightTitle-->
							<div class="clearfloat"></div>
						</div>
						<!--rightTop-->
						<div class="rightBottom">
							<ul id="ulli_1f_1">
								<!-- 在js中 -->
							</ul>
							<ul id="ulli_1f_2">
								<!-- 在js中 -->
							</ul>

						</div>
						<!--rightBottom-->
						<div class="rightfooter">
							<a href="javascript:location.reload();"><img src="assets/homeImages/reload.png"
									width="20" height="20">换一批</a>
						</div>
					</div>
					<!--contenterRight-->
					<div class="clearfloat"></div>
				</div>
				<div class="conFooter">
					<ul>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/2.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/3.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/4.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/5.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/6.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/7.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
					</ul>
				</div>
			</div>
			<!--con5-->
			<div id="con6" class="content">
				<div class="headerLeft">
					<ul>
						<li class="floorName">
							2F 果干/蜜饯
						</li>
					</ul>
				</div>
				<!--headerLeft-->
				<div class="headerRight">
					<ul>
						<li>
							今日精选
						</li>
						<li>
							热卖商品
						</li>
						<li>
							猜你喜欢
						</li>
					</ul>
				</div>
				<!--headerRight-->
				<div class="clearfloat"></div>
				<!--clearfloat-->
				<div class="conContenter">
					<div class="contenterLeft">
						<div class="leftTop">
							<img src="assets/homeImages/jianguo.jpg" />
						</div>
						<!--leftTop-->
						<div class="leftBottom">
							尝鲜价：
							<span>￥29.00</span>
						</div>
						<!--leftBottom-->
					</div>
					<!--contenerLeft-->
					<div class="contenterRight">
						<div class="rightTop">
							<div class="rightTitle">
								今日精选
							</div>
							<!--rightTitle-->
							<div class="clearfloat"></div>
						</div>
						<!--rightTop-->
						<div class="rightBottom">
							<ul id="ulli_2f_1">
								<!-- 在js中 -->
							</ul>
							<ul id="ulli_2f_2">
								<!-- 在js中 -->
							</ul>
						</div>
						<!--rightBottom-->
						<div class="rightfooter">
							<a href="javascript:location.reload();"><img src="assets/homeImages/reload.png"
									width="20" height="20">换一批</a>
						</div>
					</div>
					<!--contenterRight-->
					<div class="clearfloat"></div>
				</div>
				<div class="conFooter">
					<ul>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/2.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/3.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/4.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/5.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/6.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/7.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
					</ul>
				</div>
			</div>
			<div id="con7" class="content">
				<div class="headerLeft">
					<ul>
						<li class="floorName">
							3F 肉类/熟食
						</li>
					</ul>
				</div>
				<!--headerLeft-->
				<div class="headerRight">
					<ul>
						<li>
							今日精选
						</li>
						<li>
							热卖商品
						</li>
						<li>
							猜你喜欢
						</li>
					</ul>
				</div>
				<!--headerRight-->
				<div class="clearfloat"></div>
				<!--clearfloat-->
				<div class="conContenter">
					<div class="contenterLeft">
						<div class="leftTop">
							<img src="assets/homeImages/jianguo.jpg" />
						</div>
						<!--leftTop-->
						<div class="leftBottom">
							尝鲜价：
							<span>￥29.00</span>
						</div>
						<!--leftBottom-->
					</div>
					<!--contenerLeft-->
					<div class="contenterRight">
						<div class="rightTop">
							<div class="rightTitle">
								今日精选
							</div>
							<!--rightTitle-->
							<div class="clearfloat"></div>
						</div>
						<!--rightTop-->
						<div class="rightBottom">
							<ul id="ulli_3f_1">
								<!-- 在js中 -->
							</ul>
							<ul id="ulli_3f_2">
								<!-- 在js中 -->
							</ul>
						</div>
						<!--rightBottom-->
						<div class="rightfooter">
							<a href="javascript:location.reload();"><img src="assets/homeImages/reload.png"
									width="20" height="20">换一批</a>
						</div>
					</div>
					<!--contenterRight-->
					<div class="clearfloat"></div>
				</div>
				<div class="conFooter">
					<ul>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/2.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/3.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/4.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/5.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/6.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/7.png" /> </a>
						</li>
						<li>
							<a href="#"><img src="assets/homeImages/logo/1.png" /> </a>
						</li>
					</ul>
				</div>
			</div>
			<div id="ban">
				<img src="assets/homeImages/ban1.jpg" width="1200" height="100"
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
