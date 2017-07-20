<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="assets/js/userM.js"></script>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>

<script type="text/javascript" src="assets/js/birthday.js"></script>

<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/refreshTab.js"></script>

<script type="text/javascript" src="assets/js/ui.js"></script>

<link rel="stylesheet" type="text/css" href="assets/css/UserM.css" />
<link rel="stylesheet" type="text/css" href="assets/css/index.css" />
<link rel="stylesheet" type="text/css" href="assets/css/ProductM.css" />

 <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" /> 

<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-responsive.min.css" />


<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-combined.min.css" />

<link rel="stylesheet" type="text/css" href="assets/css/style.css" />
	
<!-- TemplateBeginEditable name="doctitle" -->
<title>Line friend管理员--用户管理</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->

	</head>
<body>


<div id="head">
	<ul class="nav nav-tabs" contenteditable="false" style="background-color: #000;">
		<li>
			<a href="AdminMsg.jsp" style="color: #fff;">通&nbsp;&nbsp;&nbsp;&nbsp;知<img src="assets/homeImages/mes.png"></a>
		</li>
		<li class="active">
			<a href="ProductManage.jsp" style="color: #000;">首&nbsp;&nbsp;&nbsp;&nbsp;页<img src="assets/homeImages/home.png"></a>
		</li>
		<span>Line friend Admin</span>
		<span class="adminid">欢迎！${AdminName}&nbsp;&nbsp;&nbsp;&nbsp;<a href="">退出<img src="assets/homeImages/quit.png"></a></span>
	</ul>

</div>
<div id="width">
	<div id="left">
		<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			<div class="accordion" id="accordion-355567">
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a class="accordion-toggle"  href="userSearch.action?condtion=&select=1">用户管理<img src="assets/homeImages/user.png"></a>
					</div>
					<div id="userM" class="accordion-body  in collapse">
						<div class="accordion-inner">
							<a href="userSearch.action?condtion=&select=1">用户查询&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
							<a href="UserManage.jsp#panel-Update">用户信息更新<img src="assets/homeImages/point.png"></a>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <a href="foodSearch.action?condtion=&sel=1" style="margin-left: 15px;margin-right: 50px;">商品管理<img src="assets/homeImages/pro.png"></a>
					</div>
					<div id="productM" class="accordion-body collapse">
						<div class="accordion-inner">
							<a href="foodSearch.action?condtion=&sel=1#panel-Pupdate">商品信息修改<img src="assets/homeImages/point.png"></a><br>
                            <a href="ProductManage.jsp#panel-Padd">商 品 上 新&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
                            <a href="foodSearch.action?condtion=&sel=1#panel-Pout">商 品 下 架&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <!-- <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#orderM"> -->
						 <a href="searchOrder.action?condtion=&select=1" style="margin-left: 15px;margin-right: 50px;">订单管理<img src="assets/homeImages/order.png"></a>
					</div>
					<div id="orderM" class="accordion-body collapse">
						<div class="accordion-inner">
							<a href="">订 单 检 索</a><br>
							<a href="">订 单 状 态 修 改</a><br>
							<a href="">作 废 订 单</a><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<div id="right">
		<div class="tabbable" id="tabs-219574">
				<ul class="nav nav-tabs">
					<li class="active">
						<a contenteditable="false" data-toggle="tab" href="#panel-Userach">用户查询</a>
					</li>
					<li>
						<a contenteditable="false" data-toggle="tab" href="#panel-Update">用户信息修改</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-Userach">
						<form class="navbar-form navbar-left" role="search" id="formSy">
							<label style="display: inline-block;margin-top:10px;left: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入查询内容:</label>			
							
								<select class="selectSy" name="select" id="select" style="margin-top: 5px;height: 30px;width: 150px;">
											<option value="1"  selected="selected">
												全部用户
											</option>
											<option value="2">
												用户邮箱
											</option>
											<option value="3">
												性别
											</option>
											<option value="4">
												用户ID
											</option>
											
											<option value="5">
												用户昵称
											</option>
											<option value="6">
												年龄
											</option>
								</select>	
								<input type="text" class="form-control"  style="margin-top: -5px;height: 30px;" placeholder="请输入查询内容" id="condtion" name="condtion" >	
								<input type="button"  class="btn" value="查询"  onclick="SearchUser();" style="margin-top: -5px;height: 30px;width: 100px;">
						</form>
						<div class="tbShow">
								<div class="clean"></div>
									<table class="table" contenteditable="false" id="tab">
											<thead>
												<tr>
													<th style="width: 10%;">用户ID</th>
													<th style="width: 10%;">注册邮箱</th>
													<th style="width: 10%;">昵称</th>
													<th style="width: 10%;">真实姓名</th>
													<th style="width: 10%;">上次登录时间</th>
													<th style="width: 10%;">上次登录IP</th>
													<th style="width: 5%;">性别</th>
													<th style="width: 10%;">身份证号</th>
													<th style="width: 10%;">出生日期</th>
													<th style="width: 15%;">操作</th>
												</tr>
											</thead>
											<tbody>
											<!--  动态加载-->
											<c:forEach items="${userList}" var="user" varStatus="status">
										
												<tr>
													<td>${user.id}</td>
													<td>${user.email}</td>
													<td>${user.nickName}</td>
													<td>${user.trueName}</td>
													<td>${user.last_login_time}</td>
													<td>${user.last_login_ip}</td>
													<td>${user.sex}</td>
													<td>${user.cardId}</td>
													<td>${user.year}-${user.mouth}-${user.day}</td>
													
													<td><a href="UserDelect.action?id=${user.id}"><input type="button"  class="btn" value="注销" /></a>&nbsp;&nbsp;&nbsp;&nbsp;
																									
													<!-- <a href="Updateuser.action?id=${user.id}"><input type="button"  class="btn" value="修改" /></a> -->
													<input type="button"  class="btn" onClick="gotoUpdate(this)" value="修改" />
													</td>
													
												</tr>
								
											</c:forEach></tbody>
									</table>
									
									<!--<div>翻页
										<a  href="#" id="btn2">上一页</a>
		                                <a  href="#" id="btn3">下一页</a>
									</div>-->
									<div id="page">翻页
										<a id="btn0"></a>
		                                <input id="pageSize" type="text" size="1" maxlength="2" value="getDefaultValue()"/><a> 条</a> <a href="#" id="pageSizeSet">设置</a> 
		                                <a id="sjzl"></a> 
		                                <a  href="#" id="btn1">首页</a>
		                                <a  href="#" id="btn2">上一页</a>
		                                <a  href="#" id="btn3">下一页</a>
		                                <a  href="#" id="btn4">尾页</a> 
		                                <a>转到 </a>
		                                <input id="changePage" type="text" size="1" maxlength="4"/>
		                                <a>页 </a>
		                                <a  href="#" id="btn5">跳转</a>
									</div>
									
						</div>

					</div><!--面板一-->


					<div class="tab-pane" id="panel-Update">
					<div id="UpdatePanl">
						<form class="navbar-form">
						
							<div class="inputDiv"><label class="labelSy">用&nbsp;&nbsp;户&nbsp;&nbsp;ID：</label>
							<input  type="text" id="id" value=${user.id} placeholder="这里将显示用户ID" disabled="true" style="height: 40px;width: 250px;margin-top: -10px;">
							</div>
							
							<div class="inputDiv"><label class="labelSy">用户邮箱：</label>
							<input  type="text" id="email" value=${user.email} placeholder="这里将显示用户邮箱" disabled="true"  style="height: 40px;width: 250px;margin-top: -10px;">
							</div>

							<div class="inputDiv"><label class="labelSy">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</label><input  type="text" id="NewnickName" value="${user.nickName}"   style="height: 40px;width: 250px;margin-top: -10px;"></div>
						
							<div class="inputDiv"><label class="labelSy">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
							<select id="Newsex"  style="height: 40px;width: 250px;margin-top: -10px;">
								<option value="男">男</option>
								<option value="女">女</option>
							</select>
							<!-- <span class="spanSy" id="sex">${user.sex}</span> --></div>

							<div class="inputDiv"><label class="labelSy">真实姓名：</label><input type="text" id="NewtrueName" value="${user.trueName}"   style="height: 40px;width: 250px;margin-top: -10px;"></div>
							
							
							<div class="inputDiv"><label class="labelSy">身份证号：</label><input type="text" id="NewcardId" value="${user.cardId}"   style="height: 40px;width: 250px;margin-top: -10px;"></div>

							<div class="inputDiv"><label class="labelSy">出生日期：</label><!-- <input  type="text" name="Newyear" style="height: 30px;width: 70px;margin-top: -5px;">&nbsp;&nbsp;年
														  		 				  <input type="text" name="Newmouth" style="height: 30px;width: 70px;margin-top: -5px;">&nbsp;&nbsp;月
																 				  <input type="text" name="Newday" style="height: 30px;width: 70px;margin-top: -5px;">&nbsp;&nbsp;日</div> -->
																 				<select id="selYear" style="width: 120px;margin-top: -5px;height: 40px"></select>&nbsp;&nbsp;年
																				<select id="selMonth" style="width: 120px;margin-top: -5px; height: 40px;"></select>&nbsp;&nbsp;月
																				<select id="selDay"  style="width: 120px;margin-top: -5px;height: 40px;"></select>&nbsp;&nbsp;日
																				
							<div class="inputDiv"><input type="button"  class="btn" value="确认"  onclick="trueUpdateUser()" style="height: 40px;width: 150px;margin-left:500px;margin-top: 30px;"></div>		
						
						</form>
					</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>

<script type="text/javascript">
var selYear = window.document.getElementById("selYear");
var selMonth = window.document.getElementById("selMonth");
var selDay = window.document.getElementById("selDay");
// 新建一个DateSelector类的实例，将三个select对象传进去
new DateSelector(selYear, selMonth, selDay, 1996, 1, 1);
// 也可以试试下边的代码
// var dt = new Date(2004, 1, 29);
// new DateSelector(selYear, selMonth ,selDay, dt);
</script>
<script type="text/javascript" src="assets/js/page.js"></script>
</body>
</html>
