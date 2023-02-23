<%@page import="com.itwillbs.market.db.MarketDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/star.css" rel="stylesheet"/>
<script type="text/javascript">
	const urlParams = new URL(location.href).searchParams;

	const id = urlParams.get('insert_id');

	console.log(id)
</script>
</head>
<body>
<%
String insert_id=(String)session.getAttribute("id");
%>
 	<form action="ReviewWritePro.pr" class="mb-3" id="myform" method="post">
	<fieldset>
	<input type="text" name="insert_id" value=>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="score" value="5.0" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="score" value="4.0" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="score" value="3.0" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="score" value="2.0" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="score" value="1.0" id="rate5"><label
			for="rate5">★</label><p>
		<input type="text" name="tgt_id" value=>
	</fieldset>
	
	<div>
		<textarea class="col-auto form-control" type="text" id="reviewContents" name="review_content"
				  placeholder="좋은 수강평을 남겨주시면 Cocolo에 큰 힘이 됩니다! 포인트 5000p도 지급!!"></textarea>
	</div>
	<input type="submit" value="전송">
	<input type="reset" value="취소">	
</form>	
</body>
</html>