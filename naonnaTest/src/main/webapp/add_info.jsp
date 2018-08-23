<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String forPerson = (String)request.getAttribute("forPerson");
// 	out.println("<script>");
// 	out.println("alert("+ forPerson +")");
// 	out.println("</script>");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>
$(document).ready(function() {
     //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
      var idck = 0;
     
          //idck 버튼을 클릭했을 때 
          $("#check").click(function() {
              
              //userid 를 param.
              var nickname =  $("#nickname").val(); 
              
              $.ajax({
                  async: true,
                  type : 'POST',
                  data : nickname,
                  url : "nickcheck.do",
                  dataType : "json",
                  contentType: "application/json; charset=UTF-8",
                  success : function(data) {
                      if (data.cnt > 0) {
                          
                          alert("닉네임이 존재합니다. 다른 아이디를 입력해주세요."); 
                          $("#nickname").focus();
                          
                      
                      } else {
                          alert("사용가능한 아이디입니다.");                        
                        $("#act_city").focus();                       
                          idck = 1;
                    
                      }
                  },
                  error:function( request,status, error) {
      				alert("code:" +request.status + "\n" +"message:" + request.responseText + "\n" + "error :" +error);
      			}
              });            
          });
       });
	</script>
</head>
<body>
<form action="insertUserInfo.do" method = "POST">
<input type="hidden" name="forPerson" value=' <%=forPerson %> ' />
<label>닉네임</label> 
<input id="nickname" name="nickname" type="text" size="20" placeholder="사용하실 닉네임을 적어주세요"/>
<input type="button" value="중복확인" id="check" >
<select name="city" id="act_city">
										<option value=''>구 선택</option>									
										<option>강남구</option>
										<option>강동구</option>
										<option>강북구</option>
										<option>강서구</option>
										<option>관악구</option>
										<option>광진구</option>
										<option>구로구</option>
										<option>금천구</option>
										<option>노원구</option>
										<option>도봉구</option>
										<option>동대문구</option>
										<option>동작구</option>
										<option>마포구</option>
										<option>서대문구</option>
										<option>서초구</option>
										<option>성동구</option>
										<option>성북구</option>
										<option>송파구</option>
										<option>양천구</option>
										<option>영등포구</option>
										<option>용산구</option>
										<option>은평구</option>
										<option>종로구</option>
										<option>중구</option>
										<option>중랑구</option>
									</select>
<label>이메일</label> <input name="email" type="email" placeholder="이메일을 적어주세요."/>
<label>성별</label> 
<input id="gender" name="gender" type="radio" value="남">남
<input id="gender" name="gender" type="radio" value="여">여
<label>생년월일</label> <input id="birth" name = "age" type="number" size="4" placeholder="나이를 적어주세요"/>	
<input type="submit">
<input type="reset">
</form>
</body>
</html>