<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetDocumentDetail</title>
<style>
  /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
  /* 사이드바 메뉴 길이 페이지마다 다를 수 있으니 별도로 부여 */
   #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 130%;
 }
  /* 신청목록 선택thead색 */
 #get_doc_apply th{
     background-color:#eaf3fa;
 } 
	 #txt_box{
	 	background-color: #D9D9D9;
	 	font-size: 15px;
	 }

 .hidden {
 		display: none;
 }

    footer{
     margin-top: 1300px;
 }
</style>
</head>

<script>
	// 오늘 날짜를 yyyy-mm-dd 형식으로 반환하는 함수
	function getTodayDate() {
	    var today = new Date();
	    var year = today.getFullYear();
	    var month = String(today.getMonth() + 1).padStart(2, '0');
	    var day = String(today.getDate()).padStart(2, '0');
	    return year + '-' + month + '-' + day;
	}
	
	// 페이지 로드 시 시작일과 종료일의 기본값을 오늘 날짜로 설정
	window.onload = function() {
	    var today = getTodayDate();
	    document.getElementById("startDate").value = today;
	    document.getElementById("endDate").value = today;
	};
	
    // 조회 결과 업데이트 및 표시 함수
    function updateResultRow() {
        // 결과 여부 확인(추후 DB서 불러올 변수)
        var results = [
            { date: "2023-09-01", record: "진료 기록 1" },
            { date: "2023-09-10", record: "진료 기록 2" }
        ]; // 예시 데이터, 실제로는 서버에서 받아올 예정

        var resultRow = document.getElementById("resultRow");

        if (results.length === 0) {
            alert('조회 결과가 없습니다.');
            resultRow.classList.add("hidden");
        } else {
            resultRow.classList.remove("hidden");

            var resultHtml = "<th>조회 결과</th><td>";
            results.forEach(function(result, index) {
                resultHtml += "<input type='checkbox' id='record" + index + "' name='record' value='" + result.record + "'>";
                resultHtml += "<label for='record" + index + "'>" + result.date + " - " + result.record + "</label><br>";
            });
            resultHtml += "</td>";
            resultRow.innerHTML = resultHtml;
        }
    }
</script>
<body>
	<!-- header sideBar include start -->
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageSideBar.jsp" %>
	<!-- header sideBar include end -->
	
  <div class="container" id="get_doc_content"style="margin-left: -10px;">
		<br><h2><b>&nbsp; 온라인 증명서 신청</b></h2>  
		
    <table id="get_doc_apply" class="table m-4">
			<tr>
				<th width="130px">증명서 종류</th>
				<td>
					getDocType
				</td>
			</tr>
        <tr>
            <th>성명</th>
            <td>getUserName 님(id / getUserId)</td>
        </tr>
        <tr>
            <th>발급 용도</th>
						<td><select name="select_purpose">
						    <option value="insurance_submit" selected>보험제출</option>
						    <option value="company_submit">회사제출</option>
						    <option value="self_collection">개인소장</option>
						    </select>
						</td>
        </tr>
        <tr>
            <th>기간</th>
            <td>
                <label for="startDate">시작일:</label>
                <input type="date" id="startDate" name="startDate">
                <label for="endDate">종료일:</label>
                <input type="date" id="endDate" name="endDate">
                <button type="button" onclick="updateResultRow()">조회</button>
            </td>
        </tr>     
				<!-- 기간 select하고 조회 클릭시 결과 없으면 alert뜨고 변화 x, 아니면 조회결과 tr생성-->
        <tr id="resultRow" class="hidden">
            <th>조회 결과</th>
            <td></td>
        </tr>       
        <tr>
            <th>발급비용</th>
            <td>getPrice</td>
        </tr>         
        <tr>
            <th>본인인증</th>
            <td>클릭넘어오는값==진료비납입확인서?"본인인증이 필요 없습니다.":버튼활성화</td>
        </tr>             
    </table>
    
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;온라인 증명서 안내 사항 동의</h4>
    <div id="txt_box" class="m-4">
    	<b>온라인 증명서 결제시 안내사항</b><br>
		  &nbsp;- 온라인 증명서 결제는 신용카드 결제만 가능합니다.<br>
		  &nbsp;- 온라인 증명서 결제가 불가능한 내역은 재증명창구를 방문해 주시기 바랍니다.<br>
		  &nbsp;- 온라인 증명서는 신청후 취소/환불이 불가능합니다.<br><br>
		
			<b>온라인 증명서 안내사항</b><br>
		  &nbsp;- 확인서에는 병명과 질병분류 코드는 기재되지 않습니다.<br>
		  &nbsp;- 병명 및 질병분류코드는 진단서(소견서)에만 기재가 되며, 원외처방전은 질병분류코드가 기재됩니다.<br>
		  &nbsp;- 진단서 발급은 진료시 의사에게 요청하셔야만 발급이 가능합니다.<br>
		  &nbsp;- PC 인터넷 익스플로러에서만 출력이 가능합니다.<br>
		  &nbsp;- 통원확인서 종류 : 검사사실확인서, 물리·재활치료확인서, 방사선치료확인서, 주사처치사실확인서, 외래진료확인서<br>
		  &nbsp;- 원무팀 업무시간(평일 : 09:00 ~ 17:30, 토요일 : 09:00 ~ 12:30
    </div>

    
    <div id="agree_yn" class="container d-flex justify-content-end align-items-center">
			
        온라인 증명서 결제 및 취소 안내사항에 모두 동의합니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <input type="radio" id="yes" name="response-yn" value="Y">
        <label for="yes" style="padding-top: 5px;">&nbsp;동의합니다. &nbsp;&nbsp;</label>

        <input type="radio" id="no" name="response-yn" value="N">
        <label for="no" style="padding-top: 5px;">&nbsp;동의하지 않음.</label>

    </div>


    <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary btn-sm m-2">신청</button>
        <button type="button" class="btn btn-secondary btn-sm m-2">취소</button>
    </div>   
   

  </div>	
	
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>