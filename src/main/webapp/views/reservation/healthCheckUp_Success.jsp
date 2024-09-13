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
    
       </style>
       <section>
        <div class="container11">
      
            <div class="container" id="pad">
              <h3 >예약완료</h3>
            
            
              <hr style= "border: 1px solid; color: rgb(31, 43, 108)">
              
                <div class="container border">
                    <div class="row">
                        <div class="col"><img src="/vita/assets/image/완료체크.jpg"  class="img-check" id="check"></div>
                        <div class="col">
                           <h1 class="text">검진 예약신청 완료</h1>
                           <h6 class="text">원활한 검진진행을 위해 내원하셔서 문진표 작성을 미리 완료해주세요.</h6>
                        </div>

                    </div>
                
                </div>
                 
                <br><br>

                
                <h3>결제 내용</h3>
                <br>
                
                
        
                  <table class="table table-bordered" style="width:1004px">
                    
                 
                  		 <tr>
                        <td id="color" style="width:200px">검진 받을 병원</td>
                        <td style="width:302px">비타병원</td>
                        <td id="color" style="width:200px">고객 번호</td>
                        <td style="width:302px">BT-00000000(수정요망)</td>
                        
                      </tr>
                      
                      <tr>
                        <td id="color" style="width:200px">희망 검진일</td>
                        <td style="width:302px">2024-00-00(수정요망)</td>
                        <td id="color" style="width:200px">내원 시간</td>
                        <td style="width:302px">오전(수정요망)</td>
                        
                      </tr>
                      
                      <tr>
                        <td id="color" style="width:200px">검진 프로그램</td>
                        <td style="width:302px">일반 건강검진</td>
                        <td id="color" style="width:200px">신청일</td>
                        <td style="width:302px">2024-00-00(수정요망)</td>
                        
                      </tr>
                      
                      <tr>
                        <td id="color" >유형</td>
                        <td style="border-right: white">개인검진 (수정요망)</td>
                      
                      </tr>
                  
                  </table>
            
                <br><br><br><br>
      
                <div align="center">
                    <button type="button" class="btn" id="btn-color">메인화면으로</button>
                </div>
      
              <br><br><br>	
      
            
            </div>
      
        
        </div>
  
  
      </section>





		<%@ include file="/views/common/footer.jsp" %>

</body>
</html>