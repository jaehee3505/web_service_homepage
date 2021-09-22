<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "qna.QnaDAO" %>
<%@ page import = "qna.Qna" %>
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
<th style="background-color:#eeeeee; text-align: center;">번호</th>
<th style="background-color:#eeeeee; text-align: center;">제목</th>
<th style="background-color:#eeeeee; text-align: center;">작성자</th>
<th style="background-color:#eeeeee; text-align: center;">작성일</th>
<th style="background-color:#eeeeee; text-align: center;">조회수</th>
</tr>
</thead>
<tbody>
<%
		QnaDAO bbsDAO = new QnaDAO();
		ArrayList<Qna> list = bbsDAO.getList(pageNumber);
		for(int i = 0; i < list.size(); i++){
			%>
<tr>
<td><%= list.get(i).getBbsID() %></td>
<td><a href="view_qna.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
<td><%= list.get(i).getUserID() %></td>
<td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td> 
<td><%= list.get(i).getBbsHit() +"회"%></td>
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
 <a href="qnabbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arrow-left">이전</a>
 <%
} if(bbsDAO.nextPage(pageNumber + 1)){
 %>
 <a href="qnabbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arrow-left">다음</a>
 <%
}
 %>
<a href="write_qna.jsp" id="writebutton" class="btn btn-primary  bg-info" style="float:right;">글쓰기</a>
</div>	
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>