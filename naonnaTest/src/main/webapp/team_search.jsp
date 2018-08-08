<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  td {
  
   text-align : center;
  
  }
  
     .main {
        height : 700px;
        display : relative;
     }
     .team-filter {
        margin : 47px 0 20px 5px;
        height : 80px;
        border : 1px solid black;
     }
     .team-filter-row {
        width : 1080px;
        display : absolute;
        margin : 5px 20px 5px 0px;
     }
     .team-filter-name{
        width : 120px;
        height : 40px;
        margin : 20px 20px 30px 15px;
        padding : 6px;
        display : inline-block;
        background-color : black;
        vertical-align : center;
     }
     .team-filter-name h4 {
        text-align : center;
        height : 100%;
        color : white;
        font-size : 14px;
        letter-spacing : -1px;
        margin : 10px 10px 0 10px;
     }
     .team-filter-name input {
        display : inline;
        width : 100px;
        height : 40px;
        margin : 20px;
     }
     .team-filter-value {
        display : inline-block;
     }
     .success th {
        text-align : center;
     }
     .container-page {
        margin : 50px auto;
        padding-left : 400px;   
        display : inline;
     }
     
     .team-list {
     	float : left;
     }
     
     .team-search {
     	float : left;
     }
   
     button {
        width : 110px;
        display : inline-block;

     }
     .table {
        margin-top : 40px;
     }
  </style>
  
  <script>
	$(document).ready(function() {
		 function printTeam() {
				$('#team_print').empty();
				$.ajax({
					url:'/naonnaTest/getTeamlistJSON.do',
					type:'POST',
					dataType: "json",
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',
					//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
					success:function(data) {
						$.each(data, function(index, team) {
							var output = '';
							output += '<tr>';
							output += '<td> <a link href="team_detail.do?team_name='+team.team_name + '">' + team.team_name  + '</td>';
							output += '<td>' + team.area + '</td>';
							output += '<td>' + team.nickname + '</td>';
							output += '<td>' + team.ability + '</td>';
							output += '<td>' + team.number_team + '</td>';
							output += '</tr>';
							console.log("output:" + output);
							$('#team_print').append(output);
						});
					},
					error:function() {
						alert("새로고침을 눌러주세요.")
					}
				}); // ajax
			} // printTeam function
			
			
			$('#target').click(function (){ 
				
				goFindteam();			
			}); //target
			
		
			function goFindteam() {
				
				$.ajax({
					url:'/naonnaTest/getTeamfindJSON.do',
					type:'POST',
					dataType: "json",
					contentType : 'application/x-www-form-urlencoded; charset=utf-8',		
					data:{							
							'team_name':$('#teamid').val(),
							'area': $('#address').val(),
							'nickname' : $('#capid').val()							
						},	
						
				success:function(data) {
				
					$('#team_print').html('');		//기존 것 날려주고..
					
					$.each(data, function(index, team) {		//새로 뿌리기
						var output = '';
						output += '<tr>';
						output += '<td> <a link href="team_detail.do?team_name='+team.team_name + '">' + team.team_name  + '</td>';
						output += '<td>' + team.area + '</td>';
						output += '<td>' + team.nickname + '</td>';
						output += '<td>' + team.ability + '</td>';
						output += '<td>' + team.number_team + '</td>';
						output += '</tr>';
						console.log("output:" + output);
						$('#team_print').append(output);
						
					});
					console.log(data);
				},
				error:function() {
					alert("ajax통신 findteam실패!!");
				}
			});	
										
		}				
			
	
			printTeam();
			
		  
		$('#target2').click(function (){
			printTeam();
		});
		 

});
	
</script>
  
</head>

<body>
<!-- Top menu -->
   <nav class="navbar navbar-default navbar-fixed-top">
       <!-- Logo div -->
       <div class="navbar-header">
         <a class="navbar-brand" href="#myPage">Input NAONNALogo</a>
       </div>
       <!-- Logo div end -->
   
       <!-- Main menu -->
       
       <div class="collapse navbar-collapse" id="myNavbar">
         <ul class="nav navbar-nav navbar-right">
           <li><a href="#myPage">대관신청</a></li>
           <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">매칭 신청
             <span class="caret"></span></a>
             <ul class="dropdown-menu">
               <li><a href="#">매칭 검색/등록</a></li>
               <li><a href="#">용병 모집/등록</a></li>
             </ul>
           </li>
           <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">팀 관리
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
           <li><a href="#tour">자유게시판</a></li>
           <li class="dropdown">
             <a class="dropdown-toggle" data-toggle="dropdown" href="#">관리메뉴
             <span class="caret"></span></a>
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
           <img src="https://t1.daumcdn.net/cfile/tistory/213D18435900DDE00E" alt="John" style="width:100%">
           <h1>User Name</h1><br>
           <p><a href="#">My page</a></p>
           <p><a href="#">My team</a></p>
           <p><a href="#">Matching</a></p>
           <p><a href="#">Booking</a></p>
           <p><a href="#">My page</a></p>
           <p><a href="#">My page</a></p>
          </div>
      </div>
      <!-- side menu bar end -->
   
   <!-- start main content -->
   
     <div class="main col-sm-8"><br>
     
     <!--  team filter start -->
     
        <div class="team-filter">
        
           <div class="team-filter-row">
              <div class="team-filter-name bg-dark"><h4> 팀 명 </h4></div>
              <div class="team-filter-value"><input type="text" class="form-control" id="teamid" placeholder="팀의 이름을 입력하세요." autofocus></div>
              
              
              <div class="team-filter-name"><h4> 팀 활동 지 역 </h4></div>
              <div class="team-filter-value">
               <form class="form-selection">
                  <select class="form-control" id="address">
                  	 <option value=''>선택사항</option>
                     <option >강남구</option>
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
               </form>
            </div>
              <div class="team-filter-name"><h4> 주장 닉네임 </h4></div>
              <div class="team-filter-value"><input type="text" class="form-control" id="capid" placeholder="주장의 닉네임을 입력하세요."></div>
           </div>
           
           
        </div>
        <div class="team-list">
        	<button type="button" class="btn btn-search-list" id="target2">목록 리스트</button>
        </div>
        
        <div class="team-search">
        	<button type="button" class="btn btn-search-select" id="target">팀 검색</button>
        </div>
        
        <!-- team filter end -->
        
        <div class="container-board">
           <button type="button" class="btn btn-primary">팀 생성</button>
           <table class="table">
           <thead>
               <tr class="success">
                 <th>팀명</th>
                 <th>위치</th>
                 <th>팀 주장</th>
                 <th>실력</th>
                 <th>인원</th>
               </tr>
          </thead>
           <tbody class="table-body" id="team_print">
           		
           
              
           </tbody>
           </table>
        </div>
        
        <div class="container-page">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">Previous</a></li>
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item active"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
        
      </div>
           
     </div>
        
      <!-- main contents end -->
           
    </div>
      

</body>
</html>