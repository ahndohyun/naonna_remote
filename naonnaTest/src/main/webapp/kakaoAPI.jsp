<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>							<!-- 카카오톡 로그인 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aecd4acbce2512282f0d82282be7ebb3"></script>		<!-- 카카오톡 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>			<!-- 카카오톡 지도 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>						<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>					<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>		<!-- 캘린더 라이브러리-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />		<!-- 캘린더 라이브러리-->
<script>
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
										url : '/v1/user/me',
										success : function(res) {
											$("#kakao-profile").append(res.properties.nickname);
											$("#kakao-profile").append($("<img/>",
																	{
																		"src" : res.properties.profile_image,
																		"alt" : res.properties.nickname + "님의 프로필 사진"
																	}));
										},
										fail : function(error) {
											console.log(error);
										}
									});
						}

						function createKakaotalkLogin() {
							$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
							var loginBtn = $("<a/>", {
								"class" : "kakao-login-btn",
								"text" : "로그인"
							});
// 							var loginBtn = $("<img/>", {
// 								"src" : "//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg",
// 								"alt" : "로그인 그림"
// 							});

							loginBtn.click(function() {
								Kakao.Auth.login({
									persistAccessToken : false,
									persistRefreshToken : false,
									success : function(authObj) {
										getKakaotalkUserProfile();
										createKakaotalkLogout();
									},
									fail : function(err) {
										console.log(err);
									}
								});
							});
							$("#kakao-logged-group").prepend(loginBtn)
						}
						
						function createKakaotalkLogout() {
							$("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
							var logoutBtn = $("<a/>", {
								"class" : "kakao-logout-btn",
								"text" : "로그아웃"
							});
							//var logoutBtn = $("<img/>", {
							//	"src" : "//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg",
							//	"alt" : "로그아웃 그림"
							//});
							logoutBtn.click(function() {
								Kakao.Auth.logout();
								createKakaotalkLogin();
								$("#kakao-profile").text("");
								Kakao.Auth.cleanup();
							});
							$("#kakao-logged-group").prepend(logoutBtn);
						}
						if (Kakao.Auth.getRefreshToken() != undefined && Kakao.Auth.getRefreshToken().replace(/ /gi,"") != "") {
							createKakaotalkLogout();
							getKakaotalkUserProfile();
						} else {
							createKakaotalkLogin();
						}
						
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level: 3 //지도의 레벨(확대, 축소 정도)
						};

						var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
					});
	

</script>
</head>
<body>

	<div id="kakao-logged-group"></div>

	<a id="custom-login-btn" href="javascript:loginWithKakao()"> 
	<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" />
	</a>
	
	<div id="kakao-profile">ㅇㅇ</div>
	
	<div id="map" style="width:500px;height:400px;">dd</div>
	
<input type="text" name="datetimes" />

<script>
$(function() {
  $('input[name="datetimes"]').daterangepicker({

	singleDatePicker : true,
	timePicker: true,
    showDropdowns: true, 
//     startDate: moment().startOf('hour'),
//     endDate: moment().startOf('hour').add(0, 'hour'),
    locale: {
//       format: 'M/DD hh:mm A'
    	format: 'YYYY/M/DD'

    }
  });
});
</script>
			
</body>
</html>
