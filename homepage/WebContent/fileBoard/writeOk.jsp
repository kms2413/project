<%@page import="fileBoardModel.BoardDto"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="fileBoardModel.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//객체넘어오면 
   //업로드할 클래스(보관할 클래스) --> List --> 파일, Text --> Dto

   DiskFileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   
   List<FileItem> list = upload.parseRequest(request);
   Iterator<FileItem> iter = list.iterator();

   BoardDto board = new BoardDto();
   String pageNumber = null;
   
   while (iter.hasNext()) {
      FileItem item = iter.next();
      if (item.isFormField()) {
          if (item.getFieldName().equals("pageNumber")) {
              pageNumber=item.getString();
           }
    	  
         if (item.getFieldName().equals("boardNumber")) {
            board.setBoardNumber(Integer.parseInt(item
                  .getString("euc-kr")));
         }

         if (item.getFieldName().equals("groupNumber")) {
            board.setGroupNumber(Integer.parseInt(item
                  .getString("euc-kr")));
         }

         if (item.getFieldName().equals("sequenceNumber")) {
            board.setSequenceNumber(Integer.parseInt(item
                  .getString("euc-kr")));
         }

         if (item.getFieldName().equals("sequenceLevel")) {
            board.setSequenceLevel(Integer.parseInt(item
                  .getString("euc-kr")));
         }

         if (item.getFieldName().equals("writer")) {
            board.setWriter(item.getString("euc-kr"));
         }

         if (item.getFieldName().equals("subject")) {
            board.setSubject(item.getString("euc-kr"));
         }

         if (item.getFieldName().equals("email")) {
            board.setEmail(item.getString("euc-kr"));
         }

         if (item.getFieldName().equals("content")) {
            board.setContent(item.getString("euc-kr"));
         }

         if (item.getFieldName().equals("password")) {
            board.setPassword(item.getString("euc-kr"));
         }

      } else {
         if (item.getFieldName().equals("file")) {
            //파일명, 사이즈
            String fileName = FilenameUtils.getName(item.getName());
            long size = item.getSize();
            String dir = "/Users/Min/Dropbox/JSP/workspace/homepage/WebContent/pds";

            if (fileName == null || fileName.equals(""))
               continue;
            
            File file = new File(dir, fileName);
            BufferedInputStream fis = null;
            BufferedOutputStream fos = null;
            
            try{
               fis = new BufferedInputStream(item.getInputStream());
               fos = new BufferedOutputStream(new FileOutputStream(file));
               
               byte[] by = new byte[(int)size];
               int count = fis.read(by);
               for(int i = 0; i < count; i++){
                  fos.write(by[i]);
               }
            }catch(Exception e){
               System.out.println("File Upload Error");
               e.printStackTrace();
            }finally{
               if(fis != null) fis.close();
               if(fos != null) fos.close();
            }
            
            board.setFileName(fileName);
            board.setPath(file.getAbsolutePath());
            board.setFileSize(size);
         }
      }
   }
   
   board.setIp(request.getRemoteAddr());
   int check = BoardDao.getInstance().insert(board);
   out.print(check);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<%
		if(check>0){
	%>
	<script type="text/javascript">
		alert("글쓰기가 완료되었습니다");
		location.href = "list.jsp?pageNumber=" +<%=pageNumber%>;
	</script>
	<%
		}else{
	%>
	<script type="text/javascript">
		alert("글쓰기가 정상 처리 되지 않았습니다.");
		location.href = "list.jsp?pageNumber=" +<%=pageNumber%>;
	</script>
	<%
		}
	%>


</body>
</html>