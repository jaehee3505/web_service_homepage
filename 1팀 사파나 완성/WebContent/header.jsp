<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>
.modal-title{font-family:"배달의민족 도현"; font-size: 20px !important; }
.navbar-brand {font-family:"배달의민족 도현"; font-size: 25px !important; }
.nav-link active {font-family:"Noto Sans KR";}
</style>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
</head>
<body>
<%
		String UserNick = null;
		if(session.getAttribute("UserNick")!= null){
			UserNick =  (String) session.getAttribute("UserNick");
		}
%>

  <!-- Navigation바 -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
    <div class="container">	
    <a href="index.jsp" class="active"><img src="img/logo.png" alt="사파나로고" width="50" height="50"></a>
      <a class="navbar-brand  active" href="index.jsp" > &nbsp;사파나</a>
      
<nav class="navbar navbar-light bg-info">
  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
   <button class="btn btn-warning" type="submit"><i class="fa fa-search" ></i></button>
  </form>
</nav>

<%	
		if(UserNick == null){
%>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link active" href="signup.jsp">회원가입
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" data-toggle="modal" a href="#myModal">로그인</a>      
          </li>
        </ul>
      </div>
      <%
		}
		else if(UserNick.equals("admin")){
			%>
			
				  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link active" href="admin.jsp">관리자페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="userCheck.jsp">마이페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active"  a href="logoutAction.jsp">로그아웃</a>
          </li>
        </ul>
      </div>
			
			
			<% 
			}else{
			%>	
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link active" href="userCheck.jsp">마이페이지
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active"  a href="logoutAction.jsp">로그아웃</a>
          </li>
        </ul>
      </div>
			<% 
		}
	
      %>
    </div>
  </nav>
</body>
  <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">			
			
					<h4 class="modal-title">로그인</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="loginAction.jsp" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i>
						<input type="text" class="form-control" placeholder="아이디" name="id" required="required" maxlength="20">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i>
						<input type="password" class="form-control" placeholder="패스워드" name="passwd" required="required" maxlength="20">					
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block  bg-info" value="로그인">
						<br>
						<a href="signup.jsp">아이디가 없으세요?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>     
</html>