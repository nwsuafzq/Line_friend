<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>公告-LINEFRIEND</title>
<link rel="stylesheet" href="assets/css/buy.css" charset="utf-8"/>
<link rel="stylesheet" href="assets/css/UserQuestion.css" charset="utf-8"/>
<link rel="stylesheet" href="assets/css/Header.css" type="text/css" />
<link rel="stylesheet" href="assets/css/Search.css" type="text/css" />
<link rel="stylesheet" href="assets/css/Footer.css" type="text/css" />

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
            <li class="nav__menu-item"><a href="userCart.html">购物车</a></li>
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
    <div class="Search1"> <a href="home.jsp"><img src="assets/homeImages/logo.png"
					width="195" height="60" /></a>
      <div class="welcome"> <font size="+6" color="#CCCCCC">|</font><font size="+2">常见问题解答</font> </div>
    </div>
  </div>
  <div class="clearfloat"></div>
  <div id="content">
  <div class="QA"><h1>公告：</h1><p class="question"><%=request.getParameter("content")%>:</p>
  <p class="answer"><%=request.getParameter("content")%>6月30日，党委书记李兴旺主持召开2017年第16次党委常委会议，研究领导班子工作规则等重要事项。

　　会议集体学习了中共中央政治局召开的审议《关于<%=request.getParameter("content")%>情况的专题报告》会议精神。会议强调，办好中国特色社会主义高等教育，必须旗帜鲜明坚持党对高校工作的领导。领导干部和广大党员要认真学习领会习近平总书记系列重要讲话精神，进一步提高政治站位，旗帜鲜明讲政治，切实强化“四个意识”，坚定“四个自信”，以实际行动维护党中央权威和集中统一领导。要以巡视整改工作为契机，全面加强党对学校的领导，严肃党内政治生活，加强学校领导班子建设，切实防范廉洁风险，把全面深化改革和全面从严治党结合起来，明晰责任、完善制度、堵塞漏洞，确保学校事业始终沿着正确方向健康发展，为实现“两个一百年”奋斗目标和中华民族伟大复兴的中国梦提供人才保障和智力支持。

　　会议审议并原则通过了学校《<%=request.getParameter("content")%>》。会议指出，工作规则是学校领导班子成员履职尽责的行为规范和基本遵循，领导班子成员要带头按规则要求办事，带头执行各项工作程序，带头改进工作作风，狠抓领导班子自身建设，在严明纪律、强化监督和加强组织创新等方面全面用力、综合施策，不断提升“关键少数”的凝聚力、创造力和战斗力。

　　会议还审议了《<%=request.getParameter("content")%>》，研究了学校改善基本办学条件专项资金项目等其他重要事项。

</p>
	</div>

  <div id="ban"><img src="assets/homeImages/ban2.jpg" width="1200" height="100" alt="间隔图片" /></div>
  <div id="foot_server">
    <dl>
      <dt>购物指南</dt>
      <dd><a target="_blank" href="#">购物流程</a></dd>
      <dd><a target="_blank" href="#">会员介绍</a></dd>
      <dd><a target="_blank" href="#">生活旅行/团购</a></dd>
      <dd><a target="_blank" href="#">常见问题</a></dd>
      <dd><a target="_blank" href="#">联系客服</a></dd>
    </dl>
    <dl>
      <dt>配送方式</dt>
      <dd><a target="_blank" href="#">上门自提</a></dd>
      <dd><a target="_blank" href="#">211限时送达</a></dd>
      <dd><a target="_blank" href="#">配送服务查询</a></dd>
      <dd><a target="_blank" href="#">配送费收取标准</a></dd>
      <dd><a target="_blank" href="#">海外配送</a></dd>
    </dl>
    <dl>
      <dt>支付方式</dt>
      <dd><a target="_blank" href="#">货到付款</a></dd>
      <dd><a target="_blank" href="#">在线支付</a></dd>
      <dd><a target="_blank" href="#">分期付款</a></dd>
      <dd><a target="_blank" href="#">邮局汇款</a></dd>
      <dd><a target="_blank" href="#">公司转账</a></dd>
    </dl>
    <dl>
      <dt>售后服务</dt>
      <dd><a target="_blank" href="#">售后政策</a></dd>
      <dd><a target="_blank" href="#">价格保护</a></dd>
      <dd><a target="_blank" href="#">退款说明</a></dd>
      <dd><a target="_blank" href="#">退换货</a></dd>
      <dd><a target="_blank" href="#">取消订单</a></dd>
    </dl>
    <div><img src="assets/homeImages/foot.png" /></div>
  </div>
  <div class="clearfloat"> </div>
  <div id="footer">
    <hr />
    <br />
    <div class="footer1"> <a href="ShoppingProcess.html"> 关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href="#">广告服务</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">LINEFRIEND社区</a> </div>
    <div class="footer2">
      <div class="copyright">Copyright&copy;&nbsp;&nbsp;2016-2017&nbsp;&nbsp;LINEFRIEND&nbsp;SC.com&nbsp;&nbsp;版权所有 </div>
    </div>
  </div>
  
  <div class="totop" id="totop" onclick="bt()"><img src="assets/homeImages/top.png" width="21" height="40" /></div>
</div>
</body>
</html>
