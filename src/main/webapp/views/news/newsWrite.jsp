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
<section class="row m-3" style="min-height: 500px">

  <div class="container border p-5 m-4 rounded" style="height: 600px;">
    <h2 class="m-4">뉴스 등록</h2>
    
    <form action="<%= contextPath %>/insert.ns" method="post" class="m-4">
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input type="text" class="form-control" name="title" required></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea rows="10" class="form-control" name="content" style="resize:none" required></textarea></td>
        </tr>
      </table>

      <br>

      <div align="center">
        <button type="submit" class="btn btn-primary btn-sm">등록하기</button>
        <button type="reset" class="btn btn-danger btn-sm">초기화</button>
      </div>

    </form>

  
  </div>
  
  
  
  </div> <!-- 관리자 사이드바의 div를 닫는 태그 -->
</section>
<!-- Section end -->


<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>