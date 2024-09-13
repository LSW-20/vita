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
        
        .container11{
          min-width: 1901px;
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
          margin-top: 1630px;
        }   
    
       </style>
      <section >

        <h2 id="pad"><b>전화/방문예약</b></h2>
        <br>
        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
        <br>
         
        <div class="container11">
          <div class="d-flex ">
            <div class="p-2" style="margin-left: 120px;">
              <img src= "/vita/assets/image/전화안내.jpg"  class="img-check" id="img"><br><br>
              <h4 style="margin-left: 75px;">전화예약</h4><br>
              <h4 style="margin-left: 55px; color: #1F2B6C">(02)123-4567</h4>
            </div>
            <div class="p-2" style="margin-left: 100px;">
            
              <br><br><br><br>
              <h5> ※  &nbsp;&nbsp;신환, 초진, 재진환자 예약이 가능합니다. </h5><br>
              <h5>  &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;전화예약을 한 후 진료당일 예약시간 20분전까지 내원하여 원무팀 </h5><br>
              <h5> &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; 접수, 수납창구에서 수납하고 진료를 받습니다. </h5>
          
              <br><br><br><br>
             
          </div>
          </div>
        </div>

        <br>
        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
        <br>

        <div class="container11">
          <div class="d-flex ">
            <div class="p-2" style="margin-left: 135px;">
              <img src="/vita/assets/image/방문예약.jpg"   class="img-check" id="img" style="margin-left: 14px;"><br><br>
              <h4 style="margin-left: 68px;">방문예약</h4><br> 
            </div>
            <div class="p-2" style="margin-left: 100px;">
            
              <br>
              <h4 style="color: #1F2B6C"><b>당일방문 접수 및 진료</b></h4><br><br>
              <h5>예약없이 당일 방문하여 원무창구에서 진료신청을 하셔도 진료는 가능합니다. </h5>
              <h5>그러나 예약환자 우선 진료에 따라 대기시간이 길어질 수 있으며 일부 진료과는</h5>
              <h5>부득이 진료를 못 받을 경우가 생길 수 있습니다.</h5><br><br>

              <h4 style="color: #1F2B6C"><b>재진 예약</b></h4><br><br>
              <h5>진료 받으신 후 담당의사와 다음 진료일시를 약속합니다. 예약날짜에 예약시간 10분전까지 곧바로 해당진료과로 가시면 됩니다.</h5>
          
              <br><br><br><br>
            </div>
          </div>
        </div>
        
        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">

         
        <br><br><br><br>

        <div align="center">
          <button type="button" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">메인화면으로</button>
          <button type="button" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:30px;">이전</button>
      </div>
    
      <br><br><br><br>




      </section>
        












		<%@ include file="/views/common/footer.jsp" %>

</body>
</html>