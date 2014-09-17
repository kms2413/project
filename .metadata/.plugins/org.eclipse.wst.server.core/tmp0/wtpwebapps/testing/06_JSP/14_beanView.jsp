<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String message=request.getParameter("message");
%>
<jsp:useBean id="b" class = "beans.Bean">
	<jsp:setProperty name = "b" property="name" value = "<%=name %>"/>
	<jsp:setProperty name = "b" property="message" value = "<%=message %>"/>
</jsp:useBean>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	Name: <jsp:getProperty property="name" name ="b"/>
	Message: <jsp:getProperty property="message" name ="b"/>
	
</body>
</html>