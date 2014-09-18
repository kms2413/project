<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "java.util.Date" %>
    <%@ page import = "java.text.SimpleDateFormat" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardSize=10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

%>

<%
	String pageNumber = request.getParameter("pageNumber");
	if(pageNumber == null){
		pageNumber = "1";
	}
	int currentPage = Integer.parseInt(pageNumber);

	//start num and ending numb
	int startRow= (currentPage-1)*boardSize+1;
	int endRow=currentPage*boardSize;
	
	int count = BoardDao.getInstance().getCount();
	//out.print("count:"+count);
	
	ArrayList<BoardDto> boardList = null;
	if(count>0){
		boardList =BoardDao.getInstance().getBoardList(startRow, endRow);
	}
	//out.print(boradList.size());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function readFun(boardNumber, currentPage){
		var url = "read.jsp?boardNumber="+boardNumber+"&pageNumber="+currentPage;
		
		location.href=url;
	}
</script>

</head>
<body>
	<center>글목록</center>
	<table width = "530" align = "center">
		<tr>
			<td align = "right" bgcolor="D1DBDB">
				<a href = "write.jsp">글쓰기</a>
			</td>
		</tr>
	</table>
	
	<%if(count ==0){%>
		<table border = "1" width = "530" cellpadding ="2" cellspacing = "0" align = "center">
			<tr>
				<td align = "center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	<% }else{%>
		<table border = "1" width = "530" cellpadding ="2" cellspacing = "0" align = "center">
			<tr>
				<td align ="center" width = "50">번호</td>
				<td align ="center" width = "250">제목</td>
				<td align ="center" width = "70">작성자</td>
				<td align ="center" width = "110">작성일</td>
				<td align ="center" width = "70">조회수</td>
				<td align ="center" width = "50">IP</td>
			</tr>
			
			<%for(int i = 0; i <boardList.size(); i++){ 
				BoardDto board = boardList.get(i);
			%>
				<tr>
					<td align ="center" width = "30"><%=board.getBoardNumber() %></td>
					<td align ="center" width = "250">
						<%if(board.getSequenceLevel()>0){
							for(int j =0; j<board.getSequenceLevel();j++){
								out.print("&nbsp;&nbsp");	
							}
							out.print("[답글]");
							
						}%>
							
						<a href ="javascript:readFun('<%=board.getBoardNumber()%>','<%=currentPage%>')"><%=board.getSubject() %></a></td>
					<td align ="center" width = "70"><%=board.getWriter() %></td>
					<td align ="center" width = "80"><%=sdf.format(board.getWriteDate())%></td>
					<td align ="center" width = "50"><%=board.getReadCount() %></td>
					<td align ="center" width = "50"><%=board.getIp() %></td>
				</tr>
			<% }%>
		</table>
	<%} %>
	<br/>
	<center>
		<%
		int pageBlock =10;
	 	if(count >0){
	 		//총페이지 = 레코드수/한페이지당 게시물 사이즈
			int pageCount = count/boardSize+(count%boardSize == 0?0:1);
	 		
	 		int startPage = (int)((currentPage-1)/pageBlock)*pageBlock+1;
	 		int endPage = startPage+pageBlock-1;
	 		
	 		if(endPage > pageCount) endPage = pageCount;
	 		
	 		if(startPage > pageBlock){ %>
	 			<a href = "list.jsp?pageNumber=<%=startPage-pageBlock%>">[이전]</a>
	 		<%} %>
	 		
	 		<%for(int i = startPage; i<=endPage; i++){%>
	 			<a href="list.jsp?pageNumber=<%=i%>">[<%=i %>]</a>
 			<%} %>
	 		
	 		<% if(endPage < pageCount){%>
	 			<a href = "list.jsp?pageNumber=<%=startPage+pageBlock%>">[다음]</a>
	 			
 			<%} %>
		<%} %>
		
	</center>
	
	
</body>
</html>
