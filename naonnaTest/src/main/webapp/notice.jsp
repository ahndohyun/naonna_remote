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
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>
  <style>
     .monami {
       background-image : url("https://lh3.googleusercontent.com/-hrYUHGyoYz4/WIz2mUMTahI/AAAAAAAABNM/d6u3yCje50EBAzYhVFMM3nkPCzjYXtCFACJoC/w1366-h768/Download-Fernando-Torres-Free-HD-Football-Wallpapers_Fotor.jpg");
       height : 727px;
     }
     .main {
        margin-top : 150px;
     }
     #notice_title {
      font-size:30px;
      color : white;
      font-weight : 700;
      background-color : #333333;
      margin : 0;
      opacity : 0.9;
      padding : 20px 0 0 16px;
   }
   .notice-table{
      background-color: #333333;
      padding:0 10px 0 10px;
      width: 100%;
      opacity : 0.9;
   }
      .table {
         margin-top : 30px;
         background-color : white;
         text-align : center;
         opacity:1;
      }
   
       #right {
          margin-top : 20px;
          float : right;
          margin-bottom: 20px;
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
               
               $('#print_match').html('');      //기존 것 날려주고..      
               var output = '';
               $.each(data, function(
                     index, match) {      //새로 뿌리기
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
         data:{   'matchLocation' : matchingCity,
               'playDate' : matchDate},
         
         //제이슨 형식의 리턴된 데이터는 아래의 data가 받음
         success:function(data) {
            
            $('#print_match').html('');      //기존 것 날려주고..
            
            $.each(data, function(index, match) {      //새로 뿌리기
               
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
            <p id="notice_title">공지사항</p>
            <div class="container-fluid notice-table">
               <table class="board-table table table-hover">
                  <thead>
                     <tr class="bg-primary">
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
               <span id="right"><button class="wirte-button btn btn-primary">글쓰기</button></span>
            </div>
         </div>
      </div>
      <!-- main contents end -->
   </div>


</body>
</html>