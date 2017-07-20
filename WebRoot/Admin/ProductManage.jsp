<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" >
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/birthday.js"></script>
<script type="text/javascript" src="assets/js/dialog.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/refreshTab.js"></script>
<script type="text/javascript" src="assets/js/page.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-combined.min.css" /> -->
<link rel="stylesheet" type="text/css" href="assets/css/index.css" />
<link rel="stylesheet" type="text/css" href="assets/css/ProductM.css" />
<link rel="stylesheet" type="text/css" href="assets/css/UserM.css" />
 <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" /> 

<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-responsive.css" /> -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-responsive.min.css" />


<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-combined.min.css" />

		

		
		<title>Line friend管理员--用户管理</title>
    
    <script type="text/javascript">
        function submitInfo(row){
			var rownum=row.parentNode.parentNode.rowIndex;
			var tab=document.getElementById("tab");
	        var id=tab.rows[rownum].cells[1].innerHTML;
		    var description=document.getElementsByName("description")[rownum].value;
			var name=document.getElementsByName("productName")[rownum-1].value;
			var storage=document.getElementsByName("storage")[rownum-1].value;
			var category=document.getElementsByName("category")[rownum-1].value;
			var price=document.getElementsByName("price")[rownum-1].value;
			window.location.href="productUpdate.action?id="+id+"&productName="+name+"&description="+description+"&category="+category+"&price="+price+"&storage="+storage;

		}
    </script>
    
    
    <script type="text/javascript">
        function removeProductSearch(){
			var sel=document.getElementById("sel").value;
			var condition=document.getElementById("condition").value;
			window.location.href="foodSearch.action?sel="+sel+"&condition="+condition+"#panel-Pout";
		}
    </script>
    
    <script type="text/javascript">
        function productInfoSearch(){
			var sel=document.getElementById("sel1").value;
			var condition=document.getElementById("condition1").value;
			window.location.href="foodSearch.action?sel="+sel+"&condition="+condition+"#panel-Pupdate";
		}
    </script>
    
    
    
    <script type="text/javascript">
            var pageSize = 8;    //每页显示的记录条数
             var curPage=0;        //当前页
             var lastPage;        //最后页
             var direct=0;        //方向
            var len;            //总行数
            var page;            //总页数
            var begin;
            var end;


            $(document).ready(function display(){   
                len =$("#tab1 tr").length - 1;    // 求这个表的总行数，剔除第一行介绍
                page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                // alert("page==="+page);
                curPage=1;    // 设置当前为第一页
                displayPage(1);//显示第一页

                document.getElementById("btn0c").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";    // 显示当前多少页
                document.getElementById("sjzlc").innerHTML="数据总量 " + len + "";        // 显示数据量
                document.getElementById("pageSizec").value = pageSize;



                $("#btn1c").click(function firstPage(){    // 首页
                    curPage=1;
                    direct = 0;
                    displayPage();
                });
                $("#btn2c").click(function frontPage(){    // 上一页
                    direct=-1;
                    displayPage();
                });
                $("#btn3c").click(function nextPage(){    // 下一页
                    direct=1;
                    displayPage();
                });
                $("#btn4c").click(function lastPage(){    // 尾页
                    curPage=page;
                    direct = 0;
                    displayPage();
                });
                $("#btn5c").click(function changePage(){    // 转页
                    curPage=document.getElementById("changePagec").value * 1;
                    if (!/^[1-9]\d*$/.test(curPage)) {
                        alert("请输入正整数");
                        return ;
                    }
                    if (curPage > page) {
                        alert("超出数据页面");
                        return ;
                    }
                    direct = 0;
                    displayPage();
                });


                $("#pageSizeSetc").click(function setPageSize(){    // 设置每页显示多少条记录
                    pageSize = document.getElementById("pageSizec").value;    //每页显示的记录条数
                    if (!/^[1-9]\d*$/.test(pageSize)) {
                        alert("请输入正整数");
                        return ;
                    }
                    len =$("#tab1 tr").length - 1;
                    page=len % pageSize==0 ? len/pageSize : Math.floor(len/pageSize)+1;//根据记录条数，计算页数
                    curPage=1;        //当前页
                     direct=0;        //方向
                    // firstPage();
                    displayPage();
                });
            });

            function displayPage(){
                if(curPage <=1 && direct==-1){
                    direct=0;
                    alert("已经是第一页了");
                    return;
                } else if (curPage >= page && direct==1) {
                    direct=0;
                    alert("已经是最后一页了");
                    return ;
                }

                lastPage = curPage;

                // 修复当len=1时，curPage计算得0的bug
                if (len > pageSize) {
                    curPage = ((curPage + direct + len) % len);
                } else {
                    curPage = 1;
                }


                document.getElementById("btn0c").innerHTML="当前 " + curPage + "/" + page + " 页    每页 ";        // 显示当前多少页

                begin=(curPage-1)*pageSize + 1;// 起始记录号
                end = begin + 1*pageSize - 1;    // 末尾记录号


                if(end > len ) end=len;
                $("#tab1 tr").hide();    // 首先，设置这行为隐藏
                $("#tab1 tr").each(function(i){    // 然后，通过条件判断决定本行是否恢复显示
                    if((i>=begin && i<=end) || i==0 )//显示begin<=x<=end的记录
                        $(this).show();
                });
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
						 <!-- <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#userM"> -->

						 <a href="userSearch.action?condtion=&select=1" style="margin-left: 15px;margin-right: 50px;">用户管理<img src="assets/homeImages/user.png"></a>

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
						 <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion-355567" href="#productM">商品管理<img src="assets/homeImages/pro.png"></a>
					</div>
					<div id="productM" class="accordion-body in collapse">
						<div class="accordion-inner">
                            <a href="ProductManage.jsp#panel-Pupdate">商品信息修改<img src="assets/homeImages/point.png"></a><br>
                            <a href="ProductManage.jsp#panel-Padd">商 品 上 新&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
                            <a href="ProductManage.jsp#panel-Pout">商 品 下 架&nbsp;&nbsp;&nbsp;&nbsp;<img src="assets/homeImages/point.png"></a><br>
							
							
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
		
       		 <!--页面-->
       		<div class="tabbable" id="tabs-337225"><!-- Only required for left/right tabs -->
			<ul class="nav nav-tabs">
				<li class="active"><a contenteditable="false" data-toggle="tab" href="#panel-Pupdate">商品信息修改</a></li>
				<li><a contenteditable="false" data-toggle="tab" href="#panel-Padd">商品上新</a></li>
				<li><a contenteditable="false" data-toggle="tab" href="#panel-Pout">商品下架</a></li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane" contenteditable="false" id="panel-Padd">
					<!-- <p>商品上架</p> -->
					
						<div class ="view" >
							<form action="productAdd.action" class="form-horizontal" role="form" enctype="multipart/form-data" method="post">
										
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">产品名称：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="product_name" id="product_name" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">产品描述：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="description" id="description" style="height: 30px;"></div>
										</div><br>
										<!--<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">上架时间：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="add_time" id="add_time" style="height: 30px;"></div>
										</div><br>
										-->
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">原价：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="fixed_price" id="fixed_price" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">折后价：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="dangqian_price" id="dangqian_price" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">分类：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="keywords" id="keywords" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">生产商：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="producer" id="producer" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">生产日期：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="produce_date" id="produce_date" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">保质期：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="expiration_date" id="expiration_date" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">库存：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="storge" id="storge" style="height: 30px;"></div>
										</div><br>
										<div class="form-group">
											<label for="pname" class="col-sm-2 control-label">净含量(g)：</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" name="specification" id="specification" style="height: 30px;"></div>
										</div><br>
										<div class="form-group" id="seleimg">
											 <label for="exampleInputFile">选择商品图片</label>
											 <input type="file" name="file" id="exampleInputFile" accept="image/png,image/jpg,image/gif" />
										</div><br>
										<div class="form-group" id="sjbotton">				
											<div class="col-sm-10">
												<input type="submit" class="form-control" id="psubmit" value="上架"></div>
										</div><br>
							</form>
						</div>
						
				</div>

				<div class="tab-pane" contenteditable="false" id="panel-Pout">
					<!-- <p>商品下架</p> -->
					<!-- 搜索框 -->
                    <form class="navbar-form navbar-left" role="search" id="formSy">
						<label style="display: inline-block;margin-top:10px;left: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入查询内容:</label>
						<!-- <span>请选择查询条件:</span> -->
						<select class="selectSy" id="sel" style="margin-top: 5px;height: 30px;width: 150px;">
							<option value="1">全部商品</option>
							<option value="2">商品编号</option>
							<option value="3">类别</option>
							<option value="4">名称</option>
							<option value="5">价格</option>
							<option value="6">上架时间</option>
						</select>
							
				
							<input type="text" class="form-control" placeholder="请输入查询内容" id="condition" style="margin-top: -5px;height: 30px;">
										
							<button type="button" onClick="removeProductSearch()" class="btn btn-default" style="margin-top: -5px;height: 30px;width: 100px;">查询</button>
						</form>

						<!-- 查询结果展示表格 -->
						<div id="tbShow">
								<div class="clean"></div>
									<table class="table" contenteditable="false" id="tab">
											<thead>
												<tr>
													<th style="width: 9%;">图片</th>
													<th style="width: 7%;">编号</th>
													<th style="width: 10%;">名称</th>
													<th style="width: 10%;">描述</th>
													<th style="width: 9%;">数量</th>
													<th style="width: 9%;">类别</th>
													<th style="width: 9%;">折后价</th>
													<th style="width: 9%;">原价</th>
													<th style="width: 9%;">上架日期</th>
                                                    <th style="width: 8%;">是否下架</th>
													<th style="width: 11%;">操作</th>
												</tr>
											</thead>
											<tbody>
                                            
                                            <c:forEach items="${productList}" var="product" varStatus="status">
												<tr>
													<td><img src="../${product.product_pic}"></td>
													<td>${product.id}</td>
													<td>${product.product_name}</td>
													<td>${product.description}</td>
													<td>100</td>
													<td>${product.keywords}</td>
													<td>${product.dangqian_price}</td>
													<td>${product.fixed_price}</td>
													<td>${product.add_time}</td>
                                                    <td>${product.has_deleted}</td>
													<td><a href="productDelete.action?id=${product.id}#panel-Pout">下架</a>&nbsp;&nbsp;&nbsp;<a href="productResume.action?id=${product.id}#panel-Pout">上架</a></td>
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
				<div class="tab-pane active" contenteditable="false" id="panel-Pupdate">
					
                    <form class="navbar-form navbar-left" role="search" id="formSy">
						<label style="display: inline-block;margin-top:10px;left: 20%;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请输入查询内容:</label>
						<!-- <span>请选择查询条件:</span> -->
						<select class="selectSy" id="sel1" tyle="margin-top: 5px;height: 30px;width: 150px;">
							<option value="1">全部商品</option>
							<option value="2">商品编号</option>
							<option value="3">类别</option>
							<option value="4">名称</option>
							<option value="5">价格</option>
							<option value="6">上架时间</option>
						</select>
							

							<input type="text" class="form-control" placeholder="请输入查询内容" id="condition1" style="margin-top: -5px;height: 30px;">
										
							<button type="button" onClick="productInfoSearch()" class="btn btn-default"  style="margin-top: -5px;height: 30px;width: 100px;">查询</button>
						</form>

						<!-- 查询结果展示表格 -->
						<div id="tbShow">
								<div class="clean"></div>
									<table class="table" contenteditable="false" id="tab1">
											<thead>
												<tr>
													<th style="width: 10%;">图片</th>
													<th style="width: 5%;">编号</th>
													<th style="width: 15%;">名称</th>
													<th style="width: 16%;">描述</th>
													<th style="width: 10%;">数量</th>
													<th style="width: 10%;">类别</th>
													<th style="width: 7%;">折后价</th>
													<th style="width: 7%;">原价</th>
													<th style="width: 10%;">上架日期</th>
													<th style="width: 10%;">操作</th>
												</tr>
											</thead>
											<tbody>
                                            
                                            <c:forEach items="${productList}" var="product" varStatus="status">
												<tr>
													<td><img src="../${product.product_pic}"></td>
													<td>${product.id}</td>
													<td><input type="text" name="productName" value="${product.product_name}" style="width:100%;height: 30px;"></td>
													
													<td><input type="text" name="description" value="${product.description}" style="width:100%;height: 30px;"></td>
													<td><input type="text" name="storage" value="100" style="width:100%;height: 30px;"></td>
													<td><input type="text" name="category" value="${product.keywords}" style="width:100%;height: 30px;"></td>
													<td><input type="text" name="price" value="${product.dangqian_price}" style="width:100%;height: 30px;"></td>
													<td>${product.fixed_price}</td>
													<td>${product.add_time}</td>
													<!--	<td><a href="productUpdate.action">更新</a></td>-->
                                                    <td><input type="button" class="btn" value="更新" style="height: 30px;width: 60px;" onClick="submitInfo(this)"></td>
												</tr>
                                            </c:forEach>
                                            
											
											</tbody>
									</table>
                                    <div id="page">
	                                    <a id="btn0c"></a>
	                                    <input id="pageSizec" type="text" size="1" maxlength="2" value="getDefaultValue()"/><a> 条 </a> <a href="#" id="pageSizeSetc">设置</a> 
	                                    <a id="sjzlc"></a> 
	                                     <a  href="#" id="btn1c">首页</a>
	                                     <a  href="#" id="btn2c">上一页</a>
	                                      <a  href="#" id="btn3c">下一页</a>
	                                      <a  href="#" id="btn4c">尾页</a> 
	                                      <a>转到 </a>
	                                      <input id="changePagec" type="text" size="1" maxlength="4"/>
	                                     <a>页 </a>
	                                     <a  href="#" id="btn5c">跳转</a>
                                     </div>	
						</div>
				
					
				</div>		
               
                                            <!--
													<td><select>
															<option>坚果/炒货</option>
															<option>果干/蜜饯</option>
															<option>肉类/熟食</option>
															<option>饼干/膨化</option>
															<option>糕点/点心</option>
															<option>素食/豆类</option>
															<option>鱿鱼/海味</option>
														</select>
													</td>-->
								
			</div>
		</div>
    		
	</div>
</div>
</body>
</html>
