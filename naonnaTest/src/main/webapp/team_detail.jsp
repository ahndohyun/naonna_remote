<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======

<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.team.*" %> 
 
 <% 
 	TeamVO vo = (TeamVO)request.getAttribute("result");
 %>


>>>>>>> eef3f71b7ea15a9f0ba1aa08d4187819c89fdbb3
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
  .team-detail {
<<<<<<< HEAD
  	border : 1px solid black;
  	margin-top : 47px;
  }
  .page_name {
  	border-bottom : 1px solid black;
  }
  .page_name h2 {
  	font-weight : 900;
  }
 
  .team-name-container {
  	margin : 20px;
  }
   #team-name{
  	font-weight : 800;
=======
     border : 1px solid black;
     margin-top : 47px;
  }
  .page_name {
     border-bottom : 1px solid black;
  }
  .page_name h2 {
     font-weight : 900;
  }
 
  .team-name-container {
     margin : 20px;
  }
   #team-name{
     font-weight : 800;
>>>>>>> eef3f71b7ea15a9f0ba1aa08d4187819c89fdbb3
  }
  .team-detail-container {
  }
  .team-detail-contents {
<<<<<<< HEAD
  	padding : 10px;
  }
  .team-join-button {
  	float : right;
  	height : 50px;
  	width : 160px;
  	margin-top : 30px;
  }
  .team-join-button p{
  	font-size : 16px;
  	font-weight : 800;
  	margin : 6px 0;
  	letter-spacing : 3px;
  }
  .table td:first-child {
  	width : 140px;
  	text-align : center;
  }
  .table td:nth-child(2){
  	padding : 9px 0 0 30px;
=======
     padding : 10px;
  }
  .team-join-button {
     float : right;
     height : 50px;
     width : 160px;
     margin-top : 30px;
  }
  .team-join-button p{
     font-size : 16px;
     font-weight : 800;
     margin : 6px 0;
     letter-spacing : 3px;
  }
  .table td:first-child {
     width : 140px;
     text-align : center;
  }
  .table td:nth-child(2){
     padding : 9px 0 0 30px;
>>>>>>> eef3f71b7ea15a9f0ba1aa08d4187819c89fdbb3
  }
  </style>
  
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
     <!-- team detail start -->
       <div class ="team-detail col-sm-12">
<<<<<<< HEAD
	     <div class="page_name"><h2>팀 상세 보기</h2></div>
	     <div class="team-detail-container col-sm-12">
	     	<div class="team-detail-header">
	     		<div class="team-name-container col-sm-4"><h3 id="team-name">liver poor</h3></div>
	     		<div class="team-join-button btn btn-success"><p>팀 가입하기</p></div>
	     	</div>
	     	<div class="container team-detail-contents col-sm-12">
	     		<table class="table table-bordered table-striped table-hover">
	     			<thead>
	     				<tr>
	     					<td> 위치 </td>
	     					<td> 성북구 </td>
	     				</tr>
	     			</thead>
	     			<tbody>
	     				<tr>
	     					<td> 연령대 </td>
	     					<td> 10~50 </td>
	     				</tr>
	     				<tr>
	     					<td> 실력 </td>
	     					<td> 의족수준 </td>
	     				</tr>
	     				<tr>
	     					<td> 인원 </td>
	     					<td> 13명 </td>
	     				</tr>
	     				<tr>
	     					<td> 팀 소개 </td>
	     					<td> 우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우
	     					     랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴
	     					     우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴
	     					     우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴우랴
	     					</td>
	     				</tr>
	     				<tr>
	     					<td> 팀 리뷰 </td>
	     					<td> 좀 합디다 ㅋ </td>
	     				</tr>
	     			</tbody>
	     		</table>
	     	</div>
	     	
	     </div>
=======
        <div class="page_name"><h2>팀 상세 보기</h2></div>
        <div class="team-detail-container col-sm-12">
           <div class="team-detail-header">
              <div class="team-name-container col-sm-4"><h3 id="team-name">${vo.team_name}</h3></div>
              <div class="team-join-button btn btn-success"><p>팀 가입하기</p></div>
           </div>
           <div class="container team-detail-contents col-sm-12">
              <table class="table table-bordered table-striped table-hover">
                 <thead>
                    <tr>
                       <td> 위치 </td>
                       <td>${vo.area } </td>
                    </tr>
                 </thead>
                 <tbody>
                    <tr>
                       <td> 최근 경기전적 </td>
                       <td> ${vo.grade } </td>
                    </tr>
                    <tr>
                       <td> 실력 </td>
                       <td> ${vo.ability } </td>
                    </tr>
                    <tr>
                       <td> 인원 </td>
                       <td> ${vo.number_team } </td>
                    </tr>
                    <tr>
                       <td> 팀 소개 </td>
                       <td> ${vo.intro }
                       </td>
                    </tr>
                    <tr>
                       <td> 팀 리뷰 </td>
                       <td> ${vo.review } </td>
                    </tr>
                 </tbody>
              </table>
           </div>
           
        </div>
>>>>>>> eef3f71b7ea15a9f0ba1aa08d4187819c89fdbb3
           
       </div>
      </div>
    </div>
    <!-- main contents end -->

</body>
</html>