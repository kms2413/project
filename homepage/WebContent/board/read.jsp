<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
	String pageNumber = request.getParameter("pageNumber");
//	out.print("boardN:" + boardNumber + ","+ "pageNumber:" + pageNumber);

	BoardDto board = BoardDao.getInstance().read(boardNumber);
	out.print(board);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>