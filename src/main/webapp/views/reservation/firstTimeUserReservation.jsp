<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%-- <%
    String alertMessage = (String) request.getAttribute("alertMessage");
    if (alertMessage != null) {
%>
    <script>
        alert("<%= alertMessage %>");
    </script>
<%
    }
%>  --%>
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
	        #submitButton{
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
	       
	       <form action= "<%= contextPath %>/first.rv"  method="post">

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
	              <select class="btn btn-outline-light border-2 border-dark text-dark dropdown-toggle dropdown-toggle-split" id="phone_no1" name="phone1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:230px; height: 38px;">
	                <option selected>010</option>
	                <option>011</option>
	                <option>016</option>
	                <option>017</option>
	                <option>018</option>
	                <option>019</option>
	              </select>
	
	              <div><h3 style="margin-left:15px">-</h3></div>
	
	              <div class="form-group" style="margin-left:15px">
	                <input type="text" class="form-control" name="phone2" maxlength="4" id="phone_no2" required>
	              </div>
	
	              <div><h3 style="margin-left:15px">-</h3></div>
	
	              <div class="form-group" style="margin-left:15px">
	                <input type="text" class="form-control" name="phone3" maxlength="4"  id="phone_no3" required>
	              </div>
	             
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
	        
	          <fieldset>
	              <input type="radio" id="checkAgree" name="check" value="T" style="margin-left: 1460px; cursor: pointer;">
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
	          
	            <fieldset>
	                <input type="radio" id="checkAgree1" name="check1" value="T" style="margin-left: 1460px; cursor: pointer;">
	                <label for="checkO">&nbsp;동의합니다.</label>
	                <input type="radio" id="non_check1" name="check1" value="F" style="margin-left: 70px; cursor: pointer;">
	                <label for="checkX">&nbsp;동의하지 않습니다. </label>
	            </fieldset>
	
	          
	           <br><br><br><br>
	           <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
	           <br>
	            <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
	                    
	                <tr>
	                  <td id="color" style="width:500px; height: 70px;"><h4 style="margin:auto">성명</h4></td>
	                  <td> <input type="text"  name="userName" class="form-control" maxlength="10" id="name" style="width:1070px; height:50px; margin-left:30px" required></td>
	                 
	                </tr>
	                 <tr>
	                  <td id="color"   style="height: 70px;"><h4 style="margin:auto">주민등록번호(외국인등록번호)</h4></td>
	                  <td class="d-flex"> 
					            <input type="text" name="userSSN1" class="form-control" maxlength="6" id="num1" style="width:500px; height:50px; margin-left:30px" required>
					            <h3 style="margin-left:27px; margin-top: 7px;">-</h3>
					            <input type="password" name="userSSN2" class="form-control" maxlength="7" id="num2" style="width:500px; height:50px; margin-left:30px" required>
					          </td>
	                  
	                </tr>
	            </table>
	
	             <br><br>
	            
	            <h4 style="margin-left:93px">※ 홈페이지를 통해 첫방문 고객 예약을 하시면, 남겨주신 연락처로 상담 간호사가 전화를 드려 예약을 도와드립니다.</h4>
	
	            <br><br> <br><br> <br><br>
	
	            
	           <div align="center" style="position: relative;">
						    <button type="submit" class="btn border-1 border-dark" id="submitButton" onclick="return validateAndProceed();" style="width:150px; position: absolute; left: 41%; top: 0; z-index: 2;">다음</button>
						    <a href="/vita/views/reservation/first_Success.jsp" class="btn border-1 border-dark" id="btn-color" style="width:150px; position: absolute; left: 41%; top: 0; z-index: 1; display:none;">다음</a>
						    <a href="/vita/views/reservation/consultation_AfterLogin.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:180px;">이전</a>
						</div>
						
						<script>
					
						    function validateAndProceed() {
							    		const isChecked1 = document.getElementById('checkAgree').checked; // 첫 번째 동의 라디오 버튼
							        const isChecked2 = document.getElementById('checkAgree1').checked; // 두 번째 동의 라디오 버튼

			
						    	    if (!isChecked1 || !isChecked2) {
						    	        alert("모든 동의 항목을 체크해주세요.");
						    	        return false; // 폼 제출 방지
						    	    }
						        
						   
						    }
						</script>
							
	            <br><br> <br><br> <br><br> 
	      </section>
        </form>
        




	<%@ include file="/views/common/footer.jsp" %>

</body>
 
</html>