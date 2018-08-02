<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.css">
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/external/jquery/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/jquery-ui-1.12.1/jquery-ui.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- 캘린더 라이브러리-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- 캘린더 라이브러리-->



<!--  star rating api -->
<script async custom-element="amp-form"
	src="https://cdn.ampproject.org/v0/amp-form-0.1.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/naonna_main.css">
<style>
.container-groundFilter {
	border: 2px solid black;
}

.container-groundSearch {
	vertical-align: middle;
	display: block;
	position: relative;
	width: 800px;
	height: 500px;
	left: 60px;
}

.groundValue {
	padding: 0px;
	border: 2px solid black;
	height: 80px;
	margin: auto;
}

.form-select {
	margin-top: 5px;
}

.valueName {
	background-color: black;
	width: 100px;
	display: inline-block;
	height: 40px;
	margin: 20px;
}

.valueName h3 {
	color: white;
	text-align: center;
	letter-spacing: 2px;
}

.form-select-citydetail {
	display: inline-block;
	margin: auto;
}

.demo-section {
	margin-left: 12px;
}

#timer, #timer input {
	display: inline;
}

#timer h4 {
	display: inline-block;
	font-size: 12px;
	letter-spacing: 1px;
	margin-right: 20px;
}

#start, #end {
	
}

.form-horizontal {
	display: inline-block;
	left: 10px;
}

.rating { -
	-star-size: 2;
	/* use CSS variables to calculate dependent dimensions later */
	padding: 0; /* to prevent flicker when mousing over padding */
	border: none; /* to prevent flicker when mousing over border */
	unicode-bidi: bidi-override;
	direction: rtl; /* for CSS-only style change on hover */
	text-align: left; /* revert the RTL direction */
	user-select: none; /* disable mouse/touch selection */
	font-size: 2em; /* fallback - IE doesn't support CSS variables */
	font-size: calc(var(- -star-size)* 1em);
	/* because `var(--star-size)em` would be too good to be true */
	cursor: pointer;
	/* disable touch feedback on cursor: pointer - http://stackoverflow.com/q/25704650/1269037 */
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	-webkit-tap-highlight-color: transparent;
	margin-top: -40px;
}
/* the stars */
.rating>label {
	display: inline-block;
	position: relative;
	width: 1.1em;
	/* magic number to overlap the radio buttons on top of the stars */
	width: calc(var(- -star-size)/3* 1.1em);
	margin-left: 15px;
}

.rating>*:hover, .rating>*:hover ~ label, .rating:not (:hover ) >input:checked 
	~ label {
	color: transparent;
	/* reveal the contour/white star from the HTML markup */
	cursor: inherit;
	/* avoid a cursor transition from arrow/pointer to text selection */
}

.rating>*:hover:before, .rating>*:hover ~ label:before, .rating:not (:hover
	) >input:checked ~ label:before {
	content: "★";
	position: absolute;
	left: 0;
	color: gold;
}

.rating>input {
	position: relative;
	transform: scale(3);
	/* make the radio buttons big; they don't inherit font-size */
	transform: scale(var(- -star-size));
	/* the magic numbers below correlate with the font-size */
	top: -0.5em; /* margin-top doesn't work */
	top: calc(var(- -star-size)/6* -1em);
	margin-left: -2.5em;
	/* overlap the radio buttons exactly under the stars */
	margin-left: calc(var(- -star-size)/6* -5em);
	z-index: 2;
	/* bring the button above the stars so it captures touches/clicks */
	opacity: 0; /* comment to see where the radio buttons are */
	font-size: initial; /* reset to default */
}

#sel1 {
	display: inline-block;
	width: 300px;
}

#sel2 {
	display: inline-block;
	width: 300px;
}

#sel3 {
	display: inline;
	width: 150px;
}

#sel3>p {
	display: inline;
}

#rating {
	display: inline-block;
}

.radio, .form-select-city {
	display: inline-block;
}

.form-select-price {
	display: inline;
}

.form-selection {
	display: inline-block;
	margin: auto;
	margin-top: 5px;
}

.parkinglot {
	display: inline;
	margin-left: 20px;
}

.table {
	position: absolute;
	top: 300px;
}
</style>

<script>
	$(document).ready(function() {
			function printGround() {
				$('#ground_print').empty();
				$.ajax({
					url:'/naonnaTest/getGroundJSON.do',
					type:'POST',
					dataType: "json",
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
					success:function(data) {
						$.each(data, function(index, ground) {
							var output = '';
							output += '<tr>';
							output += '<td>' + ground.ground_Name + '</td>';
							output += '<td>' + ground.ground_addr + '</td>';
							output += '<td>' + ground.grass + '</td>';
							output += '<td>' + ground.shower + '</td>';
							output += '<td>' + ground.parking + '</td>';
							output += '<td>' + ground.light + '</td>';
							output += '<td>' + ground.ground_size + '</td>';
							output += '<td>' + ground.ground_people + '</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#ground_print').append(output);
						});
					},
					error:function() {
						alert("새로고침을 눌러주세요.")
					}
				});
			}
			
			printGround();
			
			$('#sel2').on('change',function(){
				goDAO();				
			});
			
			$('#sel3').on('change',function(){				
				goDAO();			   
			});

			$('#sel4').on('change',function(){				
				goDAO();		
			});
			
			$('#sel5').on('change',function(){				
				goDAO();			   
			});
			
			$('#sel6').on('change',function(){			
				goDAO();			   
			});
			
          	 $(function() {
          		 
					var currentDate = new Date();
//					var tomorrow = currentDate.setDate(currentDate.getDate()+1);
        		  $('input[name="datetimes"]').daterangepicker({
					

        			singleDatePicker : true,
       		 		timePicker: true,
        		    showDropdowns: true, 
        		    startDate: moment().startOf('hour'),
        		    minDate : currentDate,
//    		     endDate: moment().startOf('hour').add(0, 'hour'),
        		    locale: {
       		       format: 'YYYY/M/DD hh:00'
//         		    	format: 'YYYY/M/DD'

        		    }
        		  });
    		});
          	 
          	$('#time_Submit').click (function(){
          		
          		var startDate = new Date($('#datePick').val());
          		var assign = $('#hours').val();
          		assign = assign*1;
          		var endDate = new Date(startDate);
          		endDate.setHours(startDate.getHours() + 1);
          		goDAO_time(startDate, endDate);
          	});		

	});
	
	function goDAO_time(startDate, endDate) {
		$.ajax({
			url:'/naonnaTest/time_ground_dao.do',
			type:'POST',
			dataType: "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			data:{	'ground_addr':$('#sel1').val(),
					'ground_city':$('#sel2').val(),
				 	'grass' : $('#sel3').val(),
				 	'parking' : $('#sel4').val(),
				 	'shower' : $('#sel5').val(),
				 	'light' : $('#sel6').val(),
				 	'startTime' : startDate,
				 	'assign' : $('#hours').val(),
				 	'endTime' : endDate},
			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
			success:function(data) {
				
				$('#ground_print').html('');		//기존 것 날려주고..
				
				$.each(data, function(index, ground) {		//새로 뿌리기
					var output = '';
					output += '<tr>';
					output += '<td>' + ground.ground_Name + '</td>';
					output += '<td>' + ground.ground_addr + '</td>';
					output += '<td>' + ground.grass + '</td>';
					output += '<td>' + ground.shower + '</td>';
					output += '<td>' + ground.parking + '</td>';
					output += '<td>' + ground.light + '</td>';
					output += '<td>' + ground.ground_size + '</td>';
					output += '<td>' + ground.ground_people + '</td>';
					output += '</tr>';
					console.log("output:" + output);
					$('#ground_print').append(output);
				});
				
				console.log(data);
			},
			error:function() {
				alert("ajax통신 실패!!");
			}
		});
	}
	
	function goDAO() {
		$.ajax({
			url:'/naonnaTest/filter_ground_dao.do',
			type:'POST',
			dataType: "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			data:{	'ground_addr':$('#sel1').val(),
					'ground_city':$('#sel2').val(),
				 	'grass' : $('#sel3').val(),
				 	'parking' : $('#sel4').val(),
				 	'shower' : $('#sel5').val(),
				 	'light' : $('#sel6').val()},
			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
			success:function(data) {
				
				$('#ground_print').html('');		//기존 것 날려주고..
				
				$.each(data, function(index, ground) {		//새로 뿌리기
					var output = '';
					output += '<tr>';
					output += '<td>' + ground.ground_Name + '</td>';
					output += '<td>' + ground.ground_addr + '</td>';
					output += '<td>' + ground.grass + '</td>';
					output += '<td>' + ground.shower + '</td>';
					output += '<td>' + ground.parking + '</td>';
					output += '<td>' + ground.light + '</td>';
					output += '<td>' + ground.ground_size + '</td>';
					output += '<td>' + ground.ground_people + '</td>';
					output += '</tr>';
					console.log("output:" + output);
					$('#ground_print').append(output);
				});
				
				console.log(data);
			},
			error:function() {
				alert("ajax통신 실패!!");
			}
		});	
	
	}
			

	
</script>

</head>

<body>
	<!-- Top menu -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<!-- Logo div -->
		<div class="navbar-header">
			<a class="navbar-brand" href="home.do">Input NAONNALogo</a>
		</div>
		<!-- Logo div end -->

		<!-- Main menu -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#myPage">대관신청</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">매칭 신청 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="matching_search.do">매칭 검색/등록</a></li>
						<li><a href="#">용병 모집/등록</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">팀 관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">팀 검색/생성</a></li>
						<li><a href="#">용병 모집/등록</a></li>
					</ul></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">QnA</a></li>
					</ul></li>
				<li><a href="#tour">자유게시판</a></li>
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">관리메뉴 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">회원관리</a></li>
						<li><a href="#">경기장 등록</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- Main menu end -->
	</nav>
	<!-- end of top menu -->

	<!-- main contents -->
	<div class="container-content">
		<!-- side menu bar start -->
		<div class="side-profile col-sm-4">
			<div class="card">
				<img src="https://t1.daumcdn.net/cfile/tistory/213D18435900DDE00E"
					alt="John" style="width: 100%">
				<h1>User Name</h1>
				<br>
				<p>
					<a href="#">My page</a>
				</p>
				<p>
					<a href="#">My team</a>
				</p>
				<p>
					<a href="#">Matching</a>
				</p>
				<p>
					<a href="#">Booking</a>
				</p>
				<p>
					<a href="#">My page</a>
				</p>
				<p>
					<a href="#">My page</a>
				</p>
			</div>
		</div>

		<!-- start main content -->
		<div class="main col-sm-8">
			<br>
			<!-- main content first low -->
			<div class="container-groundSearch">
				<h1>경기장 검색</h1>
				<div class="container-groundFilter">
					<div class="groundValue">
						<div class="valueName">
							<h3>위치</h3>
						</div>
						<div class="form-select-city">
							<form class="form-selection">
								<select class="form-control" id="sel1">
									<option value="서울시">서울특별시</option>
								</select>
							</form>
						</div>
						<div class="form-select-citydetail">
							<form name="city_name" class="form-selection" method="post"
								action="filter_city.do">
								<div class="form-select">
									<!-- <select class="form-control" name="ground_city" id="sel1" onChange="javascript:city_filter();"> -->
									<select class="form-control" name="ground_city" id="sel2">
										<option value=''>구 선택</option>									
										<option>강남구</option>
										<option>강동구</option>
										<option>강북구</option>
										<option>강서구</option>
										<option>관악구</option>
										<option>광진구</option>
										<option>구로구</option>
										<option>금천구</option>
										<option>노원구</option>
										<option>도봉구</option>
										<option>동대문구</option>
										<option>동작구</option>
										<option>마포구</option>
										<option>서대문구</option>
										<option>서초구</option>
										<option>성동구</option>
										<option>성북구</option>
										<option>송파구</option>
										<option>양천구</option>
										<option>영등포구</option>
										<option>용산구</option>
										<option>은평구</option>
										<option>종로구</option>
										<option>중구</option>
										<option>중랑구</option>
									</select>
								</div>
							</form>
						</div>
					</div>
					

					<div class="groundValue">
						<div class="valueName">
							<h3>세부사항</h3>
						</div>
						<div class="form-select-city">
							<form class="form-selection">
								<select class="form-control" id="sel3">
									<option value="">운동장 종류</option>
									<option value="인조잔디">인조잔디</option>
									<option value="천연잔디">천연잔디</option>
									<option value="모래">모래</option>
								</select>
							</form>
						</div>
						<div class="form-select-city">
							<form class="form-selection">
								<select class="form-control" id="sel4">
									<option value="">주차장</option>
									<option value="주차장 있음">주차장 있음</option>
								</select>
							</form>
						</div>
						<div class="form-select-city">
							<form class="form-selection">
								<select class="form-control" id="sel5">
									<option value="">샤워장</option>
									<option value="샤워실 있음">샤워장 있음</option>
								</select>
							</form>
						</div>
						<div class="form-select-city">
							<form class="form-selection">
								<select class="form-control" id="sel6">
									<option value=''>조명</option>
									<option value="조명 있음">조명 있음</option>
								</select>
							</form>
						</div>
					</div>
						
					<div class="groundValue" id="timeGround">
						<div class="valueName">
							<h3>날짜</h3>
						</div>
							<!--  시간 선택 API  -->
							<div class="demo-section k-content" id="timer">
								<h4>날짜 선택</h4>
								<input type="text" id="datePick" name="datetimes" style="width: 25%" />
								<h4>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 대여 시간</h4>
								<input type="number" id="hours" value="0" style="width: 5%;" />시간&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<input type="button" id="time_Submit" value="지정">
							</div>					
					</div>
						
      <!--  groundFilter end -->					
			</div>

			<div class="container-board">
				<table class="table">
					<thead>
						<tr class="success">
							<th>경기장 이름</th>
							<th>주소</th>
							<th>인조잔디</th>
							<th>샤워시설</th>
							<th>주차장</th>
							<th>조명</th>
							<th>크기</th>
							<th>경기 인원 추천</th>
						</tr>
					</thead>
					<tbody class="table-body" id="ground_print">
					</tbody>
				</table>
			</div>
			<!-- end main content -->
		</div>

	<!-- main contents end -->
</body>
</html>