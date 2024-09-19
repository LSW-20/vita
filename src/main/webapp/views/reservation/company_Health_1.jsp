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
      min-width: 1720px;
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
   
      margin-top: 1400px;
    }   
    

   </style>
  <section>

    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br><br><br><br>
  

    <div class="container11" >
     
        <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; border-color:white;">
                
            <tr>
              <td style="border-color:white; margin-left:50px;"><h2 style="margin-left:150px;">소속기업</h2></td>
              <td class="d-flex" style="border:0px solid; margin-left:50px;"> 
                <div style="border:0px solid;">
                    <input type="text" class="form-control" id="name" style="width:750px; height:70px; ">
                </div>
                <div>
                    <button type="button" class="btn border-1 border-dark" id="btn-color" style="height:68px;width: 150px; margin-left:50px;">조회</button>
                </div>
              </td>
             
            </tr>
            
        </table>
   
    <br><br><br><br>

    <h4 style="margin-left:93px"><b> →  해당 소속기업(단체)을 정확히 기입해주세요.</b></h4>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br><br>
    <h3 style="margin-left:93px;">이름/사번 입력(기업)</h3>
    <br><br>
     <table class="container12 table-bordered" id="table_custom" style="margin-left:93px; ">
             
        <tr class="d-flex" style="margin-left:200px;">
            
            <td  style="width:200px; height: 230px; border-right-style: dashed; border:white; ">
              <h3 style="margin-top:80px;">이름</h3>
            </td>
            <td style="width:346px; height: 230px; border-right-style: dashed; border:white;">
                <input type="text" class="form-control" id="name" style="width:340px; height:70px; margin-top:65px;">
            </td>
            <td  style="width:200px; height: 230px; border-right-style: dashed; border:white; ">
                <h3 style="margin-top:80px; margin-left:120px;">사번</h3>
              </td>
              <td style="width:346px; height: 230px; border-right-style: dashed; border:white;">
                  <input type="text" class="form-control" id="name" style="width:340px; height:70px; margin-top:65px; margin-left:50px;">
            </td>
            
            
           
          </tr>
        
     </table>

    
     <br><br> <br><br> <br><br> <br><br> 

        
        <div align="center">
          <a href="/vita/views/reservation/company_Health_2.jsp" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">다음</a>
          <a href="/vita/views/reservation/healthCheckUp_AfterLogin.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:30px;">이전</a>
        </div>

        <br><br> <br><br>  





        
  </section>



	<%@ include file="/views/common/footer.jsp" %>


</body>
</html>