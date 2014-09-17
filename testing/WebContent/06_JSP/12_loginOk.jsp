<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	String password = request.getParameter("password");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String dbId ="abc123";
		String dbPass="abc123";
		
		if(dbId.equals(id)&& dbPass.equals(password)){
			session.setAttribute("id", id);
			session.setAttribute("password", password);
			session.setAttribute("name", "Hong");
			response.sendRedirect("12_main.jsp");
			
		}else{
			response.sendRedirect("12_login.html");
			
		}
	%>

</body>
</html>