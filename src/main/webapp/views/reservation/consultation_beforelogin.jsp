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
            width: 144px;
            height: 144px;
        } 
        #img1{
           width: 220px;
           height: 180px;
        }
        .container11{
          min-width: 1903px;
        }
        .img-check{
            margin-left: 30px;
            margin-top: 31px;
            
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
          margin-left: 250px;
        }
        #vertical-line {
            border-left: 1px dashed #000; 
            height: 400px; 
        }
        section{
          
            position: absolute;
            margin-top: 155px;
            
          }
          
        footer{
       
          margin-top: 2317px;
        }   
        
        
    
       </style>
      <section >

      <h2 id="pad"><b>진료 예약 (당일 예약만 가능)</b></h2>
      <br>
      <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
      <br>
      <!-- 줄 -->
      
      <div class="container11">
        <div class="d-flex ">
          <div class="p-2" style="margin-left: 150px;">
            <img src="/vita/assets/image/첫방문.jpg"   class="img-check" id="img">
          </div>
          <div class="p-2">
            <h5 id="common-top"><b>진료를 처음 보시는 경우</b></h5>
            <br>
            <h6>연락처를 남겨주시면 상담 간호사가 전화를 드려</h6><br>
            <h6>예약을 도와드립니다.</h6>
            <br><br>
            <div align="left">
              <a href="/vita/views/reservation/firstTimeUserReservation.jsp" class="btn" id="btn-color" >첫방문 고객 예약하기</a>
            </div>
          </div>
          <div class="ml"id="vertical-line"></div>
          <div style="margin-left:110px">
            <img src="/vita/assets/image/본인예약.jpg"   class="img-check" id="img">
          </div>
          <div class="p-2">
            <h5 id="common-top"><b>진료를 처음 보시는 경우</b></h5>
            <br>
            <h6>연락처를 남겨주시면 상담 간호사가 전화를 드려 </h6><br>
            <h6>예약을 도와드립니다.</h6>
            <br><br>
            <div align="left">
             <a href="/vita/views/reservation/firstTimeUserReservation.jsp" class="btn" id="btn-color" >본인 예약하기</a>
              <a href="/vita/views/reservation/firstTimeUserReservation.jsp" class="btn ml-4" id="btn-color" >본인 예약 조회하기</a>
            </div>
          </div>
         
        </div>
        </div>
        
        
        <br>
        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
        <br>
        <!-- 줄 -->
        
        
        <h3 id="pad">간편 서비스</h3>
        <br><hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
        
        <!-- 줄 -->
        <div class="container11">
          <div class="d-flex" style="margin-left: 65px;">  
            <div class="p-2" style="margin-top: 70px; margin-left: 70px">
              <img src="/vita/assets/image/회원가입.jpg"   class="img-check" id="img1" style="cursor: pointer;"><br>
              <h3 style="margin-top: 30px; margin-left:85px; cursor: pointer;">회원가입</h3>
            </div>
            
            <div id="vertical-line" style="margin-left:100px; margin-top: 40px;"></div>
            
            <div class="p-2" style="margin-top: 70px; margin-left: 90px">
              <img src="/vita/assets/image/로그인및아이디비번.jpg"   class="img-check" id="img1" style="cursor: pointer;">
              <h3 style="margin-top: 30px; margin-left:90px; cursor: pointer;">로그인</h3>
              <h3 style="cursor: pointer;">&nbsp;&nbsp;&nbsp;&nbsp;</h3>
              <h3 style="cursor: pointer;">&nbsp;아이디/비밀번호찾기</h3>
            </div>
            
            <div id="vertical-line" style="margin-left:100px; margin-top: 40px;"></div>
            
            <a href="/vita/views/Department/department.jsp">
            <div class="p-2" style="margin-top: 70px; margin-left: 90px">
              <img src="/vita/assets/image/의료진료과.jpg"   class="img-check" id="img1" style="cursor: pointer;">
              <h3 style="margin-top: 30px; margin-left:50px; cursor: pointer;">의료진/진료과</h3>
            </div>
            </a>
            
            
            <div id="vertical-line" style="margin-left:100px; margin-top: 40px;"></div>
            
             <a href="/vita/views/selectContents/directions.jsp">
            <div class="p-2" style="margin-top: 70px; margin-left: 70px">
              <img src="/vita/assets/image/오시는길.jpg"  class="img-check" id="img1" style="cursor: pointer;">
              <h3 style="margin-top: 30px; margin-left:80px; cursor: pointer;">오시는길</h3>
            </div>
           	</a>
          </div>
        </div> 
        
        <br><br><br><br><br><br>
        
        <!-- 줄 -->
         
        
        
         <div class="container11 p-3 my-3" style= "background-color: #3A52CF; color:white">
          <h1 style="margin-top: 50px; margin-left:50px">인터넷 예약이 어려우신가요?  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전화문의 (02)123-4567</h1>  
          
          <br><br><br><br><br>
          <h3 style="color:#9395C7; margin-left:50px">·  대표 번호로 연락주시면 상담원이 예약을 도와드립니다. (평일: 오전 8시 ~ 오후 5시)</h3><br>
          <h3 style="color: #DAD428; margin-left:50px">·  외국인은 홈페이지 예약이 불가능하오니 콜센터 이용 바랍니다.</h3><br>
          <h3 style="color: #DAD428; margin-left:50px">·  만 18세 미만의 소아 및 청소년은 내과 대신에 소아청소년과를 이용해 주시기 바랍니다.</h3><br>
          <h3 style="color: #DAD428; margin-left:50px">·  의료급여 환자분의 경우, 처음 진료를 받으실 때 의료급여증과 1차 의료기관(병 · 의원) 및 보건소에서 발급하는 진료의뢰서를</h3><br>
          <h3 style="color: #DAD428; margin-left:50px">·  제출하셔야 보험혜택을 받을 수 있습니다. (선택병원이 지정되어 있으신 경우엔 해당병원에서 의뢰서를 발급받으셔야 합니다.)</h3>
          <br><br><br><br><br>

        </div>
         
         
        </section>
        























	<%@ include file="/views/common/footer.jsp" %>


</body>
</html>