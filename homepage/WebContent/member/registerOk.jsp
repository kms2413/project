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
      <title>ȸ�� ����</title>
   </head>
   <body>
   	<%if(check==0){ %>
   		<script type="text/javascript">
   			alert("ȸ�����Կ� �����ϼ̽��ϴ�.");
   			location.href="register.jsp";
   		</script>
   	<%}else { %>
   		<script type="text/javascript">
   			alert("ȸ�������� ���ϵ帳�ϴ�./n ȸ������ �α��� �ϼ���.");
   			location.href="login.jsp";
   		</script>
   	
   	<%} %>
   	
   </body>
</html>