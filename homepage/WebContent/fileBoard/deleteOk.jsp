<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "fileBoardModel.*" %>
    <%@ page import = "java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber= Integer.parseInt(request.getParameter("boardNumber"));
	String password= request.getParameter("password");
	String pageNumber = request.getParameter("pageNumber");
	//out.print(boardNumber + "," + password + "," + pageNumber);
	BoardDto board = BoardDao.getInstance().updateBoard(boardNumber);
	String path = board.getPath();
	
	int check= BoardDao.getInstance().delete(boardNumber, password);
//	out.print("check:" + check);

	if(check>0){
		if(board.getPath()!=null ){
			File file = new File(board.getPath());
			if(file.exists() && file.isFile())file.delete();
		}
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript">
			alert("Delted");
			location.href="list.jsp?pageNumber=<%=pageNumber%>";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("Failed");
			history.back();
		</script>
	<%} %>

</body>
</html>