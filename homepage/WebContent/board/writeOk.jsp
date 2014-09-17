<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import = "boardModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	
	int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
	int groupNumber=Integer.parseInt(request.getParameter("groupNumber"));
	int sequenceNumber=Integer.parseInt(request.getParameter("sequenceNumber"));
	int sequenceLevel=Integer.parseInt(request.getParameter("sequenceLevel"));

	out.print(boardNumber + groupNumber + sequenceNumber + sequenceLevel);
	
%>

<jsp:useBean id = "board" class = "boardModel.BoardDto"/>
<jsp:setProperty property = "*" name = "board"/>

<%
	board.setIp(request.getRemoteAddr());
	int check = BoardDao.getInstance().insert(board);
	out.print("check:" + check);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript">
			alert("Done");
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("Failed");
			location.href="list.jsp";
		</script>
	<% }%>
</body>
</html>