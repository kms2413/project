<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "addr.AddrDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	out.print(name+phone+email);
	
%>
<jsp:useBean id = "addr" class = "addr.AddrDto">
	<jsp:setProperty property = "name" name = "addr" value = "<%=name %>"/>
	<jsp:setProperty property = "phone" name = "addr" value = "<%=phone %>"/>
	<jsp:setProperty property = "email" name = "addr" value = "<%=email %>"/>
</jsp:useBean>
<%
	int value = AddrDao.getInstance().insert(addr);
	out.print("value:" + value);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(value >0){%>
		<script type = "text/javascript">
			alert("Successful");
			location.href="write.html";
		</script>
	<% }else if(value==0){ %>
		<script type = "text/javascript">
			alert("Failed");
			location.href="write.html";
		</script>
	<%	} %>
	
</body>
</html>