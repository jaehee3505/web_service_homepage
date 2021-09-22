<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
   //  Integer.parseInt(변경할Object객체.toString());
     int  UserAuth = 0;
     UserAuth = Integer.parseInt(session.getAttribute("UserAuth").toString());
     System.out.print(UserAuth);
     if(UserAuth <2 ){
  %>
  
  <script type="text/javascript">
alert("권한이 없습니다.");
location.href="regularbbs.jsp";

</script>

    	 
<%
}
     %>   
<br><br><br><br>
<div class="container" style="position:absolute;left:30%;">
	<div class="row">
		<form method="post" action="writeregularAction.jsp" enctype="multipart/form-data">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td><input type="text" id="article_title" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea  class="form-control" placeholder="글 내용" name="bbsContent" maxlength="200" style="width:800px; height: 350px; "></textarea></td>
						</tr>
			</tbody>

		<tr>		
      <td>파일첨부&nbsp&nbsp&nbsp<input type="file" name="file" data-class-button="btn btn-default" data-class-input="form-control" data-icon-name="fa fa-upload" tabindex="-1" style="float:center">
        </tr>
		
		</table>
		<input type="submit" class="btn btn-primary  bg-info float-right" value="글쓰기"  style="margin:5px;">
	
	 <script type="text/javascript">
		 function button1_event(){
       
                return confirm("작성하던 내용을 모두 지우시겠습니까?");
           
		 }	
        </script>

	 <script type="text/javascript">
	 function button2_event(){
			if (confirm("작성을 취소하고 목록으로 이동하겠습니까?")){
			 location.href = "regularbbs.jsp";
			}
			else{
				return;
			}
		 }
     </script>
		<input type="reset" id="reset_btn" class="btn btn-primary  bg-danger float-right" value="작성취소" style="margin:5px;" onclick="return button1_event();" >
		<input type="button" class="btn btn-primary  bg-info float-left" value="목록" style="margin:5px;" onclick="return button2_event();">
		</form>
	</div>
</div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>


</html>