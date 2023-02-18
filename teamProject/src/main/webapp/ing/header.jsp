<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 공통CSS -->
<link href="/resource/css/front.css" rel="stylesheet" type="text/css">

<!-- 공통JS -->
<script src="/resource/js/jquery/jquery-3.6.3.min.js"></script>

<title>Hibook</title>
</head>

<body>

<header>
<div class="topBar">
	<div id="login"><a href="로그인.jsp">로그인</a></div>
	<div id="joinMember"><a href="회원가입.jsp">회원가입</a></div>
</div>
<div class="top">
	<div class="rogo" onclick="location.href='/main.do'"><h2>Hibook</h2></div>
	<div class="search">
		<input type="text" value="" id="searchBox" placeholder="검색어 입력"
		>
		<img src="/resource/image/search.png">
	</div>
	<div class="mypage">
		<div id="mypageMenu"><a href="판매.jsp">판매하기</a></div>
		<div id="mypageMenu"><a href="마이페이지.jsp">마이페이지</a></div>
		<div id="mypageMenu"><a href="채팅.jsp">1:1 채팅</a></div>
	</div>
</div>
<nav>
	<div class="navBar">
		<div class="navContanier">
			<ul>
				<li><a href="#">홈</a></li>
				<li><a href="#">중고거래</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>
	</div>	
</nav>
</header>