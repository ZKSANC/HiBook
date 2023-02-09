<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function fun1() {
	window.location.reload();
}
</script>
<link href="css/front.css" rel="stylesheet" type="text/css">
<title>Hibook</title>
</head>

<body>

<header>
<div class="topBar">
	<div id="login"><a href="로그인.jsp">로그인</a></div>
	<div id="joinMember"><a href="회원가입.jsp">회원가입</a></div>
</div>

<div class="top">
	<div class="rogo" onclick="fun1()"><h2>Hibook</h2></div>
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

<nav class="navBar">
	<div class="navContanier">
		<ul>
			<li><a href="#">홈</a></li>
			<li><a href="#">중고거래</a></li>
			<li><a href="#">커뮤니티</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</div>
</nav>
</header>

<section class="bannerBack">
	<div class="banner">
		<div class="bannerText">
			<p id="mainText">Hibook 중고책 서점</p>
			<p id="subText">잠자는 책들을 거래해보세요</p>
	    </div>
	</div>
</section>

<article class="board">
	<div class="boardContainer">
		<div class="board1">
			<p id="subject">추천 도서📚</p>
			<p>인기있는 책을 확인하세요!</p>
		 	<div class=cardContainer>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div> 
			</div>
		</div>
		<div class="board1">
			<p id="subject">최신 도서📚</p>
			<p>관심있던 책을 찾아보세요!</p>
			<div class=cardContainer>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div>
			<div class=card></div> 
			</div>
		</div>
		<div class="board2">
			<p id="subject">자유게시판🌼</p>
			<div class="tableBar">
				<table>
				  <thead>
				    <tr>
				      <th>글번호</th>
				      <th>글제목</th>
				      <th>글쓴이</th>
				      <th>조회수</th>
				      <th>등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>8</td>
				      <td>Marco Belinelli</td>
				      <td>G</td>
				      <td>6-5</td>
				      <td>195</td>
				    </tr>
				    <tr>
				      <td>5</td>
				      <td>Carlos Boozer</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>266</td>
				    </tr>
				    <tr>
				      <td>21</td>
				      <td>Jimmy Butler</td>
				      <td>G-F</td>
				      <td>6-7</td>
				      <td>220</td>
				    </tr>
				    <tr>
				      <td>9</td>
				      <td>Luol Deng</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>220</td>
				    </tr>
				    <tr>
				      <td>22</td>
				      <td>Taj Gibson</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>225</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
		<div class="board2">
			<p id="subject">책 리뷰🖋</p>
			<div class="tableBar">
					<table>
				  <thead>
				    <tr>
				 	  <th>글번호</th>
				      <th>글제목</th>
				      <th>글쓴이</th>
				      <th>조회수</th>
				      <th>등록일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>8</td>
				      <td>Marco Belinelli</td>
				      <td>G</td>
				      <td>6-5</td>
				      <td>195</td>
				    </tr>
				    <tr>
				      <td>5</td>
				      <td>Carlos Boozer</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>266</td>
				    </tr>
				    <tr>
				      <td>21</td>
				      <td>Jimmy Butler</td>
				      <td>G-F</td>
				      <td>6-7</td>
				      <td>220</td>
				    </tr>
				    <tr>
				      <td>9</td>
				      <td>Luol Deng</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>220</td>
				    </tr>
				    <tr>
				      <td>22</td>
				      <td>Taj Gibson</td>
				      <td>F</td>
				      <td>6-9</td>
				      <td>225</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
</article>

<footer>
<div class="bottomBar">
	<div id="bottom">
	
	</div>
</div>
</footer>

</body>
</html>