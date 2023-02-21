<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/inc/header.jsp"/>
	
<style type="text/css">
.content {
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

<h1>회원탈퇴</h1>

<div class=content>

<p>
탈퇴를 위해 현재 비밀번호를 확인해 주세요.
<form action="MypageDeleteUserCheckPro.mypage" method="post">
<input type="password" name="mem_pass"><br>
<input type="submit" value="확인" class=button>
</form>
</p>
</div>

</div>
<!-- 푸터파일들어가는 곳 -->
<jsp:include page="/inc/footer.jsp"/>