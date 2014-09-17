<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "addr.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));	

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email=request.getParameter("email");
	out.print(num+","+name+phone+email);
%>

<jsp:useBean id = "addr" class = "addr.AddrDto">
	<jsp:setProperty property="num" name = "addr" value = "<%=num %>"/>
	<jsp:setProperty property="name" name = "addr" value = "<%=name %>"/>
	<jsp:setProperty property="phone" name = "addr" value = "<%=phone %>"/>
	<jsp:setProperty property="email" name = "addr" value = "<%=email %>"/>
</jsp:useBean>

<%
	int check =AddrDao.getInstance().update(addr);
	
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>
<body>

</body>
</html>