<%@page import="board.boardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.boardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkWrite() {
	 var result = confirm("게시글을 등록하시겠습니까?");
	 if (result == true){     
			 const url = "https://api.cloudinary.com/v1_1/dsbicmz4i/image/upload";	
			 const files = document.getElementById("img").files;
			 var imgUrls = [];
			 
			 Promise.all(
				[...files].map(file => {
					const formData = new FormData();
					formData.append("file", file);
					formData.append("upload_preset", "Productimage");
					
					return fetch(url, {
						method: "POST",
						body: formData
					})
						.then(response => response.json())
						.then(data => { 
							imgUrls.push(data.url);	
						})
				})
			 ).then(() => {			    
				 	const imageElList = document.getElementsByName("imgUrls");			
					 	if(imgUrls[0]!=null) {
						    for(let i = 0; i < imageElList.length; i++) {	
						    	if(imgUrls[i]==null) {break;}
						    	imageElList[i].value = imgUrls[i];
						    }
				    	}
			  }).then(() => {	 
				alert("게시글 등록");
				document.move.submit();  
			}) 
	 }else{   
	     return false;
   } 
}
</script>
</head>
<body>
<%
/* String id = (String)session.getAttribute("id");
if(id==null) {
	response.sendRedirect("MemberloginForm.me");
} */
%> 
<h1>파일첨부</h1>
<form name="move" action="fwriteFormPro.jsp" method="post">
<table border="1">
<tr><td>글쓴이</td>
	<td><input type="text" name="name" value=""></td></tr>
<tr><td id="test">글제목</td>
	<td><input type="text" name="subject" value=""></td></tr>
<tr><td>첨부파일</td>
	<td><input id="img" type="file" name="files[]" multiple></td>
<tr><td>글내용</td>
	<td><textarea name="content" rows="10" cols="20" ></textarea></td></tr>
</table>
<input type="button" value="글쓰기" name ="sub" id="sub" onclick="checkWrite();">
<input type="button" value="돌아가기" onclick="main.jsp"><br>
<input type="hidden" value="url" id="imgUrls0" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls1" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls2" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls3" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls4" name="imgUrls"><br>
</form>
</body>
</html>