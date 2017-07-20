
function bt(){
	 document.documentElement.scrollTop = document.body.scrollTop =0;	
}

window.onscroll = function () {
    if (document.documentElement.scrollTop + document.body.scrollTop > 0) {
        document.getElementById("totop").style.display = "block";
    }
    else {
        document.getElementById("totop").style.display = "none";
    }
}
