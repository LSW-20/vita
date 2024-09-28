<%@ page import="com.br.vita.member.controller.SMTPAuthenticator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비타병원</title>
</head>
<style>
section {
	/* background-color: aqua; */
	width: 100%;
	height: 300px;
	position: absolute;
	top: 80px;
}

.boxbox {
	margin-top: 110px;
	width: 79%;
	margin-left: 200px !important;
}

.emailCheck1 {
	background-color: #A3B3D4;
	color: white;
	padding: 20px 30px;
	font-size: 25px;
	height: 150px;
}

.line {
	display: inline-block;
	padding-bottom: 5px;
	border-bottom: 2px solid white;
}

.emailCheck2 {
	background-color: #00000009;
	font-size: 15px;
	padding: 20px 20px;
}

#e-mail1 {
	margin-top: 10px;
	font-size: 14px;
	width: 160px;
	border-radius: 0px;
	background-color: #666666;
	border: none;
}

.e-mail_address {
	margin-bottom: -5px;
	margin-top: 40px;
	padding-left: 20px;
}

.number1 {
	margin-bottom: -5px;
	margin-top: 30px;
	padding-left: 20px;
}

.input-wrapper {
	position: relative;
	width: 450px;
	margin: 10px 0;
}

.email-input, .code-input {
	width: 97%;
	padding: 10px;
	margin-left: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 16px;
	box-sizing: border-box;
}

.get-code-btn, .verify-btn {
	position: absolute;
	right: 10px;
	top: 50%;
	transform: translateY(-50%); /* 세로축 이동 */
	padding: 5px 10px;
	font-size: 14px;
	background-color: #f0f0f0;
	border: 1px solid #ddd;
	border-radius: 4px;
	cursor: pointer;
	box-sizing: border-box;
}

.input-wrapper .get-code-btn {
	border: 1px solid rgb(46, 46, 46);
	background-color: white;
	width: 150px;
	height: 30px;
	font-size: 13px;
}

.input-wrapper .verify-btn {
	border: 1px solid rgb(46, 46, 46);
	background-color: white;
	width: 150px;
	height: 30px;
	font-size: 13px;
}

.Hpopup-footer1 {
	display: flex;
	justify-content: space-between; /* 버튼들 사이에 공간을 균등하게 배분 */
	padding: 10px;
}

.cancel-btn, .confirm-btn {
	width: 48%;
	padding: 10px;
	font-size: 16px;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 30px;
}

.cancel-btn {
	background-color: #f0f0f0;
	border: 1px solid #ffffff;
}

.confirm-btn {
	background-color: #002f6c;
	color: white;
	border: none;
}

.title1 {
	margin-top: 30px;
	margin-bottom: -20px;
	font-size: 23px;
	margin-left: 200px;
	font-weight: 500;
}

.name, #e-mail, #email-domain, #phone_number, #userSsn, .id_1, .pwd_1,
	.pwd_2, #phone12 {
	border: 1px solid rgb(207, 207, 207);
	border-radius: 5px;
	width: 250px;
}

th {
	text-align: right !important;
}

.title2 {
	font-size: 14px;
	color: red;
	margin-left: 1180px;
	font-weight: 600;
	margin-bottom: 5px;
}

.table.table-borderless {
	width: 1080px;
	margin-left: 200px;
	border-top: 1px solid #161d49;
	border-bottom: 1px solid #161d49;
	background-color: #00000009;
}

#text1, #text2, #text3, #text4, #text5, #text6 {
	font-size: 12px;
	color: #1F2B6C;
	padding-left: 20px;
}

#etc1 {
	width: 1080px;
	border-collapse: collapse; /* 테두리 겹침 방지 */
	margin-top: 40px;
	margin-left: 200px;
}

#etc2 {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
	padding: 30px 0 50px 30px;
	font-size: 14px;
	background-color: #F7FAFC;
}

.radio-container {
	display: flex;
	align-items: center;
	border: 1px solid #ddd;
	padding: 5px 0 5px 30px;
	text-align: left;
	font-size: 14px;
}

.radio-container input {
	margin-right: 10px;
}

#signup, #cc {
	width: 180px;
	padding: 10px;
	font-size: 16px;
	border-radius: 0px;
	cursor: pointer;
	margin-top: 30px;
}

#signup {
	background-color: #002f6c;
	border: 1px solid #ffffff;
}

#cc {
	background-color: #7996B4;
	color: white;
	border: 1px solid #ffffff;
}

footer {
	background-color: #1F2B6C;
	position: absolute;
	width: 100%;
	height: 300px;
	margin-top: 1400px;
}
</style>

<body>
	<%@ include file="/views/common/header.jsp"%>
<%
    SMTPAuthenticator auth = new SMTPAuthenticator();
    String mailId = auth.getMailId();
%>
	<section>
		<nav>	
			<form name="signUpForm" id="signup-form" action="<%=contextPath%>/signUp_adult.me" method="POST" onsubmit="return validateForm()">
				<!-- 회원 정보 입력 칸 -->
				<div style="margin-top: 150px;">
					<p class="title1">
						<strong>회원 가입</strong>
					</p>
					<p class="title2" style="width: 200px;">* 필수입력항목</p>
					<div class="container123 form-group">
						<table class="table table-borderless">
							<tbody>
								<tr>
									<th>아이디&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input id="userId" type="text"
										class="id_1" name="userId">
										<button type="button" class="btn btn-secondary btn-sm"
											onclick="fnIdCheck();">중복확인</button> <span id="text1">6~15자리
											영문 소문자 포함, 숫자만 가능합니다. (한글, 특수문자 입력 불가)</span></td>
								</tr>
								<tr>
									<th>비밀번호&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input id="userPwd" type="password"
										class="pwd_1" name="userPwd" autocomplete="new-password"> <span id="text2">6~15자리의
											영문 대소문자, 숫자, 특수문자는 ‘!,@,#,$,%,^,&,*’만 가능합니다.</span></td>
								</tr>
								<tr>
									<th>비밀번호 확인&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input id="userPwdConfirm" type="password"
										class="pwd_2" name="userPwdConfirm"></td>
								</tr>
								<tr>
									<th>이름&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input type="text" id="userName"
										class="name" name="userName" autocomplete="off"> <span id="text3">정확한
											이름을 입력해주세요.</span></td>
								</tr>
								<tr>
									<th>휴대폰 번호&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input type="text" id="phone" class="name"
										name="phone">
										<!-- Button to Open the Modal -->
									  <button type="button" class="btn btn-secondary btn-sm" onclick="fnHpCheck()">인증</button>
										<span id="text4">-를 포함한 본인 휴대폰번호를 정확하게 입력하세요. &nbsp;&nbsp;ex)010-1111-2222</span></td>
								</tr>
								<tr>
									<th>주소&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2"><input type="text" id="address"
										class="name" name="address"> <span id="text5">상세주소를
											입력해주세요. &nbsp;&nbsp;ex)전라북도 전주시 덕진구 백제대로 78</span></td>
								</tr>
								<tr>
									<th>성별&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2">
										<div>
											남&nbsp;<input type="radio" id="gender" name="gender"
												value="M">&nbsp;&nbsp;&nbsp; 여&nbsp;<input
												type="radio" id="gender" name="gender" value="F">
										</div>
									</td>
								</tr>
								<tr>
									<th>이메일&nbsp;<span style="color: red;">*</span></th>
									<td colspan="2">
										<input class="name" type="text" name="email" id="email" placeholder="휴대폰을 인증해주세요." readOnly/>
									</td>
								</tr>
							</tbody>
						</table>				
					</div>
				</div>
					
				<!-- 이메일 수신 여부 -->
				<div class="form-group">
					<p class="title1" style="margin-top: 50px;">
						<strong>이메일 수신 여부</strong>
					</p>
					<table id="etc1">
						<tbody>
							<tr>
								<td id="etc2">비타의료원에서 제공하는 건강정보 및 병원소식 이메일을 수신하시겠습니까?<br>
									회원 가입 완료 후 이메일 수신 여부는 마이페이지에서 변경하실 수 있습니다.
								</td>
							</tr>
							<tr>
								<!-- 두 번째 행에 라디오 버튼 -->
								<td class="radio-container" id="etc3" style="border-top: none;">
									<input type="radio" id="callbackYN" name="callbackYN" value="Y"
									checked> <label for="callbackYN"
									style="margin-top: 5px;">수신함
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="radio"
									id="callbackYN" name="callbackYN" value="N"> <label
									for="callbackYN" style="margin-top: 5px;">수신안함</label>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div style="width: 1080px; text-align: center; margin-left: 200px;">
					<button type="submit" class="btn btn-primary mx-2" id="signup"
						onclick="onSubmit()">회원가입</button>
					<a href=""><button type="button" class="btn btn-primary mx-2"
							id="cc">취소</button></a>
				</div>
				<input type="hidden" id="userSSN" class="name" name="userSSN">
			</form>
			
			<div class="container">
			 	
			  <!-- The Modal -->
			  <div class="modal fade" id="myModal">
			    <div class="modal-dialog modal-lg">
			      <div class="modal-content">
			      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">인증</h4>
			          <button type="button" class="close" data-dismiss="modal" onclick="resetModal()">&times;</button>
			        </div>
			        
			        <!-- Modal body -->
			        <div class="modal-body">
							<table class="table borderless">
								<tbody>
				          <tr>
										<th>주민등록번호&nbsp;<span style="color: red;">*</span></th>
										<td colspan="2"><input type="text" id="userSsn" class="name" name="userSsn">
										<span id="text6">- 를 포함해서 적어주세요. &nbsp;&nbsp;ex) 900101-2222222</span>
										</td>													
									</tr>
									<tr>
									<th>이메일&nbsp;<span style="color: red;">*</span></th>
										<td colspan="2">
											<div class="container123 form-group" style="display: flex; padding-left: 0px;">
												<form action="<%=contextPath%>/views/member/sendMail.jsp"
												    method="post" id="emailForm">
												    <input type="text" class="name" name="to" id="to"/>
												    <!--받는사람-->
												    <input type="button" class="btn btn-secondary btn-sm" value="인증번호 받기" onclick="sendVerificationCode()"><br>
												    <br>
												    <!--인증받기버튼-->
												    <input type="text" class="name" name="verify" id="verifyInput"/>
												    <!--인증번호입력-->
												    <input type="button" class="btn btn-secondary btn-sm" value="인증하기" onclick="verifyCode()">
												    <!--인증확인버튼-->
												    <input type="hidden" name="from" value="<%=mailId%>" />
												    <!--보내는사람-->
												    <input type="hidden" name="subject" value="비타병원 인증코드입니다." />
												    <!--보낼메일제목-->
												    <input type="hidden" name="content" id="content" />
												    <!--보낼메일내용-->
												</form>
											</div>
										</td>		
									</tr>
								</tbody>
							</table>
			        </div>
			        
			        <!-- Modal footer -->
			        <div class="modal-footer">
			       	  <button type="button" class="btn btn-primary" onclick="fnUserSsnCheck()">완료</button>
			          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="resetModal()">닫기</button>
			        </div>
			        
			      </div>
			    </div>
			  </div>
			  
			</div>
      <style>
			.borderless{
				width: 700px;
				margin-left: 10px;
				background-color: #00000009;
			}
      </style>
			<script>
			//자동완성방지
			window.onload = function() {
          // 모든 name과 password 필드를 선택
          var inputs = document.querySelectorAll('input[name="userName"], input[type="password"]');
          // 각 필드에 autocomplete 속성 추가
          inputs.forEach(function(input) {
              input.setAttribute('autocomplete', 'new-password');
          });
      };
			
			let verificationCode;

			function sendVerificationCode() {
			    const to = document.getElementById('to').value;
			    //console.log("입력된 이메일:", to); // 콘솔에 이메일 값 출력
			    if (validateEmail(to)) {
			        verificationCode = Math.floor(100000 + Math.random() * 900000); // 6자리 랜덤 인증코드 생성
			        //console.log("발송된 코드:", verificationCode);
			        document.getElementById('content').value = verificationCode;
			        document.getElementById('emailForm').submit(); // 폼 제출
			    } else {
			        alert('유효한 이메일 주소를 입력해주세요.');
			    }
			}

			function verifyCode() {
			    const inputCode = document.getElementById('verifyInput').value;
			    if (inputCode == verificationCode) {
			        alert('인증되었습니다.');
			        document.getElementById('to').readOnly = true;
			        document.getElementById('verifyInput').readOnly = true;
			        document.getElementById('to').style.backgroundColor = '#e9e9e9';
			        document.querySelector('input[value="인증번호 받기"]').disabled = true;
			        document.querySelector('input[value="인증하기"]').disabled = true;
			        document.getElementById('email').value = document.getElementById('to').value;
			    } else {
			        alert('인증번호가 일치하지 않습니다.');
			    }
			}

			function validateEmail(to) {
			    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			    return re.test(to);
			}
			
			
   		function onSubmit() {
   	    if (validateForm()) {
   	      document.getElementById("signup-form").submit();
   	    }
   	  }

   		
   		function validateForm() {
 			  event.preventDefault(); // 기본 폼 제출 동작 방지

 			  const email = document.getElementById("email").value;
 			  const userId = document.getElementById("userId").value;
 			  const userPwd = document.getElementById("userPwd").value;
 			  const userPwdConfirm = document.getElementById("userPwdConfirm").value;
 			  const userName = document.getElementById("userName").value;
 			  const phone = document.getElementById("phone").value;
 			  const address = document.getElementById("address").value;
 			  const userSsn = document.getElementById("userSsn").value;
 			  const gender = document.querySelector('input[name="gender"]:checked')?.value;
 		
 			  if (!userId) {
 			    alert("사용자 ID를 입력해 주세요.");
 			    return false;
 			  }
 				if (!document.getElementById("userId").readOnly) {
 			    alert("아이디 중복 확인을 해주세요.");
 			    return false;
 			  }
 			  if (!userPwd) {
 			    alert("비밀번호를 입력해 주세요.");
 			    return false;
 			  }
  			const passwordPattern = /^[a-zA-Z0-9!@#$%^&*]{6,15}$/;
  			if (!passwordPattern.test(userPwd)) {
  			    alert("비밀번호는 6~15자의 영문 대소문자, 숫자, 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
  			    return false;
  			}
 			  if (!userPwdConfirm) {
 			    alert("비밀번호 확인을 입력해 주세요.");
 			    return false;
 			  }
 			  if (userPwd !== userPwdConfirm) {
 			    alert("비밀번호가 일치하지 않습니다.");
 			    return false;
 			  }
 			  if (!userName) {
 			    alert("이름을 입력해 주세요.");
 			    return false;
 			  }
 			  if (!phone) {
 			    alert("전화번호를 입력해 주세요.");
 			    return false;
 			  }
 			 if (!userSsn) {
  			    alert("휴대폰을 인증해주세요.");
  			    return false;
  			  }
 			  if (!address) {
 			    alert("주소를 입력해 주세요.");
 			    return false;
 			  }	  
 			  if (!gender) {
 			    alert("성별을 선택해 주세요.");
 			    return false;
 			  }
 			  return true;
 			}
        	  
        		
	    // 아이디 중복체크용 함수
	    function fnIdCheck() {
	        const $idInput = $("#signup-form input[name=userId]");
	        const userId = $idInput.val();
	        
	    	 // 아이디 유효성 검사
	        const idPattern = /^(?=.*[a-z])[a-z0-9]{6,15}$/;
	        if (!idPattern.test(userId) || /^[0-9]+$/.test(userId)) {
	            alert('아이디는 6~15자리의 영문 소문자 포함, 숫자만 가능합니다.');
	            $idInput.select(); // 다시 입력 유도
	            return;
	        }
	
	        // 사용자가 입력한 아이디값 전달하면서 ajax요청
	        $.ajax({
	            url: '<%=contextPath%>/idcheck.me',
	            data: {checkId: userId},
	            success: function(res){
	                console.log(res);
	                if(res == 'NNNNN'){ // 사용불가능
	                    alert('이미 존재하거나 탈퇴한 회원의 아이디입니다.');
	                    $idInput.select(); // 다시 입력 유도
	                }else{ // 사용가능
	                    if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
	                        $('#signup-form :submit').removeAttr('disabled'); // 회원가입 버튼 활성화
	                        $idInput.prop('readonly', true); // 더이상 아이디 수정 불가하도록
	                    }else{
	                        $idInput.select(); // 다시 입력 유도
	                    }
	                }
	            },
	            error: function() {
	                console.log('아이디 중복체크용 ajax 통신 실패');
	            }
	        });
	    }	
	    
	 		// 휴대폰 중복체크용 함수
	    function fnHpCheck() {
        const $hpInput = $("#signup-form input[name=phone]");
        const phone = $hpInput.val();
        
     		// 이메일 인증 여부 확인
        const emailInput = document.getElementById('email');
        if (emailInput.value) {
            alert('이미 인증되었습니다.');
            return;
        }
        
        
        // 휴대폰 유효성 검사
        const phPattern = /^01[016789]-\d{3,4}-\d{4}$/;
        if (!phPattern.test(phone)) {
            alert('올바른 형식의 휴대폰 번호를 입력하세요. 예: 010-1234-5678');
            $hpInput.select(); // 다시 입력 유도
            return;
        }

        // 사용자가 입력한 휴대폰값 전달하면서 ajax요청
        $.ajax({
            url: '<%=contextPath%>/hpcheck.me',
            data: {checkHp: phone},
            success: function(res){
                console.log(res);
                if(res == 'NNNNN'){ // 사용불가능
                    alert('이미 존재는 번호입니다.');
                    $hpInput.select(); // 다시 입력 유도
                }else{ // 사용가능
										$hpInput.prop('readonly', true); // 더이상 번호 수정 불가하도록
										// 모달 켜기
						        $('#myModal').modal('show');
                }
            },
            error: function() {
                console.log('휴대폰 중복체크용 ajax 통신 실패');
            }
        });
	    }		
	 		
	    function resetModal() {
        document.getElementById('userSsn').value = '';
        document.getElementById('to').value = '';
        document.getElementById('verifyInput').value = '';
        document.querySelector("#signup-form input[name=phone]").prop('readonly', false);
      }
	    
	 		// 주민등록번호 중복체크용 함수
	    function fnUserSsnCheck() {
	      const $userSsnInput = $("#myModal input[name=userSsn]");
	      const userSsn = $userSsnInput.val();
	      
	      // 주민등록번호 유효성 검사
	      const userSsnPattern = /^\d{6}-\d{7}$/;
	      if (!userSsnPattern.test(userSsn)) {
	        alert('올바른 형식의 주민등록번호를 입력하세요. 예: 900101-2222222');
	        $userSsnInput.select(); // 다시 입력 유도
	        return;
	      }

	      // 생년월일 확인
	      const birthDate = userSsn.substring(0, 6);
	      const year = parseInt(birthDate.substring(0, 2), 10);
	      const month = parseInt(birthDate.substring(2, 4), 10) - 1; // 월은 0부터 시작
	      const day = parseInt(birthDate.substring(4, 6), 10);
	      const currentYear = new Date().getFullYear();
	      const fullYear = year < 50 ? 2000 + year : 1900 + year; // 2000년 이후 출생자는 2000년대, 그 이전은 1900년대
	      const age = currentYear - fullYear;

	      if (age < 14) {
	    	    alert("만 14세 미만입니다.");
	    	    return;
	    	}

	      // 사용자가 입력한 주민등록번호값 전달하면서 ajax요청
	      $.ajax({
	        url: '<%=contextPath%>/userSsnCheck.me',
	        data: {checkUserSsn: userSsn},
	        success: function(res){
	          console.log(res);
	          if(res == 'NNNNN'){ // 사용불가능
	            alert('이미 존재하는 주민등록번호입니다.');
	            $userSsnInput.select(); // 다시 입력 유도
	          } else { // 사용가능           
	            if(document.querySelector('input[value="인증하기"]').disabled === true){
	            	alert('인증성공!');
	              document.getElementById('userSSN').value = userSsn;
	              // 모달 닫기
	              $('#myModal').modal('hide');  
	            } else {
	              alert('이메일을 인증해주세요.');
	            }
	          }
	        },
	        error: function() {
	          console.log('주민등록번호 중복체크용 ajax 통신 실패');
	        }
	      });
	    }	
		    
	    // 비밀번호 유효성 검사
	    function validatePassword() {
	        const pwdPattern = /^[a-zA-Z0-9!@#$%^&*]{6,15}$/;
	        const pwd1 = document.querySelector('.pwd_1').value;
	        const pwd2 = document.querySelector('.pwd_2').value;
	        const text2 = document.getElementById('text2');

	        if (!pwdPattern.test(pwd1)) {
	            text2.style.color = 'red';
	            text2.textContent = '비밀번호는 6~15자리의 영문 대소문자, 숫자, 특수문자(!,@,#,$,%,^,&,*)만 가능합니다.';
	            return false;
	        }
	        if (pwd1 !== pwd2) {
	            text2.style.color = 'red';
	            text2.textContent = '비밀번호가 일치하지 않습니다.';
	            return false;
	        }
	        text2.style.color = 'green';
	        text2.textContent = '비밀번호가 유효합니다.';
	        return true;
	    }
   
	    document.querySelector('.pwd_1').addEventListener('blur', function() {
	        validatePassword();
	    });

	    document.querySelector('.pwd_2').addEventListener('blur', function() {
	        validatePassword();
	    });
		    						   
		</script>

		</nav>
	</section>
	<%@ include file="/views/common/footer.jsp"%>


</body>
</html>