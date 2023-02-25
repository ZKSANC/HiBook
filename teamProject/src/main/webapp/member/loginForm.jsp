<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="/inc/header.jsp"/>
<!-- 헤더파일들어가는 곳 -->
<link href="/resource/css/member.css" rel="stylesheet" type="text/css">

<!-- 자바스크립트 들어가는 곳 -->
<script type="text/javascript">
alertClassName() {
    var alert  = this.state.alert
    return alert === false ? 'login-alert' : 'login-alert-view'
  }

return (
    <div className={this.alertClassName()}>
        <h5>회원정보를 확인해주세요</h5>
    </div>
)
</script>

<div class="boardContainer">
<!-- 내용 시작 -->

		<div class="loginContainer" >
		
			<h2 class="h2">로그인</h2>
			
			<form  action="MemberLoginPro.me" method="post">
				  <input type="text" placeholder="아이디" name="id" class="text-field" minlength="3" maxlength="12">
					<input type="password"  placeholder="비밀번호"	name="pass" class="text-field" minlength="3" maxlength="12"> 
					<input type="submit"  value="로그인" class="submit-btn">
					<div class="login-alert log-alert-view"></div>
			</form>
			
		</div>
	
</div>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="/inc/footer.jsp"/>
<!-- 푸터 들어가는 곳 -->
