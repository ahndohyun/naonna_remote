<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>NAONNA 경기장예약 매칭 사이트 </title>
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
</head>
<style>
	.form-group {
		padding : 10px;
	}
	.input-form {
		margin-top : 40px;
	}
	#page_title {
		font-weight : 900;
	}
</style>
<body>
<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<div class="main col-sm-8">
		  <div class="col-sm-offset-4">
			<h1 id="page_title">팀등록 </h1>
		  </div>
		<div class="input-form col-sm-9">
    	<form class="form-horizontal" id="multiform" action="insertTeam.do" method="post" method="post" enctype="multipart/form-data">
		    <div class="form-group">
		        <label for="input_team_name" class="col-sm-3 control-label">팀 이름</label>
		        <div class="col-sm-8">
		        <input type="text" class="form-control" id="input_team_name" name="team_name" placeholder="팀이름을 입력하세요." />
		        </div>
		    </div>
		    <div class="form-group">
		        <label for="input_team_emblem" class="col-sm-3 control-label">엠블럼</label>
		        <div class="col-sm-8">
		        <input type="file" class="form-control" id="input_team_emblem" name="emblem"/>
		        </div>
		    </div>
		    <input type="hidden" name="nickname" />
			<div class="form-group">
		        <label for="input_team_ability" class="col-sm-3 control-label">실력</label>
		        <div class="col-sm-8">
		        <input type="text" class="form-control" id="input_team_ability" name="ability" placeholder="ex 프리미어리거,동네축구 등">
		        </div>
		    </div>
		    <div class="form-group">
		        <label for="input_team_number" class="col-sm-3 control-label">팀 인원</label>
		        <div class="col-sm-8">
		        <input type="text" class="form-control" id="input_team_number" name="number_team"/>
		        </div>
		    </div>
		    <div class="form-group">
		        <label for="input_team_location" class="col-sm-3 control-label">지역</label>
		        <div class="col-sm-8">
		        <input type="text" class="form-control" id="input_team_location" name="area"/>
		        </div>
		    </div>
		    <div class="form-group">
		        <label for="input_team_intro" class="col-sm-3 control-label">팀 소개글</label>
		        <div class="col-sm-8">
		        <textarea class="form-control" rows="5" id="input_team_intro" name="intro"/></textarea>
		        </div>
		    </div>
	         	<button class="col-sm-offset-6 btn btn-success"onclick="fnAction('insertTeam.do')">저장</button>
	         	<button class="btn btn-success">취소</button>
   		</form>
   	  </div>
   </div>
   </div>
</body>
</html>