<%@page import="mypage.member.MemberDTO"%>
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
<link href="/resource/css/profile.css" rel="stylesheet" />
<link href="/resource/css/star.css" rel="stylesheet" />
</head>
<body>
	<header>
		<jsp:include page="/inc/header.jsp" />
	</header>
	<%
	String sid = request.getParameter("id");
	String tgt_id = (String) session.getAttribute("id");
	MemberDTO dto = (MemberDTO) request.getAttribute("dto");
	StarReviewDAO sDao = new StarReviewDAO();
	StarReviewDTO sDto = sDao.ReviewStar(tgt_id);

	// 페이징 처리 
		ArrayList<StarReviewDTO> boardList = (ArrayList<StarReviewDTO>) request.getAttribute("boardList");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		int currentPage = (Integer) request.getAttribute("currentPage");
		int startPage = (Integer) request.getAttribute("startPage");
		int pageBlock = (Integer) request.getAttribute("pageBlock");
		int endPage = (Integer) request.getAttribute("endPage");
		int pageCount = (Integer) request.getAttribute("pageCount");
	%>
	<div class="container">
		<div class="main-box">
			<div class="image-container">
				<div class="image-box">
<%-- 					<img src="upload/<%=dto.getMem_img() %>" width="100" height="100"> --%>
					<div class="profile-chat">
						<h4>
							아이디 :
							<%=tgt_id %></h4>
						<h4>
							별점 :
							<%=Double.toString(sDto.getScore()).substring(0, 3)%>
						</h4>
						<button class="jjimbtn">찜목록</button>
						<button class="chatbtn">1:1채팅</button>
					</div>
					<!-- 					<hr class="board-box"> -->
				</div>
			</div>
			<div class="info-container">
				<div class="info-box">
					<ul class="list-group">
						<li class="list-group-item">
							<h6 class="board1">내가쓴 게시글</h6>
						</li>
						<li class="list-group-item">
							<h6 class="board2">내가쓴 판매글</h6>
						</li>
						<li class="list-group-item">
							<h6 class="board3">내가쓴 댓글</h6>
						</li>
					</ul>
				</div>
			</div>
			<div class="reviewbox">
				<%
 					//배열 접근 => for => //배열 한칸에 내용 가져오기 => BoardDTO 저장 => 출력
 					for (int i = 0; i < boardList.size(); i++) {
 						StarReviewDTO sdto = boardList.get(i);
 				%>
				<div class="reviewbox2">
					<table>
						<tr>
							<td><%=sdto.getScore()%></td>
						</tr>
						<tr>
							<td><%=sdto.getInsert_id()%></td>
						</tr>
						<tr>
							<td><%=sdto.getReview_content()%></td>
						</tr>
						<tr>
							<td><%=sdto.getReview_date()%></td>
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
	<footer>
		<jsp:include page="/inc/footer.jsp" />
	</footer>
</body>
</html>