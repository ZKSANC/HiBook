<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// request 가져온 데이터 담기 

ArrayList<BoardDTO> freeList = (ArrayList<BoardDTO>) request.getAttribute("freeList");
ArrayList<BoardDTO> reviewList = (ArrayList<BoardDTO>) request.getAttribute("reviewList");
%>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="/inc/header.jsp"/>
<!-- 헤더파일들어가는 곳 -->


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
			<p id="boardTag">추천 도서📚</p>
			<p>인기있는 책을 확인하세요!</p>
		 	<div class="cardContainer">
			<div class="card">
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div> 
			</div>
		</div>
		<div class="board1">
			<p id="boardTag">최신 도서📚</p>
			<p>관심있던 책을 찾아보세요!</p>
			<div class=cardContainer>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div>
			<div class=card>
				<div class="innerCard">
					<div class="innerTop">
						<img src="/resource/image/book.jpg" alt="...">
					</div>
					<div class="innerBottom">
						<div class="cardText">
							<p id="price">가격</p>
							<p id="subject">책제목</p>
							<p id="date">등록일</p>
						</div>
					</div>
				</div>
			</div> 
			</div>
		</div>
		<div class="board2">
			<p id="boardTag">자유게시판💬</p>
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
				    <%
				    // list반복해서 list에 담긴 boardDTO 뿌려주기
				    for (int i = 0; i < freeList.size(); i++) {
						// 배열 한칸에 내용 가져오기 
						BoardDTO dto = freeList.get(i);
						%>
				      <td><%=dto.getBoardId() %></td>
				      <td>
				      	<a href="BoardContent.bo?boardType=<%=dto.getBoardType() %>&boardId=<%=dto.getBoardId()%>">
							<%=dto.getTitle()%>
						</a>
					  </td>
				      <td><%=dto.getInsertId() %></td>
				      <td><%=dto.getViewCnt() %></td>
				      <td><%=dto.getInsertDate() %></td>
				    </tr>
				   <%} %>
				  </tbody>
				</table>
			</div>
		</div>
		<div class="board2">
			<p id="boardTag">책 리뷰💬</p>
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
				    <%
				    // list반복해서 list에 담긴 boardDTO 뿌려주기
				    for (int i = 0; i < reviewList.size(); i++) {
						// 배열 한칸에 내용 가져오기 
						BoardDTO dto = reviewList.get(i);
						%>
				      <td><%=dto.getBoardId() %></td>
				      <td>
				      	<a href="BoardContent.bo?boardType=<%=dto.getBoardType() %>&boardId=<%=dto.getBoardId()%>">
							<%=dto.getTitle()%>
						</a>
					  </td>
				      <td><%=dto.getInsertId() %></td>
				      <td><%=dto.getViewCnt() %></td>
				      <td><%=dto.getInsertDate() %></td>
				    </tr>
				   <%} %>
				    
				  </tbody>
				</table>
			</div>
		</div>
	</div>
</article>



<!-- 푸터파일들어가는 곳 -->
<jsp:include page="/inc/footer.jsp"/>
<!-- 푸터파일들어가는 곳 -->   