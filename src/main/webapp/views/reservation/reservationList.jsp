<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.br.vita.reservation.model.vo.Consultation" %>
<%@ page import="com.br.vita.reservation.model.vo.HealthCheck" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // consultations와 healthChecks 리스트를 받아온다.
    List<Consultation> consultations = (List<Consultation>)request.getAttribute("consultations");
    List<HealthCheck> healthChecks = (List<HealthCheck>)request.getAttribute("healthChecks");

    // NullPointerException 방지를 위해 리스트가 null일 경우 빈 리스트로 처리
    if (consultations == null) consultations = new ArrayList<>();
    if (healthChecks == null) healthChecks = new ArrayList<>();

    // 두 리스트를 하나로 결합
    List<Object> allReservations = new ArrayList<>();
    allReservations.addAll(consultations);
    allReservations.addAll(healthChecks);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<style>
  /* 기본 스타일 설정 */
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }

  #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 100%;
 }

 /* 예약 박스 스타일 */
 .reservation_box {
    width: 300px;
    height: 150px;
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 10px;
    position: relative;
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

 .checkupDate{
    font-weight: bold;
    margin-bottom: 10px;
 }

 /* 컨테이너 중앙 정렬 */
 .container_reservations {
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start; /* 줄 바꿈 시 왼쪽부터 추가되게 함 */
    gap: 25px;
    margin: 0 auto;
 }

 .no_reservation {
    text-align: center;
    margin-top: 20px;
 }

 .info_box {
    background-color: #f0f0f0;
    padding: 15px;
    border-radius: 5px;
    margin-bottom: 20px;
    font-size: 14px;
 }

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

 /* 예약 박스들을 중앙에 배치 */
 .reservation_wrapper {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 25px;
    width: 100%;
 }

 footer{
    margin-top: 1053px;
 }
</style>
</head>
<body>
   <%@ include file="/views/common/header.jsp" %>
   <%@ include file="/views/common/myPageSideBar.jsp" %>
   
   <div class="container" id="reserve_check_content" style="margin-left: -10px;">
    <br><h2><b>&nbsp;&nbsp;예약 내역 조회</b></h2>

    <div class="container">
        <h5>&nbsp;&nbsp;예약 현황</h5>
        
        <!-- 안내 텍스트박스 -->
        <div class="info_box ">
            <%= ((Member)session.getAttribute("loginUser")).getUserName() %>님(환자 번호 : <%= ((Member)session.getAttribute("loginUser")).getUserNo() %> )의 진료 예약 현황입니다. <br>
            진료과나 접수창구에서 예약하신 진료의 변경은 콜센터에서 가능합니다. 문의: 1588-XXXX <br>
            <strong>*인터넷으로 예약한 진료만 취소 가능합니다.</strong>
        </div>
        <div class="reservation_wrapper">
        <!-- 예약 내역 없을 때 -->
        <div id="no_reservation" class="no_reservation" <%= allReservations.isEmpty() ? "" : "style='display:none;'" %>>
            예약 내역이 없습니다.
        </div>

        <!-- 모든 예약 내역을 출력 -->
        <div id="reservation_list" class="container_reservations" <%= allReservations.isEmpty() ? "style='display:none;'" : "" %>>
            <%
                for (Object reservation : allReservations) {
                    if (reservation instanceof Consultation) {
                        Consultation c = (Consultation) reservation;
            %>
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
            <% 
                    } else if (reservation instanceof HealthCheck) {
                        HealthCheck h = (HealthCheck) reservation;
            %>
                <div class="reservation_box">
                    <form action="<%=request.getContextPath()%>/deletech.rv" method="POST">
                        <input type="hidden" name="appointmentNo" value="<%= h.getAppointmentNo() %>">
                        <button type="submit" class="cancel_button">취소</button>
                    </form>
                    <div class="checkupDate"><%= h.getCheckUpDate() %></div>
                    <div class="appType"><b>건강검진</b></div><hr>
                    <div class="patient_name">환자명 : <%= h.getUserName() %></div>
                    <div class="appointment_time">예약시간 : <%= h.getAppointmentTime() %> 검진</div>
                </div>
            <% 
                    }
                }
            %>
        </div>

        <!-- 추가 진료 예약 버튼 -->
    </div>
        <button id="add_reservation_button" class="add_reservation_button">추가진료예약</button>
   </div>

  </div>

  <script>
    // 추가 진료예약 버튼 클릭 시 예약 페이지로 이동
    document.getElementById("add_reservation_button").addEventListener('click', function() {
        window.location.href = '<%= request.getContextPath() %>/consultationAL.rv';
    });
  </script>

<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>
