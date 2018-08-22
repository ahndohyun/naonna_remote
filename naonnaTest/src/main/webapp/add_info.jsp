<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String forPerson = (String) request.getAttribute("forPerson");
	// 	out.println("<script>");
	// 	out.println("alert("+ forPerson +")");
	// 	out.println("</script>");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>부가정보 입력 폼</title>
	
<style>
		.add_info{
			width: 600px;
			height: 600px;
			margin-top: 30px;
			margin-left: 400px;
			border: solid black;
			border-left-color: silver;
			border-right-color: silver;
			border-top-width: 30px;
			border-bottom-width: 30px; 
		}
		.first_title{
			text-align: center;
			font-size: 25px;
			display:block;
			margin-top:15px;
		}
		.second_title{
			text-align: center;
			font-size: 18px;
			display:block;
			color: red;
			margin-bottom: 20px;
		}
		.info_label{
			display: block;
			font-size:18px;
			margin-left: 40px;
			margin-bottom: 5px;
		}
		.info_content{
			display: block;
			width: 85%;
			height: 30px;
			margin-left: 40px;
			margin-bottom: 25px;
		}
		.info_area{
			margin-left: 40px;
			margin-bottom: 25px;
			height: 30px;
			width: 200px;	
		}
		.info_gender{
			margin-left: 40px;
			margin-bottom: 25px;
		}
		.info_button{
			float:right;
			border: none;
			outline:0; /* 버튼 누르고 나서 테두리 없애기 위해 */
		  	display: inline-block;
		  	padding: 8px;
		  	color: white;
		  	background-color: silver;
		  	text-align: center;
		  	cursor: pointer;
		  	width: 100px;
		  	font-size: 14px;
		  	margin-right: 15px;
		  	margin-top: 10px;
		}
	</style>
</head>

<body>
	
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