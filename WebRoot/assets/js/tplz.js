// JavaScript Document
$(document).ready(function(){	//jQuery�е�һ������������js�е�window.onload��������ǿ��
		$(".clickButton a").attr("href","javascript:return false;");   //�±�����   ִ��return false
		$(".clickButton a").each(function(index){			
			$(this).click(function(){     //$(this)���ǰ�each��������divԪ��ת����jquery������Ϊֻ��jquery�������������.html("...")���������this������dom������û��html()�ⷽ����
				changeImage(this,index);	
			});			
		});	
		autoChangeImage();	//auto�Զ���תͼƬ	
	});

	function autoChangeImage(){
		for(var i = 0; i<=10000;i++){
			window.setTimeout("clickButton("+(i%3+1)+")",i*2000);			//����ָ����ĳ��ʱ��κ�ִ��һ��ָ���ķ�����ͼƬ�Զ��任�ļ��ʱ��
		}
	}

	function clickButton(index){
		$(".clickButton a:nth-child("+index+")").click();        //css3 ����a�����ÿһ����Ԫ�ض�ִ��index�������תͼƬ����
	}

	function changeImage(element,index){
		var arryImgs = ["assets/homeImages/11.jpg","assets/homeImages/1.jpg","assets/homeImages/01.jpg"];
		$(".clickButton a").removeClass("active");           //�Ƴ�active��
		$(element).addClass("active");
		$(".imgs img").attr("src",arryImgs[index]);
	}