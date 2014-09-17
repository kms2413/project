<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String address = "서울 강남 에이비씨동";
		String phone = "010-123-1234";
	%>
	<!--Action Tag -->
	<jsp:include page ="08_includeC.jsp">
	<jsp:param name = "address"	 value = "<%=address %>"/>
	<jsp:param name = "phone"	 value = "<%=phone %>"/>
	</jsp:include>
	

</body>
</html>