/**
 * @author 张琼
 */
function myCheck() {
	if (document.register.email.value == '') {
		alert('用户名不能为空！');
		document.register.email.focus();
		return false;
	}
	if (document.register.password.value == '') {
		alert('密码不能为空！');
		document.register.password.focus();
		return false;
	}
	if (document.register.password.value.length < 6) {
		alert('密码至少为6位，请重新输入！');
		document.register.password.focus();
		return false;
	}
	if (document.register.password.value != register.password2.value) {
		alert('你两次输入的密码不一致，请重新输入！');
		document.register.password2.focus();
		return false;
	}
	if(i&&i2){return true;}else{return false;}
/*
 * var $box= document.getElementsByName(checkBox); if($box.checked === false){
 * alert('同意条款才可以注册'); }else{ return false; }
 */
	//return true;
}



/*

function verificationcode() {
	var text = $.trim($("#checkcode").val());
	$.post("${pageContext.request.contextPath}/imageVerification.action", {
		op : text
	}, function(data) {
		data = parseInt($.trim(data));
		if (data > 0) {
			$("#span").text("验证成功!").css("color", "green");
			// alert(true);
			return true;
		} else {
			$("#span").text("验证失败!").css("color", "red");
			reload(); // 验证失败后需要更换验证码
			$("#checkcode").val(""); // 将验证码清空
			document.register.checkcode.focus();
			// alert(false);
			return false;
		}
	});
	//return false;
}*/
