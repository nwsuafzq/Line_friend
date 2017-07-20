<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="assets/css/index.css">
<link rel="stylesheet" type="text/css" href="assets/css/OrderM.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-responsive.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/ProductM.css">
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-combined.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/ProductM.css">
<link rel="stylesheet" type="text/css" href="assets/css/UserM.css">
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/npm.js"></script>
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/refreshTab.js"></script>
	<script type="text/javascript" src="assets/js/page.js"></script>
<!-- TemplateBeginEditable name="doctitle" -->
<title>Line friend管理员--订单管理</title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<script>
		function SearchUser(){
			//获取输入框和下拉框狂的值
			//alert(1);
			//var tiaojian=document.formSy.getElementsByName("condtion").value;
			//var sel2=document.formSy.getElementsByName("sel2").value;
			//var condtion=document.formSy.condtion.value;
			//var select=document.formSy.select.value;
			
			var select=document.getElementById("select").value;
			//alert("select:"+select);
			var condtion=document.getElementById("condtion").value;
			//alert("condtion:"+condtion);
			if(select==1){
				alert("将搜索所有用户信息！");
				window.location.href="searchOrder.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==2){
			if(condtion==null)
				alert("查询条件不能为空");
				//alert("订单编号");
	
				window.location.href="searchOrder.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==3){
			if(condtion==null)
				alert("查询条件不能为空");
				//alert("下单时间");
				window.location.href="searchOrder.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==4){
			if(condtion==null)
				alert("查询条件不能为空");
				//alert("用户ID");
				window.location.href="searchOrder.action?"+"condtion="+condtion+"&select="+select;
			}
			
			
		}
	
</script>
<script type="text/javascript">
function gotoUpdate(r){
	//var i=r.parentNode.parentNode.rowIndex;
	//alert("行号为="+i);
	//alert("订单详情");
	var rownum=r.parentNode.parentNode.rowIndex;
	//alert("行号="+rownum);
	var tab=document.getElementById("tab");
	var id=tab.rows[rownum].cells[0].innerHTML;
	var address_id=tab.rows[rownum].cells[6].innerHTML;
	//alert("order="+id);
	//alert("address_id="+address_id);
	window.location.href="showOrder.action?id="+id+"&address_id="+address_id+"#panel-Oitem";
	alert(成功);
}
</script>
<script>
    function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
     function delcfmm() {
        if (!confirm("确认要修改？")) {
            window.event.returnValue = false;
        }
    }
</script>
  </head>
  
  <body>
	
<div id="head">
	<ul class="nav nav-tabs" contenteditable="false" style="background-color: #000;">
		
		<li >
			<a href="AdminMsg.jsp" style="color: #fff;">通&nbsp;&nbsp;&nbsp;&nbsp;知<img src="assets/homeImages/mes.png"></a>
		</li>
		<li class="active">
			<a href="ProductManage.jsp"  style="color: #000;">首&nbsp;&nbsp;&nbsp;&nbsp;页<img src="assets/homeImages/home.png"></a>
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
						 <!-- <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#userM"> -->
						 <a href="userSearch.action?condtion=&select=1" style="margin-left: 15px;">用户管理<img src="assets/homeImages/user.png"></a>
					</div>
					<div id="userM" class="accordion-body collapse">
						<div class="accordion-inner">
							<a href="">用 户 查 询<img src="assets/homeImages/point.png"></a><br>
							<a href="">注 销 用 户<img src="assets/homeImages/point.png"></a>
						</div>
					</div>
				</div>
				<div class="accordion-group">
					<div class="accordion-heading">
						 <!-- <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#productM"> -->
						 <a href="foodSearch.action?condtion=&sel=1" style="margin-left: 15px;">商品管理<img src="assets/homeImages/pro.png"></a>
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
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#orderM">订单管理<img src="assets/homeImages/order.png"></a>
					</div>
					<div id="orderM" class="accordion-body in  collapse">
						<div class="accordion-inner">
							<a href="OrderManage.jsp#panel-Osearch">订 单 查 询&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
							
							<a href="OrderManage.jsp#panel-Oitem">订 单 详 情&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<div id="right">
		
       		 <!--页面-->
       		<div class="tabbable" id="tabs-337225"><!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a contenteditable="false" data-toggle="tab" href="#panel-Osearch">订单查询</a></li>

				<li><a contenteditable="false" data-toggle="tab" href="#panel-Oitem">订单详情</a></li>
				
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" contenteditable="false" id="panel-Osearch">
					<!-- <p>商品上架</p> -->
					
					<form class="navbar-form navbar-left" role="search" id="formSy">
						<label style="display: inline-block;margin-top:10px;left: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请选择查询条件:</label>
						<!-- <span>请选择查询条件:</span> -->
						<select class="selectSy" name="select" id="select" style="margin-top: 5px;height: 30px;width: 150px;">
						    <option value="1">全部订单</option>
							<option value="2">订单编号</option>
							<option value="3">下单时间</option>
							<option value="4">用户ID</option>
							
						</select>
							
						
						
							<input type="text" class="form-control" placeholder="请输入查询内容" id="condtion" name="condtion" style="margin-top: -5px;height: 30px;">
										
							<button type="button" class="btn btn-default" style="margin-top: -5px;height: 30px;width: 100px;" onClick="SearchUser();">查询</button>
						</form>

						<!-- 查询结果展示表格 -->
						<div id="tbShow">
								<div class="clean"></div>
								
								<table class="table" contenteditable="false" id="tab">
											<thead>
												<tr>
													<th style="width: 10%;">订单编号</th>
													<th style="width: 10%;">下单时间</th>
													<th style="width: 10%;">用户ID</th>
													<th style="width: 10%;">订单状态</th>
						                             
													<th style="width: 15%;">订单状态修改</th>
													<th style="width: 5%;">总金额</th>
													<th style="width: 15%;">收货地址</th>
													<th style="width: 5%;">收货人</th>
													<th style="width: 20%;">操作</th>
												</tr>
											</thead>
											
											<tbody>
											
											<c:forEach items="${orderList}"  var="item" varStatus="status">
												<tr>
												<!--<form action="editOrder.action">-->
													<!-- 隐藏域 -->
													<!-- <input type="hidden" value=${item.id} name="id"/> -->
													
													
													<td>${item.id}</td>
													<td>${item.order_time}</td>
													<td>${item.user_id}</td>
							                         <form  id="update" action="editOrder.action">
													<td>${item.status}</td>
													<td>
														<select id="stateName" name="stateName" >
															<option value="未处理">未处理</option>
															<option value="已接单">已接单</option>
															<option value="已发货">已发货</option>
															<option value="已完成">已完成</option>
														</select>
					

													</td>
													<td>${item.price_amount}</td>
													
													<td>${item.address_id}</td>
													<td>${item.address_id}</td>
											        
													 <input type="hidden" value=${item.id} name="id"/>
													<td><input type="submit" value="确定"  class="button3" onClick="delcfmm()"/>&nbsp;&nbsp;&nbsp;&nbsp;
													<!-- <a href="showOrder.action?id=${item.id}&address_id=${item.address_id}">详情查看</a> -->
													<a href="#" onClick="gotoUpdate(this);">详情查看</a>
													&nbsp;&nbsp;&nbsp;&nbsp;<a href="deleteOrder.action?id=${item.id}" onClick="delcfm()">作废</a></td>
													</form>
													<!-- <td><input type="submit" value="确定"/></td> -->
												   <!--<td><a href="editOrder.action?id=${item.id}&state=${stateName}">确定</a></td>-->
												  <!-- </form>-->
												
												</tr>
												</c:forEach>
												
											</tbody>
									</table>
									<div id="page">
									<a id="btn0"></a>
                                    <input id="pageSize" type="text" size="1" maxlength="2" value="getDefaultValue()"/><a> 条 </a> <a href="#" id="pageSizeSet">设置</a> 
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
						
				</div>


				<div class="tab-pane" contenteditable="false" id="panel-Oitem">
				

				<div id="xiangqing" style=" margin-left: 20%;" >
					<c:forEach items="${orderitemList}"  var="item"  varStatus="status">
					<table name="detil" style="margin:50px;width:800px;font:18px;">
					<caption>基本信息</caption>
					    <tr>
					    <td>订单号：${item.id}</td>
					     
					    <td>订单状态：${item.status}</td>
					     
					   </tr>
					   <tr>
					    <td>用户ID：${item.user_id}</td>
					    
					    <td>下单时间：${item.order_time}</td>
					      
					   </tr>
					</table>
					</c:forEach>
					<c:forEach items="${addressList}"  var="item"  varStatus="status">
					<table name="detil"  style="margin:50px;width:800px;font:18px;">
					<caption>地址详细信息</caption>
					   <tr>
					    <th colspan="4">收货人：${item.receive_name}</th>
					   
			
					   </tr>
					    <tr>
					    <th>所在地区：</th>
					     <td>${item.province}省${item.city}市${item.district}区</td>
					      <th>详细地址：</th>
					      <td>${item.full_address}</td>
					   </tr>
					   <tr>
					    <th>电话：</th>
					     <td>${item.phone}</td>
					      <th>邮编：</th>
					      <td>${item.postal_code}</td>
					   </tr>
					</table>
					</c:forEach>
					
					
					<table name="product"  style="margin:50px;width:800px;font:18px;">
					<caption>商品信息</caption>
					   <tr>
					    <th>商品编号</th>
					    <th>商品名称</th>
			            <th>单价</th>
					    <th>数量</th>
					    <th>小计</th>
					    <th>操作</th>
					   </tr>
					   <c:forEach items="${itemList}"  var="item"  varStatus="status">	
					    <tr>
					    <td>${item.product_id}</td>
					    <td>${item.product_name}</td>
			            <td>${item.price}</td>
					    <td>${item.product_num}</td>
					    <td>${item.amount}</td>
					    <td><a href="foodSearch.action?sel=2&condition=${item.product_id}#panel-Pout" >查看商品详情</a></td>
					   </tr>
					   </c:forEach>
					   <tr>
					    <td colspan="4" name="xiaoji"></td>
					    <td colspan="2" >总计：118.5元</td>
					   </tr>
					
					</table>
				
			</div>

			<!---->

				</div>
			</div>
		</div>
    	
			
	</div>
</div>
</body>
</html>
