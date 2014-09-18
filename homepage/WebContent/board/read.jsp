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
//	out.print(board);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border = "1" width = "510" cellpadding = "2" cellspacing = "0" align = "center">
		<tr>
			<td height = "20" width = "125 "align = "center">글번호</td>
			<td height = "20" width = "125 "align = "center"><%=board.getBoardNumber() %></td>
			
			<td height = "20" width = "125 "align = "center">조회수</td>
			<td height = "20" width = "125 "align = "center"><%=board.getReadCount() %></td>
		</tr>
	
		<tr>
			<td height = "20" width = "125 "align = "center">작성자</td>
			<td height = "20" width = "125 "align = "center"><%=board.getWriter() %></td>
			
			<td height = "20" width = "125 "align = "center">작성일</td>
			<td height = "20" width = "125 "align = "center"><%=sdf.format(board.getWriteDate()) %></td>
		</tr>
		
		<tr>
			<td height = "300" width = "125 "align = "center">글내용</td>
			<td height = "300" colspan = "3" valign ="top"><%=board.getContent() %></td>
		</tr>
		
		<tr>
			<td height = "30" align = "center" colspan = "4">
				<input type = "button" value = "글수정" onclick=""/>
				<input type = "button" value = "글삭제" onclick=""/>
				<input type = "button" value = "답글" onclick=""/>
				<input type = "button" value = "목록" onclick="location.href = 'list.jsp?pageNumber=<%=pageNumber%>'"/>
			</td>
		</tr>
	</table>
</body>
</html>