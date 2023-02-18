<%@page import="com.itwillbs.util.ComCdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.util.ComCdDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
String id = (String) session.getAttribute("id");
if (id == null) {
	response.sendRedirect("MemberloginForm.me");
}
// DB com_code 테이블 값 가져오기
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
$(document).ready(function(){ // j쿼리 start
		//멀티이미지 업로드 시 미리보기 불러오기
		$("#img").on("change", function(event) {
			if($(".preview-image").length > 0) { 
				 $(".preview-container").remove();   
				
				 var files = event.target.files;
				 var imageContainer = $("#imgWrap");
					
				 for (var i = 0; i < files.length; i++) {
				 	var file = files[i];
				 	var reader = new FileReader();
				 	reader.onload = (function(theFile) {
				    	return function(e) {
				                var img = $('<img>', {
				                    src: e.target.result,
				                    class: 'preview-image'
				                });
				                var label = $('<div>', {
				                    text: theFile.name,
				                    class: 'preview-label'
				                });
				                var container = $('<div>', {
				                    class: 'preview-container'
				                });
				                container.append(label, img);
				                imageContainer.append(container);
				            };
					})(file);
					reader.readAsDataURL(file);
				}	 
		  }else{
		    	 var files = event.target.files;
				 var imageContainer = $("#imgWrap");
					
				 for (var i = 0; i < files.length; i++) {
				 	var file = files[i];
				 	var reader = new FileReader();
				 	reader.onload = (function(theFile) {
				    	return function(e) {
				                var img = $('<img>', {
				                    src: e.target.result,
				                    class: 'preview-image'
				                });
				                var label = $('<div>', {
				                    text: theFile.name,
				                    class: 'preview-label'
				                });
				                var container = $('<div>', {
				                    class: 'preview-container'
				                });
				                container.append(label, img);
				                imageContainer.append(container);
				            };
					})(file);
					reader.readAsDataURL(file);
				}	 
			}
		});
		//미리보기 이미지클릭 시 해당 이미지 및 파일 삭제 동작 
		$("#imgWrap").on("click", ".preview-image", function() {
	 		var fileName = $(this).prev().text(); 
			$(this).parent().remove();
			var files = document.getElementById("img").files;
			var index = 0;
 	 		for (var i = 0; i < files.length; i++) {
				if (files[i].name === fileName) {
					index = i;
				    break;
				}	
			} 	
 	 		const deleteImgFile = (num) => {	
 	 		    const dataTransfer = new DataTransfer();
 	 		    let files = $('#img')[0].files;
 	 		    let fileArray = Array.from(files);
 	 		    fileArray.splice(num, 1);
 	 		    fileArray.forEach(file => { dataTransfer.items.add(file); });
 	 		    $('#img')[0].files = dataTransfer.files;
 	 		  }
 	 		  deleteImgFile(index);
		});
}); // j쿼리 end

	function checkWrite() {
		 //총 이미지 개수 저장
		 var oldImgLength = document.getElementsByClassName("old-image").length;
		 var preImgLength = document.getElementsByClassName("preview-image").length;
		 var totalImgLength = oldImgLength + preImgLength;
		 console.log(totalImgLength);
		 //이미지 개수 제한
		 if(totalImgLength > 5) {
			 alert("한 게시글 당 이미지는 5개까지 올릴 수 있습니다.");
			 return false;
		 }
		 //알림창 확인 클릭 시 클라우디너리 업로드 진행
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
<style>
.preview-image {
	max-width: 200px;
	max-height: 200px;
	margin: 5px;
}
</style>
</head>

<body>
	<h1>파일첨부</h1>
	<form name="move" action="FileBoardWritePro.bo" method="post">
		<table border="1">
			<tr>
				<td>글쓴이</td>
				<td>
					<input type="text" name="name" value="<%=id%>" readonly>
				</td>
			</tr>

			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="subject" value="">
				</td>
			</tr>

			<tr>
				<td>글내용</td>
				<td>
					<textarea name="content" rows="10" cols="20"></textarea>
				</td>
			</tr>

			<!-- select box start -->
			<tr>
				<td><%=cdto.getCdGrpnms()[0]%></td>
				<td>
					<select name="<%=cdtoList0.get(0).getCdGrp()%>">
						<%
						for (int i = 0; i < cdtoList0.size(); i++) {
						%>
						<option value="<%=cdtoList0.get(i).getCdNm()%>"><%=cdtoList0.get(i).getCdNm()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><%=cdto.getCdGrpnms()[1]%></td>
				<td>
					<select name="<%=cdtoList1.get(0).getCdGrp()%>">
						<%
						for (int i = 0; i < cdtoList1.size(); i++) {
						%>
						<option value="<%=cdtoList1.get(i).getCdNm()%>"><%=cdtoList1.get(i).getCdNm()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><%=cdto.getCdGrpnms()[2]%></td>
				<td>
					<select name="<%=cdtoList2.get(0).getCdGrp()%>">
						<%
						for (int i = 0; i < cdtoList2.size(); i++) {
						%>
						<option value="<%=cdtoList2.get(i).getCdNm()%>"><%=cdtoList2.get(i).getCdNm()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><%=cdto.getCdGrpnms()[3]%></td>
				<td>
					<select name="<%=cdtoList3.get(0).getCdGrp()%>">
						<%
						for (int i = 0; i < cdtoList3.size(); i++) {
						%>
						<option value="<%=cdtoList3.get(i).getCdNm()%>"><%=cdtoList3.get(i).getCdNm()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td><%=cdto.getCdGrpnms()[4]%></td>
				<td>
					<select name="<%=cdtoList4.get(0).getCdGrp()%>">
						<%
						for (int i = 0; i < cdtoList4.size(); i++) {
						%>
						<option value="<%=cdtoList4.get(i).getCdNm()%>"><%=cdtoList4.get(i).getCdNm()%>
						</option>
						<%
						}
						%>
					</select>
				</td>
			</tr>
			<!-- select box end -->

			<tr>
				<td>첨부파일</td>
				<td>
					<input id="img" type="file" name="files[]" accept="image/*" multiple>
				</td>
		</table>
		<div id="imgWrap">
			이미지 미리보기<br>
		</div>
		<input type="button" value="글쓰기" name="sub" id="sub" onclick="checkWrite();"> 
		<input type="button" value="돌아가기" onclick="location.href='MemberMain.me'">

		<!-- 클라우디너리 배열값 저장 -->
		<input type="hidden" value="url" id="imgUrls0" name="imgUrls"><br> 
		<input type="hidden" value="url" id="imgUrls1" name="imgUrls"><br> 
		<input type="hidden" value="url" id="imgUrls2" name="imgUrls"><br> 
		<input type="hidden" value="url" id="imgUrls3" name="imgUrls"><br> 
		<input type="hidden" value="url" id="imgUrls4" name="imgUrls"><br>
	</form>
</body>
</html>