// JavaScript Document

$(function(){	
	//获取要定位元素距离浏览器顶部的距离
	var navH = 950;
	//滚动条事件
	$(window).scroll(function(){
		//获取滚动条的滑动距离
		var scroH = $(this).scrollTop();
		//滚动条的滑动距离大于等于定位元素距离浏览器顶部的距离，就固定，反之就不固定
		if(scroH>=navH){
			$(".btdw").css({"position":"fixed","top":20,"left":"2.5%","margin-left":"0px","display":"block"});
		}else if(scroH<navH){
			$(".btdw").css({"position":"static","margin":"0 auto","display":"none"});
		}
		console.log(scroH==navH);
	})
})