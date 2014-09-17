<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.util.Date" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardSize=10;

%>

<%
	String pageNumber = request.getParameter("pageNumber");
	if(pageNumber == null){
		pageNumber = "1";
	}
	int currentPage = Integer.parseInt(pageNumber);
	
	//start num and ending numb
	int startRow= (currentPage-1)*boardSize+1;
	int endRow=currentPage*boardSize;
	
	ArrayList<BoardDto> boradList = BoardDao.getInstance().getBoardList(startRow, endRow);
	out.print(boradList.size());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>