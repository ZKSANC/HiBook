<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.market.db.MarketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>거래글 목록</h1>
<%
ArrayList<MarketDTO> dtolist = (ArrayList<MarketDTO>)request.getAttribute("dtolist");
int currentPage = (Integer)request.getAttribute("currentPage");
int startPage = (Integer)request.getAttribute("startPage");
int pageBlock = (Integer)request.getAttribute("pageBlock");
int endPage= (Integer)request.getAttribute("endPage");
int allPage = (Integer)request.getAttribute("allPage");
%>
<table border="1">
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
</body>
</html>