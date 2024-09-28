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
	          <td>
	            <form action="<%=request.getContextPath() %>/getDoc.cr" method="get">
	              <input type="hidden" name="careNo" value="<%= d.getCareNo() %>">
	              <input type="hidden" name="docType" value="<%= d.getDocType() %>">
	              
	              <button type="submit">발급</button>	   
	              
	            </form>       
						</td>
	        </tr>
	      <%} %>
	    <%} %>
      </tbody>
    </table>
  </div>   
   
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>