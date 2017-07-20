<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="cn.edu.nwsuaf.entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>商品搜索-LINE FRIEND</title>
		<link rel="stylesheet" href="assets/css/GoodsSearch.css"
			charset="utf-8" />
		<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
		<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />

		<style>body {
			cursor: url('assets/picture/cursor.ico'), auto;
		}
		</style>
		
		<script language="JavaScript" src="assets/js/backTop.js"
			type="text/javascript" charset="utf-8"></script>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script language="JavaScript" src="assets/js/addToFavorite.js"
			type="text/javascript" charset="utf-8"></script>
		<script language="JavaScript" src="assets/js/AdminEmail.js"
			type="text/javascript" charset="utf-8"></script>
			
			<!-- ......................................... -->
		<!-- layer,jquery-1.8.3 这两个js有顺序的 必须先引入jquery1.8.3 -->
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/layer.js"></script>
		<!-- 调用浮动窗口 -->
		<script type="text/javascript" src="assets/js/IMChat.js"></script>
		<!-- ....................................... -->
			
			
	</head>
	<body>
		<div id="header">
			<div class="header1">
				<b></b><a rel="sidebar" onclick=addToFavorite(); href="#"><img
						style="position: relative; top: 2px;"
						src="assets/homeImages/love2.jpg" height="12" width="12" />&nbsp;&nbsp;收藏LINEFRIEND</a>
			&nbsp;<a rel="sidebar" href="javascript:IMChat();">实时聊天吐槽墙</a>
			</div>
			<div class="header2">
				<nav class="nav">
				<ul class="nav__menu">

					<%
						//String email = request.getParameter("email");
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
		<div class="clearfloat"></div>
		<div id="con">
			<div id="Search">
				<div class="Search1">
					<a href="home.jsp"><img src="assets/homeImages/logo.png"
							width="195" height="60" /> </a>
					<div class="welcome">
						<font size="+6" color="#CCCCCC">|</font><font size="+2">商品搜索</font>
					</div>
				</div>
				<div class="Search2">
					<form action="searchProduct.action" method="get">
						<input id="Search21" type="text" name="product_name"
							placeholder="请输入搜索关键词" size="20" />
						<input id="Search22" type="submit" value="搜索" />
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
			<div id="content">
				<div class="content">
					<div class="bt">
						<ul class="bt0">
							<li class="bt1" style="width: 224px;">
								<a target="_blank" href="#">全部商品品牌分类</a>
								<ul class="bt2">
								
									<li class="bt3">
										<a href="searchByCategory.action?keywords=果干蜜饯"><img
												src="assets/homeImages/logo/2.png" height="30" />&nbsp;&nbsp;&nbsp;果干蜜饯</a>
									</li>
									<li class="bt3">
										<a href="searchByCategory.action?keywords=坚果炒货"><img src="assets/homeImages/logo/1.png"
												height="30" />&nbsp;&nbsp;&nbsp;坚果炒货</a>
									</li>
									
									<li class="bt3">
										<a href="searchByCategory.action?keywords=肉类熟食"><img
												src="assets/homeImages/logo/3.png" height="30" />&nbsp;&nbsp;&nbsp;肉类熟食</a>
									</li>
									<li class="bt3">
										<a href="searchByCategory.action?keywords=饼干膨化"><img
												src="assets/homeImages/logo/4.png" height="30" />&nbsp;&nbsp;&nbsp;饼干膨化</a>
									</li>
									<li class="bt3">
										<a href="searchByCategory.action?keywords=糕点点心"><img
												src="assets/homeImages/logo/5.png" height="30" />&nbsp;&nbsp;&nbsp;糕点点心</a>
									</li>
									<li class="bt3">
										<a href="searchByCategory.action?keywords=素食豆类"><img
												src="assets/homeImages/logo/6.png" height="30" />&nbsp;&nbsp;&nbsp;素食豆类</a>
									</li>
									<li class="bt3">
										<a href="searchByCategory.action?keywords=鱿鱼海味"><img
												src="assets/homeImages/logo/7.png" height="30" />&nbsp;&nbsp;&nbsp;鱿鱼海味</a>
									</li>
									<li class="bt3">
										<a href="#"><img src="assets/homeImages/logo/1.png"
												height="30" />&nbsp;&nbsp;&nbsp;其他食品</a>
									</li>
								</ul>
							</li>
							<li class="bt1" style="width: 130px;">
							<a href="searchByCategory.action?keywords=果干蜜饯">果干/蜜饯</a>
						</li>
						<li class="bt1" style="width: 132px;">
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
				</div>
				<div id="beforecontent">
					全部结果&nbsp;>&nbsp;
					<strong>"${product_name}"</strong>
				</div>
				<div class="content1">
					<div id="content1_title">
						<h2>
							所有类目
						</h2>
					</div>
					<div id="content1_content">
						<div class="item">
							<h3>
								<b><img src="assets/homeImages/element.png" /> </b>
								<a href="#">三只松鼠</a>
							</h3>
							<ul>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=坚果炒货">坚果</a>
								</li>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=果干蜜饯">果干</a>
								</li>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=糕点点心">糕点</a>
								</li>
							</ul>
						</div>
						<div class="item">
							<h3>
								<b><img src="assets/homeImages/element.png" /> </b>
								<a href="#">费列罗</a>
							</h3>
							<ul>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=坚果炒货">坚果</a>
								</li>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=果干蜜饯">果干</a>
								</li>
								<li>
									<s></s>
									<a href="searchByCategory.action?keywords=糕点点心">糕点</a>
								</li>
								<li>
									<s class="tree_last"></s>
									<a href="#">百草味</a>
								</li>
							</ul>
						</div>
						<div class="item">
							<h3>
								<b><img src="assets/homeImages/element.png" /> </b>
								<a href="#">上好佳</a>
							</h3>
							<ul>
								<li>
									<s></s>
									<a href="#">坚果</a>
								</li>
								<li>
									<s></s>
									<a href="#">果干</a>
								</li>
								<li>
									<s></s>
									<a href="#">糕点</a>
								</li>
								<li>
									<s class="tree_last"></s>
									<a href="#">素食</a>
								</li>
							</ul>
						</div>
						<div class="item">
							<h3>
								<b><img src="assets/homeImages/element.png" /> </b>
								<a href="#">张雅君</a>
							</h3>
							<ul>
								<li>
									<s></s>
									<a href="#">坚果</a>
								</li>
								<li>
									<s></s>
									<a href="#">果干</a>
								</li>
								<li>
									<s></s>
									<a href="#">糕点</a>
								</li>
								<li>
									<s class="tree_last"></s>
									<a href="#">素食</a>
								</li>
							</ul>
						</div>
						<div class="item">
							<h3>
								<b><img src="assets/homeImages/element.png" /> </b>
								<a href="#">其他</a>
							</h3>
							<ul>
								<li>
									<s></s>
									<a href="#">LINE FRIENDS 布朗熊</a>
								</li>
								<li>
									<s></s>
									<a href="#">LINE FRIENDS 可妮兔车载香水</a>
								</li>
								<li>
									<s></s>
									<a href="#">LINE FRIENDS 布朗熊充电宝</a>
								</li>
								<li>
									<s class="tree_last"></s>
									<a href="#">更多萌宝</a>
								</li>
							</ul>
						</div>


					</div>
				</div>
				<div class="content2">
					<div class="sx">
						<div id="sxtitlecontent">
							<div id="sxtitle">
								<h1>
									${product_name }&nbsp;&nbsp;
									<strong>商品筛选</strong>
								</h1>
								<div id="total">
									<span>（共<strong>68058</strong>个商品）</span>
								</div>
								<div class="clear"></div>
							</div>
							<!--sxtitle-->
						</div>
						<!--sxtitlecontent-->
						<div class="" id="selected">
							
							<div class="clear"></div>
						</div>
						<!--selected-->
						<div class="" id="">
						
							<!--detail-->
							<div class="clear"></div>
						</div>
						<!--selected-->
						<form action="searchProductByPrice.action">
						<div class="sxselect" id="selected">
							<div class="description">
								价格：
							</div>
							<!--description-->
							
							<div class="detail">
								<ul>
									<li>
										<a href="searchProductByPrice.action?pricelow=0&pricehigh=10">0-10</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="searchProductByPrice.action?pricelow=20&pricehigh=50">20-50</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="searchProductByPrice.action?pricelow=50&pricehigh=100">50-100</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="searchProductByPrice.action?pricelow=100&pricehigh=300">100-300</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="searchProductByPrice.action?pricelow=300&pricehigh=1000000">300以上</a>
									</li>
									&nbsp;&nbsp;
									<li>
									
										<input type="text" name="pricelow"/>
										-
										<input type="text" name="pricehigh" />
										<input type="submit" value="确定" />
										
									</li>
								</ul>
							</div>
							<!--detail-->
							<div class="clear"></div>
						</div>
						</form>
						<!--selected-->
						<div class="sxselect" id="selected">
							<div class="description">
								热点：
							</div>
						
							<div class="detail">
								<ul>
									<li>
										<a href="#">三只松鼠</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">良品铺子</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">百草味</a>
									</li>
									&nbsp;&nbsp;
								</ul>
							</div>
							<div class="drop">
								<a href="#"><img src="assets/homeImages/conditionselect.PNG"/>
								</a>
							</div>
							
							<div class="clear"></div>
						</div>
						
						<div class="" id="selected">
							
							
							
							<div class="clear"></div>
						</div>
						
						<div class="sxselect" id="selected">
							<div class="description">
								净重：
							</div>
							
							<div class="detail">
								<ul>
									<li>
										<a href="#">300g以下</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">300g-500g</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">500g-1000g</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">1000g以上</a>
									</li>
									&nbsp;&nbsp;
								</ul>
							</div>
							<div class="drop">
								<a href="#"><img src="assets/homeImages/conditionselect.PNG" />
								</a>
							</div>
							
							<div class="clear"></div>
						</div>

						<!--selected-->
						<!--<div class="sxselect" id="selected">
							<div class="description">

								购买方式：
							</div>
							description
							<div class="detail">
								<ul>
									<li>
										<a href="#">直接支付</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">货到付款</a>
									</li>
									&nbsp;&nbsp;
								</ul>
							</div>
							detail
							<div class="clear"></div>
						</div>
						selected
						<div class="sxselect" id="selected">
							<div class="description">

								产地：
							</div>
							description
							<div class="detail">
								<ul>
									<li>
										<a href="#">中国</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">台湾</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">韩国</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">日本</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">香港</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">美国</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">澳洲</a>
									</li>
									&nbsp;&nbsp;
									<li>
										<a href="#">其他</a>
									</li>
									&nbsp;&nbsp;

								</ul>
							</div>
							<div class="drop">
								<a href="#"><img src="assets/homeImages/conditionselect.PNG" />
								</a>
							</div>
							detail
							<div class="clear"></div>
						</div>
						selected
					</div>
					sx筛选条件
					<div class="tj">
						<div id="tj_top">
							<div id="tj_top1">
								排序：
							</div>
							<div id="tj_top2">
								<a href="#">综合排序</a>
							</div>
							<div id="tj_top3">
								<a href="#">销量</a>
							</div>
							<div id="tj_top4">
								<a href="#">价格</a>
							</div>
							<div id="tj_top5">
								<a href="#">评论数</a>
							</div>
							<div id="tj_top6">
								<a href="#">新品</a>
							</div>
							<div class="clear"></div>
						</div>
						<div id="tj_bottom">
							<div id="tj_bottom1">
								配送至：
							</div>
							<div id="tj_bottom5">
								<a href="#"> <input type="text" placeholder="请输入地址" /> </a>
							</div>
							<div id="tj_bottom3">
								<a href="#"> <input type="checkbox" id="checkbox1" /> <label
										for="checkbox1">
										仅显示有货
									</label> </a>
							</div>
							<div id="tj_bottom4">
								<a href="#"> <input type="checkbox" id="checkbox2" /> <label
										for="checkbox2">
										货到付款
									</label> </a>
							</div>
							<div id="tj_bottom5">
								<input type="text" placeholder="在结果集中搜索" />
								&nbsp;
								<input type="button" value=" 确定 " />
							</div>
							<div id="clear"></div>
						</div>
						--><!--tj_bottom-->
					</div>
					<!--tj排序条件-->

					<% List<Product> productList =(List)session.getAttribute("productList"); %>
					<div class="result">
						<div id="resultcontent">
							<table class="outtable">
								<% int pageNos = (Integer)session.getAttribute("pageNos"); %>

							<%
						    int begin = (pageNos-1)*8;
						    int end = pageNos*8-1; 
						    %>

								<%for(int i = begin;i<end;i++){ %>
								<tr>
									<!--第一行开始-->
									<%for(int count=0;count<4;count++){   //每四个商品为一行 %>
									<%if(i>=productList.size()){break;}//判断商品是否已经到了最后一个，若为最后一个，则直接跳出子循环，防止越界 %>
									<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="showProductdetail.action?id=<%=productList.get(i).getId()%>"><img src="<%=productList.get(i).getProduct_pic()%>"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="showProductdetail.action?id=<%=productList.get(i).getId()%>"><%=productList.get(i).getProduct_name()%></a>
												</td>
											</tr>
											<tr>
												<td class="price">
												折扣价：<%=productList.get(i).getFixed_price()%>	
												</td>
											</tr>
											<tr>
												<td class="recommend">
													<%=productList.get(i).getKeywords()%>
												</td>
											</tr>
											<tr>
												<td>
													原价：<s><%=productList.get(i).getDangqian_price()%></s>
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>

									<%if(count<3){i++;} } %>

									<!--
									<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/2.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#"> ${product.product_name} </a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥14.90
												</td>
											</tr>
											<tr>
												<td calss="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
									<td>
										<table calss="innertable">
											<tr>
												<td>
													<a href="Goods.html"><img
															src="assets/homeImages/search/3.1.png" width="200"
															height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="Goods.html">马鲁斯坚果杏仁即食小吃 </a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥14.90
												</td>
											</tr>
											<tr>
												<td calss="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
									<td>
										<table calss="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/4.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#">夏威夷果265gx2袋零食坚果干果奶油味送开口器</a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥19.00
												</td>
											</tr>
											<tr>
												<td calss="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													上海有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
								</tr>
								 第一行结束
								<tr>
								第二行开始<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/5.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#">碧根果210gx2袋零食坚果干果 </a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥80.00
												</td>
											</tr>
											<tr>
												<td class="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
									<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/6.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#">开口松子218gx2袋坚果炒货东北手剥红松子原味</a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥98.00
												</td>
											</tr>
											<tr>
												<td class="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
									<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/7.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#">手剥巴旦木235gx2零食坚果炒货特产干果巴达木</a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥19.00
												</td>
											</tr>
											<tr>
												<td class="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
									<td>
										<table class="innertable">
											<tr>
												<td>
													<a href="#"><img src="assets/homeImages/search/8.1.png"
															width="200" height="200" /> </a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="#"> 手剥巴旦木235gx2零食坚果炒货特产干果巴达木</a>
												</td>
											</tr>
											<tr>
												<td class="price">
													￥82.00
												</td>
											</tr>
											<tr>
												<td class="recommend">
													已有4363人评价
												</td>
											</tr>
											<tr>
												<td>
													北京有货
												</td>
											</tr>
											<tr>
												<td class="option">
													<button type="submit">
														加入购物车
													</button>
												</td>
												<td class="option">
													<button type="submit">
														关注
													</button>
												</td>
												<td class="option">
													<input type="checkbox" />
													对比
												</td>
												<div class="clear"></div>
											</tr>
										</table>
									</td>
								
								-->
								</tr>
								<%} %>
								<!--第二个行结束-->
							</table>
						</div>
						<!--resultcontent-->
					
						<h3 align="center">
							<c:if test="${pageNos>1 }">
								<a href="pageSearch.action?pageNos=1">首页</a>
								<a href="pageSearch.action?pageNos=${pageNos-1 }">上一页</a>
							</c:if>
							
							<!-- 页码 -->
							<c:forEach begin="1" end="${countPage}" var="i">
							<a href="pageSearch.action?pageNos=${i}">${i }</a>
							</c:forEach>
							
							<c:if test="${pageNos < countPage }">
								<a href="pageSearch.action?pageNos=${pageNos+1 }">下一页</a>
								<a href="pageSearch.action?pageNos=${countPage }">末页</a>
							</c:if>
						</h3>
						
						<form action="pageSearch.action">
							<h3 align="center">
								共 ${countPage} 页
								<input type="text" value="${pageNos}" name="pageNos" size="1"/>
								页
								<input type="submit" value="跳转" />
							</h3>
						</form>

					</div>
					
					<!--result-->
				</div>
				<div class="clear"></div>
				<!--清除浮动-->
			</div>
			<!-- content-->
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
