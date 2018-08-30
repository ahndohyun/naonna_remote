<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%@ page import="com.spring.naonnaTest.notice.*" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<% request.setCharacterEncoding("utf-8"); %>   
   
<% 
 NoticeVO noticevo = (NoticeVO)request.getAttribute("noticevo");    
%>   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세보기</title>
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
     body{
        color : white;
     }
     .monami {
       background-image : url("https://lh3.googleusercontent.com/-hrYUHGyoYz4/WIz2mUMTahI/AAAAAAAABNM/d6u3yCje50EBAzYhVFMM3nkPCzjYXtCFACJoC/w1366-h768/Download-Fernando-Torres-Free-HD-Football-Wallpapers_Fotor.jpg");
       height : 727px;
     }
     .main {
        margin-top : 150px;
     }
   .notice-table{
      background-color: #333333;
      padding:0 30px 0 10px;
      width: 100%;
      opacity : 0.9;
   }
      .table {
         margin-top : 25px;
         background-color : white;
         text-align : center;
         opacity:1;
      }
       #right {
          margin-top : 20px;
          float : right;
          margin-bottom: 20px;
       }
       #left{
          margin-top : 20px;
          float : right;
          margin-bottom: 20px;
          margin-right: 20px;
       }
       #noticeTitle {
             margin-top : 15px; 
             margin-left : 10px;
             margin-right: 50px;
             display: inline-block;
       }
       #noticeTitle>p {
             font-size : 20px;
             font-weight : 550;
             letter-spacing : 1.5px;
       }
       .noticelabel{
	       	display: inline-block;
	       	margin-right: 15px;
	       	margin-top: 20px;
       }
       #noticeWriter, #noticeTime{
       		display: inline-block;
       		float: right;
       }
       #noticeWriter{
       		margin-right: 30px;
       }
       .noticeContent {
             height : 300px;
             padding : 20px;
             border-top: 3px solid white;
       }
       .noticeContent p {
         margin-top : 20px;             
       }
  </style>

<script>
   function res1(){
      location.href="notice_delete.do?title="+ "<%=noticevo.getTitle()%>"
   }
   function res2(){
      history.go(-1);
   }
   
   
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
         <div class="col-sm-9 col-sm-offset-1">
            <div class="notice-table container-fluid col-sm-9">
            <div class="notice_detail_body">
               <div id="noticeTitle">
                  <p><%=noticevo.getTitle()%></p>
               </div>
                  <div id="noticeTime">
                     <label class="noticelabel">등록일</label>
                     <%=noticevo.getWrite_date()%>
                  </div>
                  <div id="noticeWriter">
                     <label class="noticelabel">작성자</label>
                     <%=noticevo.getWriter()%>
                  </div>
              </div>
               <div class="noticeContent col-sm-12">
                  <div class="noticeBox">
                  <p><%=noticevo.getContents()%></p>
                  </div>
               </div>
               
            </div>
            <div>
            <%if(session.getAttribute("nickname").equals("superadmin")){ %>   
               <span id="right"><button class="wirte-button btn btn-danger" onclick="res1()">삭제</button></span>
            <%} %>
               <span id="left"><button class="wirte-button btn btn-primary" onclick="res2()">뒤로가기</button></span>
            </div>
         </div>
      </div>
      <!-- main contents end -->
   </div>


</body>
</html>