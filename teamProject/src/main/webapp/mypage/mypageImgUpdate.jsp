<%@page import="mypage.member.MemberDTO"%>
<%@page import="mypage.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	
<style type="text/css">
.content {
	text-align: center;
}

/* id="fr" 모든자손 ul li 줄간격 30px, 목록스타일 없앰,  */
/* 	안여백 위아래 5px 왼오른쪽 10px, 밖 아래 여백 2px  */
#fr ul li {
	line-height: 30px;
	list-style-type: none;
	padding: 5px 10px;
	marign-bottom: 2px;
	color: black;
}

/* id="fr" 모든자손 label 너비 110px, 글자크기 13px, 왼쪽으로 어울림 */
#fr label {
	float: left;
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

<h1>프로필사진 및 닉네임 수정</h1>

<%
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
%>

<div class=content>
<form id="fr" action="MypageImgUpdatePro.mypage" method="post" enctype="multipart/form-data">

<p>
<img src="upload/<%=dto.getMem_img() %>" width="100" height="100"><br>
<ul>

<li>
<label>프로필사진</label> 
<input type="file" name="mem_img">
<input type="hidden" name="oldfile" value="<%=dto.getMem_img()%>"><br>
</li>

<li>
<label>닉네임</label> 
<input type="text" name="nickname" value="<%=dto.getNickname()%>"><br>
</li>
</ul>
</p>

<input type="submit" value="수정" class=button>
</form>
</div>

</div>
<!-- 푸터파일들어가는 곳 -->
<jsp:include page="/inc/footer.jsp"/>