function myCheck1() {
	for ( var i = 0; i < document.register.elements.length - 1; i++) {
		if (document.register.elements[i].value == "") {
			alert("当前表单不能有空项");
			document.register.elements[i].focus();
			return false;
		}
	}
	return true;

}