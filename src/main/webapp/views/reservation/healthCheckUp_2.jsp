<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   
      margin-top: 2550px;
    }   
    
    .disabled {
    pointer-events: none;
    opacity: 0.5; /* 비활성화된 버튼의 투명도 조절 */
	}

   </style>
  <section>

    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h3 style="margin-left:93px"><b>검진 프로그램 :</b><b style="color:rgb(31, 43, 108);"> 일반 검강검진</b></h3>
   <br>
  

    <div class="container11">
     
        <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
                
            <tr>
              <td id="color" style="width:500px; height: 70px; "><h4 style="margin:auto">진료받을 병원 이름</h4></td>
              <td> 
                <div class="box" style="border:1px solid; border-color: rgb(245, 245, 245); background-color: rgb(245, 245, 245); width:350px; height:50px; margin-left:30px">
                    <h5 style="margin:auto; margin-top: 13px;">비타 병원</h5>
                </div>
              </td>
             
            </tr>
            
        </table>
   
    <br><br>

    <h3 style="margin-left:93px"><b>총 예상비용 : </b><b style="color:rgb(31, 43, 108);" id="price">0 원</b></h3>

    <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>
     <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
             
         <tr>
           <td id="color" style="width:500px; height: 350px;"><h4 style="margin:auto"><sup style="color:rgb(255, 165, 0)">*</sup><b> 필수</b></h4></td>
           <td style="text-align: left;"> <h3 style="margin-left:30px">· 건강검진</h3><br>
            <h4 style="margin-left:30px; color: rgb(153, 156, 158);">내시경 검사는 전화 예약만 가능합니다.</h4>
             <h4 style="margin-left:30px; color: rgb(153, 156, 158);">위암검진은 대상자의 경우 추가 연락 없을 시 위장조영촬영으로 진행됩니다.</h4>
             <h4 style="margin-left:30px; color: rgb(153, 156, 158);">내시경 희망 하실 경우 (02)123-4567으로 연락부탁드립니다.</h4>
             <br>
             <button type="button" class="btn border-1 border-dark" id="btn-color" name="priceController" style="width: 200px; margin-left:30px;">건강검진</button>
         </td>
          
         </tr>
    
    
    
        
     </table>
		</div>
		<script>
		
		let healthCheckClicked = false; 
		
    function updateCost() {
        let priceDisplay = document.getElementById("price");
        priceDisplay.innerText = "50,000원"; // 가격을 50,000원으로 설정
        healthCheckClicked = true; // 버튼 클릭 시 상태 업데이트

    }

    document.addEventListener("DOMContentLoaded", function() {
        const healthCheckButtons = document.getElementsByName("priceController");
        if (healthCheckButtons.length > 0) {
            healthCheckButtons[0].addEventListener("click", updateCost);
        }
    
    });
    
</script>
     
    <br><br><br>
    <h3 style="margin-left:93px"><b>예약 체크사항</b><b style="color:rgb(31, 43, 108)">(필수)</b></h3>
    <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>

     <div class="d-flex" style="margin-left:93px">
        <h3>"예약체크사항 작성하기"를 클릭하여 체크사항을 작성해 주십시오.</h3>
        <button type="button" class="btn border-1 border-dark" id="btn-color" data-toggle="modal" data-target="#myModal" style="width: 200px; margin-left:600px; margin-top:-10px">작성하기</button>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="myModalLabel">예약체크사항</h5>
                </div>
                <div class="modal-body">
								    <form id="checkListForm" action="#" method="post">
								        <div class="first-group">
								            <h5>1. 현재 복용중인 약이 있으십니까?</h5>
								            <input type="radio" name="mediList" value="N" style="cursor: pointer;" onclick="toggleMedicationInput(false); checkFormValidity()">
								            <label for="none">없음</label>
								            <br>
								            <div>
								                <input type="radio" name="mediList" value="Y" style="cursor: pointer;" onclick="toggleMedicationInput(true); checkFormValidity()">
								                <label for="other" id="other">있음</label>
								                
								                <input type="text" class="form-control" id="inputText" name="mediListDetails" placeholder="여러항목일경우 띄어쓰기없이 ( , )로 연이어서 입력해주세요" value="" disabled oninput="checkFormValidity()">
								                <br>
								                <h7 style="color:rgb(31, 43, 108);">※ 항헌혈제는 고혈압, 당뇨 및 고지혈증약과 병용 투여되는 </h7>
								                <h7 style="color:rgb(31, 43, 108);">경우가 흔하므로 상기 질환으로 치료중인 경우에는 항혈전제 투약 여부를</h7>
								                <h7 style="color:rgb(31, 43, 108);">주치의에게 사전에 확인 받으시기 바랍니다.</h7>
								            </div>
								        </div>
								        <br>
								        
								        <div class="second-group">
								            <h5>2. 1년 이내에 수술 받으신 적이 있으십니까?</h5>
								            <input type="radio" name="surgeryYN" value="N" style="cursor: pointer;" onclick="toggleSurgeryInput(false); checkFormValidity()">
								            <label for="none">없음</label>
								            <br>
								            <input type="radio" name="surgeryYN" value="Y" style="cursor: pointer;" onclick="toggleSurgeryInput(true); checkFormValidity()">
								            <label for="yes">있음</label>
								            <input type="text" class="form-control" id="SurgerySelf" name="surgeryName" value="" placeholder="수술명 직접입력" disabled oninput="checkFormValidity()">
								        </div>
								        <br>
								        <div class="third-group">
								            <h5>3. 건강검진이후 14일 이내 비행기 탑승이 예정되어 있으십니까?</h5>
								            <input type="radio" name="flyYN" value="N" style="cursor: pointer;" onclick="checkFormValidity()">
								            <label for="none">없음</label>
								            <br>
								            <input type="radio" name="flyYN" value="Y" style="cursor: pointer;" onclick="checkFormValidity()">
								            <label for="yes">있음(2주이내)</label>
								            <br><br>
								            <h7 style="color:rgb(31, 43, 108);">※ 내시경 검사중 조직검사에 제한이 있을 수 있습니다.</h7>
								        </div>
								
								        <div class="modal-footer">
								            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								            <button type="button" class="btn btn-primary" id="submitBtn" disabled onclick="handleSubmit()">저장</button>
								        </div>
								    </form>
								</div>
								
								<script>
										
								let checklistSubmitted = false;
								let clickkk = false;
								    function toggleMedicationInput(isOther) {
								        document.getElementById("inputText").disabled = !isOther;
								        
								        if (!isOther) {
								            document.getElementById("inputText").value = ""; // 비활성화되면 입력값을 초기화
								        }
								        checkFormValidity(); // 상태를 체크하여 버튼 활성화
								    }
								
								    function toggleSurgeryInput(isSurgery) {
								        document.getElementById("SurgerySelf").disabled = !isSurgery;
								
								        if (!isSurgery) {
								            document.getElementById("SurgerySelf").value = ""; // 비활성화되면 입력값을 초기화
								        }
								        checkFormValidity(); // 상태를 체크하여 버튼 활성화
								    }
								
								    function checkFormValidity() {
								        var mediListChecked = document.querySelector('input[name="mediList"]:checked');
								        var mediListValid = mediListChecked && (mediListChecked.value === "N" || (mediListChecked.value === "Y" && document.getElementById("inputText").value.trim() !== ""));
								
								        var surgeryChecked = document.querySelector('input[name="surgeryYN"]:checked');
								        var surgeryValid = surgeryChecked && (surgeryChecked.value === "N" || (surgeryChecked.value === "Y" && document.getElementById("SurgerySelf").value.trim() !== ""));
								
								        var flyChecked = document.querySelector('input[name="flyYN"]:checked') !== null;
								
								        var submitBtn = document.getElementById("submitBtn");
								        if (mediListValid && surgeryValid && flyChecked) {
								            submitBtn.disabled = false; // 모든 항목이 체크되고 유효하면 버튼 활성화
								        } else {
								            submitBtn.disabled = true; // 하나라도 체크되지 않거나 유효하지 않으면 버튼 비활성화
								        }
								    }
								
								    let isSubmitting = false; // 중복 제출 방지 변수

								    function handleSubmit(event) {
								        event.preventDefault(); // 기본 제출 동작 방지
								        if (isSubmitting) return; // 이미 제출 중이면 함수 종료
								        isSubmitting = true; // 제출 시작
								        const formData = new FormData(document.getElementById("checkListForm"));
								        fetch("<%= contextPath %>/CheckForm.rv", {
								            method: "POST",
								            body: formData,
								        })
								        .then(response => {
								            if (!response.ok) {
								                throw new Error('Network response was not ok');
								            }
								            return response.text();
								        })
								        .then(data => {
								            alert("저장되었습니다.");
								            $('#myModal').on('hidden.bs.modal', function () {
								                document.getElementById("checkListForm").reset();
								                document.getElementById("submitBtn").disabled = true;
								                isSubmitting = false; // 제출 가능 상태로 복원
								            });
								        })
								        .catch(error => {
								            alert("전송 실패: " + error.message);
								            isSubmitting = false; // 오류 발생 시에도 복원
								        });
								    }

                    function validateAndProceed(event) {
									  
									    if (!healthCheckClicked) {
									        alert('필수란의 버튼을 선택해주세요.');
									        event.preventDefault(); // 링크 이동 방지
									        return false; 
									    }
					
									    if (!clickkk) {
									        alert("예약체크사항을 작성해주세요");
									        event.preventDefault(); // 링크 이동 방지
									        return false; 
									    }
									  
									    // 모든 조건이 충족되면 true를 반환하여 링크 이동
									    return true; 
									}
					
								</script>
              </div>
            </div>
          </div>
     </div>

     <br>
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>

     <h3 style="margin-left:93px"><b>사전준비 및 주의사항</b></h3>
    <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">

    <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
      <div style="margin-left:30px;">
      <h5><b>○ 금식</b></h5><br>
      <h5>• 건강검진 2~3일 전부터는 음주, 기름진 음식은 피하십시오.</h5>
      <h5>• 오전 검진 : 검진 전날 저녁식사는 오후 7시까지 가볍게 드시고 밤9시 이후부터 금식하십시오.</h5>
      <h5>• 오후 검진 : 검진 전날 밤 12시 이후부터 금식하십시오.</h5>
      <h5>• 금식 기간 중에는 물, 껌, 사탕, 약 등 일체 금식하십시오.</h5>
      <br>
      <h5><b>○ 약물</b></h5><br>
      <h5>• 항혈전제(아스피린, 플라빅스 등)를 복용하시는 분은 내시경 조직검사 또는 용종 제거 시 출혈의 위험이 있으므로 주치의에게 확인 후 일주일 전부터 복용을 중단합니다.</h5><br>
      <h5>• 항혈전제 중지는 임의대로 중단하시면 안되며 담당 주치의에게 반드시 확인 후 중단해주십시오!</h5><br>
      <br>
      <h5><b>○ 여성(추가)</b></h5><br>
      <h5>• 생리중인 경우 검사 내용에 제한이 있을 수 있습니다.</h5><br>
      <h5>• 가임기의 모든 여성은 검진 예약 전 반드시 임신여부 확인하여 주십시오.</h5><br>
      <br>
      <h5><b>○ 대변</b></h5><br>
      <h5>• 대변은 건강검진 전날 저녁 또는 당일 채변봉투(용기)에 밤알 크기 정도 채취해 주십시오.(공단검진 대변검사 해당자 또는 일부 종합검진 대상)</h5><br>
      <h5>• 채취하신 대변은 검사의 정확도를 높이기 위해 차고 서늘한 곳에 보관해 주십시오.</h5><br>
      <h5>• 생리중에는 생리혈이 섞이지 않도록 주의 하십시오.</h5><br>
      <br>
      <h5><b>○ 예약시 고지되지 않은 기타 특이질환이 있을 경우 내시경 검사가 불가 할 수 있습니다</b></h5><br>
      
      </div>
    </div>

    <br><br><br>
       
				
        
        <div align="center">
     
          <form action="/vita/views/reservation/healthCheckUp_3.jsp" method="POST" onsubmit="return validateAndProceed(event)">
				    <button type="submit" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">다음</button>
				</form>

           <a href="/vita/views/reservation/healthCheckUp_1.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:30px;">이전</a>
          
        </div>

        <br><br> <br><br> <br><br> <br><br> 





        
  </section>



		



		
		<%@ include file="/views/common/footer.jsp" %>

</body>
</html>