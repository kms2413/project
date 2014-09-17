<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String) session.getAttribute("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
		<jsp:include page = "index.jsp"/>
	<% if(id !=null){ %>
		<div align = "center">
			안녕하세요 <%=id %>님 <br/>
			즐거운 시간되세요.
		</div>
	<%}else { %>
		<div align = "center">
			Guest님 하이
		</div>
	<%} %>
</body>
</html>