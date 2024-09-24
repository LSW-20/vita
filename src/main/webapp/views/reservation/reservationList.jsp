<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.reservation.model.vo.Consultation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Consultation> consultations = (List<Consultation>)request.getAttribute("consultations");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
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
 
 /* 예약리스트 style */
    .reservation_box {
        width: 300px; /* 고정된 크기 */
        height: 150px;
        border: 1px solid #ccc;
        border-radius: 8px;
        margin: 30px;
        padding: 15px;
        position: relative; /* 취소 버튼을 배치하기 위해 */
        display: flex;
        flex-direction: column;
        justify-content: center;
        text-align: center;
        background-color: #eaf3fa;
    }
    .reservation_date {
        font-weight: bold;
        margin-bottom: 10px;
    }
    .container_reservations {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .no_reservation {
        text-align: center;
        margin-top: 20px;
    }
    /* 연한 회색 안내 박스 스타일 */
    .info_box {
        background-color: #f0f0f0;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 20px;
        font-size: 14px;
    }
    /* 취소 버튼 스타일 */
    .cancel_button {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: gray;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 5px 10px;
        cursor: pointer;
    }
    /* 추가진료예약 버튼을 오른쪽 하단에 배치 */
    .add_reservation_button {
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        margin-top: 20px;
        position: relative;
        float: right;
    }
 
 /* footer길이 별도 부여 */
    footer{
     margin-top: 1053px;
 }
</style>
</head>
<body>
   <%@ include file="/views/common/header.jsp" %>
   <%@ include file="/views/common/myPageSideBar.jsp" %>
   
   <div class="container" id="reserve_check_content"style="margin-left: -10px;">
    <br><h2><b>&nbsp;&nbsp;예약 내역 조회</b></h2>

    <div class="container">
        <h5>&nbsp;&nbsp;예약 현황</h5>
        
        <!-- 안내 텍스트박스 -->
        <div class="info_box m-3">
            <%= ((Member)session.getAttribute("loginUser")).getUserName() %>님(환자 번호 : <%= ((Member)session.getAttribute("loginUser")).getUserNo() %> )의 진료 예약 현황입니다. <br>
            진료과나 접수창구에서 예약하신 진료의 변경은 콜센터에서 가능합니다. 문의: 1588-XXXX <br>
            <strong>*인터넷으로 예약한 진료만 취소 가능합니다.</strong>
        </div>
        <!-- 예약 내역 없을 때 -->
        <div id="no_reservation" class="no_reservation" <%= consultations.isEmpty() ? "" : "style='display:none;'" %>>
            예약 내역이 없습니다.
        </div>

			


        <!-- 예약 내역 있을 때 -->
        <div id="reservation_list" class="container_reservations" <%= consultations.isEmpty() ? "style='display:none;'" : "" %>>
        	<% for(Consultation c : consultations) {%>
	           <div class="reservation_box">
	               <form action="<%=request.getContextPath()%>/delete.rv" method="POST">
	                <input type="hidden" name="appointmentNo" value="<%= c.getAppointmentNo() %>">
	                <button type="submit" class="cancel_button">취소</button>
	               </form>
	               <div class="reservation_date"><%= c.getAppointmentDate() %></div><hr>
	               <div class="patient_name">환자명 : <%= c.getUserName() %></div>
	               <div class="doc_name">의사명 : <%= c.getDoctorName() %></div>
	               <div class="department">진료과 : <%= c.getDeptName() %></div>
	           </div>   	
		       <%} %>	
        </div>

        <!-- 추가 진료 예약 버튼 -->
        <button id="add_reservation_button" class="add_reservation_button">추가진료예약</button>
    </div>
   </div>

  <script>

    
    // 추가 진료예약 버튼 클릭 시 예약 페이지로 이동
    document.getElementById("add_reservation_button").addEventListener('click', function() {
        window.location.href = '/vita/views/reservation/personal.jsp';//추후 예약페이지로 이동되게
    });
  </script>
   
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>
