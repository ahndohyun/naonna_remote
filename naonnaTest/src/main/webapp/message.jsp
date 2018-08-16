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
  <style>
     thead tr{
        text-align : center;
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
                  <h3 class="bookingtitle content-title-name">알림창</h3>
               </div>
             <div class="button-container">
                <button class="btn btn-primary">삭제</button>
             </div>
               <table class="table table-straped table-hover">
                  <thead>
                     <tr>
                        <th><input type="checkbox" /></th>
                        <th>보낸사람</th>
                        <th>내용</th>
                        <th>날짜</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td><input type="checkbox" /></td>
                        <td>팀 나온나</td>
                        <td>팀 나온나에 가입하신걸 축하드립니다.</td>
                        <td>2018.08.23</td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" /></td>
                        <td>보라매 경기장</td>
                        <td>2018년 8월 31일 17시 경기장 예약이 되었습니다.</td>
                        <td>2018.08.20</td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" /></td>
                        <td>안도미키</td>
                        <td>2018년 8월 24일 17시에 매칭이 있습니다.</td>
                        <td>2018.08.19</td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" /></td>
                        <td>김경우</td>
                        <td>김경우님께서 2018년 8월 24일 17일 매칭에 참여하였습니다.</td>
                        <td>2018.08.17</td>
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