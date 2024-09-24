<%@ page import= "java.util.*" %>
<%@ page import= "com.br.vita.issue.model.vo.Mrecords"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<Mrecords> records = (List<Mrecords>)request.getAttribute("records");
    String docType = (String)request.getAttribute("docType");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetDocumentDetail</title>
<style>
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
  #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 130%;
 }
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
// 오늘 날짜를 YY/MM/DD 형식으로 반환하는 함수
function getTodayDate() {
    var today = new Date();
    var year = String(today.getFullYear()).slice(-2); // 마지막 두 자리만 취함 (YY 형식)
    var month = String(today.getMonth() + 1).padStart(2, '0'); // 월을 2자리로
    var day = String(today.getDate()).padStart(2, '0'); // 일을 2자리로
    return year + '/' + month + '/' + day;
}

// 페이지 로드 시 시작일과 종료일의 기본값을 오늘 날짜로 설정
window.onload = function() {
    var today = getTodayDate();
    document.getElementById("startDate").value = today;
    document.getElementById("endDate").value = today;
};
</script>

<body>
	<!-- header sideBar include start -->
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageSideBar.jsp" %>
	<!-- header sideBar include end -->
	
  <div class="container" id="get_doc_content"style="margin-left: -10px;">
		<br><h2><b>&nbsp; 온라인 증명서 신청</b></h2>  
		
	<form id="docDetailForm" method="post" action="<%= request.getContextPath() %>/detail.cr">
    <table id="get_doc_apply" class="table m-4">
			<tr>
				<th width="130px">증명서 종류</th>
				<td><%= docType %></td>
			</tr>
        <tr>
            <th>성명</th>
            <td><%= ((com.br.vita.member.model.vo.Member)session.getAttribute("loginUser")).getUserName() %> 님(id : <%= ((com.br.vita.member.model.vo.Member)session.getAttribute("loginUser")).getUserId() %> )</td>
        </tr>
        <tr>
            <th>발급 용도</th>
            <td>
                <select name="docPurpose">
                    <option value="보험제출" selected>보험제출</option>
                    <option value="회사제출">회사제출</option>
                    <option value="개인소장">개인소장</option>
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
                <button type="submit">조회</button>
            </td>
        </tr>     
        <tr id="resultRow" <%= (records == null || records.isEmpty()) ? "class='hidden'" : "" %>>
            <th>조회 결과</th>
            <td>
                <%
                    if (records != null && !records.isEmpty()) {
                        for (Mrecords record : records) {
                            %>
                            <input type="checkbox" name="record" value="<%= record.getDiagnosisName() %>">
                            <label><%= record.getTreatmentDate() %> - <%= record.getDiagnosisName() %></label><br>
                            <%
                        }
                    } else {
                        %> 조회 결과가 없습니다. <%
                    }
                %>
            </td>
        </tr>       
        <tr>
            <th>발급비용</th>
            <td>2000원</td>
        </tr>         
        <tr>
            <th>본인인증</th>
            <td>클릭넘어오는값==진료비납입확인서?"본인인증이 필요 없습니다.":버튼활성화</td>
        </tr>             
    </table>
  </form>  
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;온라인 증명서 안내 사항 동의</h4>
    <div id="txt_box" class="m-4"style="padding: 15px;">
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

    <div class="d-flex justify-content-end">
        <a href="/vita/views/issue/getDocResultList.jsp" class="btn btn-primary btn-sm m-2" data-toggle="modal" data-target="#paymentModal" >신청</a>
	  		<button type="button" class="btn btn-secondary btn-sm m-2" onclick="history.back();">뒤로가기</button>
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
