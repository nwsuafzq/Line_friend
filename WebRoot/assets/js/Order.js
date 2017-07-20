
function orderPrice(){
	/*alert("执行！");*/
	var address = document.getElementsByName("address");
	for(var i=0;i<address.length;i++){
	  if(address[i].checked==true){
	  	/*return true;*/
	  	/*alert("i--"+i);*/
	  	 var fullAddress=address[i].value;
	  	/*alert("value--"+fullAddress);*/
	  var AddressRE=document.getElementById("AddressRE");
	  AddressRE.innerHTML=address[i].value;
	 /* alert("AddressRE--"+AddressRE.innerHTML);*/
	  /*显示收货地址！！！*/
	  
	 
	   var receive_names=document.getElementsByName("receive_name");
	   var receive_name= receive_names[i].innerHTML;
	   /*alert(receive_name+"收货人");*/
	  var phones= document.getElementsByName("phone");
	  var phone=phones[i].innerHTML;
	  /* alert(phone+"电话");*/
	/*取值*/

		var ReName=document.getElementById("ReName");
	  ReName.innerHTML=receive_name;
	//span名字
	  var RePhone=document.getElementById("RePhone");
	  RePhone.innerHTML=phone;


	   
	  /*赋值*/
	 	return true;
	  }
	 
	}
	return false;
	
}
function sumPriceFun(){
    　var  sumPrice=0;
	  var xiaoji=document.getElementsByName("xiaoji");
	  for(var i=0;i<xiaoji.length;i++){
	   sumPrice=parseFloat(sumPrice)+parseFloat(xiaoji[i].innerText);
	   //alert(sumPrice.toFixed(2));
	  }
	  var sumPriceSpan =document.getElementsByName("sumPrice");
	   for (var i =0; i< sumPriceSpan.length;i++) {
		   //	alert(sumPrice.toFixed(2));
		   	sumPriceSpan[i].innerHTML=sumPrice.toFixed(2)
	   }

};



