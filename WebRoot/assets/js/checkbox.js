$(function(){
		   var regBtn = $("#submit1");
		   $("#agree").change(function(){
		       var that = $(this);
		       that.prop("checked",that.prop("checked"));
		       if(that.prop("checked")){
		           regBtn.prop("disabled",false)
		        
		       }else{
		           regBtn.prop("disabled",true)
		          
		       }
			   })
			});