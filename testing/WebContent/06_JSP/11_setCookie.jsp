<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String[] fruit = request.getParameterValues("fruit");
	//	out.print(fruit.length+"<br/>");
	
	for(int i =0; i <fruit.length; i++){
		String key = "fruit"+i; //fruit0, fruit1
		Cookie test = new Cookie(key, fruit[i]);
		test.setMaxAge(60*10); //20, 60*30, 60*60*2, 60*60*24*365
		response.addCookie(test);
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>Saved</div>
	<br/><br/>
	
	<a href="11_getCookie.jsp">Read</a>
</body>
</html>