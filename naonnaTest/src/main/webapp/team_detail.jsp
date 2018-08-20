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
  .table {
  	margin : 10px 0 5px 80px;
  }
  .row {
  	border-right : 2px solid red;
  	border-bottom : 2px solid red;
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
  	background-color : red;
  	color : white;
  	margin : 0;
  	padding : 10px 15px;
  }
  .page_name h2 {
  	font-weight : 900;
  }
   #team-name{
  	font-weight : 800;
  }
  .team-detail-header{
    border-left : 2px solid red;
    border-right : 2px solid red;
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
  	text-align : center;
  }
  .table td:nth-child(2){
  	width : 80%;
  	padding : 9px 0 0 30px;
  }
  .team_emblem{
  	width:100px;
  	height:100px;
  }
  </style>
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
     <div class="main col-sm-12">
       <div class ="team-detail col-sm-8 col-sm-offset-2">
        <div class="page_name"><h2>팀 상세 보기</h2></div>
        <div class="team-detail-container container-fluid">
          <div class="row">
           <div class="team-detail-header">
              <div class="team-name-container">
                <h3 id="team-name">${vo.team_name}</h3>
              	<img src="<spring:url value='./image/${vo.emblem}' />"/>
              </div>
           </div>
           <div class="team-detail-contents col-sm-6">
              <table class="table table-bordered table-striped table-hover">
                 <thead>
                    <tr>
                       <td> 위치 </td>
                       <td>${vo.area } </td>
                    </tr>
                 </thead>
                 <tbody>
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
                    <tr>
                       <td> 팀 소개 </td>
                       <td> ${vo.intro }
                       </td>
                    </tr>
                 </tbody>
              </table>
              <div class="team-join-button btn btn-primary"><p>팀 가입하기</p></div>
           </div>
           
        </div>   
       </div>
       </div>
      </div>
    <!-- main contents end -->

</body>
</html>