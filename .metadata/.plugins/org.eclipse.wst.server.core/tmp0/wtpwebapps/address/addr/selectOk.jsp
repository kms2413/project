<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "addr.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	//out.print(name + "<br/>");
	
	AddrDto dto = AddrDao.getInstance().select(name);
	out.print(dto);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel = "stylesheet" type = "text/css" href="addr.css"/>
</head>
<body>
	<a href= "index.html">Menu</a>
	<br/><br/>
	
	<% if(dto==null){ %>
		<table border = "0" align = "center" cellpadding ="0" cellspacing="0" width="300">
			<tr>
				<td height = "30">Data does not exist</td>
			</tr>
		</table>
	<%}else { %>
		<table border = "0" align = "center" cellpadding ="0" cellspacing="0" width="300">
			<tr>
				<td height = "30">Name</td>
				<td height = "30">
					<input type = "text" name = "name" value = "<%=dto.getName() %>" disabled = "disabled"/>
				</td>
			</tr>
			
			
			<tr>
				<td height = "30">Phone</td>
				<td height = "30">
					<input type = "text" name = "phone" value = "<%=dto.getPhone() %>" disabled = "disabled"/>
				</td>
			</tr>
			
			
			<tr>
				<td height = "30">Email</td>
				<td height = "30">
					<input type = "text" name = "email" value = "<%=dto.getEmail() %>" disabled = "disabled"/>
				</td>
			</tr>
		</table>
	<%} %>
	
	
</body>
</html>