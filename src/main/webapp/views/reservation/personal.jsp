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
        .td {
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
           margin-top: 1560px;
        }   
    
    
       </style>
      <section >

        <h2 id="pad"><b>본인 예약하기</b></h2>
        <br>

        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
        <br>

        <h4 style="margin-left:93px"><b>진료예약을 위해 주민등록번호 확인이 필요합니다.</b></h4>
      
        <br>
        
        <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
          <div style="margin-left:30px;">
          <h5><b> [고유식별번호 처리에 대한 안내]</b></h5><br>
          <h5>· 수집하는 고유식별정보 항목 : 주민등록번호, 외국인등록번호</h5>
          <h5>· 수집 ·이용목적 : 의료보험 적용 여부와 진료예약을 위한 목적</h5>
          <h4 style="color:rgb(31, 43, 108)">· 보유 및 이용 기간 : 의료법에 준함</h4><br>
          </div>
        </div>
    
        <br><br>
        
        <form action= "/server/test.do">
          <filedset>
            <input type="radio" id="check" name="check" value="T" style="margin-left: 1480px;">
            <label for="checkO">&nbsp;동의합니다.</label>
            <input type="radio" id="non_check" name="check" value="F" style="margin-left: 70px;">
            <label for="checkX">&nbsp;동의하지 않습니다. </label>
          </fieldset>


          <br><br>
          <h6 style="margin-left:1060px;">· 개인의 고유식별정보 제공동의는 거부하실 수 있으며, 거부할 경우 서비스 사용이 일부 제한될 수 있습니다.</h6>
        
      
           </form>





           <br><br>
           <h4 style="margin-left:93px"><b>진료받으실 분의 주민등록번호(외국인등록번호)를 입력해주세요.</b></h4>
           <h4 style="margin-left:93px"><b>보건부 고시에 의거 ‘진료일에 본인 외 대리 진료가 제한’됨을 알려드립니다.</b> </h4>
           
           <br>
           <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
           <br>
            <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
                    
                <tr>
                  <td class="td" id="color" style="width:500px; height: 70px;"><h4 style="margin:auto">성명</h4></td>
                  <td><h4 style="margin-left: 50px; margin-top: 10px;">이름값 가져오세요</h4></td>
                 
                </tr>
                 <tr>
                  <td class="td" id="color" style="height: 70px;"><h4 style="margin:auto">주민등록번호(외국인등록번호)</h4></td>
                 
                  <div class="container11">
                    
                    <td> 
                      <div class="d-flex "> 
                           <div style="margin-left: 50px; margin-top: 10px;"><h4>생년월일값 가져오세요</h4></div>
                           <div style="margin-left: 25px; margin-top: 10px;"><h4>-</h4></div>
                          <div> <input type="text" class="form-control" id="num" style="width:535px; height:50px; margin-left: 25px"></div>
                      </div>
                     </td>  
                      
                    </div>
                  </div>
                </tr>
            </table>

             <br><br>
            
            <h4 style="margin-left:93px">※ 모든항목을 입력하셔야 예약 일정을 선택 할 수 있습니다.</h4>

            <br><br> <br><br> <br><br> 

            
            <div align="center">
              <button type="button" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">다음</button>
              <button type="button" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:30px;">이전</button>
            </div>

            <br><br> <br><br> <br><br> 

      </section>








		<%@ include file="/views/common/footer.jsp" %>

</body>
</html>