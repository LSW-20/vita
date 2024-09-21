<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.cs.model.vo.Cs" %>
<%@ page import="com.br.vita.common.model.vo.PageInfo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		List<Cs> csList = (List<Cs>)request.getAttribute("csList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 #csthead{
   background-color:#eaf3fa;
 }
    footer{
     margin-top: 1053px;
 }
 
 /* 카테고리변경 버튼 관련 style */
 /* 버튼 그룹을 직사각형으로 설정 */
  .btn-group label {
    border: 1px solid #1F2B6C;
    border-radius: 0;
    padding: 10px 20px;
    cursor: pointer;
    margin: 0;
    transition: background-color 0.3s ease;
  }

  /* 기본 버튼 색상 */
  .btn-outline-primary {
    background-color: white;
    color: #1F2B6C;
  }

  /* 선택된 버튼 색상 */
  .cs_check:checked + label.btn-outline-primary {
    background-color: #1F2B6C;
    color: white;
  }

  /* 버튼 모서리를 맞추기 위해 첫 번째와 마지막에 스타일 조정 */
  .btn-group label:first-child {
    border-radius: 5px 0 0 5px;
  }

  .btn-group label:last-child {
    border-radius: 0 5px 5px 0;
  }

  /* 숨겨진 radio 버튼 */
  .cs_check {
    display: none;
  }  
</style>
</head>
<body>
	 <%@ include file="/views/common/header.jsp" %>
	 <%@ include file="/views/common/myPageSideBar.jsp" %>
	 <div class="side" id="navContent">
		
	   <br><h2 style="margin-left: 160px;"><b>고객의 소리</h2>  
	
	   <!-- 카테고리 변경 탭 버튼 -->
     <div class="d-flex btn-group" role="group" aria-label="Segmented button" style="padding: 20px;width: 80%; max-width: 1500px; margin: 0 auto;">
       <!-- 칭찬합니다 (기본 선택) -->
       <input type="radio" class="cs_check" name="options" id="option1" autocomplete="off" checked>
       <label class="btn btn-outline-primary" for="option1">칭찬합니다</label>
     
       <!-- 문의합니다 -->
       <input type="radio" class="cs_check" name="options" id="option2" autocomplete="off">
       <label class="btn btn-outline-primary" for="option2">문의합니다</label>
     
       <!-- QnA -->
       <input type="radio" class="cs_check" name="options" id="option3" autocomplete="off">
       <label class="btn btn-outline-primary" for="option3">QnA</label>
     </div> 
		
	   <div style="width: 1200px; margin: auto;">
			   <!-- 고객의소리 설명 텍스트 + 이미지 -->
			   <div id="csText" class="d-flex align-items-start" style="border: 1px solid black; padding: 20px;width: 80%; max-width: 1500px; margin: 0 auto;">
			     <img id="msgBox" src="/vita/assets/image/MsgBox.png" style="width: 100px; height: 100px; margin-right: 10px;">
			     <div>
			       <p>- 병원을 이용하시면서 경험한 사례를 작성 해 주세요. 고객님의 의견이 저희에게는 큰 힘이 됩니다.</p>
			       <p>- 관련 내용은 누구나 볼 수 있습니다.</p>
			       <p>- 본 게시판의 취지와 맞지 않는 글을 남기신 경우 예고 없이 삭제될 수 있음을 양해해 주시기 바랍니다.</p>
			     </div>
			   </div>
			 	 <br><br>  
			 		
			 <table class="table" id="board-list">
			   <thead id="csthead">
			     <tr>
			       <th width="50px">번호</th>
			       <th width="450px">글제목</th>
			       <th width="80px">작성자</th>
			       <th width="80px">조회수</th>
			       <th width="80px">작성일</th>
			     </tr>
			   </thead>
			   <tbody>
			     <!-- case1. 조회된 게시글이 없을 경우 -->
			     <% if(csList.isEmpty()) {%>
			     <tr>
			       <td colspan="5" style="text-align: center;">존재하는 게시글이 없습니다.</td>
			     </tr>
			     <%} else{ %>
				
				     <!-- case2. 조회된 게시글이 있을 경우 -->
				     <% for(Cs c : csList){ %>
				     <tr>
				       <td><%= c.getBoardNo() %></td>
				       <td><%= c.getBoardTitle() %></td>
				       <td><%= c.getBoardWriter() %></td>
				       <td><%= c.getBoardCount() %></td>
				       <td><%= c.getRegistDt() %></td>
				     </tr>
				     <%} %>
			     <%} %>
			   </tbody>
			 </table>		
			 <script>
			
				$(function(){
			 		$('#board-list tbody>tr').on('click', function(){
			 			let no = $(this).children().eq(0).text();
			 			let writer = $(this).children().eq(2).text();
			 			//현재로그인한회원 아이디
			 			let loginUserId = '<%= loginUser == null ? "" : loginUser.getUserId() %>';
			 			if(writer == loginUserId){
			 				location.href="<%=contextPath%>/detail.cs?no="+no;
			 			}else {
			 				//내가 쓴 글일 경우 - 조회수 증가 없이 csDetail.jsp상세이동
			 				//내가 쓴 글이 아닐 경우 - 조회수 증가하면서 csDetail.jsp상세이동
			 				location.href = "<%=contextPath%>/increase.cs?no="+no;
			 			}
			 			
			 		})
			 	}) 
			 	
			 </script>
			 
			    
	     <hr>
			 <!-- 현재 로그인되어있는 회원일 경우 보여지는 요소 -->
			 <% if(loginUser != null) {%>
			 <div class="d-flex justify-content-end">
			   <a href="/vita/views/cs/csWrite.jsp" class="btn btn-primary btn-sm">등록하기</a>
			 </div>   
			 <% } %>			 
	   </div>
 
	  
	 	 <!-- 페이징바 -->
		 <ul class="pagination d-flex justify-content-center text-dark" id="paging_bar">
		   <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
		   	<a class="page-link" href="<%= contextPath %>/list.cs?page=<%=pi.getCurrentPage()-1%>">이전</a>
		   </li>
		   <% for(int p = pi.getStartPage(); p<pi.getEndPage(); p++) {%>
		   	<li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
		   		<a class="page-link" href="<%= contextPath %>/list.cs?page=<%=p%>"><%= p %></a></li>
		   	<%} %>
        <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
         <a class="page-link" href="<%= contextPath %>/list.cs?page=<%=pi.getCurrentPage()+1 %>">다음</a>		   	
		 </ul>

	 </div>
	 
	 <!-- nav, section 별도로 닫아주기-->
	 </nav>
	</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>