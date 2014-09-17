<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "memberModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = request.getParameter("id");
	
	int check = MemberDao.getInstance().idCheck(id);

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
	<%if(check >0){ %>
		<div align = "center">
			Already Exist!!
			<form action = "idCheck.jsp" method = "post">
				<input type = "text" name = "id"/>
				<input type = "submit" value = "확인"/>
			</form>
		</div>
	<%}else { %>
		<div align = "center">
			Available.
		</div>
	<%} %>
	
	<script type="text/javascript">
		opener.memberForm.id.value = "<%=id%>";
	</script>
	
	<div align = "center">
		<a href = "javascript:self.close()">닫기</a>
	</div>
</body>
</html>