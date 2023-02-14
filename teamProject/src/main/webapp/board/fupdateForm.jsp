<%@page import="com.itwillbs.board.db.boardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkWrite() {
	 var result = confirm("게시글을 수정하시겠습니까?");
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
				alert("게시글 수정");
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
boardDTO dto = (boardDTO)request.getAttribute("dto");
int length = 0;
for(int i = 0; i < dto.getImgUrls().length; i++) {
	if(!(dto.getImgUrls()[i].equals("url"))) {length++;}
}
%>
<h1>파일글수정</h1>
<form action="FileBoardUpdatePro.bo" method="post">
<input type="hidden" name="num" value="<%=dto.getNum() %>">
<table border="1">
	<tr><td>글쓴이</td>
    <td><input type="text" name="name" value="<%=dto.getName() %>" readonly></td></tr>
	<tr><td>글제목</td>
    <td><input type="text" name="subject" value="<%=dto.getSubject() %>"></td></tr>   
	<tr><td>글내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=dto.getContent() %></textarea></td></tr>
	<% for(int i = 0; i < length; i++) { %>
	<tr><td>첨부이미지<%=i+1%></td><td><img src="<%= dto.getImgUrls()[i]%>" width=260px ></td></tr>
	<% } %>
	<tr><td>첨부파일</td><td><input type="file" name="file"></td></tr>
	<tr><td colspan="2">
	<input type="button" value="게시글목록" onclick="location.href='BoardList.bo'"></td></tr>
</table>
</form>
</body>
</html>