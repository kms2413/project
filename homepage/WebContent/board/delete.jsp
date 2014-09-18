<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber= Integer.parseInt(request.getParameter("boardNumber"));
	String pageNumber = request.getParameter("pageNumber");
	//out.print(boardNumber + "," + pageNumber);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 삭제</title>
</head>
<body>
	<form method = "post" action = "deleteOk.jsp">
		<table border = "1" width = "510" cellpadding = "2" cellspacing = "0" align = "center">
		
			<tr>
				<td align = "center" bgcolor = "D1DBDB">비번을 입력하세여</td>
			</tr>
			
			<tr>
				<td align = "center">비번을 입력하세여</td>
			</tr>
		
		
		</table>
	
	</form>
</body>
</html>