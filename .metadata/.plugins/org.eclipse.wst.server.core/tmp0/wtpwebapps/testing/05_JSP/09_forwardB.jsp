<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	
	request.setCharacterEncoding("euc-kr");
	String blood = request.getParameter("blood"); //a, b, ab, o
	String bloodType = "09_"+blood+".jsp"; //09_x.jsp
	out.print(bloodType);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%String name = "GGOP Na Young"; %>
	<jsp:forward page="<%=bloodType %>">
		<jsp:param name = "name" value = "<%=name %>"/>
	</jsp:forward>
</body>
</html>