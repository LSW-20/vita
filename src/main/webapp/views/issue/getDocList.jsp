<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>get document list</title>
<style>
  /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
#mainMenu{
	display: flex;
	flex-direction: column;
	background-color: #1F2B6C;           
}
section{
	position: absolute;
	width: 100%;
	margin-top: 153px;
}

  .get_doc_btn {
    background-color: #1F2B6C;
    color: white; 
  }

 #txt_field th{
 		background-color: #eaf3fa;
 }

 footer{
  margin-top: 1300px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
<%-- 	<%@ include file="/views/common/myPageSideBar.jsp" %> --%>
<section>
  <div class="container" style="margin-left ;">
    <h2><br><b>증명서 발급</b></h2>
    <p>&nbsp; 발급 절차</p>
    <img id="vpMark" src="/vita/assets/image/발급절차.png"  style="width: 1100px; height: 200px; margin-right: 10px;">            
    <br><br>
    <table class="table" id="get_doc_table">
      <thead>
        <tr>
          <th width="auto">발급가능 문서명</th>
          <th width="110px">발급금액</th>
          <th width="110px">본인인증</th>
          <th width="115px">발급</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>진료비 납입 확인서(연말정산용)</td>
          <td>2000원</td>
          <td>미사용</td>
          <td>
            <!-- <button type="button" class="get_doc_btn btn-sm">발급받기</button> -->
            <a href="<%= contextPath %>/detail.cr?docType=진료비납입확인서" class="get_doc_btn btn-sm">발급받기</a>
          </td>
        </tr>
        <tr>
          <td>입퇴원 사실 확인서</td>
          <td>2000원</td>
          <td>미사용</td>
          <td>
            <a href="<%= contextPath %>/detail.cr?docType=입퇴원사실확인서" class="get_doc_btn btn-sm">발급받기</a>
          </td>
        </tr>
        <tr>
          <td>처방전 사본 발급</td>
          <td>2000원</td>
          <td>미사용</td>
          <td>
            <a href="<%= contextPath %>/detail.cr?docType=처방전사본" class="get_doc_btn btn-sm">발급받기</a>
          </td>
        </tr>      
        <tr>
          <td>진단서 및 진료확인서 발급</td>
          <td>&nbsp;&nbsp;&nbsp;&nbsp; -</td>
          <td>미사용</td>
          <td>
          <% if(loginUser != null) {%>
            <a href="<%= contextPath %>/listDM.go" class="get_doc_btn btn-sm">바로가기</a>
          <%}else {%>
           	<a href="<%= contextPath %>/loginPage.me" class="get_doc_btn btn-sm">바로가기</a>
          <%}%>
          </td>
        </tr>                
      </tbody>
    </table>
    
    <br><br>
    
    <div id="txt_field" >
  	<table class="table table-bordered">
  		<tr>
  			<th>
  				발급 시간
  			</th>
  			<td>
					<ul>
					  <li>평일 08:30 ~ 17:30</li>
					  <li>15시까지 신청 시 당일 발급 가능</li>
					</ul>  				
  			</td>
  		</tr>
  		
  		<tr>
  			<th>
  				발급 수수료
  			</th>
  			<td>
  				<b>[온라인 발급]</b><br>
					<ul>
					  <li>의무기록 : 휴대폰 등 모바일과 PC에서 신청/다운로드/조회/전송이 가능합니다.</li>
					  <li>다운로드 : 1~5매 1,000원/매, 6매부터 100원/매</li>
					  <li>영상CD : 10,000원~ / 용량에 따라 추가(배송비 별도)</li>
					</ul>   
					<b>[방문 발급]</b><br>	
					<ul>
					  <li>의무기록 : 1~5매 1,000원/매, 6매부터 100원/매.</li>
					  <li>영상CD : 10,000원~ / 용량에 따라 추가</li>
					</ul> 								
  			</td>  			
  		</tr>
  	</table>
  </div>	
  
</div>
    	
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>