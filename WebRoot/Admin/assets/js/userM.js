function SearchUser(){
			//获取输入框和下拉框狂的值
			//alert(1);
			//var tiaojian=document.formSy.getElementsByName("condtion").value;
			//var sel2=document.formSy.getElementsByName("sel2").value;
			//var condtion=document.formSy.condtion.value;
			//var select=document.formSy.select.value;
			
			var select=document.getElementById("select").value;
			//alert("select:"+select);
			
			//alert("select:"+select);
			var condtion=document.getElementById("condtion").value;
			//alert("condtion:"+condtion);
			if(select==1){
			
				mizhu.alert('用户管理', '\n查询所有用户\n','../assets/homeImages/user');
				window.location.href="userSearch.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==2){
				var Regex = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/;
				if(Regex.test(condtion)){
					//mizhu.alert("邮箱格式正确，正在查询!");
					mizhu.alert('用户管理', '\n正在查询！\n','../assets/homeImages/user');	
					window.location.href="userSearch.action?"+"condtion="+condtion+"&select="+select;		
				}else{
					mizhu.confirm('',
						'请输入正确的邮箱！',
						function(flag)
						 {
						    if(flag)
							 {	
							 	window.location.href="UserManage.jsp";
							      
							 }else{
							 	window.location.href="UserManage.jsp";
							 }
						});   
					
				}
				//alert("查询全部信息1");
			}
			else if(select==3){
				if(condtion!="男" &&condtion!="女"){
					mizhu.alert('用户管理', '\n请输入男或者女\n','../assets/homeImages/user');
				}else{
					mizhu.alert('用户管理', '\n正在查询！\n','../assets/homeImages/user');
					window.location.href="userSearch.action?"+"condtion="+condtion+"&select="+select;
				}
					
			}
			else if(select==4){
				mizhu.alert('用户管理', '\n正在查询！\n','../assets/homeImages/user');
				window.location.href="userSearch.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==5){
				mizhu.alert('用户管理', '\n正在查询！\n','../assets/homeImages/user');
				window.location.href="userSearch.action?"+"condtion="+condtion+"&select="+select;
			}
			else if(select==6){
				mizhu.alert('用户管理', '\n正在查询！\n','../assets/homeImages/user');
				var date=new Date;
 				var year=date.getFullYear(); 
 				
 				var birdayYaer=year-parseInt(condtion);
 				
				window.location.href="userSearch.action?"+"condtion="+birdayYaer+"&select="+select;
			}		
}

function gotoUpdate(r){
	//var i=r.parentNode.parentNode.rowIndex;
	//alert("行号为="+i);
	alert("jajd");
	var rownum=r.parentNode.parentNode.rowIndex;
	//alert("hanghao="+rownum);
	var tab=document.getElementById("tab");
	var id=tab.rows[rownum].cells[0].innerHTML;
	
	
	//alert("user="+id);
	mizhu.confirm('',
		'确认更新该用户信息？',
		function(flag)
		 {
		    if(flag)
		 {		window.location.href="Updateuser.action?id="+id+"#panel-Update";
		      
		    }
		});   
	
	//window.location.href="Updateuser.action?id="+id+"#panel-Update";
	
}
function trueUpdateUser(){
		var id=document.getElementById("id").value;
		var NnickName=document.getElementById("NewnickName").value;
		var NtrueName=document.getElementById("NewtrueName").value;
		var Nsex=document.getElementById("Newsex").value;
		var NcardId=document.getElementById("NewcardId").value;
		var Nyear=document.getElementById("selYear").value;
		var Nmouth=document.getElementById("selMonth").value;
		var Nday=document.getElementById("selDay").value;
		alert("更新信息："+id+"-"+NnickName+"-"+NtrueName+"-"+Nsex+"-"+NcardId+"-"+Nyear+"-"+Nmouth+"-"+Nday);
		var reg=/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
		if(reg.test(NcardId)){
			//alert("输入的是身份证号");
			window.location.href="UpdateUserInfo.action?id="+id+"&nickName="+NnickName+"&trueName="+NtrueName+"&sex="+Nsex+"&cardId="+NcardId+"&year="+Nyear+"&mouth="+Nmouth+"&day="+Nday;
			//alert("该用户信息已修改!");
			  mizhu.alert('用户信息更新',
					'更新成功！');
			
		}
		else{
			//alert("请输入正确的身份证号");
		}
		
	}
window.onload= function(){
	$("#select").change(function(){
	var opt = $(this).find("option:selected");
	opt.attr("selected",true);
	});
}

