<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
     <%@include file ="header.jsp" %>   
<br><br><br><br>


<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
파일: <input type="file" name="file"><br>
<input type="submit" value="업로드"><br>
</form>
					
<br>
<a href ="download.jsp">파일 다운로드 페이지</a>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>


</html>