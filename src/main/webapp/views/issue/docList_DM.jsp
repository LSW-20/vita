<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/myPageSideBar.jsp" %>
<style>
  /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
  
  
  
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
  /* 사이드바 메뉴 길이 페이지마다 다를 수 있으니 별도로 부여 */
   #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 100%;
 }
 #csthead{
   background-color:#eaf3fa;
 }
    footer{margin-top: 1600px;}
    
    
    .dm_container{
    	margin-top: 40px;
    	margin-left: 60px;
    }
    .dm_subcontainer{
			 margin-top: 75px;
			 
    }
     h2{
    	font-size: 50px;
    }
    h4{
    	font-size: 35px;
    } 
     #subcontent{
    	font-size: 20px;
    	
    } 
    
    .info_img{
    	border: 1px solid black;
	    height: 400px;
	    width: 1000px;
    	margin-top: 40px;
    	display: flex;
    	justify-content: center;
    	border-radius: 15px;
    	
    	
    }
     .info_img img{
    	
    	width: 900px;
    }
    section{
    	height:1447px;
    }
    .subcontent2{
    
    	border: 1px solid black;
	    height: 460px;
	    width: 1000px;
    	margin-top: 40px;
    	display: flex;
    	border-radius: 15px;
    	
    }
    #sub2_container ul{
    	
    	margin-top: 25px;
    	font-size: 20px;
    }
    b{
    /* 	font-size:30px; */
    }
    .btns_div{
     margin-top: 20px;
   	 margin-left: 700px;
    	
    }
    
    
    #btn1_1{
    
    	border-radius: 10px;
    	color: white;
    	background-color:  rgb(53, 53, 133);
    	height: 45px;
    	width: 125px;
    	
    }
    
    #btn1_2{	
    
    	margin-left: 35px;
    	border-radius: 10px;
    	color: white;
    	background-color:  rgb(62, 129, 184);
    	height: 45px;
    	width: 135px;
    }
    
    #success_btn{
    	background-color: #252585;
    	border-color: #252585;
    	
    }
    
    #CareListsel_result1{
    	color: red;
    	margin-left: 60px;
    	margin-top: 22px;
    }
    
    
    #CareListsel_result2{
    	color: red;
    	margin-left: 60px;
    	margin-top: 22px;
    }
    
   /*  */
   
   
.modal-body {
    padding: 20px; /* 바디 패딩 */
    background-color: #f7f9fc; /* 부드러운 배경색 */
    border-radius: 15px; /* 모서리 둥글게 */
}

.date-container {
    display: flex; /* 플렉스 박스 사용 */
    align-items: center; /* 수직 정렬 */
    margin-top: 20px; /* 위쪽 마진 */
}

.date-container input[type="date"] {
    flex: 1; /* 입력 필드가 공간을 균등하게 차지 */
    padding: 15px; /* 내부 패딩 */
    border: 2px solid #007bff; /* 강조된 테두리 */
    border-radius: 10px; /* 테두리 둥글게 */
    font-size: 1em; /* 폰트 크기 */
    margin: 0 10px; /* 좌우 여백 */
    background-color: #ffffff; /* 흰색 배경 */
    transition: border-color 0.3s, box-shadow 0.3s; /* 전환 효과 */
}

.date-container input[type="date"]:focus {
    border-color: #0056b3; /* 포커스 시 테두리 색상 변경 */
    box-shadow: 0 0 5px rgba(0, 86, 179, 0.5); /* 포커스 시 그림자 효과 */
}

.button-group {
    display: flex; /* 버튼 그룹을 플렉스 박스로 설정 */
    justify-content: flex-end; /* 버튼을 오른쪽 정렬 */
    margin-top: 20px; /* 위쪽 마진 */
}

.button-group button {
    background-color: #28a745; /* 버튼 배경색 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 없음 */
    padding: 12px 25px; /* 패딩 */
    border-radius: 10px; /* 모서리 둥글게 */
    cursor: pointer; /* 마우스 커서 변경 */
    font-size: 1.1em; /* 버튼 폰트 크기 */
    font-weight: bold; /* 버튼 텍스트 두껍게 */
    margin-left: 15px; /* 버튼 사이 마진 */
    transition: background-color 0.3s, transform 0.2s; /* 호버 시 효과 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 버튼 그림자 */
}

.button-group button:hover {
    background-color: #218838; /* 호버 시 색상 변경 */
    transform: translateY(-2px); /* 호버 시 약간 위로 이동 */
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 강조 */
}

.button-group button:active {
    transform: translateY(0); /* 클릭 시 원래 위치로 돌아옴 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 클릭 시 그림자 복원 */
}

#careNo_go1 {
    width: 100%; /* 전체 너비 사용 */
    padding: 15px; /* 내부 패딩 */
    border: 2px solid #007bff; /* 강조된 테두리 */
    border-radius: 10px; /* 둥근 모서리 */
    font-size: 1em; /* 폰트 크기 */
    background-color: #ffffff; /* 흰색 배경 */
    transition: border-color 0.3s, box-shadow 0.3s; /* 전환 효과 */
    appearance: none; /* 기본 셀렉트 스타일 제거 */
    background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 16 16"><path fill="%23007bff" d="M4 6l4 4 4-4H4z"/></svg>'); /* 화살표 아이콘 추가 */
    background-repeat: no-repeat; /* 반복하지 않음 */
    background-position: right 10px center; /* 화살표 위치 조정 */
    background-size: 12px; /* 화살표 크기 조정 */
}

#careNo_go1:focus {
    border-color: #0056b3; /* 포커스 시 테두리 색상 변경 */
    box-shadow: 0 0 5px rgba(0, 86, 179, 0.5); /* 포커스 시 그림자 효과 */
    outline: none; /* 기본 포커스 아웃라인 제거 */
}

/* 옵션 스타일링 (선택된 것과 옵션의 스타일을 위한 추가) */
#careNo_go1 option {
    padding: 10px; /* 옵션 내부 패딩 */
    background-color: #ffffff; /* 배경 색상 */
    color: #333; /* 글자 색상 */
}

#careNo_go1 option:hover {
    background-color: #f1f1f1; /* 호버 시 배경색 변경 */
}


 
 </style>
 
 
 
 	<div class="dm_container"><h2>진단서 및 진료 확인서</h2>
 	
	 	<div class="dm_subcontainer"><h4 id="h4_text">발급절차</h4></div>
	 	
	 	<div id="subcontent">
	 		- 외래 접수 후  진단서 요청 시에는 환자 본인이 직접 방문하여 진료 받은 후 진단서 발급(의료법 제17조에 근거함)<br>
	 		- 환자가 사망 또는 의식불명인 경우에만 친족이 구비서류 준비하여 발급 요청<br>
	 		- 진단서(소견서) 재발행만 구비서류 지참하여 친족 또는 대리인 발급 가능(재발행은 3년 이내만 가능)
	 	</div>
	 	
	 	<div class="info_img">
	 		<img src="/vita/assets/image/증명서신청안내이미지.png" alt="">
	 	</div>
	 	
	 	<div class="subcontent2">
	 		<div id="sub2_container">
		 		<ul>
		 			<li>
		 				<b>발급시간</b><br>
		 					- 평일 : 오전 9시 ~ 오후 6시 <br>
		 					- 토요일 : 오전 9시 ~ 오후 1시<br>
		 					- 휴일 : 일요일, 공휴일, 개원기념일(10월15일)<br>
		 					<br>
		 			</li>
		 			
		 			<li>
		 				<b>외래진료사실 확인서/입퇴원확서등</b><br>
		 					- 원무팀 제증명통합창구(안내데스크옆)<br>
		 					- 무인제증명발급기(안내데스크옆)[환자 명의 핸드폰 문자인증 필요]<br>
		 					<br>
		 			</li>
		 			
		 			<li>
		 				<b>진료비 납입확인서(연말정산)/진료비 상세내역서(외래,입원)</b><br>
		 					- 원무팀 출력물창구(후문위치)<br>
		 					- 무인제증명발급기(후문위치)[환자 명의 핸드폰 문자인증 필요]<br>
		 					<br>
		 			
		 			</li>
		 		</ul>
		 		
	 		
	 	</div>
	 	
	 
	 	
 	
 	
 	</div>
 	
 	<div class="container">
 		<div class="btns_div">
	 		<button id="btn1_1" data-toggle="modal" data-target="#myModal1">진단서 신청</button>
	 		<button id="btn1_2" data-toggle="modal" data-target="#myModal2">진료확인서 신청</button>
	 	</div>
	 	

  <!-- The Modal -->
  <div class="modal fade" id="myModal1">
    <div class="modal-dialog">
      <div class="modal-content" style="margin-top: 170px;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">진단서 신청</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div>문서명 : <input type="text" readonly value="진단서" id="type_name1"></div><br>
        	
        	<div>진료조회 : <input type="date" id="care_date1"> ~ <input type="date" id="care_date_1"> 
        	<button onclick="fnCareList1();">조회</button>
        		<div id="CareListsel_result1"></div>
        	</div><br>
        	
        	<div>발급용도 : 
        		<select id="purpose1">
        			<option>보험제출</option>
        			<option>회사제출</option>
        			<option>개인소장</option>
        		</select>
        	</div><br>
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="success_btn" onclick="fnbtn1()">신청</button>
        </div>
        
      </div>
    </div>
  </div>
  
  <script>
  
	function fnbtn1(){
 		
 		if(confirm('"진단서"(을)를 신청하시겠습니까? ')){
 			
 			$.ajax({
 				url: '<%= contextPath%>/appication.ce',
 				data:{
 					userNo:<%= loginUser.getUserNo() %>,
 					type: $('#type_name1').val(),
 					/* cDate: $('.care_date').val(), */
 					purpose : $('#purpose1').val(),
 					careNo: $('#careNo_go1').val()
 				},
 				success: function(res){
 					console.log(res)
 					if(res > 0){
 						alert("성공적으로 신청하였습니다. 발급신청내역에서 확인하실 수 있습니다.");
 						
 					}else{
 						alert("해당날짜의 진료기록이 없거나 발급내역이 있습니다.");
 					}
 				}
 				
 			}) 
 			
 		}	
 	}
	
	
 	
	function fnCareList1(){
 		
		 let careList = '<select id="careNo_go1">';
		 		
				$.ajax({
					url:"<%= contextPath%>/careList.se",
					type:'post',
					data:{
						careDate1: $('#care_date1').val(),
						careDate2: $('#care_date_1').val()
					},
						success: function(res){
							console.log(res);
							
								if(res != ""){
								
								for(let i=0; i<res.length; i++){
									
									careList += '<option value="'+ res[i].careNo + '">'+ res[i].treatmentDate + '일'+'</option>'
														console.log(careList);
								}
								careList	+= '</select>'
								
								$('#CareListsel_result1').html(careList);
								
								
							}else{
								
								$('#CareListsel_result1').html('조회된 결과가 없습니다').css('color','red');
							}
							
							
							
							
							
							
							}
						}) 
				}
  
  </script>
  
  
  <!-- The Modal -->
  <div class="modal fade" id="myModal2">
    <div class="modal-dialog">
      <div class="modal-content" style="margin-top: 170px;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">진료확인서 신청</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<div>문서명 : <input type="text" readonly value="진료확인서" id="type_name2"></div><br>
        	
     			<div>진료조회 : <input type="date" id="care_date2"> ~ <input type="date" id="care_date_2"> 
        		<button onclick="fnCareList2();">조회</button>
        		<div id="CareListsel_result2"></div>
        	</div><br>
        	
        	
        	<div>발급용도 : 
        		<select id="purpose2">
        			<option>보험제출</option>
        			<option>회사제출</option>
        			<option>개인소장</option>
        		</select>
        	</div><br>
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal" id="success_btn" onclick="fnbtn2()">신청</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  
</div>
 	
 	
 
 <script>
 
	function fnbtn2(){
 		
 		if(confirm('"진료확인서"(을)를 신청하시겠습니까? ')){
 			
 			$.ajax({
 				url: '<%= contextPath%>/appication.ce',
 				data:{
 					userNo:<%= loginUser.getUserNo() %>,
 					type: $('#type_name2').val(),
/*  					cDate: $('.care_date2').val(), */
 					purpose : $('#purpose2').val(),
 					careNo: $('#careNo_go2').val()
 				},
 				success: function(res){
 					
 					if(res > 0){
 						alert("성공적으로 신청하였습니다. 발급신청내역에서 확인하실 수 있습니다.");
 						
 					}else{
 						alert("해당날짜의 진료기록이 없거나 발급내역이 있습니다.");
 					}
 				},
 				
 				
 			}) 
 			
 		}
 		
 		
 	}
	
	function fnCareList2(){
 		
		 let careList = '<select id="careNo_go2">';
		
		
		 		
				$.ajax({
					url:"<%= contextPath%>/careList.se",
					type:'post',
					data:{
						careDate1: $('#care_date2').val(),
						careDate2: $('#care_date_2').val()
					},
						success: function(res){
							
							
							if(res != ""){
								
								for(let i=0; i<res.length; i++){
									 
									careList += '<option value="'+ res[i].careNo + '">'+ res[i].treatmentDate +'</option>'
														console.log(careList);
								}
								careList	+= '</select>'
								
								$('#CareListsel_result2').html(careList);
								
								
							}else{
								
								$('#CareListsel_result2').html('조회된 결과가 없습니다').css('color','red');
							}
							
							
							
							
							}
						
					
						}) 
						
		
				}
 	
 
 </script>
 
 
 
 

  
	 <!-- nav, section 별도로 닫아주기-->
	 </nav>
	</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>