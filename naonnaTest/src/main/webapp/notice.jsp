<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>
  <!-- <link rel="stylesheet" href="naonna_main.css"> -->
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  <style>
  	 .naonna-board-container {
  	 	margin-top : 15px;
  	 }
  	 .naonna-board-container h3 {
  	 	font-weight : 700;
  	 	display : inline-block;
  	 }
  	 .board-container {
  	 	margin-top : 80px;
  	 }
  	 .table {
  	 	margin-top : 30px;
  	 }
     .table thead td, .table tbody td:first-child, .table tbody td:nth-child(2), table tbody td:nth-child(3), table tbody td:nth-child(4) {
     	text-align : center;
     }
   
   	 #right {
   	 	margin-top : 20px;
   	 	float : right;
   	 }
  </style>


<script>
	$(document).ready(function() {
	    $(function() {
			$.ajax({
				url:'/naonnaTest/print_matching.do',
				type:'POST',
				dataType: "json",
				contentType : 'application/x-www-form-urlencoded; charset=utf-8',
				//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
				success:function(data) {
					
					$('#print_match').html('');		//기존 것 날려주고..		
					var output = '';
					$.each(data, function(
							index, match) {		//새로 뿌리기
						var d = new Date(match.playDate);
						var y = d.getFullYear();
						var m = (d.getMonth()+1);
						var da = d.getDate();
						var h = d.getHours();
						var mi = d.getMinutes();
						
						
						output += '<tr>';
						output += '<td>' + match.matchLocation + '</td>';
						output += '<td>' + y + '-' + m + '-' + da + '&nbsp' + h + ':' + mi + '</td>';
						output += '<td>' + match.homeTeam + '</td>';
						output += '<td>' + match.matchingID + '</td>';
						output += '<td>' + match.people + '</td>';
						output += '<td><button type="button" class="btn btn-success" id="match_want">신청</button></td>';
						output += '</tr>';
						console.log("output:" + output);
						
					});
					$('#print_match').html(output);
					console.log(data);
				},
				error:function() {
					alert("ajax통신 실패!!");
				}
			});
		});

		$(document).on('click', '#match_want', function() {
			alert('되니?!!!!');
		});

		$('#search_matching').click(function(){
			var matchingCity = $('#city').val();
	  		var matchDate = new Date($('#datePick').val());
	  		search_match(matchDate, matchingCity);
		});
		
	});
		
	function search_match(matchDate, matchingCity) {
		$.ajax({
			url:'/naonnaTest/searchMatching.do',
			type:'POST',
			dataType: "json",
			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
			data:{	'matchLocation' : matchingCity,
					'playDate' : matchDate},
			
			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
			success:function(data) {
				
				$('#print_match').html('');		//기존 것 날려주고..
				
				$.each(data, function(index, match) {		//새로 뿌리기
					
					var d = new Date(match.playDate);
					var y = d.getFullYear();
					var m = (d.getMonth()+1);
					var da = d.getDate();
					var h = d.getHours();
					var mi = d.getMinutes();
					
					var output = '';
					output += '<tr>';
					output += '<td>' + match.matchLocation + '</td>';
					output += '<td>' + y + '-' + m + '-' + da + '&nbsp' + h + ':' + mi + '</td>';
					output += '<td>' + match.homeTeam + '</td>';
					output += '<td>' + match.matchingID + '</td>';
					output += '<td>' + match.people + '</td>';
					output += '<td><input type="button" class="btn btn-success" id="match_want">신청</td>';

					output += '</tr>';
					console.log("output:" + output);
					$('#print_match').append(output);
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
      <a class="navbar-brand" href="#">NAONNA</a>
    </div>
    <!-- Logo div end -->

    <!-- Main menu -->
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">대관신청</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">매칭신청
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">매칭 검색/등록</a></li>
            <li><a href="#">용병 모집/등록</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">팀관리
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">팀 검색/생성</a></li>
            <li><a href="#">용병 모집/등록</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">공지사항</a></li>
            <li><a href="#">FAQ</a></li>
            <li><a href="#">QnA</a></li>
          </ul>
        </li>

        <li><a href="#">자유게시판</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">관리메뉴
          <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">회원관리</a></li>
            <li><a href="#">경기장 등록</a></li>
          </ul>
        </li>
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
		<!-- side menu bar end -->

		<!-- start main content -->
		<div class="main col-sm-8">
			<div class="naonna-board-container col-sm-12">
				<div class="menu-nameboard col-sm-12">
					<h3>공지 사항</h3>
					<span id="right"><button class="wirte-button btn btn-success">글쓰기</button></span>
				</div>
				<div class="board-container">
					<table class="board-table table table-striped table-hover">
						<thead>
							<tr>
								<td>제목</td>
								<td>작성자</td>
								<td>등록날짜</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>안도현 좀 똑바로 해라</td>
								<td>Admin</td>
								<td>2018.08.05</td>
							</tr>
							<tr>
								<td>김경우 밖에 나가서 pt 8번 20회 하도록 해</td>
								<td>Admin</td>
								<td>2018.08.05</td>
							</tr>
							<tr>
								<td>NAONNA 사용시 유의사항</td>
								<td>Admin</td>
								<td>2018.08.05</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- main contents end -->
	</div>


</body>
</html>