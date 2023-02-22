<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibook</title>

<!-- 공통CSS -->
<link href="resource/css/front.css" rel="stylesheet" type="text/css">

<!-- 자바 들어가는 곳 -->
<%String id = (String)session.getAttribute("id"); %>
<!-- 자바스크립트 들어가는 곳 -->
</head>

<body>

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
				<li><a href="main.do">홈</a></li>
				<li><a href="MarketList.ma">중고거래</a></li>
				<li><a href="BoardList.bo?boardType=free">커뮤니티</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</div>
	</div>	
</nav>
</header>