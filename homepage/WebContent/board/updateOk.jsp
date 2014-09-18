<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String pageNumber = request.getParameter("pageNumber");
%>

<jsp:useBean id = "board" class = "boardModel.BoardDto"/>
<jsp:setProperty property = "*" name = "board"/>

<%
	int check= BoardDao.getInstance().update(board);
//	out.print(check);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript">
			alert("수정이 완료 됬다 임마.");
			location.href="list.jsp?pageNumber=<%=pageNumber%>";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("수정이 실패 됬다 임마.");
			location.href="update.jsp";
		</script>
	
	<%} %>

</body>
</html>