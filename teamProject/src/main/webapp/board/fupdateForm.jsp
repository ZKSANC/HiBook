<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.util.ComCdDTO"%>
<%@page import="com.itwillbs.util.ComCdDAO"%>
<%@page import="com.itwillbs.board.db.boardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%
	boardDTO dto = (boardDTO)request.getAttribute("dto");
	int length = 0;
	for(int i = 0; i < dto.getImgUrls().length; i++) {
		if(!(dto.getImgUrls()[i].equals("url"))) {length++;}
	}
	ComCdDAO cdao = new ComCdDAO();
	ComCdDTO cdto = new ComCdDTO();
	ArrayList<ComCdDTO> cdtoList0 = cdao.getComCdList(cdto.getCdGrpnms()[0]);
	ArrayList<ComCdDTO> cdtoList1 = cdao.getComCdList(cdto.getCdGrpnms()[1]);
	ArrayList<ComCdDTO> cdtoList2 = cdao.getComCdList(cdto.getCdGrpnms()[2]);
	ArrayList<ComCdDTO> cdtoList3 = cdao.getComCdList(cdto.getCdGrpnms()[3]);
	ArrayList<ComCdDTO> cdtoList4 = cdao.getComCdList(cdto.getCdGrpnms()[4]);
	%>

<script type="text/javascript" src="js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#option').val('<%=dto.getBook_st() %>').prop("selected",true);
		$('#book_type').val('<%=dto.getBook_type() %>').prop("selected", true);
		$('#trade_st').val('<%=dto.getTrade_st() %>').prop("selected",true);
		$('#trade_type').val('<%=dto.getTrade_type() %>').prop("selected",true);
		$('#trade_inperson').val('<%=dto.getTrade_inperson() %>').prop("selected",true);
	});

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
<h1>파일글수정</h1>
<form name="move" action="FileBoardUpdatePro.bo" method="post">
<input type="hidden" name="num" value="<%=dto.getNum() %>">
<table border="1">
	<tr><td>글쓴이</td>
    <td><input type="text" name="name" value="<%=dto.getName() %>" readonly></td></tr>
    
	<tr><td>글제목</td>
    <td><input type="text" name="subject" value="<%=dto.getSubject() %>"></td></tr>   
    
	<tr><td>글내용</td>
    <td><textarea name="content" rows="10" cols="20"><%=dto.getContent() %></textarea></td></tr>
    
	<% for(int i = 0; i < length; i++) { %>
	<tr><td>첨부이미지<%=i+1%></td>
		<td><img src="<%= dto.getImgUrls()[i]%>" width=260px ></td></tr>
		
	<% } %>
		<tr><td><%=cdto.getCdGrpnms()[0] %></td>
		<td><select name="<%=cdtoList0.get(0).getCdGrp() %>" id="<%=cdtoList0.get(0).getCdGrp() %>">
	         <%
	            for(int i=0; i<cdtoList0.size();i++) {
	         %>
	            <option value="<%=cdtoList0.get(i).getCdNm() %>"><%=cdtoList0.get(i).getCdNm() %>
	            </option>         
	         <%
	            } 
	         %>
	    </select></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[1] %></td>
		<td><select name="<%=cdtoList1.get(0).getCdGrp() %>" id="<%=cdtoList1.get(0).getCdGrp() %>">
	         <%
	            for(int i=0; i<cdtoList1.size();i++) {
	         %>
	            <option value="<%=cdtoList1.get(i).getCdNm() %>"><%=cdtoList1.get(i).getCdNm() %>
	            </option>         
	         <%
	            } 
	         %>
	    </select></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[2] %></td>
		<td><select name="<%=cdtoList2.get(0).getCdGrp() %>" id="<%=cdtoList2.get(0).getCdGrp() %>">
	         <%
	            for(int i=0; i<cdtoList2.size();i++) {
	         %>
	            <option value="<%=cdtoList2.get(i).getCdNm() %>"><%=cdtoList2.get(i).getCdNm() %>
	            </option>         
	         <%
	            } 
	         %>
	    </select></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[3] %></td>
		<td><select name="<%=cdtoList3.get(0).getCdGrp() %>" id="<%=cdtoList3.get(0).getCdGrp() %>">
	         <%
	            for(int i=0; i<cdtoList3.size();i++) {
	         %>
	            <option value="<%=cdtoList3.get(i).getCdNm() %>"><%=cdtoList3.get(i).getCdNm() %>
	            </option>         
	         <%
	            } 
	         %>
	    </select></td></tr>
	<tr><td><%=cdto.getCdGrpnms()[4] %></td>
		<td><select name="<%=cdtoList4.get(0).getCdGrp() %>" id="<%=cdtoList4.get(0).getCdGrp() %>">
	         <%
	            for(int i=0; i<cdtoList4.size();i++) {
	         %>
	            <option value="<%=cdtoList4.get(i).getCdNm() %>"><%=cdtoList4.get(i).getCdNm() %>
	            </option>         
	         <%
	            } 
	         %>
	    </select></td></tr>
	    
	<tr><td>첨부파일</td>
		<td><input id="img" type="file" name="files[]" multiple></td>
	<tr><td colspan="2">
	<input type="button" value="글수정" name ="sub" id="sub" onclick="checkWrite();">
	<input type="button" value="게시글목록" onclick="location.href='BoardList.bo'"></td></tr>
	</table>
	
	<input type="hidden" value="url" id="imgUrls0" name="imgUrls"><br>
	<input type="hidden" value="url" id="imgUrls1" name="imgUrls"><br>
	<input type="hidden" value="url" id="imgUrls2" name="imgUrls"><br>
	<input type="hidden" value="url" id="imgUrls3" name="imgUrls"><br>
	<input type="hidden" value="url" id="imgUrls4" name="imgUrls"><br>
</form>
</body>
</html>