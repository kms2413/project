<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String check = request.getParameter("check");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(check.equals("include")){ %>
		<jsp:include page = "07_result.jsp"/>
	<% }if(check.equals("forward")){%>
		<jsp:forward page = "07_result.jsp"/>
	<%} %>
	
	<div>
		returned
	</div>

</body>
</html>