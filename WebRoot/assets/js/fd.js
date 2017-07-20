// JavaScript Document
function addLoadEvent(func){
	var oldonload = window.onload;
		if(typeof window.onload != 'function'){
		window.onload = func;
	}
	else{
		window.onload = function(){oldonload();func();}
	}
}
function preparePhoto(){
	var links = document.getElementById("linkBox").getElementsByTagName("a");
	for(i=0;i<links.length;i++){
		links[i].onclick = function(){
			return showPic(this);
		}
	links[i].onmousemove = function(){
	return showPic(this);
		}
	}
}
function showPic(url){
	if(!document.getElementById("photoHandler")){
		var photoHandler = document.createElement("div");
		photoHandler.id="photoHandler";
		var textBox=document.createElement("p");
		var imgBox=document.createElement("img");
		imgBox.id="imgBox";
		photoHandler.appendChild(imgBox);
		document.getElementById("content42").appendChild(photoHandler);
		document.getElementById("content42").insertBefore(textBox,document.getElementById("linkBox"))
	}
	var scoure = url.getAttribute("href");
	document.getElementById("imgBox").setAttribute("src",scoure);
}
addLoadEvent(preparePhoto);