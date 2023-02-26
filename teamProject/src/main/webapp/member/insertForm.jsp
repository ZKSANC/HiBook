<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../inc/header.jsp"/>
<link href="/resource/css/member.css" rel="stylesheet" type="text/css">

 <script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
 <script type="text/javascript">
 	// jQuery 준비 => 대상.함수()
 	 	$(document).ready(function(){
//  			alert("준비");
 	// submit 버튼을 클릭했을때 전송되어지면 이벤트 onsubmit()
 		// id="join" 폼태그 표시 => 전송	
	 	$('#join').submit(function(){
// 	 		alert("전송");
		//class="id"
			if($('.mem_id').val()==""){
				alert("아이디를 입력하세요");
				$('.mem_id').focus();
				// 대상 지정 * 전체, h1 태그, id=이름 #이름, class=이름 .이름
			//	$('*').css('color', 'red');
			//	$('form').css('color', 'blue');
				return false;
			}
			if($('.mem_pass').val()==""){
            	alert("비밀번호를 입력하세요");
				$('.mem_pass').focus();
				return false;
            }
            
            if($('.mem_nm').val()==""){
            	alert("이름을 입력하세요");
				$('.name').focus();
				return false;
            }
            
            if($('.nickname').val()==""){
            	alert("닉네임을 입력하세요");
				$('.nickname').focus();
				return false;
            }
            
	 	});
            
            
	 	//
	 	
//		class="dup" 클릭했을때
// 		$('.dup').click(function(){
// //			alert("클릭");
// 			if($('.id').val()==""){
// 				alert("아이디 입력하세요");
// 				$('.id').focus();
// 				return false;
// 			}
// 			// 페이지 이동없이 디비에 가서 중복체크해서 결과를 가져와 출력 
// 			// idCheck.jsp
// 			$.ajax({
// 				url:'MemberIdCheck.me',
// 				data:{'mem_id':$('.mem_id').val()},
// 				success:function(result){
// // 					alert(result);
// 					//result.trim() => 결과값 앞뒤로 공백제거
// 					if(result.trim()=="아이디 중복"){
// 						$('.divresult').html(result).css("color","red");
// 					}else{
// 						$('.divresult').html(result).css("color","blue");
// 					}
// 				}	
				
// 			});
			
		
			
// 		});



 	});//준비
 </script>


	<div class="boardContainer" >
	<form action="MemberInsertPro.me" id="join" method="post" enctype = "multipart/form-data">
		
			<table class="insertTable" >
				<tr>
					<th colspan="2">회원 기본 정보</th>
				</tr>
				<tr>
					<td align="center">아이디 :</td>
					<td><input type="text" id="mem_id" name="mem_id" class="mem_id" 
					placeholder="아이디를 입력해주세요">
<!-- 						<input type="button" value="ID 중복확인" class="dup"> -->
<!-- 						<div class="divresult">아이디 중복체크</div></td> -->
				</tr>
				<tr>
					<td align="center">비밀번호 :</td>
					<td><input type="password" id="mem_pass" name="mem_pass" class="mem_pass" 
					placeholder="비밀번호를 입력해주세요" minlength="6" maxlength="12"></td>
				</tr>
				<tr>
					<td align="center">이름 :</td>
					<td><input type="text" id="mem_nm" name="mem_nm" class="mem_nm" placeholder="이름을 입력해주세요">
					</td>
				</tr>
				<tr>
					<td align="center">닉네임 :</td>
					<td><input type="text" id="nickname" name="nickname" class="nickname" placeholder="별명을 입력해주세요"></td>
				</tr>

				<tr>	
					<td align="center">프로필이미지 :</td>
					<td><input type="file" id="mem_img" name="mem_img" >
					
					</td>
				</tr>
				
				<tr>
					<td align="center">생년월일 :</td>
					<td><input type="date" id="birth" name="birth" 
						style="width: 150px;" >  </td>
				</tr>
				
				<tr>
				<td align="center">주소:
				  
				  </td>
					
       			 <td>
				<input type="text" id="zipcode" name="zipcode"  placeholder="우편번호">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<label>&nbsp;</label><input type="text" id="addr" name="addr"  placeholder="주소"><br>
				<label>&nbsp;</label><input type="text" id="addr_dtl" name="addr_dtl"  placeholder="상세주소">
				<input type="text" id="sample6_extraAddress" placeholder="참고항목">

				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr_dtl").focus();
            }
        }).open();
    }
</script>

        
				</td>
				</tr>
				
				<tr>
					<td align="center">메일주소 :</td>
					<td><input type="text" id="email" name="email" placeholder="예)id@naver.com"></td>
				</tr>
				<tr>
					<td align="center">핸드폰번호 :</td>
					<td><input type="text" id="phone" name="phone" placeholder="000-0000-0000">
					</td>
				</tr>
			
			</table>
					<input type="hidden" id="mem_st" value="정상" name="mem_st" >
					
					<input type="hidden" id="admin_yn" value="N" name="admin_yn" >
					
					<input type="hidden" id="sns_type" name="sns_type" >
					
					<input type="hidden" id="sns_id" name="sns_id" >
					
					<input type="hidden" id="join_date" name="join_date" value="join_date" >
				
					<input type="hidden" id="delete_date" name="delete_date" value="join_date">
					<input type="submit" value="회원 가입" class="submit1">
			</form>	
			</div>
				
				
					
	
	
	
	
<jsp:include page="/inc/footer.jsp"/>



