<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%!
	int num=20;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(num>50){ %>
		<span>
			<%=num %> Good job
		</span>
	<%}else if(num>40){ %>
		<span>
			<%=num %> Nice!
		</span>
	<% }else {%>
		<span>
			<%=num %> The heck?
		</span>
	<% }%>
	<br/><br/>
	
	<%
	//내장객체: 자주사용하는 클래스를 객체 만들어서 제공
	out.print("Hello");
	if(num>50){
		out.print(num +":<span>Good Job.</span>");
	}else if(num >40){
		out.print(num +":<span>The Heck?.</span>");
		
	}
	
	%>
	
	
</body>
</html>