<%@page import="com.itwillbs.wish.WishDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.wish.WishDAO"%>
<%@page import="com.itwillbs.util.ComCdDTO"%>
<%@page import="com.itwillbs.market.db.MarketDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resource/css/market.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<!-- 자바 변수들어가는 곳 -->
<%
String id = (String)session.getAttribute("id");

MarketDTO dto = (MarketDTO)request.getAttribute("dto");
ComCdDTO cdto = new ComCdDTO();
WishDAO dao = new WishDAO();

int length = 0;
for(int i = 0; i < dto.getImgUrls().length; i++) {
	if(!(dto.getImgUrls()[i].equals("url"))) {length++;}
}
%>
<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript" src="resource/js/jquery/jquery-3.6.3.js"></script>
<script type="text/javascript">
$(document).ready(function(){ // j쿼리 시작
	/* if() {
		window.open()
	} */
	//처음으로 가져온 찜개수 저장
	var count = <%= dao.getMarketWishCount(dto.getMarket_id())%>
	document.getElementById("wishCount").innerHTML=count;
	if($('.wish-btn').val() === "찜하기") {
		$('#heart').hide(); 
	} 
	// 페이지 이동 없이 MarketWishPro 동작
	$(document).on('click', '.wish-btn', function(){
        var button = $(this);
        $.ajax({ 
            url:'MarketWishPro.ma',
            data:{'market_id':<%=dto.getMarket_id() %>}, 
            success:function(result) { 
                count = result;
                $('#wishCount').html(count);          
                if(button.val() === "찜하기"){
                    button.val("찜취소");
                    $('#heart').show();  
                }else{
                    button.val("찜하기");
                    $('#heart').hide();         
                }
            }   
        });
    });
	
});// j쿼리 끝 
	//마우스 우클릭 시 메뉴 동작
	document.addEventListener("DOMContentLoaded", () => {
 	  var idSpan = document.getElementById("idSpan");
	  var miniMenu = document.getElementById("miniMenu");
	  var mmenu = document.getElementById("mmenu");
	
	  const mouse_end = (event) => {
	    console.log("mouse_end called");
	
	    const is_right_click = (event.which == 3) || (event.button == 2);
	    console.log("is_right_click:", is_right_click);
	
	    if (is_right_click) {
	      miniMenu.style.display = "block";
	      miniMenu.style.position = "absolute";
	      miniMenu.style.zIndex = "1000";
	      miniMenu.style.backgroundColor = "#FBF7FF";
	    }
	  };
	  idSpan.addEventListener("mouseup", mouse_end);
	  
	  const hideMiniMenu = (event) => {
		    console.log("hideMiniMenu called");

		    if (!miniMenu.contains(event.target)) {
		      miniMenu.style.display = "none";
		    }
		  };
		document.addEventListener("click", hideMiniMenu); 
		
		window.oncontextmenu = function () {
		    return false;
		};
	});
	//게시글 삭제 동작
	function checkDelete() {
		var result = confirm("게시글을 삭제하시겠습니까?");
		if (result == true){    
			alert("게시글 삭제");
			window.location.href = "MarketDeletePro.ma?market_id=<%=dto.getMarket_id()%>";
		}else{   
		     return false;
	  } 
	}
</script>
</head>
<body>
<!-- 헤더파일들어가는 곳 -->
<jsp:include page="/inc/header.jsp" />
<!-- 헤더파일들어가는 곳 -->

<div class="boardContainer">
<!-- 내용 시작 -->

	<h1>제품상세</h1>
	
	<table>
		<tr>
		<td>글번호</td>
		<td><%=dto.getMarket_id() %></td>
		</tr>
		
		<tr>
		<td>작성자</td>
		<td><span id="idSpan"><%=dto.getInsert_id() %></span>
		<div id="miniMenu" style="display: none;">
			<div id="mmenu" onclick="location.href='main.do'">menu1</div>	
			<div id="mmenu" onclick="location.href='main.do'">menu2</div>
			<div id="mmenu" onclick="location.href='main.do'">menu3</div>
			<div id="mmenu" onclick="location.href='main.do'">menu4</div>
		</div></td>
		</tr>
			
		<tr>
		<td>등록일</td>
		<td><%=dto.getInsert_date() %></td>
		</tr>
		
		<tr>
		<td>조회수</td>
		<td><%=dto.getView_cnt() %></td>
		</tr>
		
		<tr>
		<td>찜개수</td>
		<td>
		<span id="wishCount"></span>
		<% if(id!=null && !(id.equals(dto.getInsert_id()))) { %>
			<span id="heart">💖</span>
			<% } %>
		<% if(id!=null && !(id.equals(dto.getInsert_id()))){
				ArrayList<WishDTO> wishCheck = dao.wishCheck(dto.getMarket_id(), id);
				if(wishCheck.isEmpty()){ %>
					<input type="button" class="wish-btn" value="찜하기">
				<%} else{ %>
					<input type="button" class="wish-btn" value="찜취소">
				<%
			  }
			}
	    %>
	    </td>
		</tr>
		
		
		<tr>
		<td>글제목</td>
		<td><%=dto.getTitle() %></td>
		</tr>
		
		<tr>
		<td>글내용</td>
		<td><%=dto.getContent() %></td>
		</tr>
		
		<tr>
		<td>가격</td>
		<td><%=dto.getBook_price() %> 원</td>
		</tr>
		
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
			  
	</table>
		<input type="button" value="게시글목록" onclick="location.href='MarketList.ma'">
		<% 
		if(id != null) {
			if(id.equals(dto.getInsert_id())) { %>
				<input type="button" value="게시글삭제" onclick="checkDelete();">
				<input type="button" value="게시글수정" onclick="location.href='MarketUpdateForm.ma?market_id=<%=dto.getMarket_id()%>'">
		<%
			}
		}
		%>
		<input type="button" value="1:1 채팅" onclick="location.href='채팅가상주소'">
		<input type="button" value="신고하기" onclick="location.href='신고가상주소'">
<!-- 내용 끝 -->
</div>

<!-- 푸터 들어가는 곳 -->
<jsp:include page="/inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html>