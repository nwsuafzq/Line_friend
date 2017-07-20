	/*------------------mobile验证码----------------------------------*/

	var i2= false;	
	function smsverificationcode() {
	var text = $.trim($("#smscode").val());
	$.post("checksms.action", {
		smsco : text
	}, function(data) {
		data = parseInt($.trim(data));
		if (data > 0) {
			$("#spansms").text("SMS验证成功!").css("color", "green");
			i2=true;
			
		} else {
			$("#spansms").text("SMS验证失败!").css("color", "red");
			i2=false;
		}
	});
}

	function get_mobile_code(){
        $.post("sendsms.action", {mobile:jQuery.trim($('#mobile').val())}, function(msg) {
            //alert(jQuery.trim(unescape(msg)));
			if(msg==1){
				RemainTime();
			}
        });
	};
	var iTime = 30;
	var Account;
	function RemainTime(){
		document.getElementById('zphone').disabled = true;
		var iSecond,sSecond="",sTime="";
		if (iTime >= 0){
			iSecond = parseInt(iTime%60);
			iMinute = parseInt(iTime/60)
			if (iSecond >= 0){
				if(iMinute>0){
					sSecond = iMinute + "分" + iSecond + "秒";
				}else{
					sSecond = iSecond + "秒";
				}
			}
			sTime=sSecond+"后获取";
			if(iTime==0){
				clearTimeout(Account);
				sTime='获取手机验证码';
				iTime = 59;
				document.getElementById('zphone').disabled = false;
			}else{
				Account = setTimeout("RemainTime()",1000);
				iTime=iTime-1;
			}
		}else{
			sTime='没有倒计时';
		}
		document.getElementById('zphone').value = sTime;
	}
	