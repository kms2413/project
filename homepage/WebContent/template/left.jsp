<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
	String root = request.getContextPath();
	String str1 = "<a href='"+root+"/member/logout.jsp'>�α���</a>";
	String str2 = "<a href='"+root+"/member/register.jsp'>|ȸ������</a>";
	String str3 = "|���̵�ã��";
	
	String id = (String) session.getAttribute("id");
	String memberLevel = "";
	
	if(id != null){
		str1 = "<a href='"+root+"/member/logout.jsp'>�α׾ƿ�</a>";
		str1 = "<a href=>'"+root+"/member/register.jsp'|ȸ������</a>";
		str1 = "<a href='"+root+"/member/delete.jsp'>|ȸ��Ż��</a>";
		memberLevel=(String)session.getAttribute("memberLevel");
	}
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<tr valing="top">
   <td width="180" height="359" bgcolor="D1DBDB">
      <table width="200" height="500" cellpadding="0" cellspacing="0">
         <tr>
            <td height="30">
               <%=str1 %>
            </td>
         </tr>
         <tr>
            <td height="30">
               <a href="">HOME</a>   
            </td>
         </tr>
         <tr>
            <td height="50"><p>�� ȸ�� <br />
               &nbsp;&nbsp; <%=str2 %>
               &nbsp;&nbsp;	<%=str3 %>
            </td>
         </tr>
         <tr>
            <td height="50"><p> ��  ���� <br />
               &nbsp;&nbsp;<a href="<%=root%>/guest/write.jsp">|����</a>
            </p></td>
         </tr>
         
         <tr>
            <td height="50"><p> ��  �Խ���<br />
               &nbsp;&nbsp;<a href="<%=root%>/board/list.jsp">|�ϹݰԽ���</a><br />
               &nbsp;&nbsp;<a href="<%=root%>/fileBoard/list.jsp">|�ڷ�Խ���</a><br />
            </p></td>
         </tr>
         
         <tr>
            <td height="50">
            	<%if(memberLevel.equals("AA")){ %>
                  <a href="<%=root %>/member/manager.jsp">������</a>
            	<% }%>
            </td>
         </tr>
      </table></td>
      <td width="860">
         <table width="800" height="359" cellpadding="0" cellspacing="0">
         <tr>
            <td height="348">