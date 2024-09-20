<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.news.model.vo.News" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
		            <td colspan="5" style="text-align:center">존재하는 뉴스글이 없습니다.</td>
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
        </div>
      </div>

    </section>
<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>