<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="memberModel.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="member" class="memberModel.MemberDto">
   <jsp:setProperty property="*" name="member"/>
</jsp:useBean>
<%
   int check = MemberDao.getInstance().insert(member);
   out.print("check:"+ check);
%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>회원 가입</title>
   </head>
   <body>
   	<%if(check==0){ %>
   		<script type="text/javascript">
   			alert("회원가입에 실패하셨습니다.");
   			location.href="register.jsp";
   		</script>
   	<%}else { %>
   		<script type="text/javascript">
   			alert("회원가입을 축하드립니다./n 회원으로 로그인 하세요.");
   			location.href="login.jsp";
   		</script>
   	
   	<%} %>
   	
   </body>
</html>