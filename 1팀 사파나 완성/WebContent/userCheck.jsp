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
	if(UserNick ==  null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
	}
	User user = new UserDAO().getUser(UserNick);
	%>

<br><br><br><br>

<div class="container" style="position:absolute;left:15%;">
	<div class="row">

			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:800;height:350;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">회원정보</th>
						</tr>
				</thead>
				<tbody>
						<tr>
							<td style ="width: 20%;"> 아이디 </td>
							<td colspan ="2"><%= user.getId() %></td>
						</tr>
						<tr>
							<tr>
							<td style ="width: 20%;"> 이름 </td>
							<td colspan ="2"><%= user.getName() %></td>
						</tr>
						<tr>
							<td> 닉네임 </td>
							<td colspan ="2"><%= user.getNickname() %></td>
						</tr>
						<tr>
							<td> 성별 </td>
							<td colspan ="2"><%= user.getGender() %></td>
						</tr>
							<tr>
							<td> 전화번호 </td>
							<td colspan ="2"><%= user.getPhone() %></td>
						</tr>
						<tr>
							<td> 이메일 </td>
							<td colspan ="2"><%= user.getEmail() %></td>
						</tr>
						<tr>
							<td> 메일 수신동의 </td>
							<td colspan ="2"><%= user.getSns() %></td>
						</tr>
						<tr>
							<td> SMS 수신동의 </td>
							<td colspan ="2"><%= user.getSms() %></td>
						</tr>
						<tr>
							<td> 랭크 </td>
							<td colspan ="2"><%= user.getRank() %></td>
						</tr>	
			</tbody>
		</table>
	
	
		 <script type="text/javascript">
	 function  removeCheck(){
		 if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		     location.href="deleteCheckAction.jsp"
		 }else{   //취소
		     return false;
		 }
		}
     </script>
	
		<%
		if(UserNick != null ){
			%>
			
			<input type="button"  class="btn btn-primary bg-info float-right"  style="margin:5px;" value="회원정보 수정" onClick = "location.href='update_check.jsp'">
			<input type="button"  class="btn btn-primary bg-success float-right"  style="margin:5px;" value="회원 탈퇴" onclick="removeCheck()">   <!--  onClick = "location.href='update_check.jsp'" -->
			<% 
		}
		%>
	</div>
</div>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>