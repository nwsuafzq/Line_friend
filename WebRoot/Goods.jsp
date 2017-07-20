<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="assets/css/buttons.css" type="text/css" />

		<link rel="stylesheet" href="assets/css/Goods.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />
		<link
			href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
			rel="stylesheet">
		<script language="JavaScript" src="assets/js/backTop.js"
			type="text/javascript" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<title>商品详情</title>
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/AdminEmail.js"
			type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript"
			src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
		<script language="javascript" type="text/javascript"
			src="assets/js/qh.js"></script>
		<script language="javascript" type="text/javascript"></script>

		<!-- ......................................... -->
		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<!-- ....................................... -->

		<style type="text/css">
#tip {
	position: absolute;
	color: #333;
	display: none;
}

#tip s {
	position: absolute;
	top: 40px;
	left: -20px;
	display: block;
	width: 0px;
	height: 0px;
	font-size: 0px;
	line-height: 0px;
	border-color: transparent #BBA transparent transparent;
	border-style: dashed solid dashed dashed;
	border-width: 10px;
}

#tip s i {
	position: absolute;
	top: -10px;
	left: -8px;
	display: block;
	width: 0px;
	height: 0px;
	font-size: 0px;
	line-height: 0px;
	border-color: transparent #fff transparent transparent;
	border-style: dashed solid dashed dashed;
	border-width: 10px;
}

#tip .t_box {
	position: relative;
	background-color: #CCC;
	filter: alpha(opacity =     50);
	-moz-opacity: 0.5;
	bottom: -3px;
	right: -3px;
}

#tip .t_box div {
	position: relative;
	background-color: #FFF;
	border: 1px solid #ACA899;
	background: #FFF;
	padding: 1px;
	top: -3px;
	left: -3px;
}

.tip {
	width: 400px;
	height: 300px;
	border: 1px solid #DDD;
}
</style>

		<script type="text/javascript">
$(function(){
  $('.tip').mouseover(function(){
   var $tip=$('<div id="tip"><div class="t_box"><div><s><i></i></s><img src="'+this.src+'" /></div></div></div>');
   $('body').append($tip);
   $('#tip').show('fast');
  }).mouseout(function(){
   $('#tip').remove();
  }).mousemove(function(e){
   $('#tip').css({"top":(e.pageY-60)+"px","left":(e.pageX+30)+"px"})
  })
})
</script>
	</head>


	<body>
		<div id="header">
			<div class="header1">
				<b></b><a onclick=addToFavorite(); href="#"><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏LINE
					FRIEND</a> &nbsp;&nbsp;
				<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
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
						<a href="UserOrder.action">我的订单</a>
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
		<div id="con">
			<div id="Search">
				<div class="Search1">
					<a href="home.jsp"><img src="assets/homeImages/logo.png"
							width="195" height="60" /> </a>
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
							<a href="#">坚果</a>&nbsp;&nbsp;
							<a href="#">糕点</a>&nbsp;&nbsp;
							<a href="#">果干</a>
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
							<a href="searchByCategory.action?keywords=果干蜜饯">果干/蜜饯</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=坚果炒货">坚果/炒货</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=肉类熟食">肉类/熟食</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=饼干膨化">饼干/膨化</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=糕点点心">糕点/点心</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=素食豆类">素食/豆类</a>
						</li>
						<li class="bt1">
							<a href="searchByCategory.action?keywords=鱿鱼海味">鱿鱼/海味</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="content3">
				<div class="content4">
					<div class="content4">
						<div id="content42">
							<div class="content41">
								<img src="${product.product_pic}" class="tip" width="400"
									height="300" />
							</div>
							<ul id="linkBox">
								<li>
									<a href="${product.product_pic}"><img
											src="${product.product_pic}" width="60" height="60" /> </a>
								</li>
								<li>
									<a href="assets/homeImages/detail/3.2.png"><img
											src="assets/homeImages/detail/3.2.png" width="60" height="60" />
									</a>
								</li>
								<li>
									<a href="assets/homeImages/detail/3.3.png"><img
											src="assets/homeImages/detail/3.3.png" width="60" height="60" />
									</a>
								</li>
								<li>
									<a href="assets/homeImages/detail/3.3.png"><img
											src="assets/homeImages/detail/3.3.png" width="60" height="60" />
									</a>
								</li>
								<li>
									<a href="assets/homeImages/detail/3.3.png"><img
											src="assets/homeImages/detail/3.3.png" width="60" height="60" />
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!--
				
				
				<!-- -------------- 显示商品详情----------------  -->


				-->

				<div class="content5">
					<div class="name">
						<input id="id" type="hidden" value="${product.id}">
						<b>${product.product_name }</b>

						<div class="lname">
							${product.description}
						</div>
					</div>
					<div id="summary-price">
						<div class="dt">
							尝 鲜 价：
						</div>
						<div class="dd">
							<strong>￥${product.dangqian_price }</strong>
						</div>
					</div>
					<div class="clearfloat"></div>
					<div id="summary-stock">
						<div class="dt">
							折扣价：
						</div>
						<div class="dd">
							<strong>￥${product.fixed_price }</strong>
						</div>
					</div>
					<div class="clearfloat"></div>
					<div id="summary-service">
						<div class="ddd">
							由 LINE FRIEND 发货并提供售后服务。		
						</div>
						
					</div>
					<div id="choose-version">
						<div class="dt">
							库存：
						</div>
						<div class="dt">
							65件
						</div>
					</div>
					<div class="clearfloat"></div>
					<div class="bm">
						温馨提示: 支持7天无理由退货
						<br/><a href="favor.action?product_id=${product.id}&email=${email}&product_name=${product.product_name}&product_price=${product.dangqian_price}&product_pic=${product.product_pic}"><b>加入收藏夹</b></a>
					</div>
					<div class="clearfloat"></div>
					<div id="choose-btns">
						<div class="choose-amount">
							<div class="wrap-input">
								<input class="min" name="" type="button" value=" - " />


								<input id="num" class="text_box" name="num" type="text"
									value="1" size="+1" />


								<input class="add" name="" type="button" value=" + " />



								<script>
	var t = $(this).parent().find('input[class*=text_box]');
	$(".add").click(function() {
		t = $(this).parent().find('input[class*=text_box]');
		t.val(parseInt(t.val()) + 1);
		})
	$(".min").click(function() {
		t = $(this).parent().find('input[class*=text_box]');
		t.val(parseInt(t.val()) - 1)
		if (parseInt(t.val()) < 1) {
			t.val(1);
		}
	})

	//加入购物车发送请求
	function addCart() {
		var id = document.getElementById("id").value;
        var num = document.getElementById("num").value;
		var action = 'gotoCart.action?id=' + id + '&num=' + num;
		window.location.href = action;
	}
	//加入购物车发送请求
	function directBuy() {
		var id = document.getElementById("id").value;
        var num = document.getElementById("num").value;
		var action = 'direct.action?id=' + id + '&num=' + num;
		window.location.href = action;
	}
</script>
							</div>
						</div>


						<div class="btn">
							<a href="javascript:addCart();"><font color="#FFFFFF"><b>加入购物车</b>
							</font> </a>
						</div>
						<div class="btn">
							<div class="btnn">
								<a href="javascript:directBuy();"><font color="#FFFFFF"><b>直接购买</b>
								</font> </a>
							</div>
							
						</div>




					</div>
				</div>
			</div>
			<div class="content6">
				<a
					href="https://shop151103206.taobao.com/p/rd204604.htm?spm=2013.1.0.0.6TIgpY
				"><img
						src="assets/homeImages/detail.jpg" width="1100" height="100"
						alt="间隔图片" /> </a>
			</div>
			<div class="content7">
				<div class="content8">
					<div class="head8">
						<b>猜你喜欢</b>
					</div>
					<div class="good">
						<div class="fore1">
							<div class="p-img">
								<a href="Goods.html" title="U100开心果手剥坚果干果休闲炒货" target="_blank">
									<img width="120" height="120" alt="（2）  U100开心果手剥坚果干果休闲炒货"
										src="assets/homeImages/detail/2.1.png" class=""> </a>
							</div>
							<div class="p-name">
								<a href="Goods.html" title="U100开心果手剥坚果干果休闲炒货" target="_blank">U100开心果手剥坚果干果休闲炒货</a>
							</div>
							<div class="p-price">
								<strong class="price">￥14.90</strong>
							</div>
						</div>
						<div class="fore1">
							<div class="p-img">
								<a href="Goods.html" title="碧根果210gx2袋零食坚果干果" target="_blank">
									<img width="120" height="120" alt="碧根果210gx2袋零食坚果干果"
										src="assets/homeImages/detail/5.1.png" class=""> </a>
							</div>
							<div class="p-name">
								<a href="Goods.html" title="碧根果210gx2袋零食坚果干果" target="_blank">碧根果210gx2袋零食坚果干果</a>
							</div>
							<div class="p-price">
								<strong class="price">￥82.00</strong>
							</div>
						</div>
						<div class="fore1">
							<div class="p-img">
								<a href="Goods.html" title="开口松子218gx2袋坚果炒货东北手剥红松子原味"
									target="_blank"> <img width="120" height="120"
										alt="开口松子218gx2袋坚果炒货东北手剥红松子原味"
										src="assets/homeImages/detail/6.1.png" class=""> </a>
							</div>
							<div class="p-name">
								<a href="Goods.html" title="开口松子218gx2袋坚果炒货东北手剥红松子原味"
									target="_blank">开口松子218gx2袋坚果炒货东北手剥红松子原味</a>
							</div>
							<div class="p-price">
								<strong class="price">￥98.00</strong>
							</div>
						</div>
					</div>
				</div>
				<div class="content9">
					<div class="tab">
						<div class="tab-head">
							<ul class="tab-nav">
								<li class="active">
									<a href="#tab-js">商品介绍</a>
								</li>
								<li>
									<a href="#tab-cs">规格参数</a>
								</li>
								<li>
									<a href="#tab-pj">商品评价</a>
								</li>

							</ul>
						</div>
						<div class="clearfloat"></div>
						<div class="tab-body">
							<br />
							<div class="tab-panel active" id="tab-js">


								商品名称：${product.product_name }
								<br />
								生产商：${food.producer}
								<br />
								保质期：${food.expiration_date}
								<br />
								生产日期：${food.produce_date}
								<br />
								<br />
								<br />
								<br />

								<img src="assets/homeImages/detail/3.2.png" width="550"/>
				
							</div>
							<div class="tab-panel" id="tab-cs">

								<table width="100%" cellspacing="0" cellpadding="0">
									<tbody>
										<tr>
											<th colspan="2" height="30" class="tdTitle">
												营养成分
											</th>
										</tr>
										<tr>
											<td>
												脂肪
											</td>
											<td>
												16.6克
											</td>
										</tr>
										<tr>
											<td>
												维生素
											</td>
											<td>
												21毫克
											</td>
										</tr>
										<tr>
											<td>
												蛋白质
											</td>
											<td>
												2.3克
											</td>
										</tr>
										<tr>
											<th height="30" colspan="2" class="tdTitle">
												配料
											</th>
										</tr>
										<tr>
											<td>
												主配料
											</td>
											<td>
												杏仁
											</td>
										</tr>
										<tr>
											<td>
												配料
											</td>
											<td>
												防腐剂、干燥剂
											</td>
										</tr>
										<tr>
											<th height="30" colspan="2" class="tdTitle">
												实体店
											</th>
										</tr>
										<tr>
											<td>
												上海
											</td>
											<td>
												2家
											</td>
										</tr>
										<tr>
											<td>
												北京
											</td>
											<td>
												6家
											</td>
										</tr>
										<tr>
											<td>
												深圳
											</td>
											<td>
												3家
											</td>
										</tr>
										<tr>
											<td>
												杭州
											</td>
											<td>
												2家
											</td>
										</tr>

										<tr>
											<th height="30" colspan="2" class="tdTitle">
												包含
											</th>
										</tr>
										<tr>
											<td>
												主要
											</td>
											<td>
												${product.product_name}即食小吃1袋
												<br>
										</tr>
										<tr>
											<td>
												赠送
											</td>
											<td>
												试吃小零食（随机）
											</td>
										</tr>
										<tr>
											<td>
												配置
											</td>
											<td>
												Line friend零食袋一只
											</td>
										</tr>
										<tr>
											<th height="30" colspan="2" class="tdTitle">
												规格
											</th>
										</tr>

										<tr>
											<td>
												净重
											</td>
											<td>
												${food.specification }
											</td>
										</tr>
										<tr>
											<th height="30" colspan="2" class="tdTitle">
												类别
											</th>
										</tr>
										<tr>
											<td>
												类别
											</td>
											<td>
												${food.category }
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="tab-panel" id="tab-pj">
								<table width="100%" cellpadding="0" cellspacing="0">
									<tbody>
										<tr height="40">
											<th class="tdTitle">
												评价心得
											</th>
											<th class="tdTitle">
												评价时间
											</th>
											<th class="tdTitle">
												顾客满意度
											</th>
											<th class="tdTitle">
												购买信息
											</th>
											<th class="tdTitle">
												评论者
											</th>
										</tr>
										<c:forEach items="${commentList}" var="cmt">

											<tr>
												<td>
													${cmt.content }
												</td>
												<td>
													${cmt.send_time }
												</td>
												<td>
													${cmt.upvote }
												</td>
												<td>
													<div class="type-item">
														<span class="label">口味：</span><span class="text">原味</span>
													</div>
													<div class="type-item">
														<span class="label">组合：</span><span class="text">组合1</span>
													</div>
												</td>
												<td>
													<div class="user-item">
														<span class="user-name"> ${cmt.email } </span>
													</div>



												</td>
											</tr>
										</c:forEach>
										<tr>
											<td>
												东西不错，价格还行。
											</td>
											<td>
												2015-06-23 14:16
											</td>
											<td>
												赞
											</td>
											<td>
												<div class="type-item">
													<span class="label">口味：</span><span class="text">原味</span>
												</div>
												<div class="type-item">
													<span class="label">组合：</span><span class="text">组合1</span>
												</div>
											</td>
											<td>
												<div class="user-item">
													<span class="user-name"> j***a </span>
												</div>
												<div class="user-item">
													<span class="buy-time">2015-05-08 13:40 </span>
												</div>
												<div class="user-item">
													<span class="buy">购买</span>
												</div>
												<div data-cid="0" class="user-item">
													<span class="user-access"></span>
												</div>
											</td>
										</tr>




									</tbody>
								</table>
								<br />
								<form action="commentSend.action">
									<input type="hidden" name="product_id" value=${id } />
									<table width="100%" cellpadding="0" cellspacing="0">
										<tbody>

											<tr height="20">
												<th class="tdTitle">
													发评论
												</th>
											</tr>

											<tr>
												<td>
													<textarea name="cmtcontent"
														style="width: 100%; height: 100;"></textarea>
													<!--
								<input type="text" name="cmtcontent" size="80" />
								-->
												</td>
												<td>

													<i class="fa fa-user-o">&nbsp;&nbsp;<input
															name="anonymous" type="checkbox" value="anon" />匿名发表</i>
													<br />
													<br />
													<label>
														<i class="fa fa-thumbs-o-up">&nbsp;&nbsp;<input
																name="upvote" type="radio" value="like" checked />赞 </i>
													</label>
													&nbsp;&nbsp;
													<label>
														<i class="fa fa-thumbs-down">&nbsp;&nbsp;<input
																name="upvote" type="radio" value="hate" />踩 </i>
													</label>
													<br />
													<input type="submit" id="cmtsubmit" value="发表"
														class="button button-pill button-primary">

												</td>
											</tr>
										</tbody>
									</table>
									<span style="color: red"> ${error}</span>
								</form>

							</div>
							<div class="clearfloat"></div>
							<div class="tab-panel" id="tab-fw">
								<img src="images/txmfw.jpg" width="700" height="520" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="ban">
				<img src="assets/homeImages/ban2.jpg" width="1200px" height="100px"
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
