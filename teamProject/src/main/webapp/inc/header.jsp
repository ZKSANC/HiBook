<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hibook</title>

<!-- 공통CSS -->
<link href="resource/css/front.css" rel="stylesheet" type="text/css">
<link href="../resource/css/header.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resource/js/jquery/jquery-3.6.3.js"></script>
<!-- 자바 들어가는 곳 -->
<%String id = (String)session.getAttribute("id"); 
//관리자여부 받아옴 (관리자 로그인시 마이페이지 대신 관리자페이지 띄움) 
String adminYn = (String)session.getAttribute("adminYn");%>
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
//----------------------------------------chat관련 function
function openchatbox() {
	window.open("ChatList.hi", "a", "width=500, height=700");
}
function getUnread(){
	$.ajax({
		type: "POST",
		url: "./chatUnread",
		data: {
			id: encodeURIComponent('<%= id%>'),
		},
		success: function(result) {
			if(result >= 1){
				showUnread(result);
			} else {
				showUnread('');
			}
		}
	});
}
function getInfiniteUnread(){ //일정시간마다 자신이 읽지않은 메시지 개수를 알려줌
	setInterval(function(){
		getUnread();
	}, 4000); //4초마다 getUnread를 실행 (그래서 ChatUnreadServlet.err이 계속 뜬다. )
}
function showUnread(result){
	$('#unread').html(result);
}

//----------------------------------------chat관련 function end


</script>
</head>

<body>
<!-- 스크립트 파일 들어가는곳 -->
<script type="text/javascript">
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
		<% 	if("Y".equals(adminYn)){ %>
		<div id="mypageMenu" onclick="location.href='MypageMain.mypage'">관리자페이지</div>
	<% 	} else { %>
		<div id="mypageMenu" onclick="location.href='MypageMain.mypage'">마이페이지</div>
	<% 	} %>
	</div>
	<div class="chatMenu"><img class="chatMenuimg cursor-pointer" src="resource/image/closemessage.png" onclick="openchatbox()"><span id="unread" class="boxunread"></span>
	</div>
</div>
<div class="navWrap">
	<div class="navBar">
		<div class="navContanier">
			<ul class="ul-main">
				<li class="li-main cursor-pointer">
					<span onclick="location.href='main.do'">홈</span>
				</li>
				<li class="li-main cursor-pointer" >
					<span onclick="location.href='MarketList.ma'">중고거래</span>
				</li>
				<li class="li-main">
					<span>커뮤니티</span>
				</li>
				<li class="li-main">
					<span>고객센터</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="dropdown-wrap">
		<div class="dropdown-content-wrap">
			<div class="navContanier">
				<ul class="ul-drop-main">
					<li class="li-drop">
						<span class="drop-btn" onclick="location.href='사이트소개'">사이트 소개</span>
						<span class="drop-btn" onclick="location.href='BoardList.bo?boardType=notice'">공지사항</span>
					</li>
					<li class="li-drop">
						<span class="drop-btn" onclick="location.href='MarketList.ma?trade_type=구매'">중고책 구매</span>
						<span class="drop-btn" onclick="location.href='MarketList.ma?trade_type=판매'">중고책 판매</span>
						<span class="drop-btn" onclick="location.href='MarketList.ma?trade_type=무료나눔'">무료나눔</span>
					</li>
					<li class="li-drop">
						<span class="drop-btn" onclick="location.href='BoardList.bo?boardType=free'">자유게시판</span>
						<span class="drop-btn" onclick="location.href='BoardList.bo?boardType=review'">도서리뷰게시판</span>
					</li>
					<li class="li-drop">
						<span class="drop-btn" onclick="location.href='ReportForm.re'">신고하기</span>
						<span class="drop-btn" onclick="location.href='ReportList.re'">신고목록</span>
						<span class="drop-btn" onclick="location.href='List.re'">자주하는 질문</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</header>

	<%
		if(id != null) { // 사용자가 로그인 한 상태
	%>
	<script type="text/javascript">
		$(document).ready(function() { 
			getInfiniteUnread();
		}); 
	</script>	 
	<%
		}
	%>