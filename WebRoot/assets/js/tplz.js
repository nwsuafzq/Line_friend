// JavaScript Document
$(document).ready(function(){	//jQuery中的一种作用类似于js中的window.onload，但更加强大
		$(".clickButton a").attr("href","javascript:return false;");   //下边数字   执行return false
		$(".clickButton a").each(function(index){			
			$(this).click(function(){     //$(this)就是把each遍历到的div元素转化成jquery对象，因为只有jquery对象才有你后面的.html("...")这个方法，this本身是dom对象，是没有html()这方法的
				changeImage(this,index);	
			});			
		});	
		autoChangeImage();	//auto自动轮转图片	
	});

	function autoChangeImage(){
		for(var i = 0; i<=10000;i++){
			window.setTimeout("clickButton("+(i%3+1)+")",i*2000);			//经过指定的某个时间段后执行一次指定的方法，图片自动变换的间断时间
		}
	}

	function clickButton(index){
		$(".clickButton a:nth-child("+index+")").click();        //css3 就是a下面的每一个子元素都执行index，点击跳转图片方法
	}

	function changeImage(element,index){
		var arryImgs = ["assets/homeImages/11.jpg","assets/homeImages/1.jpg","assets/homeImages/01.jpg"];
		$(".clickButton a").removeClass("active");           //移除active类
		$(element).addClass("active");
		$(".imgs img").attr("src",arryImgs[index]);
	}