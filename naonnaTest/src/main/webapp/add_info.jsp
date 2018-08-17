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
	<meta charset="UTF-8">
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
	<div class="add_info">
		<span class="first_title">부가정보 입력</span>
		<span class="second_title">(유저의 기본 설정 값으로 사용되니 꼭 입력하여 주십시오!!!)</span>
		<form action="insertUserInfo.do" method="POST">
			<input type="hidden" name="forPerson" value=' <%=forPerson%> '/> 
			<label class="info_label">닉네임 *</label>
			<input id="nickname"  class="info_content" name="nickname" type="text" size="20" placeholder="  사용하실 닉네임을 적어주세요." />
			<label class="info_label">사는지역 *</label>
				<select name="city" id="act_city" class="info_area">
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
			<label class="info_label">이메일 *</label> 
			<input class="info_content" name="email" type="email" placeholder=" 이메일을 적어주세요." /> 
			<label class="info_label">성별 *</label> 
			<input class="info_gender" id="gender" name="gender" type="radio" value="남">남 
			<input class="info_gender" id="gender" name="gender" type="radio" value="여">여 
			<label class="info_label">나이 *</label> 
			<input class="info_content" id="birth" name="age" type="number" size="4" placeholder=" 나이를 적어주세요." />
			<input type="submit" class="info_button">
			<input type="reset" class="info_button">
		</form>
	</div>
</body>
</html>