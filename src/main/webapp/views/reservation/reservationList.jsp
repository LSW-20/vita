<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            getName님(환자 번호 : getUserNo)의 진료 예약 현황입니다. <br>
            진료과나 접수창구에서 예약하신 진료의 변경은 콜센터에서 가능합니다. 문의: 1588-XXXX <br>
            <strong>*인터넷으로 예약한 진료만 취소 가능합니다.</strong>
        </div>
        <!-- 예약 내역 없을 때 -->
        <div id="no_reservation" class="no_reservation">
            예약 내역이 없습니다.
        </div>

        <!-- 예약 내역 담을 template -->
        <template id="reservation_template">
            <div class="reservation_box">
                <button class="cancel_button">취소</button>
                <div class="reservation_date"></div><hr>
                <div class="patient_name"></div>
                <div class="medical_staff"></div>
                <div class="department"></div>
            </div>
        </template>

        <!-- 예약 내역 있을 때 -->
        <div id="reservation_list" class="container_reservations d-none">
        </div>

        <!-- 추가 진료 예약 버튼 -->
        <button id="add_reservation_button" class="add_reservation_button">추가진료예약</button>
    </div>
   </div>

  <script>
    // 나중엔 오라클에서 데이터 불러올 것, 추후 삭제
    const reservation_data = [
        { id: 1, date: '2024-09-01', patient_name: '김철수', medical_staff: '이병헌', department: '내과' },
        { id: 2, date: '2024-09-15', patient_name: '박지민', medical_staff: '강호동', department: '외과' },
        { id: 3, date: '2024-09-20', patient_name: '최영희', medical_staff: '정용화', department: '정형외과' },
        { id: 4, date: '2024-09-20', patient_name: '최영희', medical_staff: '정용화', department: '정형외과' }
    ];

    window.onload = function() {
        const reservation_list = document.getElementById("reservation_list");
        const no_reservation_text = document.getElementById("no_reservation");
        const reservation_template = document.getElementById("reservation_template");

        // 예약 내역 있을 경우 동적으로 추가
        if (reservation_data.length > 0) {
            no_reservation_text.classList.add("d-none");
            reservation_list.classList.remove("d-none");

            reservation_data.forEach(reservation => {
                // template 복제시 사용되는 구문
                const clone = reservation_template.content.cloneNode(true);
                clone.querySelector('.reservation_date').textContent = reservation.date;
                clone.querySelector('.patient_name').textContent = `환자명: ${reservation.patient_name}`;
                clone.querySelector('.medical_staff').textContent = `의료진: ${reservation.medical_staff}`;
                clone.querySelector('.department').textContent = `진료과: ${reservation.department}`;

                // 동적으로 생성된 요소에 이벤트 리스너 추가
                const cancel_button = clone.querySelector('.cancel_button');
                cancel_button.addEventListener('click', function() {
                    handleCancel(reservation.id);
                });
                reservation_list.appendChild(clone);
            });
        } else {
            // 예약 내역이 없으면 내역 없음 메시지 표시
            no_reservation_text.classList.remove("d-none");
            reservation_list.classList.add("d-none");
        }
    }

    // 취소 버튼 클릭 시 처리 함수
    function handleCancel(reservation_id) {
        if (confirm("예약을 취소하시겠습니까?")) {
            // 추후 예약 취소 로직 추가
            
            alert("예약 " + reservation_id + "번이 취소 됐습니다.");
            // 서버 취소 요청 보내거나 예약 내역 업데이트
        }
    }

    // 추가 진료예약 버튼 클릭 시 예약 페이지로 이동
    document.getElementById("add_reservation_button").addEventListener('click', function() {
        window.location.href = '/예약페이지링크';//추후 예약페이지로 이동되게
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
