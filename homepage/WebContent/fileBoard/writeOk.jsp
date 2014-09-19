<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
    
<%@ page import = "fileBoardModel.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileOutputStream" %>
<%@ page import = "java.io.BufferedInputStream" %>
<%@ page import = "java.io.BufferedOutputStream" %>

<%@ page import = "org.apache.commons.fileupload.FileItem" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import = "org.apache.commons.io.FilenameUtils" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
   //ê°ì²´ -> ì—…ë¡œë“œí•  í‚ëž˜ìŠ¤(ë³´ê´€í•œ í´ëž˜ìŠ¤) --> list --> file, text ->dto
   DiskFileItemFactory factory=new DiskFileItemFactory();
   ServletFileUpload upload=new ServletFileUpload(factory);
   
   List<FileItem> list = upload.parseRequest(request);
   Iterator<FileItem> iter=list.iterator();
   
   BoardDto board=new BoardDto();
   while(iter.hasNext()) {
      FileItem item = iter.next();
      if(item.isFormField()) {
         if(item.getFieldName().equals("boardNumber")){
            board.setBoardNumber(Integer.parseInt(item.getString()));
         }
         
         if(item.getFieldName().equals("groupNumber")){
            board.setGroupNumber(Integer.parseInt(item.getString()));            
         }
         
         if(item.getFieldName().equals("sequenceNumber")){
            board.setSequenceNumber(Integer.parseInt(item.getString()));            
         }
         
         if(item.getFieldName().equals("sequenceLevel")){
            board.setSequenceLevel(Integer.parseInt(item.getString()));            
         }
         
         if(item.getFieldName().equals("writer")){
            board.setWriter(item.getString());            
         }
         
         if(item.getFieldName().equals("subject")){
            board.setSubject(item.getString("euc-kr"));            
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
         
      }else {
         if(item.getFieldName().equals("file")){
            //filename, filesize
            String fileName=item.getName();
            long size=item.getSize();
            String dir="C:\\Users\\Lake\\git\\project\\homepage\\WebContent\\pds";
            
            if(fileName==null || fileName.equals("")) continue;
            
            File file= new File(dir,fileName);
            BufferedInputStream fis=null;
            BufferedOutputStream fos=null;
            
            try{
               fis=new BufferedInputStream(item.getInputStream());
               fos=new BufferedOutputStream(new FileOutputStream(file));
               
               byte[] by=new byte[(int)size];
               int count=fis.read(by);
               for(int i=0;i<count;i++){
                  fos.write(by[i]);
               }               
            }catch(Exception e){
               System.out.println("File upload Error");
               e.printStackTrace();
            }finally{
               if(fis!=null) fis.close();
               if(fos!=null) fos.close();
            }
            
            board.setFileName(fileName);
            board.setPath(file.getAbsolutePath());//path + filename
            board.setFileSize(size);
         }         
      }      
   }
   board.setIp(request.getRemoteAddr());
   int check = BoardDao.getInstance().insert(board);
   out.print("check:" + check);
%>
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>ê²Œì‹œê¸€ ìž‘ì„±</title>
   </head>
   <body>
      
   </body>
=======
   pageEncoding="UTF-8"%>

<%@ page import="fileBoardModel.*"%>
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.Iterator" %>
<%@ page import = "java.io.File" %>
<%@ page import = "java.io.FileOutputStream" %>
<%@ page import = "java.io.BufferedInputStream" %>
<%@ page import = "java.io.BufferedOutputStream" %>

<%@ page import = "org.apache.commons.fileupload.FileItem" %>
<%@ page import = "org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import = "org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import = "org.apache.commons.io.FilenameUtils"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//ê°ì²´ë„˜ì–´ì˜¤ë©´ --> ì—…ë¡œë“œí•  í´ëž˜ìŠ¤(ë³´ê´€í•  í´ëž˜ìŠ¤) --> List --> íŒŒì¼, Text --> Dto
   DiskFileItemFactory factory = new DiskFileItemFactory();
   ServletFileUpload upload = new ServletFileUpload(factory);
   List<FileItem> list = upload.parseRequest(request);
   Iterator<FileItem> iter = list.iterator();
%>

<jsp:useBean id="board" class="fileBoardModel.BoardDto" />
<jsp:setProperty property="*" name="board" />


=======
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
	//°´Ã¼³Ñ¾î¿À¸é 
	//¾÷·ÎµåÇÒ Å¬·¡½º(º¸°üÇÒ Å¬·¡½º) --> List --> ÆÄÀÏ, Text --> Dto

	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	
	List<FileItem> list = upload.parseRequest(request);
	Iterator<FileItem> iter = list.iterator();

	BoardDto board = new BoardDto();
	while (iter.hasNext()) {
		FileItem item = iter.next();
		if (item.isFormField()) {
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
				//ÆÄÀÏ¸í, »çÀÌÁî
				String fileName = FilenameUtils.getName(item.getName());
				long size = item.getSize();
				String dir = "C:\\JSP\\workspace\\homePageMy\\WebContent\\pds";

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
>>>>>>> 15c8369182c266e0b2f3bbc21fd2dd1fbdc60677
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- 

	<%if(check>0){ %>
		<script type="text/javascript">
			alert("±Û¾²±â°¡ ¿Ï·áµÇ¾ú½À´Ï´Ù");
			location.href="list.jsp?pageNumber=" + <%=pageNumber%>;
		</script>
	<%}else{ %>
		<script type="text/javascript">
			alert("±Û¾²±â°¡ Á¤»ó Ã³¸® µÇÁö ¾Ê¾Ò½À´Ï´Ù.");
			location.href="list.jsp?pageNumber=" + <%=pageNumber%>;
		</script>
	<%} %>

--%>
</body>
>>>>>>> branch 'master' of https://github.com/kms2413/project
</html>