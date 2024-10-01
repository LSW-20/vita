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
				    function setTime(time) {
				    	
				    document.querySelectorAll('.btn-outline-primary').forEach(btn => btn.classList.remove('active'));
				    // 선택한 버튼에 active 클래스 추가
				    const selectedButton = Array.from(document.querySelectorAll('.btn-outline-primary')).find(btn => btn.value === time);
				    selectedButton.classList.add('active');
				    
				    document.getElementById('selectedTime1').value = time; 
				    }
				    
				    function confirmSelection() {
				    		
				    	
				    	
				        const selectedTime = document.querySelector('.btn-outline-primary.active h3')?.innerText; // 선택된 시간
				        const year = document.getElementById('year').value;
				        const month = document.getElementById('month').value;
				        const daySelect = document.getElementById('day').value;
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



			function validateAndProceed(event) {
			    const checkedAgree = document.getElementById('checkAgree').checked; 

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
			   
			    document.getElementById('healthpay').submit();
		
			    return true; 
			}
			
				 
				</script>
				
  <section>
	
		
    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h3 style="margin-left:93px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 희망검진일</b></h3>
   <br>
  
      <form action="<%= contextPath %>/CompanyForm.rv" method="post" id="healthpay">

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
                            style="width:325px; height: 50px; margin-left:15px;" 
                            onchange="updateDate()" aria-label="년도 선택">
                        <option id="year-placeholder" selected value="2024">2024</option>
                    </select> 년
                </div>
                <div class="d-flex" style="margin-top: 60px;">
                    <div>
                        <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" 
                                id="month" name="month" 
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
                                style="width:140px; height: 50px; margin-left:25px;" 
                                aria-label="일 선택">
                            <option id="day-placeholder" selected value="1">1</option>
                            <!-- 일 옵션은 자바스크립트로 동적으로 생성합니다. -->
                        </select> 일
                    </div>
                </div>
            </div>
        
    


        <div style="border:1px dashed;border-left:#212529; margin-left:175px"> </div>

        <div style="margin-left:155px">
            <table class="container12 table-bordered" id="table_custom" >
             
                <tr class="d-flex">
            
                  <td  style="width:346px; height: 230px; border-right-style: dashed; border-right:white;">
                    <button type="button" class="btn btn-outline-primary" name="selectedTime1" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: white;" value="오전"	onclick="setTime('오전')"><h3 style="color:black" id="AM" >오전</h3></button>
                  </td>
                  <td style="width:346px; height: 230px; border-right-style: dashed; border-right:white; border-left:white;">
                    <button type="button" class="btn btn-outline-primary" name="selectedTime1" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: white;"value="오후"	 onclick="setTime('오후')"><h3 style="color:black" id="PM">오후</h3></button>
                  </td>
                  <td style="width:346px; height: 230px;  border-left:white;">
                    <button type="button" class="btn btn-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: #1F2B6C;" onclick="confirmSelection()"><h3 style="color:white">선택</h3></button>
                  </td>
                  
              
                 
                </tr>
               
                </table>
					
						<input type="hidden" name="selectedTime1" id="selectedTime1" />
						<input type="hidden" name="selectedPG" id="selectedPG" />
						<input type="hidden" name="merchant_uid" id="merchant_uid" />
						<input type="hidden" name="imp" id="imp" />
        </div>
        
      </div>
      </div>
    
    </form>
				
    <br>
     
	
		     
    <br><br><br>
    <h3 style="margin-left:93px"><b>예약하신 정보</b></h3>
    <hr style="border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>


    <div class="d-flex" style="margin-left:93px">
        <table class="container11 table-bordered" id="table_custom">
            <tr>
                <td id="color" style="height:70px;"width="450px"><h5>검진 프로그램</h5></td>
                <td><h5 align="left" style="margin-left:30px;">건강검진</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px;"><h5>선택항목</h5></td>
                <td><h5 align="left" style="margin-left:30px;">기업 건강검진</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px; margin-top:15px;"><h5>총 예상비용</h5></td>
                <td>
                    <h5 align="left" style="margin-left:30px; margin-top:10px;">
                        <b style="color:#1F2B6C" >0원</b>
                       
      
                    </h5>
                </td>
            </tr>
        </table>
    </div>

   


		






    <br> 
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>

    
      <fieldset>
          <input type="radio" id="checkAgree" name="check" value="T" style="margin-left: 93px; cursor: pointer;">
          <label for="checkO">&nbsp;검진 관련 주의사항 안내 및 체크사항을 확인하였습니다. <b style="color:red;">(필수)</b></label>
          
      </fieldset>
   


     <br><br><br>

     
    	

        
       
        <div align="center">
        
          <button type="submit" class="btn border-1 border-dark" id="btn-color" style="width: 150px;" onclick="validateAndProceed(event)">다음</button>
          <a href="/vita/views/reservation/healthCheckUp_2.jsp" class="btn btn-light border-2 border-dark"  style="width: 150px; margin-left:30px;">이전</a>
        </div>

        <br><br> 




        
  </section>
		
        	 <script>
        const today = new Date(),
              currentYear = today.getFullYear(),
              currentMonth = today.getMonth() + 1,
              currentDay = today.getDate();

        const yearSelect = document.getElementById('year'),
              monthSelect = document.getElementById('month'),
              daySelect = document.getElementById('day');

        // 옵션 생성 함수
        function createOptions(selectElement, start, end, current, disableBefore) {
            selectElement.innerHTML = ''; // 기존 옵션 초기화
            for (let i = start; i <= end; i++) {
                const option = new Option(i, i);
                if (i === current) option.selected = true;
                if (i < disableBefore) option.disabled = true; // 비활성화 설정
                selectElement.appendChild(option);
            }
        }

        // 년도 생성
        createOptions(yearSelect, 2000, currentYear, currentYear, currentYear);

        // 월과 일 업데이트
        function updateMonthDay() {
            const selectedYear = parseInt(yearSelect.value);
            const selectedMonth = parseInt(monthSelect.value);
            createOptions(monthSelect, 1, 12, currentMonth, selectedYear === currentYear ? currentMonth : 0);

            const daysInMonth = new Date(selectedYear, selectedMonth, 0).getDate();
            createOptions(daySelect, 1, daysInMonth, currentDay, selectedYear === currentYear && selectedMonth === currentMonth ? currentDay : 0);
        }

        // 이벤트 리스너
        yearSelect.addEventListener('change', updateMonthDay);
        monthSelect.addEventListener('change', updateMonthDay);

        // 초기화
        updateMonthDay();
    </script>




		<%@ include file="/views/common/footer.jsp" %>


</body>
</html>