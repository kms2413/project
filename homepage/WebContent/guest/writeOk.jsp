<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "guestModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id = "guest" class = "guestModel.GuestDto"/>
<jsp:setProperty property ="*" name = "guest"/>
<%
	int check = GuestDao.getInstance().insert(guest);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 작성</title>
<link rel= "stylesheet" type = "text/css" href = "style.css"/>
</head>
<body>
	<%if(check>0){ %>
		<script type="text/javascript">
			alert("방명록 작성 성공");
			location.href="write.jsp";
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("방명록이 작성 실풰 ");
			location.href="write.jsp";
		</script>
	<%} %>
</body>
</html>