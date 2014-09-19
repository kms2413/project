<%@ page language="java" contentType="text/html; charset=UTF-8"
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
//객체넘어오면 --> 업로드할 클래스(보관할 클래스) --> List --> 파일, Text --> Dto
	DiskFileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List<FileItem> list = upload.parseRequest(request);
	Iterator<FileItem> iter = list.iterator();
%>

<jsp:useBean id="board" class="fileBoardModel.BoardDto" />
<jsp:setProperty property="*" name="board" />


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

</body>
</html>