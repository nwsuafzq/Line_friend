//重新获取验证码
		function reload() {
	document.getElementById("image").src = "imageVerifyCode.action?date="
			+ new Date().getTime();
	$("#checkcode").val(""); // 将验证码清空
							}
		
		//验证码验证
		var i= false;	
function verificationcode() {
	var text = $.trim($("#checkcode").val());
	$.post("imageVerification.action", {
		op : text
	}, function(data) {
		data = parseInt($.trim(data));
		if (data > 0) {
			$("#span").text("验证成功!").css("color", "green");
			// alert(true);
			i=true;
			//return true;
		} else {
			$("#span").text("验证失败!").css("color", "red");
			reload(); // 验证失败后需要更换验证码
			//$("#checkcode").val(""); // 将验证码清空
			//document.register.checkcode.focus();
			// alert(false);
			i=false;
			//return false;
		}
		//if(i){return true;}
		//else{return false;}
	});
}