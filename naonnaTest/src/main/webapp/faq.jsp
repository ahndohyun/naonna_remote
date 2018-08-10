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
  <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
  <script type="text/javascript" src="js/faq.js"></script>
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
  
  <script>
  	function faqFunction(idMyDiv){
  		var objDiv = document.getElementById(idMyDiv);
  		if(objDiv.style.display=="block"){
  			objDiv.style.display = "none";
  		}else{
  			objDiv.style.display = "block";
  		}
  	}
  </script>
  
  <style>
  	.faqTitle{
  		display:inline-block;
  		margin-left: 10%;
  	}
  	.faqTitle2{
  		display:inline-block;
  		margin-left: 10px;
  	}
  	.faqNav{
  		width:70%;
  		margin-left: 10%;
  		margin-top: 20px;
  	}
  	.faqTab{
  		margin-left: 10%;
  	}
  	.question{
  		color: black;
  	}
  	.question:hover{
  		color:black;
  	}
  	.answer{
  		display:none;
  	}
  	table{
  	border:1px solid silver;
  	margin-top: 5px;
  	}
  	.thead{
  		text-align:center;
  	}
  	.table_number{
  		text-align: center;
  	}
  	
  	

  </style>
  
  
  
</head>

<body>
 	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<!-- main contents -->

	<div class="container-content">
		<jsp:include page="./menu_bar/sidemenu_bar.jsp" flush="true"></jsp:include>

  <!-- start main content -->
  <div class="main col-sm-8"><br>
    <div>
  		<h2 class="faqTitle">FAQ</h2>
  		<p class="faqTitle2">자주묻는질문</p>
	</div>

  	<ul class="nav nav-tabs faqNav">
    	<li class="active"><a data-toggle="tab" href="#menu1">대관</a></li>
    	<li><a data-toggle="tab" href="#menu2">매칭</a></li>
	    <li><a data-toggle="tab" href="#menu3">용병</a></li>
	    <li><a data-toggle="tab" href="#menu4">팀</a></li>
  	</ul>

  	<div class="faqTab">
    	<div id="menu1" class="tab-pane faqSection fade in active">
    		<table>
    			<tr>
    				<td class="thead" style="width:100px;">번호</td>
    				<td class="thead" style="width:600px;">내용</td>
    			</tr>
    			<tr>
    				<td class="table_number" rowspan="2">1</td>
    				<td>
    					<a href="#" onclick="faqFunction('faq_01'); return false;" class="question" style="text-decoration:none">상품 교환은 가능한가요?</a>
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<div class="answer" id="faq_01" style="width:600px;">교환의 경우 동일 상품의 재고가 있을 경우 사이즈 교환만 가능합니다.다른 상품으로 교환을 원하실 경우 반품 후 재주문을 해주셔야 합니다. ※ 교환 신청을 하지 않고 상품을 보내는 경우, 분실 우려가 있으니 반드시 마이페이지에서 교환 신청해 주셔야 합니다. </div>
    				</td>
    			</tr>
    		</table>
	    </div>
	    <div id="menu2" class="tab-pane fade">
	    <p>2</p>  
	    </div>
	    <div id="menu3" class="tab-pane fade">
	      
	    </div>
	    <div id="menu4" class="tab-pane fade">
	   
	    </div>
	</div>
  </div>
  <!-- end main content -->
  
  
  </div>
  <!-- main body end -->
</body>

</html>
