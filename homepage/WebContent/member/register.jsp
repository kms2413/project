<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>회원가입</title>
      <script type="text/javascript" src="script.js"></script>
      <link rel="stylesheet" type="text/css" href="style.css"/>
   </head>
   <body>
   	<jsp:include page="/template/top.jsp"></jsp:include>
	<jsp:include page="/template/left.jsp"></jsp:include>
      <div align="center">
         <div>회원가입(*필수입력사항입니다.)</div>
         <form class=border_doc name="memberForm" action="registerOk.jsp" method="post" onsubmit="return registerForm(this)">
            <div class=border_div>
               <div class=border_box_left>아이디</div>
               <div class=border_box_right>
                  <span>*<input type="text" name="id"  size="30"/></span>
                  <span><input type="button" value="아이디중복" onclick="idCheck(memberForm)"></span>
               </div>
            </div>   
            
            <div class=border_div>
               <div class=border_box_left>비밀번호</div>
               <div class=border_box_right>
                  <span>*<input type="password" name="password"  size="30"/></span>
               </div>
            </div>
            
            <div class=border_div>
               <div class=border_box_left>비밀번호확인</div>
               <div class=border_box_right>
                  <span>*<input type="password" name="passwordCheck"  size="30"/></span>
               </div>
            </div>
            
            <div class=border_div>   
               <div class=border_box_left>이름</div>
               <div class=border_box_right>
                  <span>*<input type="text" name="name"  size="30"/></span>
               </div>
            </div>
            
            <div class=border_div>
               <div class=border_box_left>주민번호</div>
               <div class=border_box_right>
                  <span>*<input type="text" name="jumin1"  size="20"/></span>
                  <span>-<input type="text" name="jumin2"  size="20"/></span>
               </div>
            </div>
            
            <div class=border_div>
               <div class=border_box_left>이메일</div>
               <div class=border_box_right>
                  <span><input type="text" name="email"  size="30"/></span>
               </div>
            </div>
            
            <div class=border_div>
               <div class=border_box_left>우편번호</div>
               <div class=border_box_right>
                  <span><input type="text" name="zipcode"  size="30"/></span>
                  <span><input type="button" value="우편번호검색" onclick = "zipcodeRead()"></span>
               </div>
            </div>
            
            <div class=border_div>
               <div class=border_box_left>주소</div>
               <div class=border_box_right>
                  <span><input type="text" name="address"  size="50"/></span>
               </div>
            </div>
            
            <div class=border_div>   
               <div class=border_box_left>직업</div>
               <div class=border_box_right>
                  <span>
                     <select name="job" style="width:60;">
                        <option value="sp">전문직</option>
                        <option value="engineer">엔지니어</option>
                        <option value="constructor">건설업</option>
                        <option value="student">학생</option>
                     </select>
                  </span>
               </div>               
            </div>
            
            <div class=border_div>
               <div class=border_box_left>메일수신</div>
               <div class=border_box_right>
                  <span><input type="radio" name="mailing" value="yes"/>yes</span>
                  <span><input type="radio" name="mailing"  value="no"/>no</span>
               </div>
               
               <div class=border_box_left>관심분야</div>
               <div class=border_box_right>
                  <span><input type="checkbox" name="interestValue" value="경제"/>경제</span>
                  <span><input type="checkbox" name="interestValue" value="IT"/>IT</span>
                  <span><input type="checkbox" name="interestValue" value="음악"/>음악</span>
                  <span><input type="checkbox" name="interestValue" value="미술"/>미술</span>
                  <span><input type="hidden" name="interest"/></span>
               </div>
            </div>
            <div class="border_div">
               <span><input type="submit" value="가입"></span>
               <span><input type="reset" value="취소"></span>      
            </div>                        
         </form>
      </div>
	<jsp:include page="/template/bottom.jsp"></jsp:include>
   </body>
</html>