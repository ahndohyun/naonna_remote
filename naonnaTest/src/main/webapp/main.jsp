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

<!-- <script>
  // start 카카오톡 API
    $(document).ready(function() {
 
    	// 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('aecd4acbce2512282f0d82282be7ebb3');
        
			var s = "${sessionScope.forPerson}";
			console.log(s);
			
	    		if(s != "") {
					$('#login-button').hide();
	    			outUserInfo(s);
	    			
	    		}
	    		else {
					$('#kakao-logout-group').hide();
	    		}
	    	  
	       function outUserInfo(s) {
				console.log(s);
	     		$.ajax({
	     			url:'/naonnaTest/printUserInfo.do',     			
	     			type:'POST',
	     			dataType: "json",
	     			contentType : 'application/x-www-form-urlencoded; charset=utf-8',
	     			data : {
	     					'forPerson' : s
	     				},
	     			
	     			//제이슨 형식의 리턴된 데이터는 아래의 data가 받음
	     			success:function(data) {
	     				$('#myPage').append(data.nickname);
	     				$('#myTeam').append(data.teamName);
	     				$('#matching').append(data.teamName);
	     				$('#booking').append(data.teamName);
	     				
	     			},
	     			error:function() {
	     				alert("새로고침을 눌러주세요..outUserInfo");			
	     			}
	     		});
	
	       }
	
			function getKakaotalkUserProfile() {
				Kakao.API.request({
		             url: '/v1/user/me',
		             
		             success: function(res) {
		            	 var form = document.kakaoId;
		            	 form.kakao_Id.value = res.id;            	 
		            	 form.action = '/naonnaTest/distUserInfo.do';
		            	 form.method='POST';
		            	 form.submit();
		
		             },
		             fail: function(error) {
		               alert("실패!");
		             }
		        });
			}
	       
	        
	        function createKakaotalkLogin() {
	          $("#kakao-logged-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
	//           var loginBtn = $("<a/>", {
	//             "class": "kakao-login-btn",
	//             "text": "카카오톡으로 로그인"
	//           });
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
	//               	 	 createKakaotalkLogout();
	              },
	              fail: function(err) {
	                console.log(err);
	              }
	            });
	          });
	          $("#kakao-logged-group").prepend(loginBtn)
	        }
	
	        function createKakaotalkLogout() {
	          $("#kakao-logout-group .kakao-logout-btn,#kakao-logged-group .kakao-login-btn").remove();
	          var logoutBtn = $("<a/>", {
	            "class": "kakao-logout-btn",
	            "text": "로그아웃"
	          });
	
	          logoutBtn.click(function() {
	            Kakao.Auth.logout();
	            createKakaotalkLogin();
	            $("#kakao-profile").text("");
	          });
	          $("#kakao-logout-group").prepend(logoutBtn);
	        }
	        
	        $('#kakao-logout-group').on("click", function(){
	        	Kakao.Auth.logout();
	        });
	        
	        if (Kakao.Auth.getRefreshToken() != undefined && Kakao.Auth.getRefreshToken().replace(/ /gi, "") != "") {
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
  </script> -->
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
 </div>
</body>

</html>
