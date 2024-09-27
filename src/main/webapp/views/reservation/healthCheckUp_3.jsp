<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>


 <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->

		  <style>
    
    #pad {
      padding-top: 85px;
      padding-left: 93px;
    }
    #img{
        width: 200px;
        height: 200px;
    } 
    #img1{
       width: 220px;
       height: 180px;
    }
    .container11{
      min-width: 1730px;
    }
    .container12{
      min-width: 500px;
    }
    .img-check{
        margin-left: 30px;
        margin-top: 31px;
        
    }
    .text{
        margin-top:66px;
        margin-bottom: 66px;
        margin-left: -100px;
    }
    .table{
        
        color: #212529;
    }
    td {
        text-align: center; /* 수평 가운데 정렬 */
        vertical-align: middle; /* 수직 가운데 정렬 */
        padding: 8px; /* 셀 내부 여백 */
    }
    #color{
        background-color: rgb(245, 245, 245);
        color: rgb(31, 43, 108);
    }
    #btn-color{
        background-color: rgb(31, 43, 108);
        color: rgb(245, 245, 245);
    }
    #common-top{
      margin-top: 60px;
    }
    .ml{
      margin-left: 90px;
    }
    #vertical-line {
        border-left: 1px dashed #000; 
        height: 400px; 
    }
    section{
        width: 1903px;
        position: absolute;
        margin-top: 155px;
        
      }
    footer{
   
      margin-top: 1780px;
    }   
    

   </style>
  <section>

    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h3 style="margin-left:93px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 희망검진일</b></h3>
   <br>
  
   <form action="<%= contextPath %>/CheckForm.rv" method="post">

   <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
             
    <tr class="d-flex" >

	      <td id="color" style="width:346px; height: 230px; border-rig	ht-style: dashed; ">
	        <h4 style="margin-top: 60px"><b style="color:black">희망검진일</b></h4><br>
	        <h4 id="wantday" style="margin:auto"><b></b></h4>
	      </td>
	      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);border-right: rgb(245, 245, 245);">
	        <h4 style="margin-top: 60px"><b style="color:black">검사시간</b></h4><br>
	        <h4 id="wanttime" style="margin:auto"><b></b></h4>
	      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245); border-right: rgb(245, 245, 245);"></td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245); border-right: rgb(245, 245, 245);" ></td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);"></td>
     
    </tr>
   
    </table>

    <br><br>
    <div class="d-flex">
    <h3 style="margin-left:93px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 희망검진일 선택</b></h3>
    <h3 style="margin-left:455px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 내원시간 선택</b></h3>
    </div>
    <br><br>
        	
        	
    <div class="container11" style="margin-left:93px">
    <div class="d-flex">
        <div>
            <div>
                <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" 
                        id="year" name="year" 
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
                        style="width:325px; height: 50px; margin-left:15px;" 
                        onchange="updateDate()" aria-label="년도 선택">
                    <option id="year-placeholder" selected value="2024">2024</option>
                    
                </select> 년
            </div>
           
            <div class="d-flex" style="margin-top: 60px;">
                    <div>
                        <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" 
                                id="month" name="month" 
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
                                style="width:140px; height: 50px; margin-left:15px;" 
                                onchange="updateDate()" aria-label="월 선택">
                            <option id="month-placeholder" selected value="1">1</option> 
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select> 월
                    </div>
                    <div>
                        <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" 
                                id="day" name="day" 
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
                                style="width:140px; height: 50px; margin-left:25px;" 
                                aria-label="일 선택">
                            <option id="day-placeholder" selected value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>
                            <option value="31">31</option>
            
                        </select> 일
                    </div>
               
            </div>
        </div>
 


        <div style="border:1px dashed;border-left:#212529; margin-left:175px"> </div>

        <div style="margin-left:155px">
            <table class="container12 table-bordered" id="table_custom" >
             
                <tr class="d-flex">
            
                  <td  style="width:346px; height: 230px; border-right-style: dashed; border-right:white;">
                    <button type="button" class="btn btn-outline-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: white;"	><h3 style="color:black" id="AM">오전</h3></button>
                  </td>
                  <td style="width:346px; height: 230px; border-right-style: dashed; border-right:white; border-left:white;">
                    <button type="button" class="btn btn-outline-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: white;" ><h3 style="color:black" id="PM">오후</h3></button>
                  </td>
                  <td style="width:346px; height: 230px;  border-left:white;">
                    <button type="button" class="btn btn-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: #1F2B6C;" onclick="confirmSelection()"><h3 style="color:white">선택</h3></button>
                  </td>
                  
                  
                 
                </tr>
               
                </table>
        </div>


      </div>
    </div>
    </form>
				<script>
				    let isButtonn = false;
					
				    function updateDate() {
				        const year = document.getElementById('year').value;
				        const month = document.getElementById('month').value;
				        const daySelect = document.getElementById('day');
				
				        // 일 선택 상자 초기화
				        daySelect.innerHTML = '<option id="day-placeholder" selected value="">일</option>';
				
				        if (year && month) {
				            const daysInMonth = new Date(year, month, 0).getDate(); // 선택한 월의 일수
				            for (let day = 1; day <= daysInMonth; day++) {
				                const option = document.createElement('option');
				                option.value = day;
				                option.textContent = day;
				                daySelect.appendChild(option);
				            }
				        }
				    }
				    
				    function confirmSelection() {
				    		
				    	
				        const year = document.getElementById('year').value;
				        const month = document.getElementById('month').value;
				        const daySelect = document.getElementById('day').value;
				        const selectedTime = document.querySelector('.btn-outline-primary.active h3')?.innerText; // 선택된 시간
				        const selectedDate = year + '년 ' + month + '월 ' + daySelect + '일';
							
				        // 필수 입력 확인
				        if (!year) {
				            alert('년도를 선택하세요.');
				            return;
				        }
				        if (!month) {
				            alert('월을 선택하세요.');
				            return;
				        }
				        if (!daySelect) {
				            alert('일을 선택하세요.');
				            return;
				        }
				        if (!selectedTime) {
				            alert('내원시간을 선택하세요.');
				            return;
				        }

				        // 선택된 날짜와 시간 표시
				        
				        document.getElementById('wantday').querySelector('b').innerHTML = selectedDate;
				        document.getElementById('wanttime').querySelector('b').innerHTML = selectedTime;
				      

				        isButtonn = true;
				     
				        
				        return ; // 성공적으로 선택되었음을 알림
				     
				    }

				        document.querySelectorAll('.btn-outline-primary').forEach(button => {
				            button.addEventListener('click', function() {
				                document.querySelectorAll('.btn-outline-primary').forEach(btn => btn.classList.remove('active'));
				                this.classList.add('active');
				            });
				        });
			
				        
				 
				</script>
    <br>
     
		<script>
		


    const requestPayment = async () => {
    	
    	
				const isChecked1 = document.getElementById('customCheck1').checked; // 첫 번째 동의 라디오 버튼
        const isChecked2 = document.getElementById('customCheck2').checked; // 두 번째 동의 라디오 버튼


	    if (!isChecked1 || !isChecked2) {
	        alert("모든 동의 항목을 체크해주세요.");
	        return false; // 폼 제출 방지
	    }
	
	    
        const selectedPG = document.getElementById('cardBank').value;
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
            } else {
                // 결제 실패 시 처리
                console.log('결제 실패:', rsp);
                alert('결제가 실패되었습니다.');
            }
        });
    };
		
		 
		    document.addEventListener("DOMContentLoaded", function() {
		        const paymentButton = document.querySelector('button[name="pay"]'); // 결제 버튼

		        if (paymentButton) {
		            paymentButton.addEventListener("click", function(event) {
		             		
		            		// 희망검진일 및 내원시간 선택 확인
		                const year = document.getElementById('year').value; // 연도
		                const month = document.getElementById('month').value; // 월
		                const daySelect = document.getElementById('day').value; // 일
		                const selectedTime = document.querySelector('.btn-outline-primary.active h3')?.innerText; // 내원 시간
		                const selectedDate = year + '년 ' + month + '월 ' + daySelect + '일';
		              
		                // 모든 값이 선택되지 않았는지 확인
		                if (!year || !month || !daySelect || !selectedTime || !isButtonn) {
		                    alert('희망검진일 또는 내원시간을 선택해주세요');
		                    event.stopPropagation(); // 링크 이동 방지
		                    return ; 
		                }
		         
		           			
		                document.getElementById('wantday1').innerHTML = selectedDate;
		                document.getElementById('wanttime1').innerHTML = selectedTime;
		           			
		                
		                // 결제 완료 상태 체크
		                if (isPaymentCompleted) {
		                    alert('이미 결제가 완료되었습니다.'); // 이미 결제된 경우 알림
		                    event.stopPropagation(); // 이벤트 전파 중단
		                    return; // 결제 진행 중단
		                }
		               
		                // 결제 요청
		                requestPayment(); // 검증이 완료된 경우 결제 요청
		            });
		        }
		    });
		</script>
		     
    <br><br><br>
    <h3 style="margin-left:93px"><b>예약하신 정보</b></h3>
    <hr style="border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>


    <div class="d-flex" style="margin-left:93px">
        <table class="container11 table-bordered" id="table_custom">
            <tr>
                <td id="color" style="height:70px;"><h5>검진 프로그램</h5></td>
                <td><h5 align="left" style="margin-left:30px;">건강검진</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px;"><h5>선택항목</h5></td>
                <td><h5 align="left" style="margin-left:30px;">일반 건강검진</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px; margin-top:15px;"><h5>총 예상비용</h5></td>
                <td>
                    <h5 align="left" style="margin-left:30px; margin-top:10px;">
                        <b style="color:#1F2B6C" >50,000원</b> (추가검사 포함 : 50,000원)
                       
                        <button type="button" name="pay" class="btn border-1 border-dark" id="btn-color" data-toggle="modal" data-target="#paymentModal" style="margin-left:50px; width:150px;">
                            결제하기
                        </button>
                    </h5>
                </td>
            </tr>
        </table>
    </div>

   
 
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
                                        <td><b style="color:#1F2B6C">일반 건강검진</b></td>
                                    </tr>
                                    <tr>
                                        <td style="border-right: 1px dashed; border-right-color: rgb(204, 204, 204);"><b>희망 진료일</b></td>
                                        <td><b style="color:#1F2B6C"id="wantday1" ></b></td>
                                    </tr>
                                    <tr>
                                        <td style="border-right: 1px dashed; border-right-color: rgb(204, 204, 204);"><b>내원 시간</b></td>
                                        <td><b style="color:#1F2B6C" id="wanttime1"></b></td>
                                    </tr>
                                    <tr style="border-bottom:1px solid ;border-bottom-color: rgb(224, 222, 222);">
                                        <td style="border-right: 1px dashed; border-right-color: rgb(204, 204, 204);"><b>가격</b></td>
                                        <td><b style="color:#1F2B6C">50,000원</b></td>
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


		






    <br> 
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>

    
      <fieldset>
          <input type="radio" id="checkAgree" name="check" value="T" style="margin-left: 93px; cursor: pointer;">
          <label for="checkO">&nbsp;검진 관련 주의사항 안내 및 체크사항을 확인하였습니다. <b style="color:red;">(필수)</b></label>
          
      </fieldset>
   


     <br><br><br>

     
    	

        <input type="hidden" name="merchant_uid" id="merchant_uid">
        <input type="hidden" name="selectedTime" id="selectedTime">
        <input type="hidden" name="year" id="year">
        <input type="hidden" name="month" id="month">
        <input type="hidden" name="day" id="day">
       
        <div align="center">
        
          <a href="/vita/views/reservation/healthCheckUp_Success.jsp" class="btn border-1 border-dark" id="btn-color" style="width: 150px;" onclick="return validateAndProceed(event)">예약 신청하기</a>
          <a href="/vita/views/reservation/healthCheckUp_2.jsp" class="btn btn-light border-2 border-dark"  style="width: 150px; margin-left:30px;">이전</a>
        </div>

        <br><br> 

				<script>
					
							function validateAndProceed(event) {
							    const checkedAgree = document.getElementById('checkAgree').checked; 
							    const isPaymentCompleted = window.isPaymentCompleted; // 결제 완료 상태 확인
			
							    // 모든 항목 체크
							    const year = document.getElementById('year').value; // 연도
							    const month = document.getElementById('month').value; // 월
							    const daySelect = document.getElementById('day').value; // 일
							    const selectedTime = document.querySelector('.btn-outline-primary.active h3')?.innerText; // 내원 시간
			
							    if (!year || !month || !daySelect || !selectedTime) {
							        alert('희망검진일 또는 내원시간을 선택해주세요');
							        event.preventDefault(); // 링크 이동 방지
							        return false; 
							    }
			
							    if (!checkedAgree) {
							        alert("검진 관련 주의사항 체크를 해주세요");
							        event.preventDefault(); // 링크 이동 방지
							        return false; 
							    }
							    
							    if (!isPaymentCompleted) {
							        alert('결제를 해주세요'); 
							        event.preventDefault(); // 링크 이동 방지
							        return false; 
							    }
			
							    // 모든 조건이 충족되면 true를 반환하여 링크 이동
							    return true; 
							}
							
						   
 
						</script>



        
  </section>
		





		<%@ include file="/views/common/footer.jsp" %>


</body>
</html>