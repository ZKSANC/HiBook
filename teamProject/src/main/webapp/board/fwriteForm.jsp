<%@page import="com.itwillbs.util.ComCdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.util.ComCdDTO"%>
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
String id = (String)session.getAttribute("id");
if(id==null) {
	response.sendRedirect("MemberloginForm.me");
}

ComCdDAO cdao = new ComCdDAO();
ComCdDTO cdto = new ComCdDTO();
ArrayList<ComCdDTO> cdtoList0 = cdao.getComCdList(cdto.getCdGrpnms()[0]);
ArrayList<ComCdDTO> cdtoList1 = cdao.getComCdList(cdto.getCdGrpnms()[1]);
ArrayList<ComCdDTO> cdtoList2 = cdao.getComCdList(cdto.getCdGrpnms()[2]);
ArrayList<ComCdDTO> cdtoList3 = cdao.getComCdList(cdto.getCdGrpnms()[3]);
ArrayList<ComCdDTO> cdtoList4 = cdao.getComCdList(cdto.getCdGrpnms()[4]);
%> 
<h1>파일첨부</h1>
<form name="move" action="FileBoardWritePro.bo" method="post">
<table border="1">
<tr><td>글쓴이</td>
	<td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>글제목</td>
	<td><input type="text" name="subject" value=""></td></tr>
<tr><td>첨부파일</td>
	<td><input id="img" type="file" name="files[]" multiple></td>
<tr><td>글내용</td>
	<td><textarea name="content" rows="10" cols="20" ></textarea></td></tr>
<tr><td><%=cdto.getCdGrpnms()[0] %></td>
	<td><select>
         <%
            for(int i=0; i<cdtoList0.size();i++) {
         %>
            <option name="<%=cdtoList0.get(i).getCd() %>" value="<%=cdtoList0.get(i).getCd() %>"><%=cdtoList0.get(i).getCdNm() %>
            </option>         
         <%
            } 
         %>
    </select></td></tr>
<tr><td><%=cdto.getCdGrpnms()[1] %></td>
	<td><select>
         <%
            for(int i=0; i<cdtoList1.size();i++) {
         %>
            <option name="<%=cdtoList1.get(i).getCd() %>" value="<%=cdtoList1.get(i).getCd() %>"><%=cdtoList1.get(i).getCdNm() %>
            </option>         
         <%
            } 
         %>
    </select></td></tr>
<tr><td><%=cdto.getCdGrpnms()[2] %></td>
	<td><select>
         <%
            for(int i=0; i<cdtoList2.size();i++) {
         %>
            <option name="<%=cdtoList2.get(i).getCd() %>" value="<%=cdtoList2.get(i).getCd() %>"><%=cdtoList2.get(i).getCdNm() %>
            </option>         
         <%
            } 
         %>
    </select></td></tr>
<tr><td><%=cdto.getCdGrpnms()[3] %></td>
	<td><select>
         <%
            for(int i=0; i<cdtoList3.size();i++) {
         %>
            <option name="<%=cdtoList3.get(i).getCd() %>" value="<%=cdtoList3.get(i).getCd() %>"><%=cdtoList3.get(i).getCdNm() %>
            </option>         
         <%
            } 
         %>
    </select></td></tr>
<tr><td><%=cdto.getCdGrpnms()[4] %></td>
	<td><select>
         <%
            for(int i=0; i<cdtoList4.size();i++) {
         %>
            <option name="<%=cdtoList4.get(i).getCd() %>" value="<%=cdtoList4.get(i).getCd() %>"><%=cdtoList4.get(i).getCdNm() %>
            </option>         
         <%
            } 
         %>
    </select></td></tr>
</table>
<input type="button" value="글쓰기" name ="sub" id="sub" onclick="checkWrite();">
<input type="button" value="돌아가기" onclick="location.href='MemberMain.me'">

<input type="hidden" value="url" id="imgUrls0" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls1" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls2" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls3" name="imgUrls"><br>
<input type="hidden" value="url" id="imgUrls4" name="imgUrls"><br>
</form>
</body>
</html>