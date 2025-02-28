<%@ page import="java.util.Map" %>
<%@ page import="com.br.vita.news.model.vo.News" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> nmap = (Map<String, Object>)request.getAttribute("nmap");
	News n = (News)nmap.get("n"); // 게시글번호, 카테고리명, 제목, 내용, 작성자아이디
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비타병원</title>
</head>
<body>

<!-- header start  -->
<%@ include file="/views/common/header.jsp" %>
<!-- header end -->

<% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>

	<style>
	  section{
	      position:absolute;
	      width: 100%;
	      height: 547;
	      margin-top: 153px;
	  }
		footer {
	  margin-top: 1500px; /* 페이지마다 footer 조금씩 조정 */
		}
		#side_menu {
		  height: 100%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
		}
	</style>

	<!-- sideBar start -->
	<%@ include file="/views/common/adminSideBar.jsp" %>
	<!-- sideBar end-->
	<%}else { %>

	<style>
	  section {
	    position: absolute;
	    width: 80%; /* Adjust as needed */
	    height: 547px;
	    top: 153px;
	    left: 200px;
	  }
	  footer {
	    margin-top: 1500px !important; /* Adjust as needed */
	  }
	</style>

<!-- Section start -->
<section class="row m-3" style="min-height: 500px;">
	<%} %>
  <div class="container border m-4 p-5 rounded" style="height: 1100px;">

    <h2 class="m-4">뉴스</h2>

    <div class="d-flex justify-content-end">
      <!-- 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소 -->
      <% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
      <a href="<%= contextPath %>/newsModify.admin?no=<%= n.getNewsNo() %>" class="btn btn-primary btn-sm">수정하기 페이지로</a> &nbsp;
      <a href="javascript:confirmDelete(<%= n.getNewsNo() %>);" class="btn btn-danger btn-sm">삭제하기</a>  &nbsp;
      <% } %>
      <!-- ------------------------------------------------------------------------- -->
      <a href="<%= contextPath %>/newsList.admin" class="btn btn-warning btn-sm">목록가기</a>
    </div>

    <table class="table m-4">
    	<tr>
    		<th style="width:80px;">번호</th>
    		<td><%= n.getNewsNo() %></td>
    		<th>작성자</th>
    		<td><%= n.getUserId() %></td>
    		<th>작성일</th>
    		<td><%= n.getRegistDate() %></td>
    		<th>조회수</th>
    		<td><%= n.getNewsCount() %></td>
    	</tr>
      <tr>
        <th>제목</th>
        <td colspan="7"><%= n.getNewsTitle() %></td>
        
      </tr>
      <tr>
        <th>내용</th>
        <td colspan="7"><pre style="min-height:200px; white-space: pre-wrap; word-wrap: break-word;"><%= n.getNewsContent() %></pre></td>
      </tr>
    </table>
		<script>
		function confirmDelete(newsNo) {
		    if (confirm('정말로 삭제하시겠습니까?')) {
		        window.location.href = '<%= contextPath %>/newsDelete.admin?no=' + newsNo;
		    }
		}
		</script>
  </div>
  <% if (loginUser != null && loginUser.getUserId().equals("admin01")) { %>
  </div> <!-- 관리자 사이드바의 div를 닫는 태그 -->
  <%}%>
</section>



<!-- Section end -->


<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>