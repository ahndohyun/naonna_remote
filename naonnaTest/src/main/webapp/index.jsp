<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>NAONNA 경기장예약 매칭 사이트 </title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>

  <!-- 
  <link rel="stylesheet" href="/naonnaTest/resources/naonna_main.css"/>   
   -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('aecd4acbce2512282f0d82282be7ebb3');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.login({
	        success: function(authObj) {
	          alert(JSON.stringify(authObj));
	        },
	        fail: function(err) {
	          alert(JSON.stringify(err));
	        }
	      });
	    };
	    
		function createKakaotalkLogin(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"});
			loginBtn.click(function(){
				Kakao.Auth.login({
					persistAccessToken: true,
					persistRefreshToken: true,
					success: function(authObj) {
						getKakaotalkUserProfile();
						createKakaotalkLogout();
					},
					fail: function(err) {
						console.log(err);
					}
				});
			});
			$("#kakao-logged-group").prepend(loginBtn)
		}
		function createKakaotalkLogout(){
			$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
			var logoutBtn = $("<a/>",{"class":"kakao-logout-btn","text":"로그아웃"});
			logoutBtn.click(function(){
				Kakao.Auth.logout();
				createKakaotalkLogin();
				$("#kakao-profile").text("");
				alert("로그아웃됬습니다.");
			});
			$("#kakao-logged-group").prepend(logoutBtn);
		}
	
	</script>
  <style>
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

<!-- Top menu -->
<nav class="navbar navbar-default navbar-fixed-top">
    <!-- Logo div -->
    <div class="navbar-header">
      <a class="navbar-brand" href="#myPage">Input NAONNALogo</a>
    </div><!-- Logo div end -->

    <!-- Main menu -->
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="ground_info.do">대관신청</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">매칭 신청
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="matching_search.do">매칭 검색/등록</a></li>
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
        <img src="/naonnaTest/resources/a1.jpg" alt="John" style="width:100%">
        <h1>User Name</h1><br>
        <a href="#"><p>My page</p></a>
        <a href="#"><p>My team</p></a>
        <a href="#"><p>Matching</p></a>
        <a href="#"><p>Booking</p></a>
        <a href="#"><p>My page</p></a>
        <a href="#"><p>My page</p></a>
        <a href="kakaoAPI.jsp"><p>카카오 API 공부해야지</a>
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
		<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
		</a>


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
                <label for="uname"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" name="uname" required>
                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>
                          
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
    <!-- main content first low -->
    <div class="divBoard">
      <div class="conBoard" id="conBoard1">
      </div>
      <div class="conBoard" id="conBoard2">
      </div>
    </div>
    <!-- main content second low -->
    <div class="divBoard">
      <div class="conBoard" id="conBoard3">
      </div>
      <div class="conBoard" id="conBoard4">
      </div>
    </div>
  </div>
  <!-- end main content -->
</div>
<!-- main contents end -->



</body>
</html>