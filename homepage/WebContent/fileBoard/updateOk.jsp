<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fileBoardModel.*" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.BufferedInputStream"%>
<%@ page import="java.io.BufferedOutputStream"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>

<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   DiskFileItemFactory factory=new DiskFileItemFactory();
   ServletFileUpload upload=new ServletFileUpload(factory);
   List<FileItem> list=upload.parseRequest(request);
   Iterator<FileItem> iter=list.iterator();
   
   BoardDto board=new BoardDto();
   String pageNumber=null;
   while(iter.hasNext()){
      FileItem item=iter.next();
      if(item.isFormField()){
         if(item.getFieldName().equals("pageNumber")){
            pageNumber=item.getString();
         }
         if(item.getFieldName().equals("boardNumber")){
            board.setBoardNumber(Integer.parseInt(item.getString()));
         }
         if(item.getFieldName().equals("writer")){
            board.setWriter(item.getString());
         }
         if(item.getFieldName().equals("subject")){
            board.setSubject(item.getString());
         }
         if(item.getFieldName().equals("email")){
            board.setEmail(item.getString("euc-kr"));
         }
         if(item.getFieldName().equals("content")){
            board.setContent(item.getString("euc-kr"));
         }
         if(item.getFieldName().equals("password")){
            board.setPassword(item.getString("euc-kr"));
         }         
      } else {
         if(item.getFieldName().equals("file")){
            String fileName=item.getName();
            long size=item.getSize();
            String dir="/Users/Min/Dropbox/JSP/workspace/homepage/WebContent/pds";
            
            File file=new File(dir, fileName);
            BufferedInputStream fis=null;
            BufferedOutputStream fos=null;
            
            try{
               fis=new BufferedInputStream(item.getInputStream());
               fos=new BufferedOutputStream(new FileOutputStream(file));
               
               byte[] by=new byte[(int)size];
               int count = fis.read(by);
               
               for(int i=0;i<count;i++){
                  fos.write(by[i]);
               }
               
               fos.flush();
            }catch(Exception e){
               e.printStackTrace();
               System.out.println("FileBoard update error");
            }finally{
               if(fis!=null) fis.close();
               if(fos!=null) fos.close();
            }
            board.setFileName(fileName);
            board.setPath(file.getAbsolutePath());
            board.setFileSize(size);
            
            BoardDto readBoard=BoardDao.getInstance().updateBoard(board.getBoardNumber());
            if(readBoard.getFileName()!=null){
               file=new File(readBoard.getPath());
               if(file.exists() && file.isFile()) file.delete();
            }
         }
      }
   }

   int check= BoardDao.getInstance().update(board);
   out.print("check:" + check);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%if(check>0){ %>
      <script type="text/javascript">
         alert("수정이 완료 됬다 임마.");
         location.href="list.jsp?pageNumber=<%=pageNumber%>";
      </script>
   <%}else{ %>
      <script type="text/javascript">
         alert("수정이 실패 됬다 임마.");
         location.href="update.jsp";
      </script>
   
   <%} %>

</body>
</html>