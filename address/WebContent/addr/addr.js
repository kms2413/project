/**
 * 
 */

function insertForm(form){
	if(form.name.value==""){
		alert("NAME!!");
		form.name.focus();
		return false;
	}
	
	if(form.phone.value==""){
		alert("phone!!");
		form.phone.focus();
		return false;
	}
	
	if(form.email.value==""){
		alert("EMAIL!!");
		form.email.focus();
		return false;
	}
	
}

function selectForm(form){
	alert("NAME!!!!!!!!!!!!!!!");
	form.name.focus();
	return false
}

function deleteForm(form){
	
	if(form.name.value==""){
		alert("NAME!!!!!!!!!!");
		form.name.focus();
		return ;
	}
	
	var urlName = "deleteOk.jsp?name="+form.name.value;
	var value = confirm("Are you sure?");
	if(value ==true){
		location.href =urlName;
	}else{
		alert("Canceled");
	}
	
}