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

    <style>
    section{
        position:absolute;
        width: 100%;
        height: 997;
        margin-top: 153px;
    }
    table,tr,th,td{
      border: 1px solid black;
      text-align: center;
    }
    footer{
    	margin-top: 1050px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container">
          <b style="font-size: 30px;">주차안내</b><br><br>
          <b style="font-size: 20px;">주차현황</b><br>
          <table>
            <tr style="vertical-align: text-top; background-color: rgb(193, 231, 221);">
              <th style="width: 120px; height: 50px;">구분</th>
              <th style="width: 120px;">지상</th>
              <th style="width: 150px;">C,D관 지하 1층</th>
              <th style="width: 150px;">C,D관 지하 2층</th>
              <th style="width: 150px;">C,D관 지하 3층</th>
              <th style="width: 120px;">장례식장</th>
              <th style="width: 120px;">합계</th>
            </tr>
            <tr  style="vertical-align: text-top;">
              <td style="height: 50px;">대수</td>
              <td>13(9)</td>
              <td>88(7)</td>
              <td>104</td>
              <td>104 </td>
              <td>112(2)</td>
              <td>423(18)</td>
            </tr>
          </table>
          <br><br><br>
          <b style="font-size: 20px;">주차장 요금 안내</b><br>
          <table>
            <tr style="background-color: rgb(193, 231, 221);"> 
              <th style="width: 120px; height: 30px;">구분</th>
              <th style="width: 120px;">운영시간</th>
              <th style="width: 345px;">요금내용</th>
              <th style="width: 345px;">비고</th>
            </tr>
            <tr>
              <td style="height: 140px;">주간</td>
              <td>24시간</td>
              <td>
                <ul>
                  <li>외래 진료 4시간, 일반, 종합검진 6시간,<br>입,퇴원 및 수술 환자 당일 무료</li>
                  <li>기본요금 1시간 2,000원, 이후 30분 당<br>1,000원 / 단, 30분 이내 회차시 무료</li>
                </ul>
              </td> 
              <td>장애인 차량, 국가 유공자 차량은 50% 감면<br>(단, 복지카드 소지자에 한함)</td>
            </tr>
          </table>
          <br><br><br>
          <b style="font-size: 20px;">주차장 요금 안내</b><br>
          <ul>
            <li>장시간 주차하실 분은 1일 주차권을 구입하여 이용 가능</li>
            <li>요금 : 1일권 10,000원</li>
            <li>구입 문의<br>-지하 1층 주차 관리 사무실(오전9시 ~ 오후 5시)<br>-정산소(오전 7시30분 ~ 오후 10시 30분)</li>
          </ul>
        </div>    
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>