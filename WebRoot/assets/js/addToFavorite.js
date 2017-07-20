// JavaScript Document
function addToFavorite() {
	var title = "LINE FRIEND网上购物商城";
	var url = "http://www.sc.com";
	if (window.sidebar) {
		window.sidebar.addPanel(title, url, "");
	} else {
		try {
			window.external.AddFavorite(url, title);
		} catch (e) {
			alert("您的浏览器不支持该功能,请使用Ctrl+D收藏本页");
		}
	}
}