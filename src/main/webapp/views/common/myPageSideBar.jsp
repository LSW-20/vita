<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <style>
    section{
        position:absolute;
        width: 100%;
        height: 900px;
        margin-top: 153px;
    }
    .sidemenuDiv{
        width: 100%;
        height: 100%;
        display: flex; 
    }
   
    #navContent{
        width: 80%;
        height: 100%;
    }
    #MyPageHeader{
        text-align: center;
        color: white;
        font-weight: 900;
        font-size: 30px;
    }
    #MyPageHeader p{
        font-weight: 900;
        font-size: 15px;
        margin-bottom: 50px;
    }
    #MyPageMenu{
        margin: auto;
        left: 50px;
        background-color: white;
        width: 200px;
        height: 320px;
        padding: 10px;
        border-radius: 15px;
        
    }
    #MyPageMenu span{
       font-size: 20px;
       font-weight: 900;
    }
    #MyPageMenu li{
        padding: 10px;
    }
  
    /* 고객의소리 게시글리스트 thead색 - 보겸*/
    #csthead{
      background-color:#eaf3fa;
      
    }
   
  </style>
	<!-- Header, Nav start -->
	
	<!-- Header end  -->
  <section>
    <nav class="sidemenuDiv">
        <div class="side" id="sideMenu">
            <div id="MyPageHeader">
                <br>
                name 님<br>
                환영합니다.<br>
                <p>환자번호 : userId</p>
            </div>
            <div id="MyPageMenu">
                <ul class="">
                    <span>마이페이지</span>
                    <li class=""><a href="" style="text-decoration: none;">정보수정</a></li>
                    <li class=""><a href="" style="text-decoration: none;">검진 내역 조회</a></li>
                    <li class=""><a href="" style="text-decoration: none;">예약 내역 조회</a></li>
                    <li class=""><a href="" style="text-decoration: none;">증명서 발급</a></li>
                    <li class=""><a href="" style="text-decoration: none;">발급 신청 조회</a></li>
                    <li class=""><a href="" style="text-decoration: none;">고객의 소리</a></li>
                </ul>
            </div>
        </div>
  
    
    