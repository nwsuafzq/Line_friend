// JavaScript Document


var speed=10;
var tab=document.getElementById("P");

function Marquee()
{
	if(tab.scrollLeft+tab.clientWidth==tab.scrollWidth)
	    tab.scrollLeft-=tab.clientWidth;
    tab.scrollLeft++;
}
var MyMar=setInterval(Marquee,speed);
tab.onmouseover=function() 
{
	clearInterval(MyMar)
};
tab.onmouseout=function() 
{
	MyMar=setInterval(Marquee,speed)
};