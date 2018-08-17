<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
  <!-- Top menu -->
  <nav class="top_menu navbar-default navbar-fixed-top">
    <!-- Logo div -->
    <div class="navbar-header">
      <a class="navbar-brand" href="home.do">NAONNA</a>
    </div>
    <!-- Logo div end -->

    <!-- Main menu -->
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="ground_info.do" class="firstMenu">대관신청</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle firstMenu" data-toggle="dropdown" href="#">매칭신청
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="matching_search.do" class="secondMenu">매칭 검색/등록</a></li>
            <li><a href="player_search.do" class="secondMenu">용병 모집/등록</a></li>
          </ul>
        </li>
		
		<li><a href="team_search.do" class="firstMenu">팀관리</a></li>

        <li class="dropdown">
          <a class="dropdown-toggle firstMenu" data-toggle="dropdown" href="#">고객센터
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="notice.do" class="secondMenu">공지사항</a></li>
            <li><a href="faq.do" class="secondMenu">FAQ</a></li>
          </ul>
        </li>

        <li class="dropdown">
          <a class="dropdown-toggle firstMenu" data-toggle="dropdown" href="#">관리메뉴
          <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#" class="secondMenu">회원관리</a></li>
            <li><a href="#" class="secondMenu">경기장 등록</a></li>
          </ul>
        </li>
      </ul>
    </div>
    <!-- Main menu end -->
  </nav>
  <!-- end of top menu -->
</body>
</html>