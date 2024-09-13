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
          padding-top: 100px;
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
          <section class="success" >
      
            <div class="container" id="pad">
              <h3 >신청 완료</h3>
            
            
              <hr style= "border: 1px solid; color: rgb(31, 43, 108)">
              
                <div class="container border">
                    <div class="row">
                        <div class="col"><img src="/vita/assets/image/완료체크.jpg"  class="img-check" id="check"></div>
                        <div class="col">
                            <span><h1 class="text">신청 완료</h1></span>
                            <span><h6 class="text">증명서신청 완료 되었습니다.</h6>
                        </div>

                    </div>
                
                </div>
                 
                <br><br>

                
                <h3>신청 내용</h3><br>
                
                
        
                  <table class="table table-bordered" style="width:1004px">
                    
                 
                      <tr>
                        <td id="color" style="width:200px">선택항목</td>
                        <td style="width:302px">진료확인서</td>
                        <td id="color" style="width:200px">발급신청일</td>
                        <td style="width:302px">2024년9월9일 (목)</td>
                        
                      </tr>
                   
                  
                  </table>
            
                <br><br><br>
      
                <div align="center">
                    <button type="button" class="btn" id="btn-color">메인화면으로</button>
                </div>
      
             
      
            
            </div>
      
        
        </div>
  
  
      </section>
		




		<%@ include file="/views/common/footer.jsp" %>

</body>
</html>