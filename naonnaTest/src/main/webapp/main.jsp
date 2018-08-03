<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
  <!-- <link rel="stylesheet" href="naonna_main.css"> -->
  <link href="${pageContext.request.contextPath}/resources/naonna_main.css" rel="stylesheet" type="text/css"/>

  <script>
  // start 카카오톡 API
    $(document).ready(
      function() {

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

        function getKakaotalkUserProfile() {
          Kakao.API.request({
            url: '/v1/user/me',
            success: function(res) {
              $("#kakao-profile").append(res.properties.nickname);
              $("#kakao-profile").append($("<img/>", {
                "src": res.properties.profile_image,
                "alt": res.properties.nickname + "님의 프로필 사진"
              }));
            },
            fail: function(error) {
              console.log(error);
            }
          });
        }

        function createKakaotalkLogin() {
          // $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
          // var loginBtn = $("<a/>", {
          //   "class": "kakao-login-btn",
          //   "text": "카카오톡으로 로그인"
          // });
          var loginBtn = $("<img/>", {
             "src" : "resources/kakao_account_login_btn_medium_wide.png",
             "alt" : "로그인 그림"
          });

          loginBtn.click(function() {
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

        function createKakaotalkLogout() {
          // $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
          // var logoutBtn = $("<a/>", {
          //   "class": "kakao-logout-btn",
          //   "text": "로그아웃"
          // });
        var logoutBtn = $("<img/>", {
             "src" : "//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg",
             "alt" : "로그아웃 그림"
          });
          logoutBtn.click(function() {
            Kakao.Auth.logout();
            createKakaotalkLogin();
            $("#kakao-profile").text("");
          });
          $("#kakao-logged-group").prepend(logoutBtn);
        }
        if (Kakao.Auth.getRefreshToken() != undefined &&
          Kakao.Auth.getRefreshToken().replace(/ /gi, "") != "") {
          createKakaotalkLogout();
          getKakaotalkUserProfile();
        } else {
          createKakaotalkLogin();
        }
      });
      //end of kakao

      //start multiple modal
      $(function() {
        return $(".modal").on("show.bs.modal", function() {
          var curModal;
          curModal = this;
          $(".modal").each(function() {
            if(this != curModal) {
              $(this).modal("hide");
            }
          });
        });
      });
      //end of multiple modal
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


  <!-- start main body -->
  <div class="container-content">
    <!-- side menu bar start -->
    <div class="side-profile col-sm-4">
      <div class="card">
        <!-- <img src="a1.jpg" alt="John" style="width:100%"> -->
        <img src="resources/a1.jpg" alt="John" style="width:100%">
        <h1>User Name</h1><br/>
        <!--로그인과 로그아웃 구분하기 하위 메뉴에 히든주기!!!!!!!!!!!!!! -->
        <p><a href="#">▶ My page </a></p>
        <p><a href="#">▶ My team </a></p>
        <p><a href="#">▶ Matching </a></p>
        <p><a href="#">▶ Booking </a></p>








        <!-- show login modal -->
        <button id="login-button" type="button" data-toggle="modal" data-target="#LoginModal" name="login_btn">Login</button>

        <!-- Modal -->
        <div class="modal fade" id="LoginModal" role="dialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal">&times;</button>

                <ul class="nav nav-tabs nav-justified" name="login_select">
                  <li class="active"><a data-toggle="tab" href="#login_P">사용자 로그인</a></li>
                  <li><a data-toggle="tab" href="#login_A">관리자 로그인</a></li>
                </ul>

                <div class="tab-content">
                  <div id="login_P" class="tab-pane fade in active">
                    <div id="kakao-logged-group"></div>
                      <a id="custom-login-btn" href="javascript:loginWithKakao()" style="cursor:hand;"></a>
                  </div>

                  <div id="login_A" class="tab-pane fade">
                    <label for="uname"><b>Username</b></label>
                    <input type="text" placeholder="Enter Username" name="uname" required>
                    <label for="psw"><b>Password</b></label>
                    <input type="password" placeholder="Enter Password" name="psw" required>
                    <button type="submit" name="login">Login</button>
                    <!-- <a href="joinform.html" name="join">Join</a> <--></-->
                    <a href="#" data-toggle="modal" data-target="#JoinModal" name="join_btn">Join</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- end of login modal  -->

        <div class="modal fade" id="JoinModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3>Only for Ground_Admin!!!</h3>
              </div>

              <div class="modal-body">
                <div id="join">


                  <label for="email"><b>Email</b></label>
                  <input type="text" placeholder="Enter Email" name="email" required>

                  <label for="psw_A"><b>Password</b></label>
                  <input type="password" placeholder="Enter Password" name="psw_A" required>

                  <label for="psw_repeat"><b>Repeat Password</b></label>
                  <input type="password" placeholder="Repeat password" name="psw_repeat" required>

                  <label for="PIN"><b>PIN</b></label>
                  <input type="text" placeholder="Enter PIN" name="pin" required>

                  <label for="grouond_name"><b>Ground Name</b></label>
                  <input type="text" placeholder="Enter Ground Name" name="grouond_name" required>
                </div>
              </div>

              <div class="modal-footer">
                <button type="submit" name="join">Join</button>
                <button type="reset" name="reset">Reset</button>
              </div>
            </div>
          </div>
        </div>







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
  <!-- main body end -->
</body>

</html>
