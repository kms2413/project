<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String) session.getAttribute("id");
	String memberLevel = (String) session.getAttribute("memberLevel");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
	<%if(id == null) {%>
		<a href = "main.jsp">홈</a>&nbsp;
		<a href = "register.jsp">회원가입</a>&nbsp;
		<a href = "login.jsp">로그인</a>&nbsp;
		
	<%} else if(id !=null){ %>
		<a href = "main.jsp">홈</a>&nbsp;
		<a href = "update.jsp">회원수정</a>&nbsp;
		<a href = "exit.jsp">회원탈퇴</a>&nbsp;
		<a href = "logout.jsp">로그아웃</a>&nbsp;
		<%if(memberLevel.equals("AA")){ %>
			<a href="manager.jsp">관리자모드</a>
		<%} %>
	<%}%>
	
	
	
	
</body>
</html>