<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.common.model.vo.PageInfo" %>
<%@ page import="com.br.vita.news.model.vo.News" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<News> list = (List<News>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비타병원</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<!-- header start  -->
<%@ include file="/views/common/header.jsp" %>
<!-- header end -->



<!-- section start -->
   <% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
     <style>
        section{
            position:absolute;
            width: 100%;
            height: 1347;
            margin-top: 153px;
        }
        td{
          height: 50px;
          border-bottom: 3px solid #f7f7f8;
        }
        .pagination{
          text-align: center;
        }
        #newsDt{
        	cursor: pointer;
        }
        footer{
        	margin-top: 1500px !important;
        }
            
     </style>
   <!-- sideBar start -->
   <%@ include file="/views/common/adminSideBar.jsp" %>
   <!-- sideBar end--> 
   <%}else { %>  
   		<style>
        section{
            position:absolute;
            width: 100%;
            height: 1147;
            margin-top: 153px;
        }
        td{
          height: 50px;
          border-bottom: 3px solid #f7f7f8;
        }
        .pagination{
          text-align: center;
        }
        #newsDt{
        	cursor: pointer;
        }
        footer{
        	margin-top: 1300px !important;
        }
            
     </style>
   <section>
   <%} %>
   
      <div class="container" style="text-align: center; width: 1100px; height: 800px;">
        <br>
        <div class="container" style="text-align: left; font-size: 40px; height: 80px;">
        	<b>뉴스</b>
        </div>
        <div class="container border" style="height: 10px; background: gray; margin-left: -30px;"></div><br><br>
        <div style="text-align: center; width: 1000px; height: 850px;">
          <% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
          <table id="news-list" class="table">
         	 	<thead>
	            <tr style="background: rgb(193, 231, 221);">
	            	<th style="width: 20px; height: 60px;"></th>
	              <th style="width: 80px;">번호</th>
	              <th style="width: 710px;">제목</th>
	              <th style="width: 100px;">작성자</th>
	              <th style="width: 150px;">작성일</th>
	              <th style="width: 80px;">조회수</th>
	            </tr>
	          </thead>
            <tbody>
					  <% if(list.isEmpty()) { %>
					    <!-- case1. 조회된 뉴스글이 없을 경우 -->
					    <tr>
					      <td colspan="6" style="text-align:center">존재하는 게시글이 없습니다.</td>
					    </tr>
					  <% } else { %>
					    <!-- case2. 조회된 뉴스글이 있을 경우 -->
					    <% for(News n : list) { %>
					      <tr class="board-title">
					        <td><input type="checkbox" class="delete-checkbox" value="<%= n.getNewsNo() %>"></td>
					        <td><%= n.getNewsNo() %></td>
					        <td id="newsDt"><%= n.getNewsTitle() %></td>
					        <td><%= n.getUserId() %></td>
					        <td><%= n.getRegistDate() %></td>
					        <td><%= n.getNewsCount() %></td>
					      </tr>          
					    <% } %>
					  <% } %>
					</tbody>	
          </table>
          <% }else { %>
          <table id="news-list" class="table">
         	 	<thead>
	            <tr style="background: rgb(193, 231, 221);">
	            	<th style="height: 60px;"></th>
	              <th style="width: 80px;">번호</th>
	              <th style="width: 710px;">제목</th>
	              <th style="width: 100px;">작성자</th>
	              <th style="width: 150px;">작성일</th>
	              <th style="width: 80px;">조회수</th>
	            </tr>
	          </thead>
            <tbody>
					  <% if(list.isEmpty()) { %>
					    <!-- case1. 조회된 뉴스글이 없을 경우 -->
					    <tr>
					      <td colspan="6" style="text-align:center">존재하는 게시글이 없습니다.</td>
					    </tr>
					  <% } else { %>
					    <!-- case2. 조회된 뉴스글이 있을 경우 -->
					    <% for(News n : list) { %>
					      <tr class="board-title">
					      	<td></td>
					        <td><%= n.getNewsNo() %></td>
					        <td id="newsDt"><%= n.getNewsTitle() %></td>
					        <td><%= n.getUserId() %></td>
					        <td><%= n.getRegistDate() %></td>
					        <td><%= n.getNewsCount() %></td>
					      </tr>          
					    <% } %>
					  <% } %>
					</tbody>	
          </table>
          <% } %>
          
					<% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
					  <div class="d-flex justify-content-between align-items-center">
					    <div>
					      <a id="delete-button" class="btn btn-danger">삭제</a>
					    </div>
					    <ul class="pagination mb-0">
					      <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
					        <a class="page-link" href="<%=contextPath%>/newsList.admin?page=<%=pi.getCurrentPage()-1%>">Previous</a>
					      </li>
					      <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
					        <li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
					          <a class="page-link" href="<%= contextPath %>/newsList.admin?page=<%=p%>"><%= p %></a>
					        </li>
					      <% } %>
					      <li class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
					        <a class="page-link" href="<%=contextPath%>/newsList.admin?page=<%=pi.getCurrentPage()+1%>">Next</a>
					      </li>
					    </ul>
					    <div>
					      <a href="<%= contextPath %>/newsWrite.admin" class="btn btn-success">글쓰기</a>
					    </div>
					  </div>
					<% }else { %>
						
					  <ul class="pagination d-flex justify-content-center text-dark">
       
		          <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
		          	<a class="page-link" href="<%=contextPath%>/newsList.admin?page=<%=pi.getCurrentPage()-1%>">Previous</a>
		          </li>
		          
		          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
		          	<li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
		          		<a class="page-link" href="<%= contextPath %>/newsList.admin?page=<%=p%>"><%= p %></a>
		          	</li>
		          <% } %>
		          
		          <li class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
		          	<a class="page-link" href="<%=contextPath%>/newsList.admin?page=<%=pi.getCurrentPage()+1%>">Next</a>
		          </li>
		          
		        </ul>
						
					<% } %>
					
					<script>
						$(function() {
						  $('#news-list tbody>tr').on('click', '#newsDt', function() {
						    // 현재 클릭한 게시글 번호
						    let no = $(this).closest('tr').children().eq(1).text();
						    // 현재 클릭한 게시글 작성자 아이디
						    let writer = $(this).closest('tr').children().eq(3).text();
						    // 현재 로그인한 회원 아이디
						    let loginUserId = '<%= loginUser == null ? "" : loginUser.getUserId() %>';

						    if(writer == loginUserId) {
						      console.log("내가 쓴 글입니다.");
						      // 현재 내가 쓴 글일 경우 => 조회수증가없이 상세페이지로 바로 이동
						      location.href = "<%=contextPath%>/newsDetail.admin?no=" + no;
						    } else {
						      console.log("내가 쓴 글이 아닙니다.");
						      // 내가 쓴 글이 아닐 경우 => 조회수증가하면서 상세페이지로 이동
						      location.href = "<%=contextPath%>/newsIncrease.admin?no=" + no;
						    }	
						  });
						});
					</script>
					<script>
					$('#delete-button').on('click', function() {
						  // 선택된 체크박스 가져오기
						  const checkboxes = $('.delete-checkbox:checked');
						  if (checkboxes.length === 0) {
						    alert('삭제할 게시글을 선택하세요.');
						    return;
						  }

						  // 확인 팝업 표시
						  if (confirm('선택한 게시글을 삭제하시겠습니까?')) {
						    // 선택된 뉴스 ID 수집
						    const idsToDelete = checkboxes.map(function() {
						    	console.log($(this).val());
						      return $(this).val();
						    }).get();

						    // 선택된 행을 삭제하는 AJAX 요청 보내기
						    $.ajax({
						      url: 'newsAjaxDelete.admin',
						      type: 'POST',
						      contentType: 'application/json;charset=UTF-8',
						      data: JSON.stringify({ ids: idsToDelete }),
						      success: function(response) {
						        // 페이지를 새로고침하거나 테이블을 업데이트하여 변경 사항 반영
						        location.reload();
						    	  // 삭제 성공 알림 표시
						          alert('선택한 게시글이 성공적으로 삭제되었습니다.');
						      },
						      error: function(xhr, status, error) {
						        console.error('삭제 요청 실패:', error);
						      }
						    });
						  }
						});
					</script>
				</div>
      </div>
     <% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
     </div>
     <%}else {%>
     <%} %> 
    </section>
<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>