<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>Insert title here</title>
</head>
<body>
   <h1>경기장 등록!!</h1>
   <form id="multiform" action="insertGround.do" method="post">
   <fieldset>
	   경기장이름 : <input type="text" name="ground_Name" /><br /><br />
	  경기장관리자:  <input type="text" name="ground_admin" /><br /><br />
	  경기장주소 : <input type="text" name="ground_addr" /><br /><br /> 
	  경기장(구) : <input type="text" name="ground_city" /><br /><br />    
	   잔디 : <input type="text" name="grass" /><br /><br />
	   샤워시설 : <input type="text" name="shower" /><br /><br />
	   주차장 : <input type="text" name="parking" /><br /><br />   
	    조명 : <input type="text" name="light" /><br /><br />
	  주간오전요금:<input type="text" name="week_morning" /><br /><br />
	 주간오후요금<input type="text" name="week_evening" /><br /><br />
	  주말오전요금<input type="text" name="weekend_morning" /><br /><br />
	  주말오후요금<input type="text" name="weekend_evening" /><br /><br />
	   리뷰 : <input type="text" name="review" /><br /><br />
	      이용규칙 : <input type="text" name="rule" /><br /><br />      
	     수용인원 : <input type="text" name="ground_people" /><br /><br />
	     경기장사이즈  : <input type="text" name="ground_size" /><br /><br />
     
    <!--  파일 : <input type="file" name="imgfile" /><br /><br />      -->
    </fieldset>
       <input type="button" value="서버전달2" onclick="fnAction('insertGround.do')"/>
    
   </form>
   
   <script>
      function fnAction(url) {
         var frm = document.getElementById("multiform");
         frm.action = url;
         frm.submit();
      }
   </script>
</body>
</html>