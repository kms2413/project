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
	int num =Integer.parseInt(request.getParameter("num"));
	int check = GuestDao.getInstance().delete(guest.getNum());
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(check>0){%>
		<script type="text/javascript">
			alert("삭제되었습니다.");
			location.href="write.jsp";
		</script>
	
	<%}else { %>
		<script type="text/javascript">
			alert("삭제 실패.");
			location.href="write.jsp";
		</script>
	<%} %>
	
	
</body>
</html>