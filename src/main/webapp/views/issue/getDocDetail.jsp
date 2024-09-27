<%@ page import= "java.util.*" %>
<%@ page import= "com.br.vita.issue.model.vo.Mrecords"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Mrecords> records = (List<Mrecords>)request.getAttribute("records");
    String docType = (String)request.getAttribute("docType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetDocumentDetail</title>
<!-- <script src="https://cdn.iamport.kr/js/iamport.payment-1.1.7.js"></script> -->
<!-- Iamport 결제 라이브러리 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<style>
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
  #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 130%;
 }
 #get_doc_apply th{
     background-color:#eaf3fa;
 } 
 #txt_box{
    background-color: #D9D9D9;
    font-size: 15px;
 }
 .hidden {
     display: none;
 }
 footer{
    margin-top: 1300px;
 }
</style>
</head>

<script>
// 오늘 날짜를 YY/MM/DD 형식으로 반환하는 함수
function getTodayDate() {
    var today = new Date();
    var year = String(today.getFullYear()).slice(-2); // 마지막 두 자리만 취함 (YY 형식)
    var month = String(today.getMonth() + 1).padStart(2, '0'); // 월을 2자리로
    var day = String(today.getDate()).padStart(2, '0'); // 일을 2자리로
    return year + '/' + month + '/' + day;
}

function submitDocument(){
	//선택된 라디오 버튼에서 value값 가져오기
	const selectedCareNo = document.querySelector('input[name="careNo"]:checked')
	
	if(selectedCareNo){
		//선택 된 careNo값
		const careNo = selectedCareNo.value;
		
		//신청 버튼 링크에 careNo추가
		const submitLink = document.getElementById('submitLink');
		submitLink.href = '<%= request.getContextPath() %>/confirm.cr?careNo='+careNo+'&docType=<%= docType %>';
	}else {
		alert('진료 기록을 선택 해 주세요.');
	}
}

// 페이지 로드 시 시작일과 종료일의 기본값을 오늘 날짜로 설정
window.onload = function() {
    var today = getTodayDate();
    document.getElementById("startDate").value = today;
    document.getElementById("endDate").value = today;
};

//아임포트

	 const requestPayment = async () => {
	       
     const selectedPG = document.getElementById('cardBank').value;
     // careNo는 페이지에서 hidden input으로 전달된 값을 가져온다고 가정
     var careNo = document.querySelector('input[name="careNo"]:checked').value;
     //docPurpose 의 selected된 value를 결제 성공시 url에 함께 넘기고 싶음
     var docPurpose = document.querySelector('select[name="docPurpose"]').value;     
     
       const IMP = window.IMP; 
     IMP.init("imp03551748");
     IMP.request_pay({
         pg: selectedPG, // 결제할 PG사
         pay_method: 'card', // 결제 방법 (신용카드)
         name: '일반 건강검진(비타병원)', // 상품 이름
         amount: 1, // 결제 금액
         merchant_uid: 'PN_' + new Date().getTime(), // 주문번호(unique)
         buyer_name: '<%= ((Member)session.getAttribute("loginUser")).getUserName() %>', 
         buyer_tel:  '<%= ((Member)session.getAttribute("loginUser")).getPhone() %>',
         buyer_email: '<%= ((Member)session.getAttribute("loginUser")).getEmail() %>',
         buyer_addr:'<%= ((Member)session.getAttribute("loginUser")).getAddress() %>'
     }, function (rsp) {
         if (rsp.success) {
             // 결제 성공 시 처리
             console.log('결제 성공:', rsp);
             alert('결제가 완료되었습니다.');
             isPaymentCompleted = true; // 결제 완료 상태로 설정
             $('#paymentModal').modal('hide'); // 모달 닫기
             location.href = 
             	'<%= request.getContextPath() %>/confirm.cr?careNo=' + careNo + '&docType=<%= docType %>&imp_uid=' + rsp.imp_uid + '&merchant_uid=' + rsp.merchant_uid + '&docPurpose='+docPurpose;
         } else {
             // 결제 실패 시 처리
             console.log('결제 실패:', rsp);
             alert('결제가 실패되었습니다.');
             location.href = 
             	'<%= request.getContextPath() %>/detail.cr';             
         }
     });
 };

 document.addEventListener("DOMContentLoaded", function() {
	    const paymentButton = document.querySelector('button[name="pay"]'); // 결제 버튼

	    if (paymentButton) {
	        paymentButton.addEventListener("click", function(event) {
	            // 선택된 진료 내역(careNo) 확인
	            const selectedCareNo = document.querySelector('input[name="careNo"]:checked');
	           
	            // 선택된 내역이 없을 경우 모달을 띄우지 않고 경고 메시지를 출력
	            if (!selectedCareNo) {
	                alert('진료 내역을 선택해 주세요');
	                event.stopPropagation(); // 결제 모달 표시 방지
	                return; 
	            }

	            // 결제 완료 상태 체크 (이미 결제된 경우 중복 결제 방지)
	            if (isPaymentCompleted) {
	                alert('이미 결제가 완료되었습니다.');
	                event.stopPropagation(); // 이벤트 전파 중단
	                return; // 결제 진행 중단
	            }
	            
	            // 결제 요청
	            requestPayment(); // 검증이 완료된 경우 결제 요청
	        });
	    }
	});

</script>

<body>
    <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document" >
            <div class="modal-content" style="position: absolute; margin-left:-42px; width:900px; height:900px;">
                <div class="modal-header" >
                    <h3 class="modal-title" id="paymentModalLabel"><b>결제</b></h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                        <div class="form-group">
                            <br>
                            <h4><b>결제 내용</b></h4>
                            <br>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td style="border-right: 1px dashed; border-right-color: rgb(204, 204, 204);"><b>선택항목</b></td>
                                        <td><b style="color:#1F2B6C"><%= docType %></b></td>
                                    </tr>
                                    <tr style="border-bottom:1px solid ;border-bottom-color: rgb(224, 222, 222);">
                                        <td style="border-right: 1px dashed; border-right-color: rgb(204, 204, 204);"><b>가격</b></td>
                                        <td><b style="color:#1F2B6C">2,000원</b></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="form-group">
                            <h4><b>결제 수단</b></h4>
                            <br>
                            <label for="paymentMethod">결제 수단 선택</label>
                            <select class="form-control" id="paymentMethod" disabled>
                                <option>신용카드</option>
                            </select>
                            <br>
                            <label for="cardBank">카드 선택</label>
                            <select class="form-control" id="cardBank">
                                <option value="kakaopay" selected>카카오페이</option>
                                <option value="tosspay">토스페이</option>
                                <option value="payco">페이코</option>
                            </select>
                            <br>
                        </div>
                        <br>
                        
                        
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck1">
                            <label class="custom-control-label" for="customCheck1">결제 대행서비스 약관 동의<b style="color:red;">(필수)</b></label>
                        </div>
                        <br>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="customCheck2" >
                            <label class="custom-control-label" for="customCheck2">개인정보 수집 및 이용 동의<b style="color:red;">(필수)</b></label>
                        </div>
                </div>
                
                <div class="modal-footer" style="background-color: #1F2B6C;">
                    <button type="button"  name="payment" class="btn" id="btn-color" style=" width:1197px;" onclick="requestPayment()">
                         <h5>50,000 원 결제하기</h5>
                         </button>    
                </div>
                
            </div>
        </div>
    </div>
	<!-- header sideBar include start -->
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageSideBar.jsp" %>
	<!-- header sideBar include end -->
	
  <div class="container" id="get_doc_content"style="margin-left: -10px;">
		<br><h2><b>&nbsp; 온라인 증명서 신청</b></h2>  
		
	<form id="docDetailForm" method="post" action="<%= request.getContextPath() %>/detail.cr?docType=<%= docType %>">
    <table id="get_doc_apply" class="table m-4">
			<tr>
				<th width="130px">증명서 종류</th>
				<td><%= docType %></td>
			</tr>
        <tr>
            <th>성명</th>
            <td><%= ((Member)session.getAttribute("loginUser")).getUserName() %> 님(등록번호 : <%= ((Member)session.getAttribute("loginUser")).getUserNo() %> )</td>
        </tr>
        <tr>
            <th>발급 용도</th>
            <td>
                <select name="docPurpose">
                    <option value="보험제출" selected>보험제출</option>
                    <option value="회사제출">회사제출</option>
                    <option value="개인소장">개인소장</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>기간</th>
            <td>
                <label for="startDate">시작일:</label>
                <input type="date" id="startDate" name="startDate">
                <label for="endDate">종료일:</label>
                <input type="date" id="endDate" name="endDate">
                <button type="submit">조회</button>
            </td>
        </tr>     
        <tr id="resultRow" <%= (records == null || records.isEmpty()) ? "class='hidden'" : "" %>>
            <th>조회 결과</th>
            <td>
                <%
                    if (records != null && !records.isEmpty()) {
                        for (Mrecords record : records) {
                            %>
                            <input type="radio" name="careNo" value="<%= record.getCareNo() %>">
                            <input type="hidden" name="docNum" value="<%= record.getDocNum() %>">
                            <label><%= record.getTreatmentDate() %> - <%= record.getDiagnosisName() %></label><br>
                            <%
                        }
                    } else {
                        %> 조회 결과가 없습니다. <%
                    }
                %>
            </td>
        </tr>        
        <tr>
            <th>발급비용</th>
            <td>2000원</td>
        </tr>         
        <tr>
            <th>본인인증</th>
            <td>클릭넘어오는값==진료비납입확인서?"본인인증이 필요 없습니다.":버튼활성화</td>
        </tr>             
    </table>
  </form>  
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;온라인 증명서 안내 사항 동의</h4>
    <div id="txt_box" class="m-4"style="padding: 15px;">
    	<b>온라인 증명서 결제시 안내사항</b><br>
		  &nbsp;- 온라인 증명서 결제는 신용카드 결제만 가능합니다.<br>
		  &nbsp;- 온라인 증명서 결제가 불가능한 내역은 재증명창구를 방문해 주시기 바랍니다.<br>
		  &nbsp;- 온라인 증명서는 신청후 취소/환불이 불가능합니다.<br><br>
		
			<b>온라인 증명서 안내사항</b><br>
		  &nbsp;- 확인서에는 병명과 질병분류 코드는 기재되지 않습니다.<br>
		  &nbsp;- 병명 및 질병분류코드는 진단서(소견서)에만 기재가 되며, 원외처방전은 질병분류코드가 기재됩니다.<br>
		  &nbsp;- 진단서 발급은 진료시 의사에게 요청하셔야만 발급이 가능합니다.<br>
		  &nbsp;- PC 인터넷 익스플로러에서만 출력이 가능합니다.<br>
		  &nbsp;- 통원확인서 종류 : 검사사실확인서, 물리·재활치료확인서, 방사선치료확인서, 주사처치사실확인서, 외래진료확인서<br>
		  &nbsp;- 원무팀 업무시간(평일 : 09:00 ~ 17:30, 토요일 : 09:00 ~ 12:30
    </div>

    <div class="d-flex justify-content-end">
        <!-- <a id="submitLink" href="#" class="btn btn-primary btn-sm m-2" onclick="submitDocument();">신청</a> -->
<!--         <button type="button" onclick="requestPayment()">결제하기</button>
 -->        <button type="button" name="pay" class="btn btn-primary btn-sm m-2" id="btn-color" data-toggle="modal" data-target="#paymentModal">
                            결제하기
                        </button>
	  		<button type="button" class="btn btn-secondary btn-sm m-2" onclick="history.back();">뒤로가기</button>
    </div>   

  </div>
  
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>
