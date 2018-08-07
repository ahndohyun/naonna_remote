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
      이름 : <input type="text" name="name" /><br /><br />
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