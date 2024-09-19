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


<!-- sideBar start -->
<%@ include file="/views/common/adminSideBar.jsp" %>
<!-- sideBar end-->


<style>
footer {
  margin-top: 1500px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
  height: 100%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}
</style>



<!-- section start -->
<style>
  section{
      position:absolute;
      width: 100%;
      height: 547;
      margin-top: 153px;
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
  <div class="container border m-4 p-5 rounded" style="height: 800px;">

    <h2 class="m-4">뉴스</h2>

    <div class="d-flex justify-content-end">
      <!-- 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소 -->
      <a href="/vita/views/admin/manageNewsModify.jsp" class="btn btn-primary btn-sm">수정하기 페이지로</a> &nbsp;
      <a href="" class="btn btn-danger btn-sm">삭제하기</a> &nbsp;
      <!-- ------------------------------------------------------------------------- -->
      <a href="/vita/views/admin/manageNews.jsp" class="btn btn-warning btn-sm">목록가기</a>
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