<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	out.print(id + "<br/>" + password);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Practice</title>
</head>
<body>
	<%
		String checkId="abc123";
		String checkPass="abc123";
		
		if(checkId.equals(id) && checkPass.equals(password)){
			response.sendRedirect("06_main.html");
		}else{
			response.sendRedirect("06_script.html");
		}
	%>


</body>
</html>