/**
 * 
 */

function checkForm(obj){
	if(obj.irum.value==""){
		window.alert("Name Name");
		obj.irum.focus();
		return false;
	}
	
	if(obj.siteUrl.value==""){
		window.alert("Website WebSite.");
		obj.siteUrl.focus();
		return false;
	}
	
	var test = false;
	for(var i = 0; i<obj.fruit.length; i++){
		if(obj.fruit[i].checked==true) test = true;
	}
	if(test == false){
		window.alert("Favorite Favorite");
		obj.fruit[0].focus();
		return false;
	}
	
	var inTest=false;
	var str = "";
	for(var i = 0; i<obj.interest.length; i++){
		if(obj.interest[i].checked==true) {
			inTest = true;
			str +=obj.interest[i].value+",";
		}
	}
	obj.abc.value = str;
	window.alert(str);
	
	if(inTest == false){
		window.alert("Interest Interest");
		obj.interest[0].focus();
		return false;
	}
}