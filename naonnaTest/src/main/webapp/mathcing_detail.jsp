<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
  <!-- <link rel="stylesheet" href="naonna_main.css"> -->
  <style>
   	 .ds-btn li{ list-style:none; float:left; padding:10px; }
	 .ds-btn li a span{padding-left:15px;padding-right:5px;width:100%;display:inline-block; text-align:left;}
	 .ds-btn li a span small{width:100%; display:inline-block; text-align:left;}
	 
   	 .btn-container {
   	 	margin-top : 40px;
   	 }
   	 .player-board-container {
   	 	margin-top : 60px;
   	 }
   	 .team-table, .away-table {
   	 	border : 1px solid black;
   	 }
   	 .team-table td:nth-child(odd), .away-table td:nth-child(odd) {
   	 	border : 3px solid black;
   	 	width : 30%;
   	 	text-align : center;
   	 }
   	 .vs-table {
   	 	margin-top : 20px;
   	 	border : 2px solid red;
   	 }
   	 .vs-table h1 {
   	 	text-align : center;
   	 	font-weight : 900;
   	 	color : red;
   	 }
   	 #page_title {
   	  	font-weight : 900;
   	 }
   	 .team-name {
   	 	text-align : center;
   	 }
   	 .team-name-p {
   	 	font-weight : 900;
   	 	background-color : black;
   	 	color : white;
   	 	padding : 20px 0;
   	 }
   	 .matching-detail-table {
   	 	margin-top : 40px;
   	 	border : 1px solid yellow;
   	 }
   	 .matching-detail-table tr {
   	 	height : 40px;
   	 	text-align : center;
   	 	font-weight : 600;
   	 }
   	 .card_team_info {
   	 	float : left;
   	 }
   	 .table {
   	 	margin-top : 40px;
   	 }
   	 .table tr td {
   	 	padding : 15px;
   	 }
  </style>


</head>

<body>
	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	
	<div class="col-sm-2">
		<div class="row">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
		</div>
	</div>


		<div class="main col-sm-10">
			<div class="player-board-container col-sm-12">
				<div class="player-nameboard col-sm-12">
					<h1 id="page_title">매칭 상세 정보</h1>
				</div>
				<div class="player-table-container row justify-content-md-center col-sm-12">
					<div class="team-name row">
						<h2 class="team-name-p">나다 싶으면 나와라</h2>
					</div>
					<div class="col-sm-4 team-info">
						<div class="card card_team_info">
	                        <img class="card-img-top" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6QLujzWxRjQa0hpm3Napzxj-pUEqJxgdpMsQKGo-pSu4GA2Mefw" alt="winter">
	                        <div class="card-body">
	                            <h3 class="card-title text-center">팀 안도미키</h3><br>
	                            <p class="card-text text-center">실력 : 의족</p>
	                            <p class="card-text text-center">주 활동 지역 : 지구</p>
	                            <a href="#" class="btn btn-primary btn-block">자세히보기</a>
	                        </div>
                		</div>
                	</div>
                	<div class="col-sm-8">
                		<div class="matching_info">
                			<table class="table table-striped">
                				<tr>
                					<td>장소</td>
                					<td>노원</td>
                				</tr>
                				<tr>
                					<td>시간</td>
                					<td>2018년 8월 31일 19시</td>
                				</tr>
                				<tr>
                					<td>참가자</td>
                					<td>안도미키 11명 </td>
                				</tr>
                				<tr>
                					<td></td>
                					<td>구와아앙 5명</td>
                				</tr>
                				<tr>
                					<td></td>
                					<td>김경우와아이들 5명</td>
                				</tr>
                				<tr>
                					<td></td>
                					<td>김가네 4명</td>
                				</tr>
                			</table>
                		</div>
                		<button class="btn btn-primary">참가</button>
                		<button class="btn btn-warning">목록으로</button>
					</div>
				</div>
			</div>
		</div>
</body>
</html>