<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="fileBoardModel.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.io.BufferedInputStream" %>
<%@ page import="java.io.BufferedOutputStream" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   int boardNumber=Integer.parseInt(request.getParameter("boardNumber"));
   //out.print("boardNumber:" + boardNumber);
   BoardDto board=BoardDao.getInstance().updateBoard(boardNumber);
   //out.print(board);
   String fileName=new String(board.getFileName().getBytes("euc-kr"), "UTF-8");
   
   response.setHeader("Content-Disposition", "attachment;filename="+fileName);
   response.setHeader("Content-Transfer-Encoding", "binary");
   response.setContentType("application/octet-stream");
   response.setContentLength((int)board.getFileSize());
   
   BufferedInputStream fis=null;
   BufferedOutputStream fos=null;
   
   try {
      fis=new BufferedInputStream(new FileInputStream(board.getPath()));
      fos=new BufferedOutputStream(response.getOutputStream());
      
      byte[] by=new byte[(int)board.getFileSize()];
      int count=fis.read(by);
      
      for(int i=0;i<count;i++){
         fos.write(by[i]);
      }
      fos.flush();
   }catch(Exception e) {
      e.printStackTrace();
      System.out.println("FileBoard download error");
   }finally{
      if(fis!=null) fis.close();
      if(fos!=null) fos.close();      
   }
   
   out.clear();
   out=pageContext.pushBody();
%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
      <title>Insert title here</title>
   </head>
   <body>
   
   </body>
</html>