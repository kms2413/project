<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "boardModel.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
	String pageNumber = request.getParameter("pageNumber");
	//out.print(boardNumber + "," + pageNumber);
	
	BoardDto board = BoardDao.getInstance().updateBoard(boardNumber);
	out.print(board);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
<div align="center">
		<form class="border_doc" action="updateOk.jsp" method="post"
			onsubmit="return writeForm(this)">
			<input type = "hidden" name = "boardNumber" value = "<%=boardNumber %>"/>
			<input type = "hidden" name = "pageNumber" value = "<%=pageNumber %>"/>
	
			<div class="border_div">
				<div class="border_box_left" style="border-top-width: 1px;">작성자</div>
				<div class="border_box_right" style="border-top-width: 1px;">
					<input type="text" name="writer" value = "<%=board.getWriter()%>" disabled="disabled" />
				</div>
			</div>

			<div class="border_div">
				<div class=border_box_left>제목</div>
				<div class=border_box_right>
					<input type="text" name="subject" size="40"value = "<%=board.getSubject()%>" />
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">이메일</div>
				<div class="border_box_right">
					<input type="text" name="email" size="40"value = "<%=board.getEmail()%>" />
				</div>
			</div>

			<div class="border_div" style="height: 300px;">
				<div class="border_box_left" style="height: 300px;">내용</div>
				<div class="border_box_right" style="height: 300px;">
					<textarea name="content" cols="67" rows="19"><%=board.getContent()%></textarea>
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">비밀번호</div>
				<div class="border_box_right">
					<input type="password" name="password"value = "<%=board.getPassword()%>" disabled = "disabled"/>
				</div>
			</div>

			<div class="border_box">
				<span><input type="submit" value="수정완료"></span> <span><input
					type="reset" value="다시작성"></span> 
					<span><input type="button" value="목록보기" onclick = "location.href='list.jsp?pageNumber=<%=pageNumber%>'"/></span>
			</div>
		</form>
	</div>
</body>
</html>
