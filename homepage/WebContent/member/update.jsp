<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="memberModel.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String id = (String) session.getAttribute("id");
	
	MemberDto dto = MemberDao.getInstance().update(id);
	
%>
<jsp:useBean id="member" class="memberModel.MemberDto">
	<jsp:setProperty property="*" name="member" />
</jsp:useBean>
<%

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/template/top.jsp"></jsp:include>
	<jsp:include page="/template/left.jsp"></jsp:include>
	<div align="center">
		<div>회원수정</div>
		<form class=border_doc name="memberForm" action="updateOk.jsp"
			method="post" onsubmit="return registerForm(this)">
			<div class=border_div>
				<div class=border_box_left>아이디</div>
				<div class=border_box_right>
					<span>*<input type="text" name="id" size="30"
						value="<%=dto.getId()%>" readonly /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>비밀번호</div>
				<div class=border_box_right>
					<span>*<input type="password" name="password"
						value="<%=dto.getPassword() %>" size="30" /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>비밀번호확인</div>
				<div class=border_box_right>
					<span>*<input type="password" name="passwordCheck"
						value="<%=dto.getPassword() %>" size="30" /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>이름</div>
				<div class=border_box_right>
					<span>*<input type="text" name="name"
						value="<%=dto.getName() %>" size="30" readonly /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>주민번호</div>
				<div class=border_box_right>
					<span>*<input type="text" name="jumin1"
						value="<%=dto.getJumin1() %>" size="20" readonly /></span> <span>-<input
						type="text" name="jumin2" value="<%=dto.getJumin2() %>" size="20"
						readonly /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>이메일</div>
				<div class=border_box_right>
					<span><input type="text" name="email"
						value="<%=dto.getEmail() %>" size="30" /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>우편번호</div>
				<div class=border_box_right>
					<span><input type="text" name="zipcode"
						value="<%=dto.getZipcode()%>" size="30" /></span> <span><input
						type="button" value="우편번호검색" onclick="zipcodeRead()"></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>주소</div>
				<div class=border_box_right>
					<span><input type="text" name="address"
						value="<%=dto.getAddress()%>" size="50" /></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>직업</div>
				<div class=border_box_right>
					<span> <select name="job" style="width: 60;">
							<option value="sp">전문직</option>
							<option value="engineer">엔지니어</option>
							<option value="constructor">건설업</option>
							<option value="student">학생</option>
					</select>
					</span>
					<script type="text/javascript">
                  	memberForm.job.value
                  </script>
					<span>&nbsp;&nbsp;&nbsp;<%=dto.getJob()%></span>
				</div>
			</div>

			<div class=border_div>
				<div class=border_box_left>메일수신</div>
				<div class=border_box_right>
					<span><input type="radio" name="mailing" value="yes" />yes</span> <span><input
						type="radio" name="mailing" value="no" />no</span> <span>&nbsp;&nbsp;&nbsp;<%=dto.getMailing() %></span>
					<script type="text/javascript">
                  	for(var i =0; i<memberForm.mailing.length; i++){
                  		if(memberForm.mailing[i].value=="<%=member.getMailing()%>"){
                  			memberForm.mailing[i].checked=true;
                  		}
                  	}
                  </script>
				</div>

				<div class=border_box_left>관심분야</div>
				<div class=border_box_right>
					<span><input type="checkbox" name="interestValue" value="경제" />경제</span>
					<span><input type="checkbox" name="interestValue" value="IT" />IT</span>
					<span><input type="checkbox" name="interestValue" value="음악" />음악</span>
					<span><input type="checkbox" name="interestValue" value="미술" />미술</span>
					<span>&nbsp;&nbsp;&nbsp;<%=dto.getInterest() %></span> <span><input
						type="hidden" name="interest" /></span>
					<%
                  	StringTokenizer str = new StringTokenizer(dto.getInterest(), ",");
                  	while(str.hasMoreTokens()){
                  		String strinterest=str.nextToken();
                  	
                  %>
					<script type="text/javascript">
	                  	for(var i=0; i<memberForm.interestValue.length;i++){
	                  		if(memberForm.interestValue[i].value=="<%=strinterest%>"){
	                  			memberForm.interestValue[i].checked=true
	                  		}
	                  	}
                  </script>
					<%}%>

				</div>
			</div>
			<div class="border_div">
				<span><input type="submit" value="가입"></span> <span><input
					type="reset" value="취소"></span>
			</div>
		</form>
	</div>
	<jsp:include page="/template/bottom.jsp"></jsp:include>
</body>
</html>