<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "user.User" %>
 <%@ page import = "user.UserDAO" %>
 <%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>

   <%@include file ="header.jsp" %>   

<%
int userNum = 0;
if(request.getParameter("usernum") != null){
	userNum =  Integer.parseInt(request.getParameter("usernum"));
}

User user = new UserDAO().getUser(userNum);
%>
<br><br><br>

<div class="container" style="line-height:40px;">
	<div class="row" style="line-height:50px;">
				<form method="post">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color:#eeeeee; text-align: center;">아이디</th>
<th style="background-color:#eeeeee; text-align: center;">패스워드</th>
<th style="background-color:#eeeeee; text-align: center;">이름</th>
<th style="background-color:#eeeeee; text-align: center;">이메일</th>
<th style="background-color:#eeeeee; text-align: center;">전화번호</th>
<th style="background-color:#eeeeee; text-align: center;">성별</th>
<th style="background-color:#eeeeee; text-align: center;">SNS</th>
<th style="background-color:#eeeeee; text-align: center;">SMS</th>
<th style="background-color:#eeeeee; text-align: center;">닉네임</th>
<th style="background-color:#eeeeee; text-align: center;">랭킹</th>
<th style="background-color:#eeeeee; text-align: center;">권한</th>

<th style="background-color:#eeeeee; text-align: center;"></th>
</tr>
</thead>
<tbody>

<tr>
<td><input type="text" id="article_title" class="form-control" placeholder="아이디" name="userId" value ="<%= user.getId()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="비밀번호" name="userPasswd" value ="<%= user.getPasswd()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="이름" name="userName" value ="<%= user.getName()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="이메일" name="userEmail" value ="<%= user.getEmail()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="전화번호" name="userPhone" value ="<%= user.getPhone()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="성별" name="userGender" value ="<%= user.getGender()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="SNS" name="userSns" value ="<%= user.getSns()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="SMS" name="userSms" value ="<%= user.getSms()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="닉네임" name="userNickname" value ="<%= user.getNickname()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="랭크" name="userRank" value ="<%= user.getRank()%>"></td>
<td><input type="text" id="article_title" class="form-control" placeholder="권한" name="userAuthority" value ="<%= user.getAuthority()%>"></td>
</tr>	
		</table>
		
		
				<input type="submit" class="btn btn-primary  bg-info float-right" value="수정"  style="margin:5px;"  onclick="javascript: form.action='updateAdminAction.jsp?usernum=<%= userNum %>';">
					<input type="submit" class="btn btn-primary  bg-info float-right" value="삭제"  style="margin:5px;"  onclick="javascript:form.action='deleteAdminAction.jsp?usernum=<%= userNum %>';">


		<input type="button" class="btn btn-primary  bg-info float-left" value="목록" style="margin:5px;" onclick="location.href='admin.jsp'">
		</form>
	</div>
</div>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>


</html>