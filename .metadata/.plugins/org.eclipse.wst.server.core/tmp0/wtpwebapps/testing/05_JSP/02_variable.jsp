<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	int num1 = 10;
	int num2 = 20;

	public int add(int a, int b){
		return a+b;	
	}
	
	public int sub(int a, int b){
		return a-b;
	}
	

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>HaHAHa</div>
	<%
	int r = add(num1,num2);
	int e = sub(num1, num2);
	%>
	
	<div>
		<%--comment --%>
		Result: <%=num1 %> + <%=num2 %> = <%=r %>
		<br/>
		Result: <%=num1 %> - <%=num2 %> = <%=e %>
	
	</div>


</body>
</html>