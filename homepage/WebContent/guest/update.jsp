<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form class=box name="writeForm" action="updateOk.jsp" method="post" onsubmit="returnupdateCheck(this)">
	      <div class=div_top>
	         <font>이름</font>
	         <font><input type="text" name="name" readonly/></font>
	         <font>비밀번호</font>
	         <font><input type="password" name="password"></font>
	      </div>
	      <div class=div_mid>
	         <textarea name="message" cols="65" rows="10"></textarea>
	      </div>
	      <div class=div_top style="text-align:right;">
	         <font><input type="submit" value="확인"></font>
	         <font><input type="reset" value="취소"></font>            
	      </div>                  
	</form>
</body>
</html>