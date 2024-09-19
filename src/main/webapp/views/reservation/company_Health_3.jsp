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
   
      margin-top: 1780px;
    }   
    

   </style>
  <section>

    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h3 style="margin-left:93px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 희망검진일</b></h3>
   <br>
  

   <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
             
    <tr class="d-flex">

      <td id="color" style="width:346px; height: 230px; border-right-style: dashed; ">
        <h4 style="margin-top: 60px"><b style="color:black">희망검진일</b></h4><br>
        <h4 style="margin:auto"><b>2024년 9월 19일(목)</b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);border-right: rgb(245, 245, 245);"><h4 style="margin:auto">
        <h4 style="margin-top: 60px"><b style="color:black">검사시간</b></h4><br>
        <h4 style="margin:auto"><b>오전</b></h4>
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
        <div class="d-flex" >
            

            <form action="/action_page.php">
                <div class="form-group">
                    <label for="yearSelect">년도</label><br>
                      <select id="year" style="width:345px;">
                                    <option value="">년도</option>
                                    <script>
                                    const currentYear = new Date().getFullYear();
                                    document.write('<option value="' + currentYear + '">' + currentYear + '</option>');
                                    </script>
                                </select>
                </div>
                
                <div class="d-flex" >
                <div class="form-group mt-3">
                    <label for="monthSelect">월</label><br>
                        <!-- 월 선택 -->
                         <select id="month" style="width:150px;">
                                    <option value="">월</option>
                                    <script>
                                        // 1월부터 12월까지 표시
                                        for (let i = 1; i <= 12; i++) {
                                            document.write('<option value="' + i + '">' + i + '월</option>');
                                        }
                                    </script>
                                </select>
                </div>
        
                <div class="form-group mt-3" style="margin-left:45px;">
                    <label for="daySelect" >일</label><br>
                                <select id="day" style="width:150px;">
                                    <option value="">일</option>
                                    <script>
                                        // 1일부터 31일까지 표시
                                        for (let i = 1; i <= 31; i++) {
                                            document.write('<option value="' + i + '">' + i + '일</option>');
                                        }
                                    </script>
                                </select>
                </div>
            </div>
        
            </form>

        
        <div  action="/action_page.php" style="border:1px dashed;border-left:#212529; margin-left:175px"> </div>

        <div style="margin-left:170px">
            <table class="container12 table-bordered" id="table_custom" >
             
                <tr class="d-flex">
            
                  <td  style="width:346px; height: 230px; border-right-style: dashed; border-right:white;">
                    <button type="button" class="btn btn-outline-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189)" clicked><h3 style="color:black">오전</h3></button>
                  </td>
                  <td style="width:346px; height: 230px; border-right-style: dashed; border-right:white; border-left:white;">
                    <button type="button" class="btn btn-outline-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189)"><h3 style="color:black">오후</h3></button>
                  </td>
                  <td style="width:346px; height: 230px;  border-left:white;">
                    <button type="submit" class="btn btn-outline-primary" style="width:200px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: #1F2B6C;"><h3 style="color:white">선택</h3></button>
                  </td>
                  
                  
                 
                </tr>
               
                </table>
        </div>


      </div>
    </div>
    <br>
     

     
    <br><br><br>
    <h3 style="margin-left:93px"><b>예약하신 정보</b></h3>
    <hr style="border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>

    <div class="d-flex" style="margin-left:93px">
        <table class="container11 table-bordered" id="table_custom">
            <tr>
                <td id="color" style="height:70px;"><h5>검진 프로그램</h5></td>
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
                        <b style="color:#1F2B6C">0원</b> (추가검사 포함 : 0원)
                       
                    </h5>
                </td>
            </tr>
        </table>
    </div>

   
  


    <br> 
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>

     <form action= "/server/test.do">
      <filedset>
          <input type="radio" id="check" name="check" value="T" style="margin-left: 93px; cursor: pointer;">
          <label for="checkO">&nbsp;검진 관련 주의사항 안내 및 체크사항을 확인하였습니다. <b style="color:red;">(필수)</b></label>
          
      </fieldset>
    </form>


     <br><br><br>

     
    

        
        <div align="center">
          <a href="/vita/views/reservation/healthCheckUp_Success.jsp" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">예약 신청하기</a>
          <a href="/vita/views/reservation/company_Health_2.jsp" class="btn btn-light border-2 border-dark"  style="width: 150px; margin-left:30px;">이전</a>
        </div>

        <br><br> 





        
  </section>
		














		<%@ include file="/views/common/footer.jsp" %>


</body>
</html>