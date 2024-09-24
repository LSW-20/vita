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
   
      margin-top: 2130px;
    }   
    

   </style>

  <section>

    <h2 id="pad"><b>진료예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h3 style="margin-left:93px"><b> 선택내용</b></h3>
   <br>
  

   <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
             
    <tr class="d-flex">

      <td id="color" style="width:346px; height: 230px; border-right-style: dashed; ">
        <h4 style="margin-top: 60px"><b style="color:black">진료과</b></h4><br>
        <h4 id="department" style="margin:auto"><b></b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">의료진</b></h4><br>
        <h4 id="doctorS" style="margin:auto"><b></b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">내원시간</b></h4><br>
        <h4 id="time" style="margin:auto"><b></b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);border-right: rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">진료일</b></h4><br>
        <h4 id="day" style="margin:auto"><b></b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);"></td>
     
    </tr>
   
    </table>

    <br><br>
    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br><br>
    <div class="d-flex">
    <h3 style="margin-left:150px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 진료과 선택</b></h3>
    <h3 style="margin-left:750px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 의료진 선택</b></h3>
    </div>
    <br><br>
    <div class="container11" style="margin-left:93px">
    <div class="d-flex">
        <div>
            <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="medical-department" name="medical-department" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:400px; height: 50px;margin-left:70px;" onchange="updateDoctors()">
                <option id="department-placeholder" selected value="">진료과를 선택하세요</option>
                <option value="내과">내과</option>
                <option value="외과">외과</option>
                <option value="치과">치과</option>
                <option value="안과">안과</option>
            </select>
        </div>
        <div>
            <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="doctor" name="doctor" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:400px; height: 50px; margin-left:515px;">
                <option id="doctor-placeholder" selected value="">의사를 선택하세요</option>
            </select>
        </div>
    </div>
</div>

<script>
    function updateDoctors() {
        const departmentSelect = document.getElementById('medical-department');
        const doctorSelect = document.getElementById('doctor');
        const departmentPlaceholder = document.getElementById('department-placeholder');
        const doctorPlaceholder = document.getElementById('doctor-placeholder');

        // 초기화
        doctorSelect.innerHTML = ''; 

        // 선택된 의료 과에 따라 의사 목록 설정
        switch(departmentSelect.value) {
            case '내과':
                doctorSelect.innerHTML += '<option value="박시우">박시우</option>';
                break;
            case '외과':
                doctorSelect.innerHTML += '<option value="임상우">임상우</option>';
                break;
            case '치과':
                doctorSelect.innerHTML += '<option value="황재운">황재운</option>';
                break;
            case '안과':
                doctorSelect.innerHTML += '<option value="정준수">정준수</option>';
                break;
            default:
                doctorSelect.innerHTML += '<option id="doctor-placeholder" selected value="">의사를 선택하세요</option>';
        }

        // 진료과 선택 시 placeholder 숨기기
        if (departmentSelect.value) {
            departmentPlaceholder.style.display = 'none';
        } else {
            departmentPlaceholder.style.display = 'block';
        }

        // 의사 선택 시 placeholder 숨기기
        if (doctorSelect.value) {
            doctorPlaceholder.style.display = 'none';
        } else {
            doctorPlaceholder.style.display = 'block';
        }
    }
</script>

    <br><br>
    <hr style= "border: 1px dashed; border-color:#bdbcbc;margin-left: 90px; margin-right: 90px;">
    <br><br>
    <h3 style="margin-left:150px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 내원시간 선택</b></h3>
    <br><br>
		<div class="container11" style="margin-left:93px">
			   <div class="d-flex">
				    <div style="margin-left:120px">
				        <table style="margin-left:-55px;">
				            <tr class="d-flex">
				                <td style="width:150px; height: 230px; margin-top:11px; border-right-style: dashed; border-right:white;">
				                    <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="time-select" name="appointmentTimeSelect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:400px; height: 50px;">
				                        <option id="time-select-placeholder" selected value="">내원시간을 선택하세요</option>
				                        <option value="오전">오전</option>
				                        <option value="오후">오후</option>
				                        
				                    </select>
				                </td>
				                <td style="width:150px; height: 230px; border-right:white; border-left:white;">
				                    <button type="button" class="btn btn-outline-primary" style="width:120px; height:70px; border-color:rgb(190, 189, 189); background-color: #1F2B6C; margin-left:300px;" onclick="confirmSelection()">
				                        <h3 style="color:white">선택</h3>
				                    </button>
				                </td>
				            </tr>
				        </table>
				    </div>
				    
				    <div style="margin-left:600px;">
				        <h3>※ 우리 병원은 <b style="color:red">당일 예약</b>만 가능합니다.</h3>
				        <h3>&nbsp;&nbsp;&nbsp;&nbsp;해당 사항 참고하시고 예약해주시길</h3> 
				        <h3>&nbsp;&nbsp;&nbsp;&nbsp;바랍니다.</h3>
				    </div>
				</div>
    </div>
        
   

     
    <br><br>
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br><br>
    <h3 style="margin-left:93px"><b>예약하신 정보</b></h3>
    <hr style="border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>

    <div class="d-flex" style="margin-left:93px">
        <table class="container11 table-bordered" >
            <tr>
                <td id="color" style="height:70px; width: 600px;"><h5><b>진료과</b></h5></td>
                <td><h5 id="department1" align="left" style="margin-left:30px;"><b></b></h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px;"><h5><b>의료진</b></h5></td>
                <td><h5 id="doctor1" align="left" style="margin-left:30px;"><b></b></h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px; margin-top:15px;"><h5><b>내원시간</b></h5></td>
                <td>
                    <h5 id="time1" align="left" style="margin-left:30px; margin-top:10px;"><b></b></h5>
                </td>
            </tr>
        </table>
    </div>

		 <script>

    function confirmSelection() {
        const department = document.getElementById('medical-department').value;
        const doctor = document.getElementById('doctor').value;
        const time = document.getElementById('time-select').value;
        
        const today = new Date();
        const day = today.toLocaleDateString();
        
        // 진료과, 의료진, 내원시간 모두 선택되었는지 확인
        if (!department) {
            alert('진료과를 선택하세요.');
            return;
        }
        if (!doctor) {
            alert('의료진을 선택하세요.');
            return;
        }
        if (!time) {
            alert('내원시간을 선택하세요.');
            return;
        }
        
        document.getElementById('doctorName').value = doctor;
        document.getElementById('appointmentTime').value = time;


     // 선택한 진료과와 의사 이름 업데이트
        document.getElementById('department').querySelector('b').innerHTML = department;
        document.getElementById('doctorS').querySelector('b').innerHTML = doctor;
        
        // 내원시간 업데이트
        document.getElementById('time').querySelector('b').innerHTML = time;
        document.getElementById('day').querySelector('b').innerHTML = day;

        // 예약 정보 업데이트
        document.getElementById('department1').querySelector('b').innerHTML = department;
        document.getElementById('doctor1').querySelector('b').innerHTML = doctor;
        document.getElementById('time1').querySelector('b').innerHTML = time;
        return true; // 성공적으로 선택되었음을 알림
    }
</script>








    <br> 
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>



     <br><br><br>





     
    <form action="<%= contextPath %>/personalForm.rv" method="post" >
    <input type="hidden" name="doctorName" id="doctorName">
    <input type="hidden" name="appointmentTime" id="appointmentTime">

    
    
    <div align="center" style="position: relative;">
         
         <button type="submit" class="btn border-1 border-dark" id="submitButton"
						    				style="width:150px; position: absolute; left: 41%; top: 0; background-color: rgb(31, 43, 108); color: rgb(245, 245, 245);"
						    				>예약신청하기</button>

        <a href="/vita/views/reservation/personal.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:180px;">이전</a>
    </div>
</form>

        <br><br> 

	



        
  </section>
	

		
		<%@ include file="/views/common/footer.jsp" %>
</body>
</html>