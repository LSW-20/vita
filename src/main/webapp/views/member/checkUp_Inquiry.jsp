<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckUp_Inquiry</title>

	<style>
     section{
       /* background-color: aqua; */
       width: 100%;
       height: 1100px;
       position: absolute;
       top: 0px;
     }
     .title1 {
       margin-top: 30px;
       margin-left: 50px;
       font-size: 30px;
     }
     .box {
       background-color: #f0f0f0;
       padding: 25px;
       font-size: 14px;
       width: 1200px;
       margin-left: 50px;
     }
     #text1 {
       margin-left: 50px;
       margin-top: 50px;
       font-size: 18px;
     }
     .btn-period {
    	 margin-right: 10px;
     }
     .btn-period.active {
       background-color: #0058b6; /* 파란색 배경 */
       color: white;
     }

     .btn-period.inactive {
       background-color: #e9ecef; /* 비활성화된 색상 */
       color: #6c757d;
     }
     .btn-search {
       width: 100px;
       background-color: #B1B1B9;
       border: none;
       border-radius: 0;
     }
     .table-container {
       margin: 20px;
       margin-left: 50px;
       width: 1200px;
     }
     .table th, .table td {
       text-align: center;
     }
     .btn-result {
       min-width: 100px; /* 버튼의 최소 너비 설정 */
       background-color: #777777;
       border: none;
     }
     footer{
	      background-color: #1F2B6C;
	      position:absolute;
	      width: 100%;
	      height: 300px;
	      margin-top: 1200px;
	   }
	   #sideMenu{
	     background-color: rgb(54, 99, 204);
	     width: 20%;
	     height: 120%;
 		 }

	</style>
	
	
	
	
	
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/myPageSideBar.jsp" %>

        <form action="">
          <div>
            <p class="title1"><strong>검진 내역 조회</strong></p>
          </div>
          <div class="box">
            <p style="margin-top: 10px;"> 
              ※ 본 서비스는 검진센터에서 청구완료되어야 제공 가능합니다.<br><br>
              ※ 검진일로부터 청구완료까지 통상 30일 소요</p>
          </div>
          <div>
            <p id="text1"><strong>◎ &nbsp;XXX님의 건강검진 결과</strong></p>
          </div>
            <input type="date" style="margin-left: 50px; margin-right: 20px;">
            <div class="btn-group">
              <button type="submit" class="btn btn-period inactive" data-period="3">3개월</button>
              <button type="button" class="btn btn-period inactive" data-period="6">6개월</button>
              <button type="button" class="btn btn-period inactive" data-period="12">12개월</button>
              <button type="button" class="btn btn-period inactive" data-period="24">24개월</button>
              <button type="button" class="btn btn-period inactive" data-period="36">36개월</button>
              <button type="button" class="btn btn-primary btn-search">검색</button>
          </div>
          <div class="table-container">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>검진일자</th>
                        <th>구분</th>
                        <th>패키지명</th>
                        <th>검진결과</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-06-17</td>
                        <td>초진</td>
                        <td></td>
                        <td>
                          <a href="#"><button type="button" class="btn btn-primary btn-result">결과</button></a>
                        </td>
                    </tr>
                </tbody>
            </table>
        	</div>
        </form>
      </nav>
	</section>
	
<%@ include file="/views/common/footer.jsp" %>

</body>
</html>