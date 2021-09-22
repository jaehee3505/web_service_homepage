<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="file.FileDAO" %>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
   <%@ page import="com.oreilly.servlet.MultipartRequest"%>
    <% request.setCharacterEncoding("UTF-8"); %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
FileDAO fileDAO = new FileDAO();

 		String directory = application.getRealPath("/upload/");
		int maxSize =  1024 *  1024 *  100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		new FileDAO().upload(fileName, fileRealName);

%>
</body>
</html>