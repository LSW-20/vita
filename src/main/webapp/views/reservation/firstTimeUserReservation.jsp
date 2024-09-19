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
	       
	          margin-top: 2100px;
	        }   
	        
	    
	       </style>
	      <section>
	
	        <h2 id="pad"><b>첫 방문 고객 예약하기</b></h2>
	        <br>
	
	        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
	        <br>
	
	        <h4 style="margin-left:93px"><b>예약하시는 분 휴대전화</b></h4>
	        <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
	        <br>
	
	        <div class="container11">
	          <div class="d-flex" style="margin-left: 90px;">
	              <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="phone_no1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:230px; height: 38px;">
	                <option selected>010</option>
	                <option>011</option>
	                <option>016</option>
	                <option>017</option>
	                <option>018</option>
	                <option>019</option>
	              </select>
	
	              <div><h3 style="margin-left:15px">-</h3></div>
	
	              <div class="form-group" style="margin-left:15px">
	                <input type="text" class="form-control" id="phone_no2">
	              </div>
	
	              <div><h3 style="margin-left:15px">-</h3></div>
	
	              <div class="form-group" style="margin-left:15px">
	                <input type="text" class="form-control" id="phone_no3">
	              </div>
	              
	              <div><button type="submit" class="btn border-1 border-dark" id="btn-color" style="width: 150px; margin-left:60px">제출하기</button></div>
	          </div>
	        </div>
	        
	      
	        <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
	        <br><br>
	        <h3 style="margin-left:93px">진료받으실 분의 주민등록번호(외국인등록번호)를 입력하여 주시기 바랍니다.</h3>
	        <br>
	        <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
	          <div style="margin-left:30px;">
	          <h5><b> [고유식별번호 처리에 대한 안내]</b></h5><br>
	          <h5>· 수집하는 고유식별정보 항목 : 주민등록번호, 외국인등록번호</h5>
	          <h5>· 수집 ·이용목적 : 의료보험 적용 여부와 진료예약을 위한 목적</h5>
	          <h4 style="color:rgb(31, 43, 108)">· 보유 및 이용 기간 : 의료법에 준함</h4>
	          <h5>· 개인의 고유식별정보 제공동의는 거부하실 수 있으며, 거부할 경우 서비스 사용이 일부 제한될 수 있습니다.</h5><br>
	          </div>
	        </div>
	
	        <br><br>
	        <form action= "/server/test.do">
	          <filedset>
	              <input type="radio" id="check" name="check" value="T" style="margin-left: 1460px; cursor: pointer;">
	              <label for="checkO">&nbsp;동의합니다.</label>
	              <input type="radio" id="non_check" name="check" value="F" style="margin-left: 70px; cursor: pointer;">
	              <label for="checkX">&nbsp;동의하지 않습니다. </label>
	          </fieldset>
	         
	          <br><br>
	
	          <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
	            <div style="margin-left:30px;">
	            <h5><b>  [개인정보 수집 이용에 대한 안내]</b></h5><br>
	            <h5>· 수집하는 개인정보 항목 : 이름, 휴대폰전화번호</h5>
	            <h5>· 수집 · 이용목적 : 진료 예약 및 진료 안내</h5>
	            <h4 style="color:rgb(31, 43, 108)">· 보유 및 이용 기간 : 의료법에 준함</h4>
	            <h5>· 개인정보 수집 이용 동의는 거부하실 수 있으며, 거부할 경우 서비스 사용이 일부 제한될 수 있습니다.</h5><br>
	            </div>
	          </div>
	  
	          <br><br>
	          <form action= "/server/test.do">
	            <filedset>
	                <input type="radio" id="check" name="check1" value="T" style="margin-left: 1460px; cursor: pointer;">
	                <label for="checkO">&nbsp;동의합니다.</label>
	                <input type="radio" id="non_check" name="check1" value="F" style="margin-left: 70px; cursor: pointer;">
	                <label for="checkX">&nbsp;동의하지 않습니다. </label>
	            </filedset>
	
	           </form>
	           <br><br><br><br>
	           <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
	           <br>
	            <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
	                    
	                <tr>
	                  <td id="color" style="width:500px; height: 70px;"><h4 style="margin:auto">성명</h4></td>
	                  <td> <input type="text" class="form-control" id="name" style="width:1070px; height:50px; margin-left:30px"></td>
	                 
	                </tr>
	                 <tr>
	                  <td id="color" style="height: 70px;"><h4 style="margin:auto">주민등록번호(외국인등록번호)</h4></td>
	                  <td class="d-flex"> 
					            <input type="text" class="form-control" id="num" style="width:500px; height:50px; margin-left:30px">
					            <h3 style="margin-left:27px; margin-top: 7px;">-</h3>
					            <input type="text" class="form-control" id="num" style="width:500px; height:50px; margin-left:30px">
					          </td>
	                  
	                </tr>
	            </table>
	
	             <br><br>
	            
	            <h4 style="margin-left:93px">※ 홈페이지를 통해 첫방문 고객 예약을 하시면, 남겨주신 연락처로 상담 간호사가 전화를 드려 예약을 도와드립니다.</h4>
	
	            <br><br> <br><br> <br><br>
	
	            
	            <div align="center">
	               <a href="/vita/views/reservation/first_Success.jsp" class="btn border-1 border-dark" id="btn-color" style="width: 150px;">다음</a>
	               <a href="/vita/views/reservation/consultation_AfterLogin.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:30px;">이전</a>
	              
	            </div>
	
	            <br><br> <br><br> <br><br> 
	
	      </section>
        
        








	<%@ include file="/views/common/footer.jsp" %>

</body>
 
</html>