<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "user.User" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.writebutton {
    float: right;
    margin: 0 10px 10px 0; 
}
</style>
</head>
<body>
<%! String link; %>
     <%@include file ="header.jsp" %>   
<%
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber =  Integer.parseInt(request.getParameter("pageNumber"));
		}
%>
<br><br><br><br>
<div class="container" style="line-height:40px;">
<div class="row" style="line-height:40px;">
<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color:#eeeeee; text-align: center;">아이디</th>
<th style="background-color:#eeeeee; text-align: center;">패스워드</th>
<th style="background-color:#eeeeee; text-align: center;">이름</th>
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
<%
		UserDAO userDAO = new UserDAO();
		ArrayList<User> list = userDAO.getList(pageNumber);
		for(int i = 0; i < list.size(); i++){
			%>
<tr>
<td><a href="update_admin.jsp?usernum=<%= list.get(i).getUsernum() %>"><%= list.get(i).getId() %></a></td>
<td><%= list.get(i).getPasswd() %></td>
<td><%= list.get(i).getName() %></td> 
<td><%= list.get(i).getPhone()%></td>
<td><%= list.get(i).getGender()%></td>
<td><%= list.get(i).getSns()%></td>
<td><%= list.get(i).getSms()%></td>
<td><%= list.get(i).getNickname()%></td>
<td><%= list.get(i).getRank()%></td>
<td><%= list.get(i).getAuthority()%></td>

</tr>	

<% 
}
%>			
</tbody>
</table>
</div>
<%
if(pageNumber != 1){
%>
 <a href="admin.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arrow-left">이전</a>
 <%
} if(userDAO.nextPage(pageNumber + 1)){
 %>
 <a href="admin.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arrow-left">다음</a>
 <%
}
 %>

</div>	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>