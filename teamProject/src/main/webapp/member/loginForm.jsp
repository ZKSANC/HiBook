<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<meta charset="UTF-8">
<link href="/resource/css/member.css" rel="stylesheet" type="text/css">
<head>

<script>
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

</head>
<body>
<header>
<jsp:include page="/inc/header.jsp"/>
</header>

	<div class= "loginContainer" >
		<h2 class="h2">로그인</h2>
		<form  action="MemberLoginPro.me" method="post">
			
			    <input type="text"  placeholder="아이디" name="id" class="text-field" minlength="3" maxlength="12">
				<input type="password"  placeholder="비밀번호"	name="pass" class="text-field" minlength="3" maxlength="12"> 
				<input type="submit"  value="로그인" class="submit-btn">
				<div class="login-alert log-alert-view">
				</div>
			</form>
	</div>
	
<footer>
	<jsp:include page="/inc/footer.jsp"/>
	</footer>
</body>


	

</html>