/**
 * 张琼
 * @param data
 * @param email
 * @return
 */
function ine(data, email) {
/*	 if (email
	 .search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)
	 == -1) { //邮箱是否合法
	 document.getElementById("submit1").disabled = true; // 按钮不可用
	 document.getElementById("checkUN").innerHTML = "<b style='color:
	 red'>邮箱不合法!</b>";
	 }else{
	 */

	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	// 先检测邮箱是否合法
	if (reg.test(email)) {

		if (data == 1) {
			document.getElementById("checkUN").innerHTML = "<b style='color: red'>用户名已存在</b>";
			document.getElementById("submit1").disabled = true; // 按钮不可用
		} else if (data == 2) {
			document.getElementById("checkUN").innerHTML = "<b style='color:red'>不能为空</b>";
			document.getElementById("submit1").disabled = true; // 按钮不可用
		} else if (data == 3) {
			
			document.getElementById("checkUN").innerHTML = "<b style='color:green'>该用户名可用</b>"
			document.getElementById("submit1").disabled = false; // 按钮可用
		} else if (data == 0) {
			document.getElementById("checkUN").innerHTML = "<b style='color:red'>ajax成功返回值为空</b>"
			document.getElementById("submit1").disabled = true; // 按钮不可用
		} else {
			document.getElementById("checkUN").innerHTML = "<b style='color:red'>未知错误</b>"
			document.getElementById("submit1").disabled = true; // 按钮不可用
		}

	} else {
		document.getElementById("checkUN").innerHTML = "<b style='color: red'>邮箱非法！</b>";
		document.getElementById("submit1").disabled = true; // 按钮不可用
	}
	
	/*
	if(pwd==''){
		document.getElementById("userPasswordMessage").innerHTML = "<b style='color: red'>密码不能为空</b>";
		document.getElementById("submit1").disabled = true; // 按钮不可用
	}*/
}

function checkUser() {
	var name = $('#email').val();
	var pwd = $('#password').val();
	var s = 0;
	$.ajax( {
		type : "post",
		url : 'checkUser.action',
		data : "email=" + name, // “email”传到action
		success : function(data) {
			ine(data, name);
		}
	});
}
$(document).ready(function() {
	$("#email").blur(function() {
		checkUser();
	});
//	$("#password").blur(function() {
//		checkUser();
//	});
	
})