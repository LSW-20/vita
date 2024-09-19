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
      padding-top: 260px;
      padding-left: 120px;
    }
    #check{
        width: 144px;
        height: 144px;
    } 
    .container11{
        min-width: 913px;
    }
    .img-check{
        margin-left: 155px;
        margin-top: 66px;
        margin-bottom: 66px;
    }
    .text{
        margin-top:66px;
        margin-bottom: 66px;
        margin-left: -100px;
    }
    .table{
        width: 975px;
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
  
  	footer{
   
      margin-top: 130px;
    }   
   </style>
    <section>
      <div class="container11">
        <section class="success" >
    
          <div class="container" id="pad">
            <h3 >첫방문 안내 신청 완료</h3>
          
          
            <hr style= "border: 1px solid; color: rgb(31, 43, 108)">
            
              <div class="container border">
                  <div class="row">
                      <div class="col"><img src="/vita/assets/image/완료체크.jpg"  class="img-check" id="check"></div>
                      <div class="col">
                          <span><h1 class="text">신청 완료</h1></span>
                          <span><h6 class="text">
                            상담 간호사가 확인 후 전화로 예약을 도와드리겠습니다.<br><br>
                            <b style="color: rgb(31, 43, 108);">(상담 가능 시간: 평일 08:00 ~ 17:00)</b>
                          </h6>
                          
                      </div>
  
                  </div>
              
              </div>
              
              
              
              
              
      
          
              <br><br><br>
    
              <div align="center">
                   <a href="/vita/" class="btn" id="btn-color">메인화면으로</a>
              </div>
    
           
    
          
          </div>
    
      
      </div>
  
  
    </section>




	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>