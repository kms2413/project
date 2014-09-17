<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	int boardNumber = 0;
	int groupNumber = 1;
	int sequenceNumber = 0;
	int sequenceLevel=0;
	
	if(request.getParameter("boardNumber")!=null){
		boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
		groupNumber=Integer.parseInt(request.getParameter("groupNumber"));
		sequenceNumber=Integer.parseInt(request.getParameter("sequenceNumber"));
		sequenceLevel=Integer.parseInt(request.getParameter("sequenceLevel"));
	}
	
	out.print(boardNumber + groupNumber + sequenceNumber + sequenceLevel);
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" language="javascript" src="script.js"></script>
</head>
<body>
	<div align="center">
		<form class="border_doc" action="writeOk.jsp" method="post"
			onsubmit="return writeForm(this)">
			<input type = "hidden" name = "boardNumber" value = "<%=boardNumber %>"/>
			<input type = "hidden" name = "groupNumber" value = "<%=groupNumber %>"/>
			<input type = "hidden" name = "sequenceNumber" value = "<%=sequenceNumber %>"/>
			<input type = "hidden" name = "sequenceLevel" value = "<%=sequenceLevel %>"/>
			<div>글쓰기</div>
			<div style="text-align: right; color: red;">
				<a href="">글목록</a>
			</div>
			<div class="border_div">
				<div class="border_box_left" style="border-top-width: 1px;">작성자</div>
				<div class="border_box_right" style="border-top-width: 1px;">
					<input type="text" name="writer">
				</div>
			</div>

			<div class="border_div">
				<div class=border_box_left>제목</div>
				<div class=border_box_right>
					<input type="text" name="subject" size="40" />
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">이메일</div>
				<div class="border_box_right">
					<input type="text" name="email" size="40" />
				</div>
			</div>

			<div class="border_div" style="height: 300px;">
				<div class="border_box_left" style="height: 300px;">내용</div>
				<div class="border_box_right" style="height: 300px;">
					<textarea name="content" cols="67" rows="19"></textarea>
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">비밀번호</div>
				<div class="border_box_right">
					<input type="password" name="pw">
				</div>
			</div>

			<div class="border_box">
				<span><input type="submit" value="글쓰기"></span> <span><input
					type="reset" value="다시작성"></span> <span><input
					type="button" value="목록보기"></span>
			</div>
		</form>
	</div>
</body>
</html>