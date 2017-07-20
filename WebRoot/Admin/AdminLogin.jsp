<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html lang="en">  
<head>  
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 

    <title>Line friend零食铺-后台管理登录</title>  
    <link rel="stylesheet" type="text/css" href="assets/css/Login.css"/>   
<script type="text/javascript">
    function checkLength(){
       var password=document.getElementById("password"); //获取密码框值
       var adminname= document.getElementById("userName");
    if(password.value.length<6){
         alert("密码长度不少于六位！");
        window.location.href="adminlogin.action?&userName="+userName+"&password="+password;
    }else{

    }
      
    }
  </script>
  </head>
  
  <body>
    <img src="assets/homeImages/8.jpg"/> 
    <div id="login">  
        <h1>管理员</h1>  
        <form action="adminlogin.action">  
            <input type="text" required="required" placeholder="请输入用户名" name="userName" id="userName"></input>  
            <input type="password" required="required" placeholder="输入口令" name="password" id="password"></input> 


            <button class="but" type="submit" onclick="checkLength();">登录</button>  
            <div name="errMsg"></div>




        </form>  
    </div>  
  </body>
</html>
