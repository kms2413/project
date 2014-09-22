<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import ="memberModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String) session.getAttribute("id");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
	<jsp:include page="/template/top.jsp"></jsp:include>
	<jsp:include page="/template/left.jsp"></jsp:include>
	<form action = "exitOk.jsp" method = "post">
		<table border = "1" align = "center" cellpadding ="2" cellspacing ="0">
			<tr>
				<td>회원ID</td>
				<td><input type = "text" name = "id" value = "<%=id%>"/>  </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type ="password" name = "password"></td>
			</tr>

			<tr>
				<td colspan ="2" align = "center">
					<input type="submit" value = "확인"/>
					<input type="reset" value = "취소"/>
				</td>
			</tr>

		</table>
	</form>
<jsp:include page="/template/bottom.jsp"></jsp:include>
</body>
</html>