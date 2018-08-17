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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- 캘린더 라이브러리-->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<!-- 캘린더 라이브러리-->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/naonna_main.css">
  <style>
  	.form-box {
  		border : 1px solid black;
  	}
  	.form-group {
  		margin-top : 20px;
  	}
  	#email {
  		margin-left : 0;
  		width : 100%;
  	}
  </style>
  <script>
  $(document).ready(function() {
  	$(function() {
		 var currentDate = new Date();
		 //var tomorrow = currentDate.setDate(currentDate.getDate()+1);
	     $('input[name="datetimes"]').daterangepicker({
		 singleDatePicker : true,
	 	 //timePicker: true,
	     showDropdowns: true, 
	     startDate: moment().startOf('hour'),
	     minDate : "01/01/1940",
		 //endDate: moment().startOf('hour').add(0, 'hour'),
	     locale: {
	       format: 'YYYY/M/DD'
		//format: 'YYYY/M/DD'
		}
	  });
	});
  });
  </script>
</head>
<body>
	<jsp:include page="./menu_bar/topnavi.jsp" flush="true"></jsp:include>
	<div class="container col-sm-8 col-sm-offset-2">
	  <div class="container-fluid form-box">
		<form class="form-horizontal" action="insertUserInfo.do" method = "POST">
			<input type="hidden" name="forPerson" value=' <%=forPerson %> ' />
			<div class="form-group">
				<label class="col-sm-2 control-label" for="nickname">닉네임</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="nickname" name="nickname" size="20" placeholder="사용하실 닉네임을 적어주세요"/>
				</div>
			</div>
			<div class="form-group">
			 	<label class="col-sm-2 control-label" for="city">주소 </label>
			 	<div class="col-sm-4">
				<select class="form-control" name="city" id="act_city">
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
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">성별</label>
				<div class="col-sm-4">
					<label class="checkbox-inline">
					<input id="gender" name="gender" type="radio" value="남"> &nbsp;&nbsp;남</label>
					<label class="checkbox-inline">
					<input id="gender" name="gender" type="radio" value="여"> &nbsp;&nbsp;여</label>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="birth">생년월일</label>
				<div class="col-sm-4">
					<input type="text" id="datePick" name="datetimes" style="width: 100%" />
				</div>
			</div>	
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">메일</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="email" name="email" placeholder="메일을 입력하세요." />
				</div>
			</div>
			
			<input class="btn btn-primary" type="submit">
		</form>
		</div>
		</div>
</body>
</html>