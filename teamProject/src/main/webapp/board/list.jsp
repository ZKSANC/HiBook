<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.db.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글목록
<%
ArrayList<boardDTO> dtolist = (ArrayList<boardDTO>)request.getAttribute("dtolist");
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
	boardDTO dto = dtolist.get(i);
%>
<tr>
<td><%=dto.getMarket_id() %></td>
<td><%=dto.getInsert_id() %></td>
<td><a href="BoardContent.bo?boardNum=<%=dto.getMarket_id()%>"><%=dto.getTitle() %></a></td>
<td><%=dto.getView_cnt() %></td>
<td><%=dto.getInsert_date() %></td>
</tr>	
	<%
}
%>
</table>
<% 
if(startPage > pageBlock) { %>
	<a href="BoardList.bo?pageNum=<%= currentPage-pageBlock%>">🔙</a>
<% 
}
for(int i = startPage; i <= endPage; i++) {	
%>
	<a href="BoardList.bo?pageNum=<%= i%>"><%= i%></a> 
<% 
}
if(endPage > allPage) {
%>
	<a href="BoardList.bo?pageNum=<%= currentPage+pageBlock%>">🔜</a> 
<%
}
%>
<br>
<input type="button" value="메인으로" onclick="location.href='MemberMain.me'">
</body>
</html>