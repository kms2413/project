<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "memberModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//out.print(id + password);
	
	String memberLevel = MemberDao.getInstance().loginCheck(id, password);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(memberLevel !=null){
		session.setAttribute("id", id);
		session.setAttribute("memberLevel", memberLevel);
	%>
		<script type="text/javascript">
			alert("로그인 성공하셨습니다.");
			location.href="main.jsp";
		</script>
	<%} else { %>
		<script type="text/javascript">
			alert("로그인 실패.");
			location.href="login.jsp";
		</script>
	<%} %>
</body>
</html>