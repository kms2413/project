<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber= Integer.parseInt(request.getParameter("boardNumber"));
	String password= request.getParameter("password");
	String pageNumber = request.getParameter("pageNumber");
	//out.print(boardNumber + "," + password + "," + pageNumber);
	
	int check= BoardDao.getInstance().delete(boardNumber, password);
//	out.print("check:" + check);
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