<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "gradeModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	//out.print(request.getParameter("name"));
%>

<jsp:useBean id = "sung" class = "gradeModel.GradeDto">
	<jsp:setProperty name = "sung" property="*"/>
</jsp:useBean>

<%
	int check = GradeDao.getInstance().insert(sung);
	out.print(check);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript"> 
		alert("Succeed");
		location.href="index.html";
		</script>
	<%}else { %>
		<script type="text/javascript"> 
		alert("Failed");
		location.href="index.html";
		</script>
	<%} %>
</body>
</html>