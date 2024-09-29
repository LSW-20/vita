<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.issue.model.vo.Document" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Document> docList = (List<Document>)request.getAttribute("docList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetDocumentResultList</title>
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
     height: 100%;
 }
 /* 신청증명서 리스트 테이블 스타일 */
  #doc_result_list{
    text-align: center;
  } 
 #doc_result_list thead{
   background-color:#eaf3fa;
 }  
 button{
	background-color:#1F2B6C; color: white; 
 }
    footer{
     margin-top: 1053px;
 }
 
 
 
 	              	
       
 
  
</style>
</head>
<body>
   <%@ include file="/views/common/header.jsp" %>
   <%@ include file="/views/common/myPageSideBar.jsp" %>
   
   
  <div id="doc_result_content" style="margin-left: 10px;">
    <br><h2><b>&nbsp; 증명서 발급 내역</h2>  
    <br>
    
    <table class="table" id="doc_result_list">
      <thead>
        <tr>
          <th width="200px">신청 증명서</th>
          <th width="1200px">발급 일자</th>
          <th width="100px">비고</th>
        </tr>
      </thead>
      <tbody>
    <!-- 신청 내역이 없을 경우 -->
	    <%if(docList.isEmpty()) {%>
	        <tr><td colspan="3" style="text-align: center;">발급 내역이 없습니다.</td></tr>
	    <%}else { %>
	    <!-- 신청 내역이 있을 경우 -->
	    	<%for(Document d : docList) {%>
	        <tr>
	          <td><%=d.getDocType() %></td>
	          <td><%=d.getApplyDate() %>&nbsp;(진료과: <%=d.getDeptName() %> | 담당의: <%=d.getDoctorName() %>)</td>
	          <td style="padding: 5px;">
	            <form action="<%=request.getContextPath() %>/getDoc.cr" >
	              <input type="hidden" name="careNo" value="<%= d.getCareNo() %>">
	              <input type="hidden" name="docType" value="<%= d.getDocType() %>">
	              
	              <% if(d.getDocType().equals("진단서")){ %>
	              
	              	<% if(d.getDocCheck().equals("R")){ %>
	              		<div style="color:green;">확인중</div>
	              	<%}else if(d.getDocCheck().equals("N")){%>
	              		<div style="color:red;">반려</div>
	              	<%}else if(d.getDocCheck().equals("Y")){ %>	 

  <style>
  
  	
.t_container {
	border: 1px solid black;
	width: 900px;
	height: 1060px;
	display: flex;
	flex-direction: column;
}

.t_header {
	border: 1px solid black;
	width: 100%;
	height: 70px;
	text-align: center;
	font-size: 30px;
	padding-top: 10px;
	background-color: lightgray;
}

.table_div {
	margin-left: 70px;
	margin-top: 20px;
}

#table_container_tb {
	width: 760px;
	height: 700px;
	text-align: center;
}

.u_name {
	height: 50px;
	width: 140px;
}

.u_ssn {
	width: 145px;
}

.u_addr {
	height: 65px;
}

.symptoms {
	height: 150px;
}

.doc_detail {
	display: flex;
	flex-direction: column;
	width: 760px;
}

.c_date {
	text-align: right;
	margin-left:417px;
}

.side_detail {
	display: flex;
}

.doc_num {
	margin-left: 140px;
}

.doc_name {
	text-align-last: right;
}

.opinion_date {
	height: 80px;
}

.modal-content {
	width: 902px;
	height: 1060px;
	margin-top: 60px;
	margin-left: -185px;
}

.modal-footer {
	margin-top: -16px;
	border: none;
	margin-right: 300px;
}
  
  </style>
  
<div class="container">
  <!-- Button to Open the Modal -->
  <button 
  			style="font-size:15px;" 
  			type="button" 
  		  class="btn btn-primary" 
  		  data-toggle="modal" 
  		  data-target="#myModal1" 
  		  onclick="fnfilesearch1(this);"
  		data-care-no="<%= d.getCareNo() %>"
		data-user-no="<%= d.getUserNo() %>"
		data-doc-type="<%= d.getDocType() %>">보기
  </button>

  	<!-- The Modal -->
							<div class="modal fade" id="myModal1">
								<div class="modal-dialog">
									<div class="modal-content" style="margin-top: 170px;">


										<div class="t_container">
											<div class="t_header">진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</div>
											<div class="table_div">
												<table border="1" id="table_container_tb">
													<tr>
														<td class="u_name"><b>환자의 성명</b></td>
														<td id="userName_result"></td>

														<td class="u_ssn"><b>주민등록번호</b></td>
														<td id="userSSN_result"></td>
													</tr>

													<tr>
														<td class="u_addr"><b>환자의 주소</b></td>
														<td colspan="3" id="userAddress_result"></td>
													</tr>
													<tr>

														<td class="symptoms"><b>증상</b></td>
														<td colspan="3" id="syptoms_result"></td>
													</tr>

													<tr>
														<td class="opinion"><b>진단 및 소견</b></td>
														<td colspan="3" id="opinion_result"></td>
													</tr>

												</table>

												<div class="doc_detail" style="text-align: left;">
													<br> [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.

													<div style="margin-top: 20px;">
														의료기관 명칭 : <b>VitaPrimus</b> <b class="c_date"
															id="treatmentDate_result" style="margin-left: 428px;"></b>
													</div>
													<br>
													<div class="side_detail">
														<div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
														<div class="doc_num" style="margin-left: 130px;">
															[ ■ ] 의사 면허 <b id="doc_licence"></b> 호
														</div>
													</div>
													<br>
													<div style="color: red">※ 원내방문하셔서 1층 원무과(재발급창구)에서 발급받으시면 됩니다. <고객확인용> ※ </div>
													<div class="doc_name">
														담당의 : <b id="docName_result"></b>
													</div>



												</div>

												<!-- Modal footer -->
												<div class="modal-footer">
												
												</div>
											</div>

										</div>

									</div>

								</div>
							</div>
  
</div>
	              	 
	              	
	              	
	              		
					<%} %>
	              	
	              	 
	         <%}else if(d.getDocType().equals("진료확인서")){ %>
	         
	         	<% if(d.getDocCheck().equals("R")){ %>
	              		<div style="color:green;">확인중</div>
	              		
	              	<%}else if(d.getDocCheck().equals("N")){%>
	              		<div style="color:red;">반려</div>
	              		
	              	<%}else if(d.getDocCheck().equals("Y")){ %>	 
	         		
  
  
    <style>
        * {
          box-sizing: border-box;
        }
      
        .t_container{
          border: 1px solid black;
          width: 901px;
    	  height: 1058px;
          display: flex;
          flex-direction: column;
        }
      
        .t_header{
          border: 1px solid black;
          width: 100%;
          height: 70px;
          text-align: center;
          font-size: 30px;
          padding-top: 10px;
          background-color: lightgray;
        }
        .table_div{
          margin-left: 70px;
          margin-top: 20px;
        }
        #table_container{
          width: 760px;
          height: 700px;
          text-align: center;
        }
        .u_name{
          height: 50px;
          width: 140px;
        }
        .u_ssn{
          width: 145px;
        }
        .u_addr{
          height: 65px;
        }
        .symptoms{
          height: 150px;
        }
      
        .doc_detail{
          display: flex;
          flex-direction: column;
         
          width: 760px;
        }
        .c_date{
          text-align: right;
          
        }
        .side_detail{
          display: flex;
        }
        .doc_num{
          margin-left: 140px;
        }
        .doc_name{
          text-align-last: right;
        }
        .opinion_date{
          height: 80px;
        }
      
       
      </style>  
  	
<div class="container">
 	<button style="font-size:15px;" 
 						class="btn btn-primary"
	         			type="button"
	         			onclick="fnfilesearch2(this);"
	         				data-toggle="modal" 
	         			   data-target="#myModal2" 
	         				data-care-no2="<%= d.getCareNo() %>"
	         				data-user-no2="<%= loginUser.getUserNo() %>"
	         				data-doc-type2="<%= d.getDocType() %>"
	         			>보기</button>
	
    

 <!-- The Modal -->
 <div class="modal fade" id="myModal2">
   <div class="modal-dialog">
     <div class="modal-content" style="margin-top: 170px;">
     

<div class="t_container">
  <div class="t_header">
    진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
  </div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td id="userName_result2"></td>
   
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td id="userSSN_result2"></td>
      </tr>
      
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3" id="userAddress_result2"></td>
      </tr>
      <tr>
        <td class="symptoms"><b>진단명</b></td>
        <td colspan="3" id="diagnosisName_result2"></td>
      </tr>
      <tr>
        <td class="opinion"><b>치료내용</b></td>
        <td colspan="3" id="treatmentContent_result2"></td>
      </tr>
      
    </table>

  <div class="doc_detail" style="text-align: left;">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.
      
      <div style="margin-top: 20px;">의료기관 명칭 : <b>VitaPrimus</b> <b class="c_date" id="treatmentDate_result2" style="margin-left: 428px;"></b></div>
      <br>
      <div class="side_detail">
        <div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
        <div class="doc_num" style="margin-left: 130px;">[ ■ ] 의사  면허 <b id="doc_licence2"></b> 호</div>
      </div>
      <br>
      <div style="color: red">※ 원내방문하셔서 1층 원무과(재발급창구)에서 발급 받으시면 됩니다. <고객확인용> ※ </div>
      <div class="doc_name">담당의 : <b id="docName_result2"></b></div>

      
      
    </div>
    
    <!-- Modal footer -->
      <div class="modal-footer">
       
      </div>
       
  </div>



</div>

  
  </div>
       
      
     </div>
   </div>
 </div>
 			
	         			
	         			
	         		<%}%>
	              
	         <%}else{ %>
	         	<button type="submit">발급</button>
	         <%} %>
	            </form>       
			</td>
	        </tr>
	      <%} %>
	    <%} %>
      </tbody>
    </table>
  </div>   
  
  
  <script>
  
	
	function fnfilesearch1(button) {
		
	    const careNo = $(button).data('care-no');
	    const userNo = $(button).data('user-no');
	    const type = $(button).data('doc-type');

	    $.ajax({
	        url: '<%= contextPath %>/diagnosis.se',
	        data: {
	            careNo: careNo,
	            userNo: userNo,
	            type: type
	        },
	        success: function(res) {
	            console.log(res);  // {Doctor:{}, Member:{}, ..}

	            let doc = res.Doctor;
	            let mem = res.Member; // {phone:이름, ..}
	            let mrc = res.Mrecords;

	            $('#userName_result').text(mem.userName);
	            $('#userSSN_result').text(mem.userSSN);
	            $('#userAddress_result').text(mem.address);
	            $('#syptoms_result').text(mrc.symptoms);
	            $('#opinion_result').text(mrc.opinion);
	            $('#treatmentDate_result').text(mrc.treatmentDate);
	            $('#doc_licence').text(doc.licenceNo);
	            $('#docName_result').text(doc.doctorName);
	            
	            
	            
	            
	        }
	    });
	}
	
	
	
	
	
	function fnfilesearch2(button) {
		
	    const careNo2 = $(button).data('care-no2');
	    const userNo2 = $(button).data('user-no2');
	    const type2 = $(button).data('doc-type2');
	    
	    $.ajax({
	        url: '<%= contextPath %>/diagnosis.se',
	        data: {
	            careNo: careNo2,
	            userNo: userNo2,
	            type: type2
	        },
	        success: function(res) {
	        	
	            console.log(res);  
	              

	            let doc = res.Doctor;
	            let mem = res.Member; 
	            let mrc = res.Mrecords;

	            $('#userName_result2').text(mem.userName);
	            $('#userSSN_result2').text(mem.userSSN);
	            $('#userAddress_result2').text(mem.address);
	            $('#diagnosisName_result2').text(mrc.diagnosisName);
	            $('#treatmentContent_result2').text(mrc.treatmentContent);
	            $('#treatmentDate_result2').text(mrc.treatmentDate);
	            $('#doc_licence2').text(doc.licenceNo);
	            $('#docName_result2').text(doc.doctorName);
	           
	        }
	    });
	}
  
  </script>
   
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>