<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "qna.Qna" %>
 <%@ page import = "qna.QnaDAO" %>
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
		QnaDAO bbsDAO = new QnaDAO();
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
		bbsDAO.hit(bbsID);
	}
	
	if(UserNick == null ){
%>
	  <script type="text/javascript">
	  alert("로그인을 하세요.");
	  location.href="index.jsp";

	  </script>
	
	<%
	}else{
	Qna user = new QnaDAO().getBbs(bbsID);
	if(!(UserNick.equals(user.getUserID()) || (UserNick.equals("admin")))){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	}
	
	Qna user = new QnaDAO().getBbs(bbsID);
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
							<td colspan ="2"><%= user.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td> 작성자 </td>
							<td colspan ="2"><%= user.getUserID() %></td>
						</tr>
							<tr>
							<td> 작성일자 </td>
							<td colspan ="2"><%= user.getBbsDate().substring(0,11) + user.getBbsDate().substring(11,13) + "시" + user.getBbsDate().substring(14, 16) + "분" %></td>
						</tr>
						<tr>
							<td> 조회수 </td>
							<td colspan ="2"><%= user.getBbsHit() +"회"%></td>
						</tr>
							<tr> 
							<td> 사진 </td>
							<td colspan ="2">
							</td>
						</tr>
							<tr> 
							<td> 내용 </td>
							<td colspan ="2" style="min-height: 200px; text-align:left;"><%= user.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n","<br>") %></td>
						</tr>
			</tbody>
		</table>
	<input type="button"class="btn btn-primary  bg-info float-left"  style="margin:5px;" value="목록" onClick="location.href='qnabbs.jsp'">
			<input type="button"  class="btn btn-primary bg-info float-right"  style="margin:5px;" value="수정" onClick = "location.href='update_qna.jsp?bbsID=<%=bbsID %>'">
			<input type="button"  class="btn btn-primary bg-info float-right"  style="margin:5px;" value="삭제" onClick = "location.href='qnadeleteAction.jsp?bbsID=<%=bbsID %>'">
	</div>	
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>