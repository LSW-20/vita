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
 	
 		<div class="btns_div">
	 		<button id="btn1_1" onclick="fnbtn1();">진단서 신청</button>
	 		<button id="btn1_2" onclick="fnbtn2();">진료확인서 신청</button>
	 	</div>
 	
 	
 
 <script>
 	function fnbtn1(){
 		if(confirm('"진단서"(을)를 신청하시겠습니까? ')){
 			location.href; /* 신청서 insert 데이터 어떻게 보낼건지 생각해보자! */
 		}
 	}
 	
 	
 	
 	function fnbtn2(){
 		if(confirm('"진료확인서"(을)를 신청하시겠습니까? ')){
 			location.href; /* 신청서 insert 데이터 어떻게 보낼건지 생각해보자! */
 		}
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