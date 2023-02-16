<%@page import="com.itwillbs.util.ComCdDTO"%>
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
<%
String id = (String)session.getAttribute("id");
boardDTO dto = (boardDTO)request.getAttribute("dto");
int length = 0;
for(int i = 0; i < dto.getImgUrls().length; i++) {
	if(!(dto.getImgUrls()[i].equals("url"))) {length++;}
	}

ComCdDTO cdto = new ComCdDTO();
%>
<h1>글 내용 [로그인 : <%=id %>]</h1>
<table border="1">
	<tr><td>글번호</td><td><%=dto.getNum() %></td></tr>
	<tr><td>작성자</td><td><%=dto.getName() %></td></tr>
	<tr><td>등록일</td><td><%=dto.getDate() %></td></tr>
	<tr><td>조회수</td><td><%=dto.getReadcount() %></td></tr>
	<tr><td>글제목</td><td><%=dto.getSubject() %></td></tr>
	<tr><td>글내용</td><td><%=dto.getContent() %></td></tr>
	<% if(length > 0) {
		for(int i = 0; i < length; i++) { %>
	<tr><td>첨부이미지<%=i+1%></td><td><img src="<%= dto.getImgUrls()[i]%>" width=260px ></td></tr>
	 	<% }%>
	<% } else { %>
	<tr><td>첨부이미지</td><td>없음</td></tr>	
	<% }%>
	<tr><td><%=cdto.getCdGrpnms()[0] %></td>
		<td><%=dto.getBook_type() %></td></tr>	
	<tr><td><%=cdto.getCdGrpnms()[1] %></td>
		<td><%=dto.getBook_st() %></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[2] %></td>
		<td><%=dto.getTrade_type() %></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[3] %></td>
		<td><%=dto.getTrade_st() %></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[4] %></td>
		<td><%=dto.getTrade_inperson() %></td></tr>
	<tr><td colspan="2">
	<input type="button" value="게시글목록" onclick="location.href='BoardList.bo'">
	<% 
	if(id != null) {
		if(id.equals(dto.getName())) { %>
			<input type="button" value="게시글삭제"
			onclick="location.href='BoardDeletePro.bo?num=<%=dto.getNum()%>'">
			<input type="button" value="게시글수정"
			onclick="location.href='FileBoardUpdateForm.bo?num=<%=dto.getNum()%>'"></tr>
	<%
		}
	}
	%>
</table>
</body>
</html>