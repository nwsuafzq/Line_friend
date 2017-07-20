window.onload=function(){
	$(document).ready(function() {

if(location.hash) {

$('a[href=' + location.hash + ']').tab('show');

}

$(document.body).on("click", "a[data-toggle]", function(event) {

location.hash = this.getAttribute("href");

});

});

$(window).on('popstate', function() {

var anchor = location.hash || $("a[data-toggle=tab]").first().attr("href");

$('a[href=' + anchor + ']').tab('show');

});

}