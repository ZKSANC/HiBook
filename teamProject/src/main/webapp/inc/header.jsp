<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibook</title>

<!-- 공통CSS -->
<link href="resource/css/front.css" rel="stylesheet" type="text/css">
<link href="/resource/css/util.css" rel="stylesheet" type="text/css">

<!-- 자바 들어가는 곳 -->
<%String id = (String)session.getAttribute("id"); %>
<!-- 자바스크립트 들어가는 곳 -->

</head>

<body>
<!-- 스크립트 파일 들어가는곳 -->
<script type="text/javascript">
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(e) {
  if (!e.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    for (var d = 0; d < dropdowns.length; d++) {
      var openDropdown = dropdowns[d];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>
<!-- 스크립트 끝. -->
<header>
<div class="topBar">
	<%if (id!=null) { %>
		<div id="login"><%=id%>님 반갑습니다!🤗</div>
		<div id="login" onclick="location.href='MemberLogout.me'">로그아웃</div>
	<% }else{ %>
		<div id="login" onclick="location.href='MemberLoginForm.me'">로그인</div>
		<div id="joinMember" onclick="location.href='MemberInsertForm.me'">회원가입</div>
	<% } %>
</div>
<div class="top">
	<div class="rogo" onclick="location.href='main.do'">
	<h2 id="rogotitle">Hibook</h2>
	</div>
	<div class="search">
		<input type="text" value="" id="searchBox" placeholder="검색어 입력">
		<img src="/resource/image/search.png">
	</div>
	<div class="mypage">
		<div id="mypageMenu" onclick="location.href='MarketWriteForm.ma'">판매하기</div>
		<div id="mypageMenu" onclick="location.href='MypageMain.mypage'">마이페이지</div>
		<div id="mypageMenu" onclick="location.href='1:1채팅'">1:1 채팅</div>
	</div>
</div>
<nav>
	<div class="navBar">
		<div class="navContanier">
			<ul>
				<li class="dropdown">
					<span onclick="myFunction()" class="dropbtn">홈</span>
						<div id="myDropdown" class="dropdown-content">
							<a href="BoardList.bo?boardType=notice">공지사항</a>
						</div>
				</li>
				<li><a href="MarketList.ma">중고거래</a></li>
				<li class="dropdown">
					<span onclick="myFunction()" class="dropbtn">커뮤니티</span>
						<div id="myDropdown" class="dropdown-content">
							<a href="BoardList.bo?boardType=free">자유게시판💬</a>
							<a href="BoardList.bo?boardType=review">도서리뷰게시판💬</a>
						</div>
				</li>
				<li><a href="#">고객센터</a></li>
			</ul>
			
		</div>
	</div>
</nav>
</header>