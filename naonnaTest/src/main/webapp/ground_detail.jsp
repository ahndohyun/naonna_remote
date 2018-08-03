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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naonna_main.css">
  <style>
  	body {
  font-family: Arial;
  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	.main {
		margin-top : 40px;
	}
	img {
	  vertical-align: middle;
	}
	
	.container {
	  position: relative;
	  overflow : hidden;
	}
	
	/* Hide the images by default */
	.mySlides {
		width : 400px;
	  display: none;
	}
	.mySlides img {
		width : 400px;
		height : 300px;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  left: 370px;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  width : 400px;
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: black;
	}
	.row {
		width : 400px;
		margin-left : 0px;
	}
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 33.33%;
	}
	.row img {
		height :133.8px;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	.demo .cursor{
		height : 100%;
	}
	.active,
	.demo:hover {
	  opacity: 1;
	}	
	.ground-detail {
		width : 500px;
		margin : 30px 40px 0 -150px;
		padding : 20px 0px 0px 10px;
	}
	.ground-detail-contents img {
		width : 80px;
	}
	.ground-dtail-texts {
		margin-top : 10px;
	}
	.ground-detail-textmore {
		margin : 8px 2px 3px -2px;
		text-align : center;
	}
	.gorund-detail-textmore p {
		color : blue;
	}
	.ground-detail-size-texts {
		display : inline-block;
		width : 400px;
		margin : 10px 30px 0px;
	}
	.ground-detail-size-fieldtext, .ground-detail-size-formaltext {
		display :inline-block;
	}
	
	.formal-ground-size {
		width : 315px;
		height : 210px;
		margin-left : 72.5px;
	}
	.small-box {
		width : 17px;
		height : 10px;
		display : inline-block;
		margin : 0 0 0 15px;
	}
	.gray-box {
		background-color : #dedede;
	}
	.green-box {
		background-color: #466626;
	}
	.ground-detail-size-fieldtext p, .ground-detail-size-formaltext p{
		color : black;
		font-size : 10px;
		display : inline-block;
		margin-left : 3px;
	}
	.ground-detail-addr {
		margin-top : 30px;
	}
	.ground-detail-addr p {
		text-align : center;
	}
	.ground-notice {
		margin-left : 40px;
	}
	.ground-notice h2 {
		font-weight : 700px;
		letter-spacing : 3px;
		margin-bottom : 20px;
		margin-top : 20px;
	}
	ul {
		list-style-type : none;
		
	}
	.ground-notice-1 ul li, .ground-notice-3 ul li{
		margin :  0 0 10px -20px;
		font-size : 12px;
	}
	.ground-pics {
		margin : 50px 40px 0px 110px;
	}
	.payment, .back-to-list {
		display : inline-block;
		width : 200px;
		margin : 40px 8px 0;
	}
	.payment {
		margin-left : 360px;
	}
	.btn {
		height : 60px;
	}

  </style>
  <script>
	
  </script>
</head>

<body>
<!-- Top menu -->
<nav class="navbar navbar-default navbar-fixed-top">
    <!-- Logo div -->
    <div class="navbar-header">
      <a class="navbar-brand" href="#myPage">Input NAONNALogo</a>
    </div><!-- Logo div end -->

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
        <!-- show login modal -->
        <button onclick="document.getElementById('id01').style.display='block'">Login</button>

          <div id="id01" class="modal">
            <form class="modal-content animate" action="#">

                <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
              <div class="container-modal">
                <div class="login_select">
                  <button class="login_select" type="submit">일반회원 로그인</button>
                  <button class="login_select" type="submit">관리자 로그인</button>
                </div>
                  <a id="kakao-login-btn"></a>
                    <a href="http://developers.kakao.com/logout"></a>
                    <script type='text/javascript'>
                      //<![CDATA[
                        // 사용할 앱의 JavaScript 키를 설정해 주세요.
                        Kakao.init('d0cf3d4bb9d904e3beb7b60a97eb0891');
                        // 카카오 로그인 버튼을 생성합니다.
                        Kakao.Auth.createLoginButton({
                          container: '#kakao-login-btn',
                          success: function(authObj) {
                            alert(JSON.stringify(authObj));
                          },
                          fail: function(err) {
                             alert(JSON.stringify(err));
                          }
                        });
                      //]]>
                    </script>

                <button type="submit">Sign up</button>
                <button type="submit">Sign in</button>
              </div>
            </form>
          </div>

          <script>
          // Get the modal
          var modal = document.getElementById('id01');
          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function(event) {
              if (event.target == modal) {
                  modal.style.display = "none";
              }
          }
          
          </script>
          <!-- login modal end-->
      
      </div>
  </div>
  <!-- side menu bar end -->

<!-- start main content -->
  <div class="main col-sm-8"><br>
  	 <div class="ground-pics col-sm-6">
    	<div class="mySlides">
    		<div class="numbertext">1 / 3</div>
    			<img src="https://gif.fmkorea.com/files/attach/new/20161213/486616/47017249/533826390/223e96e691e76354f671b407d997f2d2.gif" style="width:100%">
  			</div>

			  <div class="mySlides">
			    <div class="numbertext">2 / 3</div>
			    <img src="http://cdnweb01.wikitree.co.kr/webdata/editor/201704/21/img_20170421085646_f1d41d88.jpg" style="width:100%">
			  </div>

			  <div class="mySlides">
			    <div class="numbertext">3 / 3</div>
			    <img src="http://kstatic.inven.co.kr/upload/2016/05/15/bbs/i13095811292.jpg" style="width:100%">
			  </div>
    
			  <a class="prev" onclick="plusSlides(-1)">❮</a>
			  <a class="next" onclick="plusSlides(1)">❯</a>

			  <div class="caption-container">
			    <p id="caption"></p>
			  </div>

			  <div class="row">
			    <div class="column">
			      <img class="demo cursor" src="https://gif.fmkorea.com/files/attach/new/20161213/486616/47017249/533826390/223e96e691e76354f671b407d997f2d2.gif" style="width:100%" onclick="currentSlide(1)">
			    </div>
			    <div class="column">
			      <img class="demo cursor" src="http://cdnweb01.wikitree.co.kr/webdata/editor/201704/21/img_20170421085646_f1d41d88.jpg" style="width:100%" onclick="currentSlide(2)">
			    </div>
			    <div class="column">
			      <img class="demo cursor" src="http://kstatic.inven.co.kr/upload/2016/05/15/bbs/i13095811292.jpg" style="width:100%" onclick="currentSlide(3)">
			    </div>
  			  </div>
  <script>
  var slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("demo");
	  var captionText = document.getElementById("caption");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";
	  dots[slideIndex-1].className += " active";
	  captionText.innerHTML = dots[slideIndex-1].alt;
	}
  </script>
  </div>
  <div class="ground-detail col-sm-6">
  	<div class="ground-detail-contents col-sm-12">
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/chun.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/jo.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/ju.png"></div>
  		<div class="ground-detail-icon col-sm-3"><img src="https://www.iamground.kr/img/icons/sh.png"></div>
  	</div>
  	<div class="ground-detail-texts col-sm-12">
  		<div class="ground-detail-textmore col-sm-3"><p>잔디유무</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>조명유무</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>주차장유무</p></div>
  		<div class="ground-detail-textmore col-sm-3"><p>샤워시설유무</p></div>
  	</div>
  	<div class="ground-detail-size col-sm-12">
  		<div class="ground-detail-size-pics">
  			<img class="formal-ground-size" src="https://www.iamground.kr/img/sample/ssize.jpg">
  		</div>
  		<div class="ground-detail-size-texts col-sm-12">
			<div class="ground-detail-size-fieldtext col-sm-6">
				<div class="gray-box small-box"></div>
				<p>경기장(100 x 70)</p>
			</div>
			<div class="ground-detail-size-formaltext col-sm-6">
				<div class="green-box small-box"></div>
				<p>정규 규격(105 x 70)</p>
			</div>  			
  		</div>
  	</div>
  	<div class="ground-detail-addr col-sm-12">
  		<p>서울 시립 창동 운동장 </p>
  		<p>창동 1-9번지</p>
  	</div>
  </div>
  <!-- end main content -->
  <div class="button-container">
  	<div class="payment"><button class="btn btn-success">결제하기</button></div>
  	<div class="back-to-list"><button class="btn btn-success">목록으로</button></div>
  </div>
  </div>
</div>
<!-- main contents end -->
</body>
</html>