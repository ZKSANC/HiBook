<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/front.css" rel="stylesheet" type="text/css">
<title>Hibook</title>
</head>
<body>

<div class="topBar">
	<div id="login"><a href="로그인.jsp">로그인</a></div>
	<div id="joinMember"><a href="회원가입.jsp">회원가입</a></div>
</div>

<div class="top">
	<div class="rogo"><h2>Hibook</h2></div>
	<div class="search">
		<input type="text" value="" id="searchBox" placeholder="검색어 입력"
		>
		<img src="image/search.png">
	</div>
	<div class="mypage">
		<div id="mypageMenu"><a href="판매.jsp">판매하기</a></div>
		<div id="mypageMenu"><a href="마이페이지.jsp">마이페이지</a></div>
		<div id="mypageMenu"><a href="채팅.jsp">1:1 채팅</a></div>
	</div>
</div>

<nav class="container">
</nav>

<header class="bannerBack">
	<div class="banner">
		<div class="bannerText">
			<h1>Hibook 중고책 서점</h1>
			<p>잠자는 책들을 거래해보세요</p>
	    </div>
	</div>
</header>

<div class="boardWrap">
	<div class="tradeBoard"></div>
	<div class="freeBoard"></div>
	<div class="reviewWrap"></div>
</div>

<footer>
<div id="bottom">
</div>
</footer>
</body>
</html>