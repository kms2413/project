<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String gender=request.getParameter("gender");
	String [] pet = request.getParameterValues("pet");
	out.print(name + "," + address + "," + gender + "," + pet.length);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP연습입니다.</title>
</head>
<body>
	<div>
		name: <%=name %> <br/><br/>
		address : <%=address %><br/><br/>
	</div>
	
	<%
		if(gender.equals("man"))
			out.print("Male" + "<br/>");
		else out.print("Female" + "<br/>");
	%>
	<br/><br/>
	
	<%
		if(pet!=null){
			for(int i =0; i<pet.length;i++){
				out.print(pet[i]+"&nbsp&nbsp");
			}
		}
	%>
</body>
</html>