<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "regular.Regular" %>
 <%@ page import = "regular.RegularDAO" %>
   <%@ page import = "regularcomment.RegularComment" %>
  <%@ page import = "regularcomment.RegularCommentDAO" %>
     <%@ page import="java.io.PrintWriter" %>
     <%@ page import = "java.util.ArrayList" %>
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
	 <%! String link; %>
	<%

	int bbsID = 0;
	if(request.getParameter("bbsID") != null ){
		RegularDAO bbsDAO = new RegularDAO();
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		bbsDAO.hit(bbsID);
	}
	if((UserNick ==  null) && (UserNick !="admin")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('접근할 수  없는 글입니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
		
	Regular bbs = new RegularDAO().getBbs(bbsID);
	%>

<br><br><br><br>

<div class="container" style="position:absolute;left:15%;">
	<div class="row">

			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:800;height:350;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td style ="width: 20%;"> 글 제목 </td>
							<td colspan ="2"><%= bbs.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td> 작성자 </td>
							<td colspan ="2"><%= bbs.getUserID() %></td>
						</tr>
							<tr>
							<td> 작성일자 </td>
							<td colspan ="2"><%= bbs.getBbsDate().substring(0,11) + bbs.getBbsDate().substring(11,13) + "시" + bbs.getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
						<tr>
							<td> 조회수 </td>
							<td colspan ="2"><%= bbs.getBbsHit() +"회"%></td>
						</tr>
							<tr> 
							<td> 사진 </td>
							<td colspan ="2">
							<%
							RegularDAO bbsDAO = new RegularDAO();
							 String baseurl = "C:/Users/zzzma/eclipse-workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Sapana/upload/";
							if(bbs.getBbsURL()!=null){
							   String saddummy =  bbs.getBbsURL();
							   link = baseurl+saddummy;
							%>	
							   <script>
							      var imglink = '<%= link %>';
							      document.write("<img src='")
							      document.write(imglink)
							      document.write("'weight=300 height=300>")
							   </script>
							   <%} %>
			
							</td>
						</tr>
							<tr> 
							<td> 내용 </td>
							<td colspan ="2" style="min-height: 200px; text-align:left;"><%= bbs.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
			</tbody>
		</table>
	<input type="button"class="btn btn-primary  bg-info float-left"  style="margin:5px;" value="목록" onClick="location.href='regularbbs.jsp'">
			<input type="button"  class="btn btn-primary bg-info float-right"  style="margin:5px;" value="수정" onClick = "location.href='update_regular.jsp?bbsID=<%=bbsID %>'">
			<input type="button"  class="btn btn-primary bg-info float-right"  style="margin:5px;" value="삭제" onClick = "location.href='regulardeleteAction.jsp?bbsID=<%=bbsID %>'">

	</div>
			<form method="post" action="regularcomment_writeAction.jsp?bbsID=<%=bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">댓글쓰기</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="댓글 내용" name="commentContent" maxlength="200" style="height: 100px; float: center; "></td>
						</tr>
			</tbody>
		</table>
		<input type="submit" class="btn btn-primary  bg-info float-right" value="댓글쓰기"  style="margin:5px;">
		</form>
		<form method="post">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
<thead>
<tr>
<th style="background-color:#eeeeee; text-align: center;">닉네임</th>
<th style="background-color:#eeeeee; text-align: center;">내용</th>
</tr>
</thead>
<tbody>
<%
		RegularCommentDAO commentDAO = new RegularCommentDAO();
		ArrayList<RegularComment> list = commentDAO.getList(bbsID);
		for(int i = 0; i < list.size(); i++){
			%>
		
<tr>
<td><%= list.get(i).getNickname() %></td>
<td><%= list.get(i).getCommentContent() %></td>
<script>
function search(type,type2){
  location.href="regularcomment_deleteAction.jsp?commentID="+type+"&bbsID="+type2;
}
</script>
<td><input type="submit" id="delete" class="btn btn-outline-primary" value="삭제"  style="float:right" onclick="search(<%=list.get(i).getCommentID()%>,<%=bbsID%>)"></td>
</tr>

<% 
}
%>			
</tbody>
</table>
	</form>
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>