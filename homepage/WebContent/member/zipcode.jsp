<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="memberModel.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   request.setCharacterEncoding("euc-kr");
   String checkDong=request.getParameter("dong");
   //out.print("checkDong:" + checkDong);
   
   ArrayList<ZipcodeDto> zipcodeList=null;
   if (checkDong != null) {
      zipcodeList = MemberDao.getInstance().zipcodeReader(checkDong);
      //out.print(zipcodeList.size());
   }   
   
%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>우편번호</title>
      <script type="text/javascript" src="script.js"></script>
      <link rel="stylesheet" type="text/css" href="style.css"/>
   </head>
   <body>
      <form action="zipcode.jsp" method="post">
         <table align="center">
            <tr>
               <td>
                  <input type="text" name="dong"/>
                  <input type="submit" value="검색"/>
            </tr>
         </table>
      </form>
      
      <%if(zipcodeList == null){ %>
         <table align="center">
            <tr><td>검색된 결과가 없습니다.</td></tr>
         </table>
      <%}else {%>
         <table align="center">
            <tr>
               <td>아래 우편번호를 클릭하세요.</td>
            </tr>
            <%for(int i=0;i<zipcodeList.size();i++){
               ZipcodeDto address = zipcodeList.get(i);
               String zipcode = address.getZipcode();
               String sido = address.getSido();
               String gugun = address.getGugun();
               String dong = address.getDong();
               String ri = "";
               if(address.getRi() != null) ri=address.getRi();
               String bunji = "";
               if(address.getBunji() != null) bunji=address.getBunji();
            
            %>
               <tr>
                  <td>
                     <a href="javascript:sendAddress('<%=zipcode%>','<%=sido %>','<%=gugun %>','<%=dong %>','<%=ri %>','<%=bunji %>')">
                          <%=zipcode%><%=sido %><%=gugun %><%=dong %><%=ri %><%=bunji %>
                       </a>
                   </td>
               </tr>                  
            <%} %>
         </table>
      <%} %>
   </body>
</html>