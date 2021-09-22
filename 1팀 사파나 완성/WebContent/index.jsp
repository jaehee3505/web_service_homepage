<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>유통페이지 - 사파나</title>

<style>
.modal-title{font-family:"배달의민족 도현"; font-size: 20px !important; }
.list-group-item {font-family:"Noto Sans KR";}
</style>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/shop-homepage.css" rel="stylesheet">

</head>

<body>

<%@include file ="header.jsp" %>

  <!-- Page Content -->
  <div class="container">

    <div class="row">
      <div class="col-lg-3">
        <h1 class="my-4"></h1>
        <div class="list-group">
          <a href="regularbbs.jsp" class="list-group-item">정식 판매자 게시판</a>
          <a href="normalbbs.jsp" class="list-group-item">일반 판매자 게시판</a>
          <a href="qnabbs.jsp" class="list-group-item">Q&A</a>

        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#" data-slide-to="0" class="active"></li>
            <li data-target="#" data-slide-to="1"></li>
            <li data-target="#" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
            <a href="https://www.samsung.com/sec/">
              <img class="d-block img-fluid" src="img/banner1_.jpg" alt="First slide">
        </a>
            </div>
            <div class="carousel-item">
               <a href="https://www.logitech.com/ko-kr">
              <img class="d-block img-fluid" src="img/banner2_.jpg" alt="Second slide">
              </a>
            </div>
            <div class="carousel-item">
              <a href="https://www.hanwha.co.kr/index.do">
              <img class="d-block img-fluid" src="img/banner3_.jpg" alt="Third slide">
              </a>
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>

  <br>  <br>  <br>  <br>  <br>  <br> 

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  
</body>
</html>
<%@include file ="footer.jsp" %>
