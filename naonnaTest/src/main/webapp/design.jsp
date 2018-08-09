<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link href="assets/css/bootstrap-responsive.css" rel="stylesheet"> -->
<title>Insert title here</title>

<style>
	/* 바디 */
	body{
		background-color:#F2F2F2;
	}
	
	/* 상단메뉴 */
	.mainMenu{
		background-color:red;
		height:100px;
	}
	
	/* 바디컨테이너 */
	.mainBox{
		margin-left:10%;
		margin-right:10%;
	}
	
	/* 사이드메뉴 */
	.sideMenu{
		background-color:yellow;
		display:inline-block;
		height:500px;
	}
	
	/* 본문내용 */
	.bodyContents{
		background-color:blue;
		display:inline-block;
		height:500px;
	}
	
	/* 푸터 */
	.footer{
		background-color:#D8D8D8;
		height:150px;
	}
	
	
</style>
</head>
<body>
	<nav class="mainMenu container col-sm-12">상단 메뉴부분</nav>
	
	
	
	
	<div class="mainBox container col-sm-11">
		<div class="sideMenu container col-sm-2">사이드 메뉴</div>
		
		
		
		<div class="bodyContents container col-sm-9">본문 바디 내용</div>
	</div>
	
	
	
	
	<div class="footer container col-sm-12">footer</div>
	
</body>
</html>