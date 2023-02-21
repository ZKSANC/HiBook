<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.market.db.MarketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/css/market.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<!-- 자바 들어가는 곳 -->
<%
ArrayList<MarketDTO> dtolist = (ArrayList<MarketDTO>)request.getAttribute("dtolist");
int currentPage = (Integer)request.getAttribute("currentPage");
int startPage = (Integer)request.getAttribute("startPage");
int pageBlock = (Integer)request.getAttribute("pageBlock");
int endPage= (Integer)request.getAttribute("endPage");
int allPage = (Integer)request.getAttribute("allPage");
%>
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript" src="resource/js/jquery/jquery-3.6.3.js"></script>
<script type="text/javascript"></script>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="/inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<div class="boardContainer">
<!-- 내용 시작 -->

	<h1>거래글 목록</h1>
	<table>
	<tr><td>글번호</td><td>글쓴이</td><td>글제목</td><td>조회수</td><td>등록일</td></tr>
	<%
	for(int i = 0; i < dtolist.size(); i++) {
		MarketDTO dto = dtolist.get(i);
	%>
	<tr>
	<td><%=dto.getMarket_id() %></td>
	<td><%=dto.getInsert_id() %></td>
	<td><a href="MarketContent.ma?market_id=<%=dto.getMarket_id()%>"><%=dto.getTitle() %></a></td>
	<td><%=dto.getView_cnt() %></td>
	<td><%=dto.getInsert_date() %></td>
	</tr>	
		<%
	}
	%>
	</table>
	<% 
	if(startPage > pageBlock) { %>
		<a href="MarketList.ma?pageNum=<%= currentPage-pageBlock%>">🔙</a>
	<% 
	}
	for(int i = startPage; i <= endPage; i++) {	
	%>
		<a href="MarketList.ma?pageNum=<%= i%>"><%= i%></a> 
	<% 
	}
	if(endPage > allPage) {
	%>
		<a href="MarketList.ma?pageNum=<%= currentPage+pageBlock%>">🔜</a> 
	<%
	}
	%>
	<br>
	<input type="button" value="메인으로" onclick="location.href='MemberMain.me'">
	<input type="button" value="거래글 쓰기" onclick="location.href='MarketWriteForm.ma'">
	
<!-- 내용 끝 -->
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="/inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>