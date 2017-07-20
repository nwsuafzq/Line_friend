// JavaScript Document

function changeAll(){
	var fathers=document.getElementById("father");
	var father2=document.getElementById("father2");
	var sons=document.getElementsByName("son");
	if(fathers.checked){
		father2.checked="checked";
		for(var i=0;i<sons.length;i++){
			sons[i].checked="checked";
		} 
	}else{
		father2.checked="";
		for(var i=0;i<sons.length;i++){
			sons[i].checked="";
		}
	}
}
function change2(){
	var fathers=document.getElementById("father");
	var father2=document.getElementById("father2");
    var sons=document.getElementsByName("son");
	if(father2.checked){
		fathers.checked="checked";
		for(var i=0;i<sons.length;i++){
			sons[i].checked="checked";
		} 
	}else{
		fathers.checked="";
		for(var i=0;i<sons.length;i++){
			sons[i].checked="";
		}
	}
}
function  change(){
	var fathers=document.getElementById("father");
	var father2=document.getElementById("father2");
    var sons=document.getElementsByName("son");
	var isTrue=true;
	for(var i=0;i<sons.length;i++){
		isTrue=(isTrue&&sons[i].checked);
	}
	if(isTrue){
		fathers.checked="checked";
	}else{
		fathers.checked="" ;
	} 
}
