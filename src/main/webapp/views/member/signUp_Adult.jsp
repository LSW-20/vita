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
        height: 1300px;
        position: absolute;
        top: 80px;
	    }
	    .boxbox {
	      margin-top: 110px;
	      width: 79%; 
	      margin-left: 200px !important; 
	    }
	    .col-xl-2{
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
	    .col-xl-10 {
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
	      transform: translateY(-50%); /* 정렬 */
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
	      margin-top: 60px;
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
	        text-align:right;
	    }
	    .title2 {
	        font-size: 14px;
	        color: red;
	        margin-left: 1600px;
	        font-weight: 600;
	        margin-bottom: -10px;
	    }
	    .table.table-borderless {
	      width: 1500px;
	      margin-left: 200px;
	      border-top: 1px solid #161d49;
	      border-bottom: 1px solid #161d49;
	      background-color: #00000009;
	    }
	    #text1{
	      font-size:12px;
	      color:#1F2B6C;
	    }
	    #etc1 {
	      width: 1500px;
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
	    .btn_signupcc {
	      margin-top: 40px;
	      display: flex;
	      justify-content: center;
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
		      margin-top: 2500px;
		  }

            
	</style>

<body>
<%@ include file="/views/common/header.jsp" %>

<section>
            <nav>
              <form action="" method="POST">
                <div class="boxbox" style="display: flex;">
                  <div class="col-xl-2">
                    <p class="line">인증확인</p>
                  </div>
                  <div class="col-xl-10">
                    <p>본인인증을 위해 입력하신 개인정보는 본인인증기관에서 수집하는 정보이며<br>
                    본인인증 외 어떠한 용도로도 이용되거나 별도 저장되지 않습니다.</p>
                    <a href="#"><button type="button" id="e-mail1" class="btn btn-primary" data-toggle="modal" data-target="#myModal">이메일 인증</button></a>
                  </div>
                </div>
                
                  <!-- The Modal -->
                  <div class="modal" id="myModal">
                    <div class="modal-dialog">
                      <div class="modal-content">
                      
                        <!-- Modal Header -->
                        <div class="modal-header">
                          <h3 class="modal-title">이메일(EMAIL)로 인증</h3>
                          <button type="button" class="close1" data-dismiss="modal"> × </button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body">
                          <p>
                            허위 정보를 입력하시는 경우 정확한 본인확인이 불가능하여<br>
                            아이디/비밀번호 분실시 도움을 드리기 어렵습니다.<br>
                            정확한 이메일 주소를 입력해주세요.</p>
                          <div id="modal1" class="modal1">
                            <div class="modal-content1">
                              <p class="e-mail_address">E-MAIL 주소</p>
                              <div class="input-wrapper">
                                <input type="email" placeholder="ex) aaaaa@naver.com" class="email-input">

                                <!-- 인증번호가 발송되었다는 팝업창 하나 더 띄워야함 -->
                                <a href="#"><button class="get-code-btn">인증번호 받기</button></a>
                              </div>
                              
                              <!-- 인증번호가 일치/불일치 메시지는 자바스크립트로 -->
                              <p class="number1">인증번호</p>
                              <div class="input-wrapper">
                                <input type="text" placeholder="인증번호 입력" class="code-input">
                                <button class="verify-btn">인증하기</button>
                              </div>

                              <!-- Modal footer -->
                              <div class="modal-footer1">
                                <button class="cancel-btn" data-dismiss="modal">취소</button>
                                <button type="submit" class="confirm-btn">확인</button></a>
                              </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 회원 정보 입력 칸 -->
                <div>
                  <p class="title1"><strong>회원 정보</strong></p>
                  <p class="title2"> * 필수입력항목</p>
                  <div class="container123">
                          <table class="table table-borderless">
                          <thead>
                              <colgroup>
                                  <col width="200">
                                  <col width="*">
                              </colgroup>
                              <tr>
                                <th><br>이름&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2"><br><input type="text" class="name"><span id="text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정확한 이름을 입력해주세요.</span></td>
                              </tr>
                          </thead>
                          <tbody>
                              <tr>
                                <th>주민등록번호&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2">
                                    <input type="text" id="number2" style="width: 150px;">
                                    <span style="font-size: 20px;">-</span>
                                    <input type="text" id="number2" style="width: 150px;">
                                  </td>
                              </tr>
                              <tr>
                                <th>아이디&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2"><input type="text" class="id_1"><span id="text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6~15자리 영문 소문자, 숫자만 가능합니다.(한글, 특수문자 입력 불가)</span></td>
                              </tr>
                              <tr>
                                <th>비밀번호&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2"><input type="text" class="pwd_1"><span id="text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;특수문자는 ‘!,@,#,$,%,^,&,*’만 가능합니다.</span></td>
                              </tr>
                              <tr>
                                <th>비밀번호 확인&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2"><input type="text" class="pwd_2"></td>
                              </tr>
                              <tr>
                                <th>휴대폰 번호&nbsp;<span style="color:red;">*</span></th>
                                <td colspan="2">
                                    <div>
                                        <select id="phone_number" style="width: 90px; height: 35px;">
                                            <option value="선택">선택</option>
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>
                                        <span style="font-size: 20px;">-</span>
                                        <input type="text" id="phone12" style="width: 150px;">
                                        <span style="font-size: 20px;">-</span>
                                        <input type="text" id="phone12" style="width: 150px;"><span id="text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인 휴대폰번호를 정확하게 입력하세요.</span></td>
                                    </div>
                                </td>
                            </tr>
                              <tr>
                                <th>이메일 주소&nbsp;<span style="color:red;">*</span></th>
                                  <td colspan="2">
                                      <div>
                                          <input type="text" id="e-mail" style="width: 200px;">
                                          <span style="margin: 10px;">@</span>
                                          <select id="email-domain" style="width: 250px; height: 35px;">
                                              <option value="선택">선택</option>
                                              <option value="naver.com">naver.com</option>
                                              <option value="gmail.com">gmail.com</option>
                                              <option value="hanmail.net">hanmail.net</option>
                                              <option value="nate.com">nate.com</option> 
                                          </select><span id="text1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이메일 주소를 입력하세요.</span></td>
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
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">수신함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">수신안함</label>
                              </td>
                          </tr>
                      </tbody>
                    </table>
                   </div>

                   <!-- 이용약관 동의 여부 -->
                   <div>
                    <p class="title1" style="margin-top: 50px;"><strong>이용약관</strong></p>
                    <table id="etc1">
                      <tbody>
                          <tr>
                              <td id="etc2" style="padding: 30px 0 30px 30px;">
                                <strong style="font-size: 20px; color:#2970BA;">제1장 총칙</strong><br>
                                <strong style="font-size: 14px; color:black;">제1조 (목적)</strong><br>
                                한양대학교의료원(이하 "병원"이라 합니다)에서 운영하는 인터넷 홈페이지/모바일 웹, 앱에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)의 이용에 관한 사항을 규정함을 목적으로 합니다.<br><br>
                                <strong style="font-size: 14px; color:black;">제2조 (정의)</strong><br>
                                1. &nbsp;이용자(회원) : 병원 인터넷 홈페이지/모바일 웹, 앱에 로그인하여 본 약관에 따라 병원이 제공 하는 서비스를 받는 자를 말합니다.<br>
                                2. &nbsp;운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 병원에서 선정한 사람<br>
                                3. &nbsp;연결사이트 : 병원 홈페이지/모바일 웹, 앱과 하이퍼링크 방식(하이퍼링크의 대상에는 문자, 정지 및 동화상 등이 포함됨) 등으로 연결된 웹 사이트를 말합니다.<br>
                                4. &nbsp;개인정보 : 당해 정보에 포함되어 있는 성명, ID,환자번호등의 사항에 의하여 특정 개인을 식별할 수 있는 정보<br>
                                &nbsp;&nbsp;&nbsp;&nbsp;(당해 정보만으로는 특정 개인을 인식할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함한다)를 말합니다.<br>
                                5. &nbsp;해지 : 이용자가 서비스 개통 후 이용계약을 해약하는 것<br>
                              </td>
                          </tr>
                          <tr>
                              <!-- 두 번째 행에 라디오 버튼 -->
                              <td class="radio-container" id="etc3" style="border-top: none;">
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">동의함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">동의하지 않음</label>
                              </td>
                          </tr>
                      </tbody>
                    </table>
                   </div>

                   <!-- 개인정보 수집·이용 동의 여부  -->
                   <div>
                    <p class="title1" style="margin-top: 50px;"><strong>개인정보 수집·이용 동의 여부</strong></p>
                    <table id="etc1">
                      <tbody>
                          <tr>
                              <td id="etc2" style="padding: 30px 0 30px 30px;">병원은 다음의 목적을 위하여 개인정보를 활용합니다. 개인정보는 다음 각 호의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라<br>
                                별도의 동의를 받는 등 필요한 조치를 이행할 것입니다.<br><br>
                                개인정보 수집·이용에 대한 동의를 거부할 권리가 있습니다. 그러나 동의를 거부할 경우 회원가입 및 홈페이지 이용이 제한됩니다.<br><br>
                                <strong style="font-size: 14px; color:black;">1. 수집·이용 목적</strong><br>
                                <strong>·</strong> &nbsp;&nbsp;진료예약, 빠른진료예약, 종합검진 예약, 외국인 진료예약, 예약조회 및 회원제 서비스 이용에 따른 본인 확인 절차에 사용<br>
                                <strong>·</strong> &nbsp;&nbsp;진단 및 치료를 위한 진료서비스 제공<br>
                                <strong>·</strong> &nbsp;&nbsp;고객 온라인 상담(고객의소리, 신문고, 칭찬합시다, 암센터 문의) 답변 처리를 위한 자료<br>
                                <strong>·</strong> &nbsp;&nbsp;기업 및 관계자 상담(기업검진 상담, 지역의약품안전센터 보고&상담)<br>
                                <strong>·</strong> &nbsp;&nbsp;건강정보 및 의료 소식지 등 홍보자료 제공<br>
                                <strong>·</strong> &nbsp;&nbsp;의사회원 : 협력병원 체결 및 온라인 진료의뢰, 의뢰환자 검사결과 조회, 진료회신서 회송서비스를 위한 본인 확인 절차에 사용<br>
                                <strong>·</strong> &nbsp;&nbsp;새로운 서비스 및 행사정보 안내 제공<br>
                              </td>
                                
                          </tr>
                          <tr>
                              <!-- 두 번째 행에 라디오 버튼 -->
                              <td class="radio-container" id="etc3" style="border-top: none;">
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">동의함 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                  <input type="radio" id="option1" name="options" value="1">
                                  <label for="option1" style="margin-top: 5px;">동의하지 않음</label>
                              </td>
                          </tr>
                      </tbody>
                    </table>
                   </div>

                   <!-- 동의 거부 시 불이익에 관한 사항 -->
                   <div>
                    <p class="title1" style="margin-top: 50px;"><strong>동의 거부 시 불이익에 관한 사항</strong></p>
                    <table id="etc1">
                      <tbody>
                          <tr>
                              <td id="etc2"><strong style="color: red;">귀하는 위 항목에 대해 동의를 거부할 수 있으며, 동의 후에도 언제든지 철회 가능합니다.</strong><br><br>
                                다만, 수집하는 개인정보는 원활한 서비스 제공을 위해 필요한 최소한의 기본정보로서, 동의를 거부하실 경우에는 회원에게 제공되는 서비스 이용에 제한될 수 있음을 알려드립니다.</td>
                          </tr>
                      </tbody>
                    </table>
                   </div>
                   <div class="btn_signupcc">
                    <a href=""><button type="submit" class="btn btn-primary mx-2" id="signup">회원가입</button></a>
                    <a href=""><button type="button" class="btn btn-primary mx-2" id="cc">취소</button></a>
                </div>
              </form>
            </nav>
        </section>
<%@ include file="/views/common/footer.jsp" %>


</body>
</html>