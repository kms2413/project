<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="gradeModel.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	GradeDto dto = GradeDao.getInstance().read(num);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href="sungjuk.css">
<script type="text/javascript">
	function delFun(num){
		var url="delete.jsp?num="+num;
		location.href=url;
	}
	function editFun(num){
		var url = "update.jsp?num="+num;
		location.href=url;
		
	}

</script>

</head>
<body>
	<%if(dto == null){ %>
		  <table border="0" align="center" cellpadding="0" cellspacing="0" 
               width="300"> 
               <tr>
               	<td>Does not exist</td>
               </tr>
          </table>
	<%}else{ %>
		<table border="0" align="center" cellpadding="0" cellspacing="0" 
               width="300">   
            <tr>
               <td height="30">이름</td>
               <td height="30">
                  <input type="text" name="name" value = "<%=dto.getName()%>"/>
               </td>
            </tr>
            
            <tr>
               <td height="30">국어</td>
               <td height="30">
                  <input type="text" name="kor" value = "<%=dto.getKor()%>"/>
               </td>
            </tr>
            
            <tr>
               <td height="30">영어</td>
               <td height="30">
                  <input type="text" name="eng" value = "<%=dto.getEng()%>"/>
               </td>
            </tr>
            
            <tr>
               <td height="30">수학</td>
               <td height="30">
                  <input type="text" name="math" value = "<%=dto.getMath()%>"/>
               </td>
            </tr>
            
            <tr>
               <td height="30">총점</td>
               <td height="30">
                  <input type="text" name="total" value = "<%=dto.getTotal()%>"/>
               </td>
            </tr>
            
            <tr>
               <td height="30">평균</td>
               <td height="30">
                  <input type="text" name="average" value = "<%=dto.getAverage()%>"/>
               </td>
            </tr>
            
            <tr>
            	<td colspan ="2" align = "center" height= "30">
            		<input type = "button" value = "Edit" onclick = "editFun(<%=dto.getNum()%>)"/>
            		<input type = "button" value = "Delete" onclick ="delFun(<%=dto.getNum()%>)"/>
            	</td>
            </tr>
            
         </table>
	<%} %>
</body>
</html>