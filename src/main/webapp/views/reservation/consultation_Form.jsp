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
        <h4 style="margin:auto"><b>내과</b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">의료진</b></h4><br>
        <h4 style="margin:auto"><b>홍길동</b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">희망검진일</b></h4><br>
        <h4 style="margin:auto"><b>2024년 9월 19일(목)</b></h4>
      </td>
      <td id="color" style="width:346px; height: 230px; border-left:rgb(245, 245, 245);border-right: rgb(245, 245, 245);">
        <h4 style="margin-top: 60px"><b style="color:black">내원시간</b></h4><br>
        <h4 style="margin:auto"><b>오전</b></h4>
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
            

            <div class="d-flex" >
                <div>
                    <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="medical department" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:400px; height: 50px;margin-left:70px;">
                    <option selected>내과</option>
                    <option>외과</option>
                    <option>치과</option>
                    <option>안과</option>
                    </select>
                </div>
                <div>
                    <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="medical department" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:400px; height: 50px; margin-left:515px;">
                        <option selected>홍길동</option>
                        <option>김개똥</option>
                        <option>김말똥</option>
                        <option>강개순</option>
                        </select>

                </div>
            </div>  
              
    </div>

    <br><br>
    <hr style= "border: 1px dashed; border-color:#bdbcbc;margin-left: 90px; margin-right: 90px;">
    <br><br>
    <h3 style="margin-left:150px"><sup style="color:rgb(255, 165, 0)">*</sup><b> 내원시간 선택</b></h3>
    <br><br>
    <div class="container11" style="margin-left:93px">
            

        <div class="d-flex" >
            <div style="margin-left:120px">
                <table class="container12 table-bordered" id="table_custom" style="margin-left:-55px;">
                 
                    <tr class="d-flex">
                
                      <td  style="width:150px; height: 230px; border-right-style: dashed; border-right:white;">
                        <button type="button" class="btn btn-outline-primary" style="width:120px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); margin-left:30px;" ><h3 style="color:black">오전</h3></button>
                      </td>
                      <td style="width:150px; height: 230px; border-right-style: dashed; border-right:white; border-left:white;">
                        <button type="button" class="btn btn-outline-primary" style="width:120px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); margin-left:30px;"><h3 style="color:black">오후</h3></button>
                      </td>
                      <td style="width:150px; height: 230px; border-right:white; border-left:white;">
                        <button type="submit" class="btn btn-outline-primary" style="width:120px; height:70px; margin-top:65px; border-color:rgb(190, 189, 189); background-color: #1F2B6C; margin-left:30px;"><h3 style="color:white">선택</h3></button>
                      </td>
                      
                      
                     
                    </tr>
                   
                    </table>
            </div>
            <div style="margin-left:410px;">
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
        <table class="container11 table-bordered" id="table_custom">
            <tr>
                <td id="color" style="height:70px;"><h5>진료과</h5></td>
                <td><h5 align="left" style="margin-left:30px;">내과(수정요망)</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px;"><h5>의료진</h5></td>
                <td><h5 align="left" style="margin-left:30px;">홍길동(수정요망)</h5></td>
            </tr>
            <tr>
                <td id="color" style="height:70px; margin-top:15px;"><h5>내원시간</h5></td>
                <td>
                    <h5 align="left" style="margin-left:30px; margin-top:10px;">오전</h5>
                </td>
            </tr>
        </table>
    </div>

      
  








    <br> 
     <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
     <br><br>



     <br><br><br>

     
    

        
        <div align="center">
          <a href="/vita/views/reservation/consultation_Success.jsp" class="btn border-1 border-dark" id="btn-color" style="width: 150px;" >예약신청하기</a>
          <a href="/vita/views/reservation/personal.jsp" class="btn btn-light border-2 border-dark"  style="width: 150px; margin-left:30px;" >이전</a>
          
        </div>

        <br><br> 





        
  </section>


		
		<%@ include file="/views/common/footer.jsp" %>
</body>
</html>