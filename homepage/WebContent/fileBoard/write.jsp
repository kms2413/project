<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
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
	
	String pageNumber= request.getParameter("pageNumber");
	if(pageNumber == null){
		pageNumber="1";
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script type="text/javascript" language="javascript" src="script.js"></script>
</head>
<body>
   	<jsp:include page="/template/top.jsp"></jsp:include>
	<jsp:include page="/template/left.jsp"></jsp:include>
	<div align="center">
		<form class="border_doc" action="writeOk.jsp" method="post"
			onsubmit="return writeForm(this)" enctype = "multipart/form-data">
			<!-- application/x-www-form-urlencoded -->
			<input type="hidden" name="boardNumber" value="<%=boardNumber %>" />
			<input type="hidden" name="groupNumber" value="<%=groupNumber %>" />
			<input type="hidden" name="sequenceNumber"
				value="<%=sequenceNumber %>" /> <input type="hidden"
				name="sequenceLevel" value="<%=sequenceLevel %>" /> <input
				type="hidden" name="pageNumber" value="<%=pageNumber %>" />
			<div>�۾���</div>
			<div style="text-align: right; color: red;">
				<a href="list.jsp">�۸��</a>
			</div>
			<div class="border_div">
				<div class="border_box_left" style="border-top-width: 1px;">�ۼ���</div>
				<div class="border_box_right" style="border-top-width: 1px;">
					<input type="text" name="writer">
				</div>
			</div>

			<div class="border_div">
				<div class=border_box_left>����</div>
				<div class=border_box_right>
					<input type="text" name="subject" size="40" />
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">�̸���</div>
				<div class="border_box_right">
					<input type="text" name="email" size="40" />
				</div>
			</div>

			<div class="border_div" style="height: 300px;">
				<div class="border_box_left" style="height: 300px;">����</div>
				<div class="border_box_right" style="height: 300px;">
					<textarea name="content" cols="67" rows="19"></textarea>
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">��й�ȣ</div>
				<div class="border_box_right">
					<input type="password" name="password">
				</div>
			</div>

			<div class="border_div">
				<div class="border_box_left">���ϸ�</div>
				<div class="border_box_right">
					<input type="file" name="file"size = "40"/>
				</div>
			</div>

			<div class="border_box">
				<span><input type="submit" value="�۾���"></span> <span><input
					type="reset" value="�ٽ��ۼ�"></span> <span><input
					type="button" value="��Ϻ���" onclick="location.href='list.jsp'"/></span>
			</div>
		</form>
	</div>
	   	<jsp:include page="/template/bottom.jsp"></jsp:include>
</body>
</html>