<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/inc/header.jsp"/>
<link href="/resource/css/member.css" rel="stylesheet" type="text/css">

	<div class= "loginContainer" >
		<h2 class="h2">로그인</h2>
		<form  action="MemberLoginPro.me" method="post">
			
			    <input type="text"  placeholder="아이디" name="id" class="text-field" minlength="3" maxlength="12">
				<input type="password"  placeholder="비밀번호"	name="pass" class="text-field" minlength="3" maxlength="12"> 
				<input type="submit"  value="로그인" class="submit-btn">
				
			</form>
	</div>
	
	<footer>
	<jsp:include page="/inc/footer.jsp"/>
	</footer>



	

