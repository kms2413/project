<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
    <%@ page import = "java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String)session.getAttribute("id");
	String memberLevel=(String)session.getAttribute("memberLevel");
%>

<%
	request.setCharacterEncoding("euc-kr");
	int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
	String pageNumber = request.getParameter("pageNumber");
//	out.print("boardN:" + boardNumber + ","+ "pageNumber:" + pageNumber);

	BoardDto board = BoardDao.getInstance().read(boardNumber);
//	out.print(board);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript">
	function replyFun(boardNumber, groupNumber, sequenceNumber, sequenceLevel, pageNumber){
		var url ="write.jsp?boardNumber="+boardNumber+"&groupNumber="+groupNumber
				+"&sequenceNumber="+sequenceNumber+"&sequenceLevel="+sequenceLevel+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function deleteFun(boardNumber, pageNumber){
		var url = "delete.jsp?boardNumber="+boardNumber+ "&pageNumber="+pageNumber;
		alert(url);
	}
</script>
</head>
<body>
<!-- 	<%if(memberLevel!=null){ %> -->
	<table border = "1" width = "510" cellpadding = "2" cellspacing = "0" align = "center">
		<tr>
			<td height = "20" width = "125 "align = "center">글번호</td>
			<td height = "20" width = "125 "align = "center"><%=board.getBoardNumber() %></td>
			
			<td height = "20" width = "125 "align = "center">조회수</td>
			<td height = "20" width = "125 "align = "center"><%=board.getReadCount() %></td>
		</tr>
	
		<tr>
			<td height = "20" width = "125 "align = "center">작성자</td>
			<td height = "20" width = "125 "align = "center"><%=board.getWriter() %></td>
			
			<td height = "20" width = "125 "align = "center">작성일</td>
			<td height = "20" width = "125 "align = "center"><%=sdf.format(board.getWriteDate()) %></td>
		</tr>
		
		<tr>
			<td height = "300" width = "125 "align = "center">글내용</td>
			<td height = "300" colspan = "3" valign ="top"><%=board.getContent() %></td>
		</tr>
		
		<tr>
			<td height = "30" align = "center" colspan = "4">
				<input type = "button" value = "글수정" onclick=""/>
				<input type = "button" value = "글삭제" onclick="deleteFun(<%=board.getBoardNumber()%>, <%=pageNumber%>)"/>
				<input type = "button" value = "댓글" onclick="replyFun('<%=board.getBoardNumber()%>','<%=board.getGroupNumber()%>','<%=board.getSequenceNumber()%>','<%=board.getSequenceLevel()%>','<%=pageNumber%>')"/>
				<input type = "button" value = "목록" onclick="location.href = 'list.jsp?pageNumber=<%=pageNumber%>'"/>
			</td>
		</tr>
	</table>
<!-- 	<%}else { %>
		<script type="text/javascript">
			alert("회원가입 후 게시판 읽기 가능합니다.");
			location.href="../member/register.jsp";
		</script>
	<%} %> 
-->
</body>
</html>