<%@page import="com.itwillbs.market.db.MarketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resource/css/star.css" rel="stylesheet" />
</head>
<body>
	<%
	String insert_id = (String) session.getAttribute("id");
	%>
	<form action="ReviewWritePro.pr" class="mb-3" id="myform" name="myform"
		method="get">
		<fieldset>
			<input type="hidden" name="insert_id" value=<%=insert_id%>>
			<span class="text-bold"></span> <input type="radio"
				name="score" value="5.0" id="rate1"><label for="rate1">★</label>
			<input type="radio" name="score" value="4.0" id="rate2"><label
				for="rate2">★</label> <input type="radio" name="score" value="3.0"
				id="rate3"><label for="rate3">★</label> <input type="radio"
				name="score" value="2.0" id="rate4"><label for="rate4">★</label>
			<input type="radio" name="score" value="1.0" id="rate5"><label
				for="rate5">★</label>
			<p>
				<input type="hidden" name="tgt_id" id="tgt_id" value="">
		</fieldset>

		<div>
			<textarea class="col-auto form-control" type="text"
				id="reviewContents" name="review_content"
				placeholder="리뷰를 써주시면 다른사람에게 도움이 됩니다."></textarea>
		</div>
		<input type="submit" class = "probtn" value="전송" onclick="TabClose()">
		<input type="button" class = "probtn" value="취소" onclick="close()">
		<script type="text/javascript">
			var urlParams = new URL(location.href).searchParams;
			var id = urlParams.get('insert_id');
			console.log(id);
			document.getElementById("tgt_id").value = id;
			function TabClose() {
				self.opener=self;
	          setTime('close()',3000);
	        }
			
			function close(){
				window.close;
			}
		</script>
	</form>
</body>
</html>