<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const email2Input = document.getElementById("email2");
        const email3Select = document.getElementById("email3");

        email3Select.addEventListener("change", function() {
            if (email3Select.value !== "선택") {
                email2Input.value = email3Select.value.split(" ")[0]; // 선택된 이메일 도메인을 email2에 설정
            } else {
                email2Input.value = ""; // 선택이 "선택"일 경우 email2 비우기
            }
        });
    });
</script>

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
   
    <form action= "<%= contextPath %>/Healthnormal.rv"  method="post">
  <section>

    <h2 id="pad"><b>검진예약</b></h2>
    <br>

    <hr style= "border: 1px dashed; margin-left: 90px; margin-right: 90px;">
    <br>

    <h4 style="margin-left:93px"><b>검진받을병원</b></h4>
   <br>
  

    <div class="container11">
     
        <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
                
            <tr>
              <td id="color" style="width:500px; height: 70px; "><h4 style="margin:auto">병원이름</h4></td>
              <td> 
                <div class="box" style="border:1px solid; border-color: rgb(245, 245, 245); background-color: rgb(245, 245, 245); width:350px; height:50px; margin-left:30px">
                    <h5 style="margin:auto; margin-top: 13px;">비타 병원</h5>
                </div>
              </td>
             
            </tr>
            
        </table>
   
    <br><br>

    <h4 style="margin-left:93px"><b>검진자 정보</b></h4>

    <hr style= "border-color:rgb(31, 43, 108); margin-left: 90px; margin-right: 90px;">
    <br>
     <table class="container11 table-bordered" id="table_custom" style="margin-left:93px; ">
             
         <tr>
           <td id="color" style="width:500px; height: 70px;"><h4 style="margin:auto"><sup style="color:rgb(255, 165, 0)">*</sup> 검진자(성명)</h4></td>
           <td> <input type="text" class="form-control" id="name" name="userName" style="width:1070px; height:50px; margin-left:30px" required></td>
          
         </tr>
          <tr>
           <td id="color" style="height: 70px;"><h4 style="margin:auto"><sup style="color:rgb(255, 165, 0)">*</sup> 주민등록번호(외국인등록번호)</h4></td>
           <td class="d-flex"  style="height: 70px; border-color: rgb(255, 255, 255);"> 
            <input type="text" class="form-control" id="userSSN1" name="userSSN1" maxlength="6" style="width:500px; height:50px; margin-left:30px" required>
            <h3 style="margin-left:27px; margin-top: 7px;">-</h3>
            <input type="password" class="form-control" id="userSSN2" name="userSSN2" maxlength="7" style="width:500px; height:50px; margin-left:30px" required>
          </td>
           
         </tr>
         <tr>
            <td id="color" style="height: 63px;"><h4 style="margin:auto"><sup style="color:rgb(255, 165, 0)">*</sup> 핸드폰</h4></td>
            <td>
            
                <div class="d-flex" style=" height: 53px;margin-left: 30px; " >
                    <select class="btn btn-outline-light border-2 text-dark dropdown-toggle dropdown-toggle-split" id="phone_no1" name="phone1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:329px; height: 43px; margin-top:6px; border-color: rgba(85, 83, 83, 0.253);" required>
                      <option selected>010</option>
                      <option>011</option>
                      <option>016</option>
                      <option>017</option>
                      <option>018</option>
                      <option>019</option>
                    </select>
      
                    <div><h3 style="margin-left:15px; margin-top:6px">-</h3></div>
      
                    <div class="form-group" style="margin-left:15px; margin-top:6px; margin-bottom: 6px; width:329px">
                      <input type="text" class="form-control" id="phone_no2" name="phone2"maxlength="4" style="height: 43px;" required>
                    </div>
      
                    <div><h3 style="margin-left:15px; margin-top:6px">-</h3></div>
      
                    <div class="form-group" style="margin-left:15px; margin-top:6px; width:329px; border-color: aliceblue;">
                      <input type="text" class="form-control" id="phone_no3" name="phone3" maxlength="4"style="height: 43px;" required>
                    </div>
                    

                </div>
             
            </td>
            
          </tr>

          <tr>
            <td id="color" style="height: 63px;"><h4 style="margin:auto">&nbsp;&nbsp;이메일</h4></td>
            <td>
            
                <div class="d-flex" style=" height: 53px;margin-left: 30px; " >
                    
                    
                    <div class="form-group" style=" margin-top:6px; margin-bottom: 6px; width:329px">
                      <input type="text" class="form-control" id="email1" name="email1" style="height: 43px;">
                    </div>

                    <div><h6 style="margin-left:13px; margin-top:18px">@</h6></div>
      
                    <div class="form-group" style="margin-left:13px; margin-top:6px; width:329px; border-color: aliceblue;">
                      <input type="text" class="form-control" id="email2" name="email2" style="height: 43px;" readonly>
                    </div>
                    
                    
                        <select class="btn btn-outline-light border-2 text-dark dropdown-toggle dropdown-toggle-split" id="email3"  name="email3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="width:329px; height: 43px; margin-left:40px; margin-top:6px; border-color: rgba(85, 83, 83, 0.253);">
                          <option selected>선택</option>
                          <option>naver.com (네이버)</option>
                          <option>nate.com (네이트)</option>
                          <option>daum.net (다음)</option>
                          <option>yahoo.co.kr (야후)</option>
                          <option>gmail.com (구글)</option>
                        </select>

                </div>
             
            </td>
            
          </tr>
     </table>

     
    <br><br><br>
    <h4 style="margin-left:93px"><b>개인정보 수집 및 이용 동의</b></h4>
    <br>
    <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
      <div style="margin-left:30px;">
      <h5><b> [개인정보 수집 이용에 대한 안내]</b></h5><br>
      <h5>· 수집하는 개인정보 항목 : 이름, 성별, 생년월일, 휴대폰번호, 결과받을 주소, 이메일</h5>
      <h5>· 수집 · 이용목적 : 건강검진 예약 및 건강검진 안내</h5>
      <h4 style="color:rgb(31, 43, 108)">· 보유 및 이용 기간 : 의료법에 준함</h4>
      <h5>· 개인정보 수집 이용 동의는 거부하실 수 있으며, 거부할 경우 서비스 사용이 일부 제한될 수 있습니다.</h5><br>
      </div>
    </div>

    <br><br>
 
      <fieldset>
          <input type="radio" id="checkAgree" name="check" value="T" style="margin-left: 1460px; cursor: pointer;">
          <label for="checkO">&nbsp;동의합니다.</label>
          <input type="radio" id="non_check" name="check" value="F" style="margin-left: 70px; cursor: pointer;">
          <label for="checkX">&nbsp;동의하지 않습니다. </label>
      </fieldset>
     
      <br><br><br>
      <h4 style="margin-left:93px"><b>건강검진 대상 조회 동의</b></h4>
      <br>
      <div class="container11 border mt-3 p-3" style="margin-left:93px; margin-right: 90px;"><br>
        <div style="margin-left:30px;">
        <h5>※ 검진예약이용자는 한국건강관리협회 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 </h5>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;동의 거부 시에는 진료예약이 제한됩니다.</h5><br>
        <h5>※ 게시판 이용자는 한국건강관리협회 홈페이지에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 </h5>
        <h5>&nbsp;&nbsp;&nbsp;&nbsp;동의 거부 시에는 서비스 이용이 제한됩니다.</h5><br>
        </div>
      </div>

      <br><br>
  
        <fieldset>
            <input type="radio" id="checkAgree1" name="check1" value="T" style="margin-left: 1460px; cursor: pointer;" >
            <label for="checkO">&nbsp;동의합니다.</label>
            <input type="radio" id="non_check" name="check1" value="F" style="margin-left: 70px; cursor: pointer;" >
            <label for="checkX">&nbsp;동의하지 않습니다. </label>
        </fieldset>


        <br><br> <br><br> <br><br>


          <div align="center" style="position: relative;">
						    <button type="submit" class="btn border-1 border-dark" id="submitButton" onclick="return validateAndProceed();" style="width:150px; position: absolute; left: 41%; top: 0; z-index: 2;  background-color: rgb(31, 43, 108); color: rgb(245, 245, 245);">다음</button>
						    <a href="/vita/views/reservation/healthCheckUp_3.jsp" class="btn border-1 border-dark" id="btn-color" style="width:150px; position: absolute; left: 41%; top: 0; z-index: 1; display:none;">다음</a>
						    <a href="/vita/views/reservation/healthCheckUp_AfterLogin.jsp" class="btn btn-light border-2 border-dark" style="width: 150px; margin-left:180px;">이전</a>
						</div>
        
        <br><br> <br><br> <br><br> 
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


  </section>
</form>






	<%@ include file="/views/common/footer.jsp" %>

</body>
</html>