<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>Line friend零食铺——确认订单</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="assets/css/order_css.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/buy.css" charset="utf-8" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<script type="text/javascript" src="assets/js/Order.js"
			language="javascript"></script>
		
		<script language="JavaScript" src="assets/js/backTop.js"
			type="text/javascript" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/choosechange.js"
			type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript"
			src="http://code.jquery.com/jquery-1.6.1.min.js"></script>
		<script type="text/javascript" src="assets/js/cart.js"
			language="javascript"></script>

		<!-- ......................................... -->
		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<!-- ....................................... -->
		<script type="text/javascript">
		function getAddressId(){
			var address = document.getElementsByName("address");
		    for(var i=0;i<address.length;i++){
		        if(address[i].checked==true){
	            var addresspar = address[i].parentNode;
				var addressid = addresspar.getElementsByTagName("input")[1].value;//address[i].value
				//alert(addressid);
				
				var message = document.getElementsByName("leaveMsg")[0].value;
				//alert(message)
				var action = 'submitOrder.action?id=' + addressid + '&message=' + message;
		        window.location.href = action;
			  
			}
		}
	}
</script>
	</head>
	<body onload="sumPriceFun()">
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onClick="addToFavorite();" href=""><img
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
								<a href="GoodsSearch.jsp">商品检索</a>
							</li>
							<li class="nav__menu-item">
								<a href="User.html">用户管理</a>
							</li>
							<!--<li class="nav__menu-item">
								<a href="userCart.html">购物车</a>
							</li>
							-->
							<li class="nav__menu-item">
								<a href="gotoCart.action">购物车</a>
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
		<div class="banner">
		</div>

		<!--head列表-->
		<!--详细订单信息-->
		<!---->
		<div id="hdpay">
			<img src="assets/homeImages/logo.png" id="logoimg">
			<ul>
				<li>
					1.选择商品
				</li>
				<li id="li-sy">
					2.确认订单
				</li>
				<li>
					3.订单支付
				</li>
				<li>
					4.确认收货
				</li>
			</ul>
		</div>
		<div id="tableform">
			<form>
				<span>确认收货地址</span>
				<div id="alladd">
					<hr>

					<!-- 动态页面代码 -->
					<c:forEach items="${addressList}" var="item" varStatus="status">
						
						<div name="add" class="addressInput">
						
						
							<input type="radio" name="address" value=${item.full_address}
								onclick="javascript:orderPrice();" style="margin-right: 10px;">
							(
							<span id="receive_name" name="receive_name">${item.receive_name}</span>&nbsp;&nbsp;&nbsp;收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.province}省&nbsp;&nbsp;&nbsp;&nbsp;${item.city}市&nbsp;&nbsp;&nbsp;&nbsp;${item.district}区&nbsp;&nbsp;&nbsp;&nbsp;${item.full_address}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span id="phone" name="phone" style="margin-right: 5%;">${item.phone}</span>
						   
						   <input type="hidden" id = "address_id" name = "addressId" value="${item.id}" />
							
						
						</div>
						
					</c:forEach>
					<hr>
				</div>
				<div id="orderinfo">
					<span>确认订单信息</span>
					<hr>
					<table id="tb">
						<tr id="tbhead">
							<th id="th1" width="30%">
								商品名称
							</th>
							<th id="th2" width="40%">
								商品描述
							</th>
							<th id="th3" width="10%">
								单价
							</th>
							<th id="th4" width="10%">
								数量
							</th>
							<th id="th5" width="10%">
								小计
							</th>
						</tr>

						<c:forEach items="${list}" var="item" varStatus="status">
							<tr class="trwidth">
								<td>
									<div class="goods_show">
										<a href="showProductdetail.action?id=${item.product.id }"><img
												src="${item.product.product_pic }" id="goodsimg"> </a>
										<p>
											${item.product.product_name }
										</p>
										</a>
									</div>
								</td>
								<td>
									${item.product.description}
								</td>
								<td>
									${item.product.dangqian_price }
								</td>
								<td>
									${item.product_count }
								</td>
								<td name = "xiaoji" >
								${item.product.dangqian_price*item.product_count }
								<!--
								<c:out value="${item.product.dangqian_price*item.product_count }"></c:out>
									
								--></td>
							</tr>
						</c:forEach>



						<!--
			<tr class="trwidth">
				<td><div class="goods_show"><a href="Goods.html"><img src="assets/homeImages/goods/goods6.jpg" id="goodsimg"><p>夏威夷果奶油味坚果零食</p></a></div></td>
				<td>52.50</td>
				<td>2</td>
				<td>105.00</td>
			</tr><!--静态页面代码-->
						<!-- 动态页面代码 -->
					</table>
					<hr>
				</div>
				<!-- 留言总价统计 -->
				<div id="msg">
					<div id="textareaDiv">
						<label style="font-size: 14px;">
						给Line friend留言:&nbsp;&nbsp;
						</label><br><br>
						<textarea rows="3" cols="50" name="leaveMsg" style="padding-top: 5px;"></textarea>
					</div>
					<div id="titiDiv">
						<lable>
						订单共
						</lable>
						<span name="sumPrice"  class="priceSpan"></span>
						<span style="font-size: 20px;">¥</span>
					</div>
				</div>
				<!--  -->
				<div id="ordershow">
					<div id="sure">
						订单金额:
						<span name="sumPrice" class="priceSpan">137.00</span><span style="font-size: 20px;">&nbsp;¥</span>
						<br>
						<br>
						寄送至：
						<span id="AddressRE"></span>
						<br>
						<br>
						收货人：
						<span id="ReName"></span>
						<br>
						<br>
						联系方式：
						<span id="RePhone"></span>
						<br>
					</div>
					<a href="javascript:getAddressId();" id="submit"><img
							src="assets/homeImages/submit.jpg"> </a>
				</div>
			</form>




		</div>
		<div id="fontsy">
			<div class="clearfloat"></div>

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
						<a target="_blank" href="#">返修/退换货</a>
					</dd>
					<dd>
						<a target="_blank" href="#">取消订单</a>
					</dd>
				</dl>
				<div>
					<img src="assets/homeImages/foot.png" />
				</div>
			</div>

			<div class="clearfloat"></div>
			<div id="footer">
				<hr />
				<br />
				<div class="footer1">
					<a href="ShoppingProcess.html"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					<a href="#">Line friend零食铺</a>
				</div>
				<div class="footer2">
					<div class="copyright">
						Copyright&copy;&nbsp;&nbsp;2016-2017&nbsp;&nbsp;Line
						friend零食铺&nbsp;&nbsp;&nbsp;版权所有
					</div>
				</div>
			</div>
		</div>
	</body>
</html>