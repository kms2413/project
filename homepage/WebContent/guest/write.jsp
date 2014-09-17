<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import = "guestModel.*" %>
    <%@page import = "java.util.ArrayList" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardSize = 3;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%
	//총 게시물 수
	//페이지당 게시물
	//페이지당 시작번호, 끝번호
	
	String pageNumber=request.getParameter("pageNumber");
	if(pageNumber==null) pageNumber="1";
	int currentPage = Integer.parseInt(pageNumber); // [1]: 1~10
	
	int startRow = (currentPage-1)*boardSize+1;
	int endRow = (currentPage*boardSize);
	
	int count = GuestDao.getInstance().getCount();

	ArrayList<GuestDto> guestList = null;
	if(count>0){
	 	guestList= GuestDao.getInstance().getGuestList(startRow, endRow);
	}
%>

<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>방명록</title>
      <link rel="stylesheet" type="text/css" href="style.css">
      <script type="text/javascript" src="script.js"></script>
   </head>
   <body>
      <div align="center">
      	<%if(currentPage ==1||count==0){ %>
         <form class=box name="writeForm" action="writeOk.jsp" method="post" onsubmit="return writeCheck(this)">
               <div class=div_top>
                  <font>이름</font>
                  <font><input type="text" name="name"/></font>
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
         <%} %>
         <%for(int i= 0; i<guestList.size();i++){ 
         	GuestDto list = guestList.get(i);
         %>
	          <div class="box" style = "border-width:1px;">
	               <div class="div_top" style = "text-align:right; border-width:1px">
	                  <%=list.getName() %>
	                  <%=sdf.format(list.getWriteDate()) %>&nbsp;&nbsp;&nbsp;&nbsp;
	                  
	                  <a href = "update.jsp?num=<%=list.getNum()%>">수정</a>
	                  <a href = "delete.jsp?num=<%=list.getNum() %>">삭제</a>
	               </div>
	               
	               <div class="div_mid" style = "border-width:1px">
						<%=list.getMessage() %>
	               </div>
	         </div>
         <%} %>
      </div>   
      <!-- 페이지 -->
      <%if(count>0){ 
	      	int pageBlock = 3;
	    
	      	int pageCount= count/boardSize+(count%boardSize==0?0:1);
	      	
	      	int startPage=(int)((currentPage-1)/pageBlock)*pageBlock+1;
	      	int endPage = startPage+pageBlock-1;
	      	
	      	if(endPage > pageCount)endPage = pageCount;
			
	      	if(startPage>pageBlock){%>
	      		<a href = "write.jsp?pageNumber=<%=startPage-pageBlock%>">[이전]</a>
	      		
	      	<%} %>
	      	
	      	<%for(int i=startPage; i<= endPage;i++){%>
	      		<a href ="write.jsp?pageNumber=<%=i%>">[<%=i %>]</a>
	      	<%} %>
	      	
	      	<% if(endPage < pageCount){%>
	      		<a href="write.jsp?pageNumber=<%=startPage+pageBlock%>">[다음]</a>
	      	<%} %>
      	
      <%} %>
   </body>
</html>