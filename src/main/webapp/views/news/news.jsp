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
<title>Insert title here</title>
</head>
<body>

<!-- header start  -->
<%@ include file="/views/common/header.jsp" %>
<!-- header end -->

<!-- section start -->
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
        footer{
        	margin-top: 1300px !important;
        }
     </style>
    <section>
      <div class="container" style="text-align: center; width: 1100px; height: 800px;">
        <br>
        <div class="container" style="text-align: left; font-size: 40px; height: 80px;">
        	<b>뉴스</b>
        </div>
        <div class="container border" style="height: 10px; background: gray; margin-left: -30px;"></div><br><br>
        <div style="text-align: center; width: 1000px; height: 850px;">
          <table id="news-list" class="table">
         	 	<thead>
	            <tr style="background: rgb(193, 231, 221);">
	              <th style="width: 80px; height: 60px;">번호</th>
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
		            <td colspan="5" style="text-align:center">존재하는 게시글이 없습니다.</td>
		          </tr>
		          <% } else { %>
		          	<!-- case2. 조회된 뉴스글이 있을 경우 -->
		          	<% for(News n : list) { %>
			          <tr class="board-title">
			            <td><%= n.getNewsNo() %></td>
			            <td><%= n.getNewsTitle() %></td>
			            <td><%= n.getUserId() %></td>
			            <td><%= n.getRegistDate() %></td>
			            <td><%= n.getNewsCount() %></td>
			          </tr>          
								<% } %>
							<% } %>
            </tbody>		
          </table>
          <script>
        	$(function() {
        		$('#news-list tbody>tr').on('click', function() {
        			
        			// 현재 클릭한 게시글 번호
        			let no = $(this).children().eq(0).text();
        			// 현재 클릭한 게시글 작성자 아이디
        			let writer = $(this).children().eq(3).text();
        			// 현재 로그인한 회원 아이디
        			let loginUserId = '<%= loginUser == null ? "" : loginUser.getUserId() %>';
        			
        			if(writer == loginUserId) {
        				// 현재 내가 쓴 글일 경우 => 조회수증가없이 상세페이지로 바로 이동
        				location.href = "<%=contextPath%>/detail.ns?no=" + no;
        			}else{
        				// 내가 쓴 글이 아닐 경우 => 조회수증가하면서 상세페이지로 이동
        				location.href = "<%=contextPath%>/increase.ns?no=" + no;
        			}
        		})
        	})
        </script>
        <ul class="pagination d-flex justify-content-center text-dark">
        
          <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
          	<a class="page-link" href="<%=contextPath%>/list.ns?page=<%=pi.getCurrentPage()-1%>">Previous</a>
          </li>
          
          <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
          	<li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
          		<a class="page-link" href="<%= contextPath %>/list.ns?page=<%=p%>"><%= p %></a>
          	</li>
          <% } %>
          
          <li class='page-item <%=pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : ""%>'>
          	<a class="page-link" href="<%=contextPath%>/list.ns?page=<%=pi.getCurrentPage()+1%>">Next</a>
          </li>
          
        </ul>
        </div>
      </div>

    </section>
<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>