<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.util.Date" %>
   <%@ page import = "java.util.Calendar"%>
   <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String today = sdf.format(d);
	%>
	<span><%= today %></span>
	<br/><br/>
	
	<% Calendar ca = Calendar.getInstance();%>
	
	<span>
		Calendar:
		<%=ca.get(Calendar.YEAR) %> 년
		<%=ca.get(Calendar.MONTH) %> 월
		<%=ca.get(Calendar.DATE) %> 일
	</span>
	
	
</body>
</html>