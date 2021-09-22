<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "bbs.Bbs" %>
 <%@ page import = "bbs.BbsDAO" %>
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
if(UserNick == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요.')");
	script.println("location.href = 'index.jsp'");
	script.println("</script>");
}
int bbsID = 0;
if(request.getParameter("bbsID") != null){
	bbsID =  Integer.parseInt(request.getParameter("bbsID"));
}
if(bbsID == 0){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('유효하지 않을 글 입니다.')");
	script.println("location.href = 'normalbbs.jsp'");
	script.println("</script>");
}

Bbs bbs = new BbsDAO().getBbs(bbsID);
if(!UserNick.equals(bbs.getUserID()) && !UserNick.equals("admin")){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('권한이 없습니다.')");
	script.println("location.href = 'normalbbs.jsp'");
	script.println("</script>");
	
}
%>

<br>

<div class="container" style="position:absolute;left:30%;">
	<div class="row">
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td><input type="text" id="article_title" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value ="<%= bbs.getBbsTitle()%>"></td>
						</tr>
						<tr>
							<td><textarea  class="form-control" placeholder="글 내용" name="bbsContent" maxlength="200" style="width:800px; height: 350px; "><%= bbs.getBbsContent()%></textarea></td>
						</tr>
			</tbody>

					<tr>		
      <td>파일첨부&nbsp&nbsp&nbsp<input id="InputSubject" type="file"  data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" tabindex="-1" style="float:center">
        </tr>
		
		</table>
		<input type="submit" class="btn btn-primary  bg-info float-right" value="글 수정"  style="margin:5px;">
	

	 <script type="text/javascript">
	 function button2_event(){
			if (confirm("작성을 취소하고 목록으로 이동하겠습니까?")){
			 location.href = "normalbbs.jsp";
			}
			else{
				return;
			}
		 }
     </script>
    
		<input type="button" class="btn btn-primary  bg-info float-left" value="목록" style="margin:5px;" onclick="return button2_event();">
		</form>
	</div>
</div>


  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>


</html>