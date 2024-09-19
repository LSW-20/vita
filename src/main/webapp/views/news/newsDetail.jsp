<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      height: 597;
      margin-top: 153px;
  }
  footer{
  	margin-top: 1000px !important;
  }

</style>





<!-- section 나머지 여기부터 start -->

  <!--  
  <div id="content" > 

    
      <br><br>

      <div id="admin_name">
          관리자 강보람님
      </div>

      <br><br><br>
  --> 


<!-- Section start -->
<section class="row m-3" style="min-height: 500px;">
  <div class="container border rounded" style="height: 800px; margin-top: 153px;">

    <h2 class="m-4">뉴스</h2>

    <div class="d-flex justify-content-end">
      <!-- ------------------------------------------------------------------------- -->
      <a href="/vita/views/news/news.jsp" class="btn btn-warning btn-sm">목록가기</a>
    </div>

    <table class="table m-4">
      <tr>
        <th style="width:80px;">제목</th>
        <td>기존 뉴스 제목</td>
      </tr>
      <tr>
        <th>내용</th>
        <td><p style="min-height:200px;">기존 뉴스 내용</p></td>
      </tr>
    </table>

  </div>
  </div> <!-- 관리자 사이드바의 div를 닫는 태그 -->
</section>
<!-- Section end -->


<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>