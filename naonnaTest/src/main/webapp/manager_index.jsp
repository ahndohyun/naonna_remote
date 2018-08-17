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

<script>

</script>
<style>
	.content-title-name {
		display : inline;
	}
	.manager-index {
		margin-top : 4vw;
	}
	.mov-btn {
	
	}
	.right {
		float : right;
	}
</style>

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
  <div class="main col-sm-8"><br>
    <!-- main content first low -->
      <div class="row">
      	<div class="container-fluid col-sm-12 manager-index">
      		<div class="show-ground row col-sm-12">
      			<div class="content-title col-sm-12">
      				<h3 class="bookingtitle content-title-name">예약현황</h3>
      				<a href="#" class="right mov-btn btn btn-success">더보기</a>
      			</div>
      			<table class="table table-straped table-hover">
      				<thead>
      					<tr>
      						<th>예약자</th>
      						<th>예약날짜</th>
      						<th>사용시간</th>
      					</tr>
      				</thead>
      				<tbody>
      					<tr>
      						<td>김경우</td>
      						<td>2018.08.14</td>
      						<td>2</td>
      					</tr>
      					<tr>
      						<td>김도우</td>
      						<td>2018.08.07</td>
      						<td>3</td>
      					</tr>
      					<tr>
      						<td>안도현</td>
      						<td>2018.08.07</td>
      						<td>2</td>
      					</tr>
      					<tr>
      						<td>정상완</td>
      						<td>2018.08.15</td>
      						<td>5</td>
      					</tr>
      				</tbody>
      			</table>
      		</div>
      		<div class="show-book row col-sm-12">
      			<div class="content-title col-sm-12">
      				<h3 class="bookingtitle content-title-name">운동장 정보</h3>
      				<a href="ground_detail.jsp" class="right mov-btn btn btn-success">바로가기</a>
      			</div>
      			<table class="table table-straped table-hover">
      				<thead>
      					<tr>
      						<th>경기장이름</th>
      						<th>경기장 크기</th>
      						<th>잔디</th>
      						<th>샤워장</th>
      						<th>주차장</th>
      						
      					</tr>
      				</thead>
      				<tbody>
      					<tr>
      						<td>보라매 공원</td>
      						<td>100&times;100</td>
      						<td>천연잔디</td>
      						<td>있음</td>
      						<td>있음</td>
      					</tr>
      				</tbody>
      			</table>
      		</div>
      	</div>    
      </div>
  </div>
  <!-- end main content -->
  </div>
  <!-- main body end -->

</body>

</html>
