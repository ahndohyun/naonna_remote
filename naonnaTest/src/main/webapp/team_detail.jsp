<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.team.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<% request.setCharacterEncoding("utf-8"); %> 
 <% 
 	TeamVO vo = (TeamVO)request.getAttribute("vo");
 %>
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
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  
  <style>
  .monami {
			background-image : url("https://i1.wp.com/thesefootballtimes.co/wp-content/uploads/2016/03/55f80d2448bdd.jpg?fit=1500%2C900&ssl=1");
			height: 727px;
		}
	.main {
        margin-top : 150px;
     }
     .team-detail{
     	background-color: #111;
	    color: #DDD;
	    padding: 15px;
	    border: 3px solid #A52A2A;
	    opacity: 0.9;
     }
  .table {
  	margin : 10px 0 5px 80px;
  	font-size : 16px;
  	letter-spacing : 1.4px;
  	font-weight : 545;
  }
 
  .team-name-container {
  	margin : 20px;
  }
  .team-name-container img {
  	width : 200px;
  	height : 200px;
  	margin : 10px;
  }
  .page_name {
  	color: white;
	font-weight: 600;
	font-size: 30px;
	margin-left: 15px;
  }
  .page_name h2 {
  	font-weight : 900;
  }
   #team-name{
  	font-weight : 800;
  }
  .team-detail-header{
  	display:inline-block;
  	float:left;
  	margin : 0;
  }
  .team-detail-contents {
  	padding : 10px;
  	display:inline-block;
  }
  
  .team-join-button {
  	float : right;
  	height : 50px;
  	width : 160px;
  	margin-top : 20px;
  }
  .team-join-button p{
  	font-size : 16px;
  	font-weight : 800;
  	margin : 6px 0;
  	letter-spacing : 3px;
  }
  .table td:first-child {
  	width : 20%;
  	text-align : left;
  	background-color : red;
  	color : white;
  	
  }
  .table td:nth-child(2){
  	width : 80%;
  	padding : 9px 0 0 30px;
  	background-color : #777;
  	color : black;
  }
  .team_emblem{
  	width:100px;
  	height:100px;
  }
  .last_row{
  	
  }
  .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
  	border : none;
  	text-align : left;
  }
  </style>

  <script>
  	$(document).ready(function() {
  		
  		$.ajax({
   			url:'/naonnaTest/printTeamMember.do',     			
   			type:'POST',
   			dataType: "json",
   			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
   			data : {
   					'team_name' : '${vo.team_name}',
   				},
   			
   			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
   			success:function(data) {
   				var output = "";
   				$('#teamMember').html('');
   				output += "<tr><td>구성원</td><td>"
   				$.each(data, function(index, member) {
   						output += "<a href='go_#MypageModal?nickname="+ member.nickname + "'>"+ member.nickname +"</a>";
   						output += "&nbsp&nbsp&nbsp"
   							
   				});
   				output += "</td></tr>"
   				
   				$('#teamMember').html(output);
   				console.log(output);
   			},
   			error:function() {
   				alert("새로고침을 눌러주세요.");			
   			}
       });
  		
  		$('#joinTeam').click(function () {
  			$.ajax({
	   			url:'/naonnaTest/joinTeamMessage.do',     			
	   			type:'POST',
	   			dataType: "json",
	   			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	   			data : {
	   					'teamName' : '${vo.team_name}',
	   					'sendPeople' : "${sessionScope.nickname}",
	   					'getPeople' : '${vo.nickname}'
	   				},
	   			
	   			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
	   			success:function(data) {
	   				alert("주장님께서 승낙하시면 가입 완료가 됩니다.");
	   				window.location.reload();
	   			},
	   			error:function() {
	   				alert("새로고침을 눌러주세요.");			
	   			}
	       });
  		});
  	});
  	
  </script>

</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
 	<div class="monami">
 	<div class="col-sm-2">
		<div class="row">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>
		</div>
	</div>
	
	<form name="kakaoId">
		<input type="hidden" name="kakao_Id">
	</form>
	
     <div class="main col-sm-10">
       <div class ="team-detail col-sm-9 col-sm-offset-1">
        <div class="page_name"><p>팀 상세 보기</p></div>
        <div class="team-detail-container container-fluid">
          <div class="row">
           <div class="team-detail-header">
              <div class="team-name-container">
                <h3 id="team-name">${vo.team_name}</h3>
              	<img src="<spring:url value='./image/${vo.emblem}' />"/>
              </div>
           </div>
           <div class="team-detail-contents col-sm-6">
              <table class="table">
                 <thead>

                 </thead>
                 <tbody>
                    <tr>
                       <td> 주장 </td>
                       <td>${vo.nickname } </td>
                    </tr>
                    <tr>
                       <td> 위치 </td>
                       <td>${vo.area } </td>
                    </tr>
                    <tr>
                       <td>  연령대 </td>
                       <td> ${vo.age } </td>
                    </tr>
                    <tr>
                       <td> 실력 </td>
                       <td> ${vo.ability } </td>
                    </tr>
                    <tr>
                       <td> 인원 </td>
                       <td> ${vo.number_team } </td>
                    </tr>
                    <tr class="last_row">
                       <td> 팀 소개 </td>
                       <td> ${vo.intro }</td>
                    </tr>
                   </tbody>
                 <tfoot id="teamMember">
                 </tfoot>
              </table>
              <div class="team-join-button btn btn-primary" id="joinTeam"><p>팀 가입하기</p></div>
           </div>
        </div>   
       </div>
       </div>
      </div>
      <div class="modal fade" id="MypageModal" role="dialog">
                   <div class="modal-dialog">
                     <div class="modal-content">
                        <div class="modal-body">
                             <span class="team_title">마이페이지</span>
                             <button type="button" id="team_close" class="close" data-dismiss="modal">&times;</button>
                         </div>
                      </div>
                   </div>
                </div>
	</div>
</body>
</html>