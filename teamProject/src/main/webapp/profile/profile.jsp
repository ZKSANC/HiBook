<%@page import="com.itwillbs.review.db.StarReviewDTO"%>
<%@page import="com.itwillbs.review.db.StarReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
// 로그인 ID
//String sid = request.getParameter("id");
String id = (String) session.getAttribute("id");

// 타겟 ID
String tgt_id = (String) request.getAttribute("tgt_id");

// 마이페이지 리뷰가 없는 회원의 NICKNMAE
String nickname = "";
if (request.getParameter("nickname") != null) {
	nickname = request.getParameter("nickname");
}

StarReviewDAO sDao = new StarReviewDAO();
StarReviewDTO dto = sDao.getMemberImg(id);;
StarReviewDTO sdto = sDao.getMemberImg(tgt_id);

// 페이징 처리 
ArrayList<StarReviewDTO> boardList = (ArrayList<StarReviewDTO>) request.getAttribute("boardList");

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
int currentPage = (Integer) request.getAttribute("currentPage");
int startPage = (Integer) request.getAttribute("startPage");
int pageBlock = (Integer) request.getAttribute("pageBlock");
int endPage = (Integer) request.getAttribute("endPage");
int pageCount = (Integer) request.getAttribute("pageCount");

StarReviewDTO sDto = sDao.ReviewStar(tgt_id);
%>
<link href="/resource/css/profile.css" rel="stylesheet" />
</head>
<body>
	<div class="container">
		<div class="main-box">
			<div class="image-container">
				<div class="image-box">
					<div class="profile-chat">
						<%
						if (sdto.getMemImg() == null) {
						%>
						<img src="resource/image/image.png" width="100" height="100">
						<%
						} else 
						{
						%>
						<img src="upload/<%=sdto.getMemImg() %>" width="100" height="100">
						<%
						}
						%>
						<h4 class="profileInfo">
							아이디 :
							<%
						if (sDto.getMemId() == null) {
						%>
							<%=tgt_id%>
							<%
							} else {
							%>
							<%=sDto.getMemId()%>
							<%
							}
							%>
						</h4>
						<h4 class="profileInfo">
							닉네임 :
							<%
						if (sDto.getNickname() == null && !(nickname.equals(""))) {
						%>
							<%=nickname%>
							<%
							} else {
							%>
							<%=sDto.getNickname()%>
							<%
							}
							%>
						</h4>
						<h4 class="profileInfo">
							별점 :
							<%=Double.toString(sDto.getScore()).substring(0, 3)%>
						</h4>
						<h6 class="board1"><a href="MypageMarketList.mypage">중고장터 게시글</a></h6>
						<h6 class="board2"><a href="MypageBoardList.mypage">커뮤니티 게시글</a></h6>
<!-- 						<button type="hidden" class="chatbtn" -->
<%-- 							onclick="location.href='Chat.hi?to_id=<%=dto.getTgt_id()%>'">1:1채팅</button> --%>
					</div>
					<!-- 					<hr class="board-box"> -->
				</div>
			</div>
<!-- 			<div class="info-container"> -->
<!-- 				<div class="info-box"> -->
<!-- 					<ul class="list-group"> -->
<!-- 						<li class="list-group-item"> -->
<!-- 							<h6 class="board1"><a href="MypageMarketList.mypage">중고장터 게시글</a></h6> -->
<!-- 						</li> -->
<!-- 						<li class="list-group-item"> -->
<!-- 							<h6 class="board2"><a href="MypageBoardList.mypage">커뮤니티 게시글</a></h6> -->
<!-- 						</li> -->
<!-- 						<li class="list-group-item"> -->
<!-- 							<h6 class="board2"><a href="MypageReportList.mypage">1:1문의 글</a></h6> -->
<!-- 						</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 			</div> -->
			<div class="reviewbox">
				<%
				//배열 접근 => for => //배열 한칸에 내용 가져오기 => BoardDTO 저장 => 출력
				for (int i = 0; i < boardList.size(); i++) {
					StarReviewDTO Sdto = boardList.get(i);
				%>
				<div class="reviewbox2">
					<table class="reviewTable">
						<colgroup class="TableGroup">
							<col width="50px">
							<col width="50px">
							<col width="*">
							<col width="100px">
						</colgroup>
						<tr class="re_tr">
							<td class="re_td">별점</td>
							<td class="re_td">작성자</td>
							<td class="re_td">리뷰내용</td>
							<td class="re_td">글쓴시간</td>
						</tr>
						<tr class="T_tr1">
							<td class="re_td"><%=Sdto.getScore()%></td>
							<td class="re_td"><%=Sdto.getInsert_id()%></td>
							<td class="re_td"><%=Sdto.getReview_content()%></td>
							<td class="re_td"><%=Sdto.getReview_date()%></td>
						</tr>
					</table>
				</div>
				<%
				}
				%>
				<%
				if (currentPage > 1) {
				%>
				<a href="ReviewBox.pr?pageNum=<%=currentPage - 1%>">[1페이지 이전]</a>
				<%
				}
				//1페이지 다음
				if (currentPage < pageCount) {
				%>
				<a href="ReviewBox.pr?pageNum=<%=currentPage + 1%>">[1페이지 다음]</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var urlParams = new URL(location.href).searchParams;
		var id = urlParams.get('insert_id');
		console.log(id);
		document.getElementById("tgt_id").value = id;
	</script>	
</body>
</html>