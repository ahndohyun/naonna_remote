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
   <h1>파일 Upload!!</h1>
   <form id="multiform" action="fileUpload2" method="post" enctype="multipart/form-data">
      경기장이름 : <input type="text" name="ground_name" /><br /><br />
      경기장(구) : <input type="text" name="ground_city" /><br /><br />
      경기장주소 : <input type="text" name="ground_addr" /><br /><br />
      잔디 : <input type="text" name="grass" /><br /><br />
      조명 : <input type="text" name="light" /><br /><br />
      샤워시설 : <input type="text" name="shower" /><br /><br />
      주차장 : <input type="text" name="parking" /><br /><br />        
      수용인원 : <input type="text" name="ground_people" /><br /><br />
      경기장사이즈  : <input type="text" name="ground_size" /><br /><br />
       파일 : <input type="file" name="file" /><br /><br />     
      <input type="button" value="서버전달2" onclick="fnAction('fileUpload2')"/>
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