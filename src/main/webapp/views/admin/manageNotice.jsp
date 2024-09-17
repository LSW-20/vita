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
  .pagination{
    text-align: center;
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


    <div class="container" style="text-align: center; width: 1100px; height: 800px;">
      <br>
      <div class="container" style="text-align: left; font-size: 40px; height: 80px;"><b>공지사항</b></div>
      <div class="container border" style="height: 10px; background: gray; margin-left: -30px;"></div><br><br>
      <div style="text-align: center; width: 1050px; height: 850px;">
        <table>
          <tr style="background: rgb(193, 231, 221);">
            <th style="width: 30px; height: 60px;"></th>
            <th style="width: 80px;">번호</th>
            <th style="width: 710px;">제목</th>
            <th style="width: 100px;">작성자</th>
            <th style="width: 150px;">작성일</th>
            <th style="width: 80px;">조회수</th>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
          <tr>
            <th style="width: 30px;">
              <input type="checkbox">
            </th>
            <td style="width: 80px;">545</td>
            <td style="width: 710px;">공공의료본부,'장애인 지원체계구축'을 위한 업무협약 체결</td>
            <td style="width: 100px;">최고관리자</td>
            <td style="width: 150px;">2024-07-10</td>
            <td style="width: 80px;">236</td>
          </tr>
        </table>
      </div>
      <div class="container" style="width: 1050px; height: 50px; display: flex; margin-left: -10px;">
          <div class="container" style="width: 250px; height: 50px; margin-top: -30px; margin-left: -30px;">
              <button type="button" class="btn btn-primary">수정</button>
              <button type="button" class="btn btn-danger">삭제</button>
          </div>
          <div class="container" style="height: 50px;">
              <ul class="pagination d-flex justify-content-center text-dark">
                  <li class="page-item"><a class="page-link" href="#">이전</a></li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">4</a></li>
                  <li class="page-item"><a class="page-link" href="#">5</a></li>
                  <li class="page-item"><a class="page-link" href="#">6</a></li>
                  <li class="page-item"><a class="page-link" href="#">7</a></li>
                  <li class="page-item"><a class="page-link" href="#">8</a></li>
                  <li class="page-item"><a class="page-link" href="#">9</a></li>
                  <li class="page-item"><a class="page-link" href="#">10</a></li>
                  <li class="page-item"><a class="page-link" href="#">다음</a></li>
              </ul>
          </div>
          <div class="container" style="width: 200px; height: 50px; margin-top: -30px; margin-right: -60px;">
              <button type="button" class="btn btn-success">글쓰기</button>
          </div>
      </div>
    </div>

















  </div>
</section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>