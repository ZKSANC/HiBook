<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mypage.market.MarketDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mypage.wish.WishDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	
<style type="text/css">
.pageNum {
	text-align: center;
}

.button {
 	width: 100px;
 	padding: 0;
 	margin: 10px 20px 10px 0;
 	font-weight: 600;
 	text-align: center;
 	line-height: 35px;
 	color: #fff;
  	border-radius: 5px;
 	transition: all 0.2s;		
 	background: #42444e;
}
</style>
	
	<div class="boardContainer">

<h1>찜목록</h1>

<%
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

ArrayList<MarketDTO> getwishlist=(ArrayList<MarketDTO>)request.getAttribute("getwishlist"); 
		
int currentPage=(Integer)request.getAttribute("currentPage");
int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>

<!-- 체크박스로 선택해 글 여러개 삭제가능  -->
<form action="MypageMultidelWishListPro.mypage" method="post">
<input type="submit" value="삭제" class=button>

<!-- 체크박스 모두 선택하는 함수  -->
<script type="text/javascript">
function allChk(obj){
    var chkObj = document.getElementsByName("chk");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox")
             chkObj[i].checked = true;
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){
             chkObj[i].checked = false;
         }
        }
    }
} 
</script> 

<div class="tableBar">
<table>
<tr><th><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
<th>글번호</th><th>글제목</th>
<th>글쓴이</th><th>가격</th><th>등록일</th></tr>

<%
	for(int i=0; i<getwishlist.size(); i++){
		// 배열 한칸에 내용 가져오기 => MarketDTO 저장 => 출력 
		MarketDTO dto = getwishlist.get(i);
	%>
	<tr>
	<td><input type="checkbox" name="chk" value="<%=dto.getMarket_id() %>"></td>
	<td><%=dto.getMarket_id() %></td>
<%-- 	<td><img src="upload/<%=dto.getContent_img1() %>" width="100" height="100"></td> --%>
	<td><a href="MarketContent.ma?market_id=<%=dto.getMarket_id() %>"><%=dto.getTitle() %></a></td>
	<td><%=dto.getInsert_id() %></td>
	<td><%=dto.getBook_price() %></td>
	<td><%=dateFormat.format(dto.getInsert_date()) %></td><tr>
	<%
}
%>
</table>
</div>
</form>

<div class=pageNum>
<%
//1페이지 이전
if(currentPage > 1){
	%>
	<a href="MypageWishList.mypage?pageNum=<%=currentPage-1%>">&lt;</a>
	<%
}

//페이지 번호 누르면 해당 페이지로 이동 
for(int i=startPage; i<=endPage; i++) {
	%>
	<a href="MypageWishList.mypage?pageNum=<%=i%>"><%=i%></a>
	<% 
}

//1페이지 다음
if(currentPage < pageCount){
	%>
	<a href="MypageWishList.mypage?pageNum=<%=currentPage+1%>">&gt;</a>
	<%
}
%>
</div>

</div>
<!-- 푸터파일들어가는 곳 -->
<jsp:include page="/inc/footer.jsp"/>