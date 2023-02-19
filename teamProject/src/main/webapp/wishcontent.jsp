<%@page import="wish.WishDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="wish.WishDAO"%>
<%@page import="market.MarketDTO"%>
<%@page import="market.MarketDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
</head>
<body>

<h1>책 판매글</h1>

<%
//  http://localhost:8080/webProject/board/content.jsp?num=2
// request 에 저장된 num 파라미터값 가져오기
int market_id=Integer.parseInt(request.getParameter("market_id"));
// // BoardDAO 객체생성
MarketDAO dao=new MarketDAO();
// // 리턴할형 BoardDTO  getBoard(int num) 메서드 정의 
// // BoardDTO  dto = dao.getBoard(num) 메서드 호출
MarketDTO dto=dao.getMarket(market_id);
// 세션값 가져오기
String id=(String)session.getAttribute("id");
%>
<h1>글내용 [로그인 : <%=id %>]</h1>
<table border="1">
<tr><td>글번호</td><td><%=dto.getMarket_id() %></td></tr>
<tr><td>사진</td><td><%=dto.getContent_img1() %></td></tr>
<tr><td>제목</td><td><%=dto.getTitle() %></td></tr>
<tr><td>작성자</td><td><%=dto.getInsert_id() %></td></tr>
<tr><td>가격</td><td><%=dto.getBook_price() %></td></tr>
<tr><td>작성일</td><td><%=dto.getInsert_date() %></td></tr>
<tr><td colspan="2">
<%
// 찜하기/찜취소 버튼 표시하기 
// 로그인 => 세션값 있음
if(id != null){
	// 세션id, 글쓴이 다를때
	if(!id.equals(dto.getInsert_id())){
		// 해당 게시글에서 찜을 한 적이 없으면 (null을 반환하면) 찜버튼 표시
		WishDAO dao2 = new WishDAO();
		ArrayList<WishDTO> wishCheck = dao2.wishCheck(market_id, id);
		if(wishCheck.isEmpty()){ %>
			<button onclick = "location.href='../mypage/wishPro.jsp?market_id=<%=market_id %>'">찜하기</button>
	<% 	}
		// 해당 게시글에서 찜을 한 적이 있으면 찜취소 버튼 표시  
		else{ %>		
			<button onclick = "location.href='../mypage/wishPro.jsp?market_id=<%=market_id %>'">찜취소</button>
		<%
	}
	}
}

// 찜개수 표시하기
WishDAO dao2 = new WishDAO();
int count = dao2.getWishCount(market_id);
%>

찜개수 <%=count %>
 </td></tr>
</table>
</body>
</html>