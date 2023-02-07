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

<div class="top">
	<div id="rogo">Hibook</div>
	<div id="search">
	<form action="search.jsp" method=post>
	<type="text" value="">
	</form>
	</div>
	<div id="login"></div>
</div>

<header class="bannerBack">
	<div class="banner">
		<div class="bannerText">
			<h1>Hibook 중고책 서점</h1>
			<p>잠자는 책들을 거래해보세요</p>
	    </div>
	</div>
</header>

<nav class="container"></nav>

<div id="boardWrap">

<div id="tradeBoard"></div>
<div id="freeBoard"></div>
<div id="reviewWrap"></div>

</div>

<footer>
<div id="bottom">
</div>
</footer>
</body>
</html>