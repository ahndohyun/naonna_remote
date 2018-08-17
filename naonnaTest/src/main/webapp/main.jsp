<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="utf-8">

<head>
  <!-- NAONNA -->
  <title>NAONNA 경기장예약 매칭 사이트 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>

  <style>
  	body {
  		margin : 0;
  		padding : 0;
  		background-color : black;
  	}
  	.main {
  		width : 100%;
  		margin : -30px -10px 0 0;
  		padding : 0px;
  	}
  	.carousel-inner img {
      -webkit-filter: grayscale(90%);
      filter: grayscale(90%); /* make all photos black and white */ 
      width: 100%;
      height : 700px;
      
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  
  .carousel-caption p {
  	letter-spacing : 2px;
  	font-weight : 800;
  }
  </style>
<script>

</script>
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
  <!-- start main content -->
  	<form name="kakaoId">
		<input type="hidden" name="kakao_Id">
	</form>	
	
  	<div class="main col-sm-8">
  		<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="image/main1.png" alt="main1">
        <div class="carousel-caption">
          <h3>매칭신청</h3>
          <p>경기를 합시닷</p>
        </div>      
      </div>

      <div class="item">
        <img src="image/main2.png" alt="main">
        <div class="carousel-caption">
          <h3>경기장 대관</h3>
          <p>근처에 있는 경기장을 확인해 보세요.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="image/main3.png" alt="Los Angeles">
        <div class="carousel-caption">
          <h3>팀</h3>
          <p>함께 경기를 할 팀을 찾아보세요.</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  	</div>
  <!-- end main content -->
  </div>
  <!-- main body end -->

</body>

</html>
