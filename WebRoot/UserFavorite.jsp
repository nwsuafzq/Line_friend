<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="cn.edu.nwsuaf.entity.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>收藏夹-LINEFRIEND</title>
<link rel="stylesheet" href="assets/css/User.css" charset="utf-8"/>
<link rel="stylesheet" href="assets/css/UserFavorite.css" charset="utf-8"/>
<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
<link rel="stylesheet" href="assets/css/BT.css" type="text/css" />
<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
<link rel="stylesheet" href="assets/css/Personality.css" type="text/css" />
<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" charset="utf-8" />

<script language="javascript" src="assets/js/windowOpen.js"
type="text/javascript" charset="utf-8"></script>
<script language="JavaScript" src="assets/js/backTop.js"
	type="text/javascript" charset="utf-8"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script language="JavaScript" src="assets/js/addToFavorite.js"
	type="text/javascript" charset="utf-8"></script>
<script language="JavaScript" src="assets/js/AdminEmail.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="header">
  <div class="header1"> <b></b><a rel="sidebar" onclick="addToFavorite()" href="#"><img
				style="position: relative; top: 2px;" src="assets/homeImages/love2.jpg"
				height="12" width="12" />&nbsp;&nbsp;收藏LINE FRIEND</a> </div>
  <div class="header2">
    <nav class="nav">
      <ul class="nav__menu">
        <li class="nav__menu-item"><a href="UserLogin.html">你好！请登录</a></li>
        <li class="nav__menu-item"><a href="UserRegister.html">免费注册</a></li>
        <li class="nav__menu-item"><a href="UserOrder.html">我的订单</a></li>
        <li class="nav__menu-item">客户服务^
          <ul class="nav__submenu">
            <li class="nav__submenu-item"><a href="UserQuestion.html">常见问题</a></li>
            <li class="nav__submenu-item"><a href="javascript:AdminEmail()">客服邮箱</a></li>
          </ul>
        </li>
        <li class="nav__menu-item">网站导航^
          <ul class="nav__submenu">
            <li class="nav__menu-item"><a href="home.jsp">网站主页</a></li>
            <li class="nav__menu-item"><a href="GoodsSearch.html">商品检索</a></li>
            <li class="nav__menu-item"><a href="User.html">用户管理</a></li>
            <li class="nav__menu-item"><a href="UserCart.html">购物车</a></li>
            <li class="nav__menu-item"><a href="UserOrder.html">我的订单</a></li>
            <li class="nav__menu-item"><a href="UserFavorite.html">我的收藏</a></li>
          </ul>
        </li>
      </ul>
    </nav>
  </div>
</div>
<div class="clearfloat"></div>
<div id="con">
  <div id="Search">
    <div class="Search1"><a href="home.jsp"><img src="assets/homeImages/logo.png"
					width="195" height="60" /></a>
      <div class="welcome"> <font size="+6" color="#CCCCCC">|</font><font size="+2">收藏夹</font> </div>
    </div>
    <div class="Search2">
      <form action="" method="get">
        <input id="Search21" type="text" name="search"  placeholder="请输入搜索关键词"  size="20"/>
        <input id="Search22" type="button" value="搜索"/>
      </form>
      <div class="Search3">
        <div class="Search31">热门搜索：<a href="#">夏威夷果</a>&nbsp;&nbsp;<a href="#">芒果干</a>&nbsp;&nbsp;<a href="#">肉脯</a></div>
      </div>
    </div>
    <div class="Search4">
      <div class="Search41"><img src="assets/homeImages/小人.png" width="20" height="20" /></div>
      <div class="Search42" style="width:135px;"><a href="User.html">我的LINEFRIEND</a></div>
    </div>
    <div class="Search5">
      <div class="Search51"><img src="assets/homeImages/购物车小图标.png" width="20" height="20"/></div>
      <div class="Search52"><a href="UserCart.html">去购物车结算</a></div>
    </div>
  </div>
  <div class="content2">
    <div class="bt">
      <ul class="bt0">
        <li class="bt1" style="width:224px;"><a target="_blank" href="#">全部商品品牌分类</a>
          <ul class="bt2">
            <li class="bt3"><a href="nut.html"><img src="assets/homeImages/logo/1.png" height="30" />&nbsp;&nbsp;&nbsp;坚果炒货</a> </li>
            <li class="bt3"><a href="fruit.html"><img src="assets/homeImages/logo/2.png" height="30" />&nbsp;&nbsp;&nbsp;果干蜜饯</a></li>
            <li class="bt3"><a href="meat.html"><img src="assets/homeImages/logo/3.png" height="30" />&nbsp;&nbsp;&nbsp;肉类熟食</a> </li>
            <li class="bt3"><a href="biscuit.html"><img src="assets/homeImages/logo/4.png" height="30"  />&nbsp;&nbsp;&nbsp;饼干膨化</a></li>
            <li class="bt3"><a href="biscuit.html"><img src="assets/homeImages/logo/5.png" height="30" />&nbsp;&nbsp;&nbsp;糕点点心</a> </li>
            <li class="bt3"><a href="fruit.html"><img src="assets/homeImages/logo/6.png" height="30"  />&nbsp;&nbsp;&nbsp;素食豆类</a></li>
            <li class="bt3"><a href="seafood.html"><img src="assets/homeImages/logo/7.png" height="30" />&nbsp;&nbsp;&nbsp;鱿鱼海味</a> </li>
            <li class="bt3"><a href="#"><img src="assets/homeImages/logo/1.png" height="30" />&nbsp;&nbsp;&nbsp;其他食品</a> </li>
          </ul>
        </li>
        <li class="bt1"><a href="home.jsp">首页</a></li>
        <li class="bt1"><a href="nut.html">坚果/炒货</a></li>
        <li class="bt1"><a href="fruit.html">果干/蜜饯</a></li>
        <li class="bt1"><a href="meat.html">肉类/熟食</a></li>
        <li class="bt1"><a href="biscuit.html">饼干/膨化</a></li>
        <li class="bt1"><a href="biscuit.html">糕点/点心</a></li>
        <li class="bt1"><a href="fruit.html">素食/豆类</a></li>
        <li class="bt1"><a href="seafood.html">鱿鱼/海味</a></li>
      </ul>
    </div>
  </div>
  <div id="Content">
    <div id="Personality">
      <div class="Personality1"><a href="User.html">我的LINEFRIEND</a></div>
      <div class="Personality2"><a href="User.html">个人主页</a></div>
      <div class="Personality3">
        <ul>
          <li class="Personality4"><a href="">设置</a>
            <ul class="Personality41">
              <li class="Personality42"><a href="EditUserMessage.html">编辑个人信息</a></li>
              <li class="Personality42"><a href="findAllAddress.action">管理收货地址</a></li>
              <li class="Personality42"><a href="UserOrder.html">查看订单记录</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
    <div class="clearfloat"></div>
    <div id="VerticalBar">
      <div class="VerticalBar1">
        <div class="VerticalBar11">
          <p>订单中心</p>
        </div>
        <div class="Same"><a href="#">我的订单</a></div>
        <div class="Same"><a href="#">评价晒单</a></div>
        <div class="Same"><a href="#">取消订单记录</a></div>
      </div>
      <div class="VerticalBar2">
        <div class="VerticalBar21">
          <p>关注中心</p>
        </div>
        <div class="Same"><a href="#">关注的商品</a></div>

      </div>
      <div class="VerticalBar3">
        <div class="VerticalBar41">
          <p>客户服务</p>
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
          <p>设置</p>
        </div>
        <div class="Same"><a href="#">个人信息</a></div>
        <div class="Same"><a href="#">收货地址</a></div>
      </div>
    </div>
    <div id="mymessage">
      <div class="mymessage">
        <div class="headf"><a href="UserFavorite.html">收藏的商品</a></div>
        <div class="type">
          <li class="typechoose"><a href="">全部</a></li>
          <li class="typechoose"><a href="">坚果/炒货</a></li>
          <li class="typechoose"><a href="">果干/蜜饯</a></li>
          <li class="typechoose"><a href="">肉类/熟食</a></li>
          <li class="typechoose"><a href="">饼干/膨化</a></li>
          <li class="typechoose"><a href="">糕点/点心</a></li>
          <li class="typechoose"><a href="">素食/豆类</a></li>
          <li class="typechoose"><a href="">鱿鱼/海味</a></li>
        </div>
      </div>
      <div class="mymessage">
        <div class="head-g">
          <input id="prodcutListAllCheck" class="jdcheckbox" type="checkbox" name="prodcutListAllCheck"/>
          <label for="prodcutListAllCheck">全选</label>
          <a href="UserCart.html">加入购物车</a> <a href="">取消关注</a> </div>
      </div>
     
      <% List<Favourite> favouriteList =(List)session.getAttribute("favouriteList"); %>
      
      <div class="mymessage">
      <table width="780" cellpadding="0" cellspacing="0">
            <div class="goods">
              <div class="p-img"> <a target="_blank" href="Goods.html"> <img width="160" height="160" data-img="1" alt="" src="<%=favouriteList.get(0).getProduct_pic()%>"></a> </div>
              <div class="p-name">
                <input type="checkbox" value="996967" class="jdcheckbox" name="sku"/>
                <a alt="<%=favouriteList.get(0).getProduct_name()%>" title="<%=favouriteList.get(0).getProduct_name()%>" target="_blank" href=""><%=favouriteList.get(0).getProduct_name()%></a>
                <div class="p-price"> <strong price="<%=favouriteList.get(0).getProduct_price()%>">¥<%=favouriteList.get(0).getProduct_price()%></strong> <span class="stock"></span> </div>
                <div class="p-comments"> <span class="c-txt"><a class="ftx-03" target="_blank" clstag="homepage|keycount|guanzhu|comments" href="">111022人评价</a></span> <span class="c-perc">好评度98%</span> </div>
              </div>
              <div class="p-opbtns"> <a clstag="homepage|keycount|guanzhu|shop_shp" btn="add2cart" class="btn" target="_blank" href="">加入购物车</a> <a clstag="homepage|keycount|guanzhu|contrast" skuid="996967" id="comp996967" class="btn btn-compare" href="javascript:void(0);">对比</a> <a clstag="homepage|keycount|guanzhu|sub" btn="subscribeBtn" class="btn" href="javascript:void(0);">订阅</a> <a clstag="homepage|keycount|guanzhu|del_shp" btn="unfollow" class="btn" href="javascript:void(0);">取消</a> </div>
            </div>
            <div class="goods">
              <div class="p-img"> <a target="_blank" href="Goods.html"> <img width="160" height="160" data-img="1" alt="U100牌蔓越莓干" src="<%=favouriteList.get(1).getProduct_pic()%>"></a> </div>
              <div class="p-name">
                <input type="checkbox" value="996967" class="jdcheckbox" name="sku"/>
                <a alt="<%=favouriteList.get(1).getProduct_name()%>" title="<%=favouriteList.get(1).getProduct_name()%>" target="_blank" href=""><%=favouriteList.get(1).getProduct_name()%></a>
                <div class="p-price"> <strong price="10.68">¥<%=favouriteList.get(1).getProduct_price()%></strong> <span class="stock"></span> </div>
                <div class="p-comments"> <span class="c-txt"><a class="ftx-03" target="_blank" clstag="homepage|keycount|guanzhu|comments" href="">111022人评价</a></span> <span class="c-perc">好评度98%</span> </div>
              </div>
              <div class="p-opbtns"> <a clstag="homepage|keycount|guanzhu|shop_shp" btn="add2cart" class="btn" target="_blank" href="">加入购物车</a> <a clstag="homepage|keycount|guanzhu|contrast" skuid="996967" id="comp996967" class="btn btn-compare" href="javascript:void(0);">对比</a> <a clstag="homepage|keycount|guanzhu|sub" btn="subscribeBtn" class="btn" href="javascript:void(0);">订阅</a> <a clstag="homepage|keycount|guanzhu|del_shp" btn="unfollow" class="btn" href="javascript:void(0);">取消</a> </div>
            </div>
      <div class="goods">
              <div class="p-img"> <a target="_blank" href="Goods.html"> <img width="160" height="160" data-img="1" alt="U100牌蜜桃干" src="<%=favouriteList.get(2).getProduct_pic()%>"></a> </div>
              <div class="p-name">
                <input type="checkbox" value="996967" class="jdcheckbox" name="sku"/>
                <a alt="<%=favouriteList.get(2).getProduct_name()%>" title="<%=favouriteList.get(2).getProduct_name()%>" target="_blank" href=""><%=favouriteList.get(2).getProduct_name()%></a>
                <div class="p-price"> <strong price="10.68">¥<%=favouriteList.get(2).getProduct_price()%></strong> <span class="stock"></span> </div>
                <div class="p-comments"> <span class="c-txt"><a class="ftx-03" target="_blank" clstag="homepage|keycount|guanzhu|comments" href="">111022人评价</a></span> <span class="c-perc">好评度98%</span> </div>
              </div>
              <div class="p-opbtns"> <a clstag="homepage|keycount|guanzhu|shop_shp" btn="add2cart" class="btn" target="_blank" href="">加入购物车</a> <a clstag="homepage|keycount|guanzhu|contrast" skuid="996967" id="comp996967" class="btn btn-compare" href="javascript:void(0);">对比</a> <a clstag="homepage|keycount|guanzhu|sub" btn="subscribeBtn" class="btn" href="javascript:void(0);">订阅</a> <a clstag="homepage|keycount|guanzhu|del_shp" btn="unfollow" class="btn" href="javascript:void(0);">取消</a> </div>
            </div>
      
            
      </table>
      </div>
      <div class="clearfloat"></div>
      <div class="mymessage">
        <div class="ops">
          <input type="checkbox" clstag="homepage|keycount|guanzhu|shpall" name="prodcutListAllCheck" id="prodcutListAllCheck" class="jdcheckbox"/>
          <label for="prodcutListAllCheck">全选</label>
          <a clstag="homepage|keycount|guanzhu|shop_shpall" multiadd2cart="" class="ftx-05 ml10 btn-addcart" href="javascript:void(0);"> 加入购物车 </a> <a clstag="homepage|keycount|guanzhu|del_shpall" multiunfollow="" href="javascript:void(0)" class="ftx-05 ml10"> 取消关注 </a> </div>
        <div class="page"><a href="javascript:void(0)" class="ui-pager-prev prev-disabled"><b></b>上一页</a> <a href="javascript:void(0)" class="ui-page-curr">1</a> <a href="javascript:void(0)" class="ui-pager-next next-disabled">下一页<b></b></a><span class="ui-page-skip"><span> 共 1 页 </span>到 第 
          <input type="text" class="itxt" name="pageNo" style="width:40px"/>
          页 <a href="javascript:void(0);" class="btn-skipsearch" name="submitBtn">确定</a></span></div>
      </div>
    </div>
  </div>
  <div id="ban"><img src="assets/homeImages/ban2.jpg" width="1200" height="100" alt="间隔图片" /></div>
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

