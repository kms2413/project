<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="gradeModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
//	out.print(num + name);
	
	int check = GradeDao.getInstance().delete(num,name);
//	out.print(check);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript">
			alert("삭제 되었습니다.");
			location.href="index.html";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("삭제 되지않습니다.");
			location.href="index.html";
		</script>

	<%} %>
</body>
</html>