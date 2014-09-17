<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "gradeModel.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");

%>
<jsp:useBean id ="sung" class = "gradeModel.GradeDto">
	<jsp:setProperty property = "*" name = "sung"/>
</jsp:useBean>
<%
	int check=GradeDao.getInstance().update(sung);
	out.print(check);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>