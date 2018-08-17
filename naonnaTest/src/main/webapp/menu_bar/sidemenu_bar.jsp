<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	.side-profile {
		margin-left : 50px;
	}
</style>
<script>
  // start 카카오톡 API
    $(document).ready(function() {
 
    	// 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('aecd4acbce2512282f0d82282be7ebb3');
        
			var s = "${sessionScope.forPerson}";
			var n = "${sessionScope.nickname}";
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
	     				if(data.userPhoto != null) {
	     					$('#profileImage').attr('src','/naonnaTest/image/' + data.userPhoto);
	     				}
	     				$('#myPage').append(data.nickname);
	     				$('#myPage').attr("href", "myPage.do?nickname=" + data.nickname);
	     				$('#myTeam').append(data.teamName);
	     				$('#myTeam').attr('href', "team_detail.do?team_name="+data.teamName);
	     				$('#matching').append(data.teamName);
	     				$('#myTeam').attr('href', "myMatching.do?team_name="+data.teamName);
	     				$('#booking').append(data.teamName);
	     				$('#myTeam').attr('href', "myBooking.do?team_name="+data.teamName);
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
	//               	createKakaotalkLogout();
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
				Kakao.Auth.cleanup();
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
  </script>
  
</head>
<body>
  <!-- <div class="container-content"> -->
    <!-- side menu bar start -->
    <div class="side-profile col-sm-3 col-sm-offset-1">
      <div class="card sidecard">
        <img id="profileImage" src="/naonnaTest/resources/a1.jpg" alt="John" style="width:100%">
        <h1>User Name</h1><br/>
        <!--로그인과 로그아웃 구분하기 하위 메뉴에 히든주기!!!!!!!!!!!!!! -->
				<p><a href="#" id="myPage"></a></p>
				<p><a href="#" id="myTeam"></a></p>
				<p><a href="#" id="matching"></a></p>
				<p><a href="#" id="booking"></a></p>

        <!-- show login modal -->
				<button id="login-button" type="button" data-toggle="modal" data-target="#LoginModal" name="login_btn">Login</button>
				<div id="kakao-logout-group">로그아웃</div>
				
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
                <h3>경기장 관리자 회원가입</h3>
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
                  <input type="text" placeholder="Enter Ground Name" name="ground_name" required>
                </div>
              </div>

              <div class="modal-footer">
                <button type="submit" name="join" id="admin_join_btn">Join</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- side menu bar end -->
</body>
</html>