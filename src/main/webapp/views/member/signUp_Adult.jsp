<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signUp_Adult</title>
</head>
	<style>
	    section{
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
	    .emailCheck1{
	      background-color:#A3B3D4;
	      color:white;
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
	      background-color:#00000009;
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
	    .modal-header{
	      justify-content: center !important;
	      margin-top: 15px;
	      position: relative;
	    }
	    .modal-title {
	      font-weight: 600;
	      font-size: 25px;
	    }
	    .close1 {
	      border: none;
	      background-color: white;
	      font-size: 30px;
	      position: absolute;
	      top: -15px;
	      right: 7px;
	      cursor: pointer;
	    }
	    .modal-body {
	      text-align: center;
	      color: #1F2B6C;
	      font-size:14px;
	    }
	    .modal-header {
		    justify-content: center;
		    margin-top: 15px;
		    position: relative;
		    padding-right: 0;
		    border-bottom: none;
	    }
	    .modal-footer {
	        border-top: none;
	    }
	    .modal-content1 {
	      text-align: left;
	      font-size: 18px;
	      color: black;
	    }
	    .e-mail_address{
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
	    .modal-footer1 {
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
	    .name, #e-mail, #email-domain, #phone_number, #number2, .id_1, .pwd_1, .pwd_2, #phone12{
	        border: 1px solid rgb(207, 207, 207);
	        border-radius: 5px;
	        width: 250px;
	    }
	    th {
	        text-align:right !important;
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
	    #text1, #text2, #text3, #text4, #text5, #text6{
	      font-size:12px;
	      color:#1F2B6C;
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
	    footer{
		      background-color: #1F2B6C;
		      position:absolute;
		      width: 100%;
		      height: 300px;
		      margin-top: 1500px;
		  }

            
	</style>

<body>
<%@ include file="/views/common/header.jsp" %>

		<section>
            <nav>
              <form id="signup-form" action="<%= contextPath %>/signUp_adult.me" method="POST">
                <div class="container boxbox" style="display: flex; padding: 0%; width: 1080px;">
                  <div class="container emailCheck1" style="width: 15%;">
                    <p class="line">인증확인</p>
                  </div>
                  <div class="container emailCheck2">
                    <p>본인인증을 위해 입력하신 개인정보는 본인인증기관에서 수집하는 정보이며<br>
                    본인인증 외 어떠한 용도로도 이용되거나 별도 저장되지 않습니다.</p>
                    <a href="#"><button type="button" id="e-mail1" class="btn btn-primary" data-toggle="modal" data-target="#myModal">이메일 인증</button></a>
                  </div>
                </div>
                
                  <!-- The Modal -->
                  <!-- <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        Modal Header
                        <div class="modal-header">
                          <h3 class="modal-title">이메일(EMAIL)로 인증</h3>
                          <button type="button" class="close1" data-dismiss="modal"> × </button>
                        </div>
                        
                        Modal body
                        <div class="modal-body">
                          <p>
                            허위 정보를 입력하시는 경우 정확한 본인확인이 불가능하여<br>
                            아이디/비밀번호 분실시 도움을 드리기 어렵습니다.<br>
                            정확한 이메일 주소를 입력해주세요.</p>
                          <div id="modal1" class="modal1">
                            <div class="modal-content1">
                              <p class="e-mail_address">E-MAIL 주소</p>
                              <div class="input-wrapper">
                                <input type="email" placeholder="ex) aaaaa@naver.com" class="email-input" name="email" required>

                                인증번호가 발송되었다는 팝업창 하나 더 띄워야함
                                <a href="#"><button class="get-code-btn">인증번호 받기</button></a>
                              </div>
                              
                              인증번호가 일치/불일치 메시지는 자바스크립트로
                              <p class="number1">인증번호</p>
                              <div class="input-wrapper">
                                <input type="text" placeholder="인증번호 입력" class="code-input">
                                <button class="verify-btn">인증하기</button>
                              </div>

                              Modal footer
                              <div class="modal-footer1">
                                <button class="cancel-btn" data-dismiss="modal">취소</button>
                                <button id="submitBtn" type="button" class="confirm-btn">확인</button>
                              </div>
                          </div>
                        </div>
                      </div>
                      <script>
										  document.getElementById('submitBtn').addEventListener('click', function(event) {
										    event.preventDefault(); // 폼 제출 기본 동작 방지
										
										    const email = document.querySelector('.email-input').value;
										
										    // 이메일 데이터 저장 (예: 로컬 스토리지 사용)
										    localStorage.setItem('userEmail', email);
										
										    // 팝업창 닫기
										    document.getElementById('modal1').style.display = 'none';
										
										    // 추가로 필요한 작업이 있다면 여기에 추가
										    alert('이메일이 저장되었습니다.');
										  });
										</script>
                    </div>
                  </div>
                </div> -->

                <!-- 회원 정보 입력 칸 -->
                <div>
                  <p class="title1"><strong>회원 정보</strong></p>
                  <p class="title2" style="width: 200px;"> * 필수입력항목</p>
                  <div class="container123">
                          <table class="table table-borderless">
								            <tbody>
								                <tr>
								                    <th>아이디&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2"><input type="text" class="id_1" name="userId" required>
								                    <button type="button" class="btn btn-secondary btn-sm" onclick="fnIdCheck();">중복확인</button>
								                    <span id="text1">6~15자리 영문 소문자, 숫자만 가능합니다. (한글, 특수문자 입력 불가)</span></td>
								                </tr>
								                <tr>
								                    <th>비밀번호&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2"><input type="password" class="pwd_1" name="userPwd" required>
								                    <span id="text2">6~15자리의 영문 대소문자, 숫자, 특수문자는 ‘!,@,#,$,%,^,&,*’만 가능합니다.</span></td>
								                </tr>
								                <tr>
								                    <th>비밀번호 확인&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2"><input type="password" class="pwd_2" name="userPwdConfirm" required></td>
								                </tr>
								                <tr>
								                    <th>이름&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                    <input type="text" id="name" class="name" name="userName" required>
								                    <span id="text3">정확한 이름을 입력해주세요.</span></td>
								                </tr>
								                <tr>
								                    <th>휴대폰 번호&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                    <input type="text" id="phone" class="name" name="phone" required>
								                    <span id="text4">- 를 포함한 본인 휴대폰번호를 정확하게 입력하세요. &nbsp;&nbsp;ex)010-1111-2222</span></td>
								                </tr> 
								                <tr>
								                    <th>이메일&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                    <input type="email" class="name" name="email" required>
								                    <span id="text5">@ 를 포함한 본인 이메일주소를 정확하게 입력하세요. &nbsp;&nbsp;ex) aaaaa@naver.com</span></td>
								                </tr> 
								                <tr>
								                    <th>주소&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                        <div>
								                            <input type="text" id="address" class="name" name="address" required>                                        
								                        </div>
								                    </td>
								                </tr>
								                <tr>
								                    <th>주민등록번호&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                    <input type="text" id="number2" class="name" name="userSSN" required>
								                    <span id="text6"> - 를 포함해서 적어주세요. &nbsp;&nbsp;ex) 900101-2222222</span></td>
								                </tr> 
								                <tr>
								                    <th>성별&nbsp;<span style="color:red;">*</span></th>
								                    <td colspan="2">
								                        <div>
								                            남&nbsp;<input type="radio" id="gender" name="gender" value="M" required>&nbsp;&nbsp;&nbsp; 
								                            여&nbsp;<input type="radio" id="gender" name="gender" value="F" required>                                       
								                        </div><br>
								                    </td>
								                </tr>
								            </tbody>
								        </table>
                      </div>
                  </div>

                  <!-- 이메일 수신 여부 -->
                   <div>
                    <p class="title1" style="margin-top: 50px;"><strong>이메일 수신 여부</strong></p>
                    <table id="etc1">
                      <tbody>
                          <tr>
                              <td id="etc2">비타의료원에서 제공하는 건강정보 및 병원소식 이메일을 수신하시겠습니까?<br>
                                회원 가입 완료 후 이메일 수신 여부는 마이페이지에서 변경하실 수 있습니다.</td>
                          </tr>
                          <tr>
                              <!-- 두 번째 행에 라디오 버튼 -->
                              <td class="radio-container" id="etc3" style="border-top: none;">
                                  <input type="radio" id="option1" name="getCallbackYN" value="Y" checked>
                                  <label for="option1" style="margin-top: 5px;">수신함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="radio" id="option2" name="getCallbackYN" value="N">
                                  <label for="option2" style="margin-top: 5px;">수신안함</label>
                              </td>
                          </tr>
                      </tbody>
                    </table>
                   </div>                 
                   <div style="width: 1080px; text-align: center; margin-left: 200px;">
                    <button type="submit" class="btn btn-primary mx-2" id="signup">회원가입</button>
                    <a href=""><button type="button" class="btn btn-primary mx-2" id="cc">취소</button></a>
                </div>
              </form>
              
             	<script>
							    // 아이디 중복체크용 함수
							    function fnIdCheck() {
							        const $idInput = $("#signup-form input[name=userId]");
							        const userId = $idInput.val();
							        
							        // 아이디 유효성 검사
							        const idPattern = /^[a-z0-9]{6,15}$/;
							        if (!idPattern.test(userId)) {
							            alert('아이디는 6~15자리의 영문 소문자와 숫자만 가능합니다.');
							            $idInput.select(); // 다시 입력 유도
							            return;
							        }
							
							        // 사용자가 입력한 아이디값 전달하면서 ajax요청
							        $.ajax({
							            url: '<%= contextPath %>/idcheck.me',
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
							    
							    
							 		// 휴대폰 유효성 검사
							    function validatePhone() {
									    const phonePattern = /^01[016789]-\d{3,4}-\d{4}$/;
									    const phoneValid = document.querySelector('#phone').value;
									    const text4 = document.getElementById('text4');
									    
									    if (!phonePattern.test(phoneValid)) {
									        text4.style.color = 'red';
									        text4.textContent = '올바른 형식의 휴대폰 번호를 입력하세요. 예: 010-1234-5678';
									        return false;				            
									    } else {
									        text4.style.color = 'green';
									        text4.textContent = '휴대폰번호가 유효합니다.';
									        return true;
									    }
									}
									
									document.querySelector('#phone').addEventListener('blur', function() {
									    validatePhone();
									});
							    
									// 주민등록번호 유효성 검사
									function validateSSN() {
									    const ssnPattern = /^\d{6}-\d{7}$/;
									    const ssnValid = document.querySelector('#number2').value;
									    const text6 = document.getElementById('text6');
									    
									    if (!ssnPattern.test(ssnValid)) {
									        text6.style.color = 'red';
									        text6.textContent = '올바른 형식의 주민등록번호를 입력하세요. 예: 900101-2222222';
									        return false;				            
									    } else {
									        text6.style.color = 'green';
									        text6.textContent = '주민등록번호가 유효합니다.';
									        return true;
									    }
									}

									document.querySelector('#number2').addEventListener('blur', function() {
									    validateSSN();
									});
							</script>
              
            </nav>
        </section>
<%@ include file="/views/common/footer.jsp" %>


</body>
</html>