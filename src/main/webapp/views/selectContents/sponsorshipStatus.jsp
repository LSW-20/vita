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
        height: 797px;
        margin-top: 153px;
    }
    #dietImg{
        width: 300px;
        height: auto;
    }
    p{
      font-size: 15px;
    }
    td{
      font-size: 14px;
    }
    footer{
        margin-top: 950px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 900px;">
          <b class="container" style="font-size: 30px;">후원현황</b>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 500px; display: flex;">
          <div class="container" style="width: 40%;">
            <b style="font-size: 22px; color: rgb(21, 148, 105);"><br>나눔의 품격에 참여해 주신 분들</b>
            <div class="container" style="text-align: center; background-color: rgb(226, 222, 222); height: 100px; padding: 10px;">
              <b style="font-size: 30px;">총 10,775명</b><br>
              <p>~2023년 12월 말까지</p>
            </div>
            <br><br>
            <b>기금 현황</b>
            <table>
              <tr style="height: 15px;"></tr>
              <tr>
                <td style="width: 180px; height: 20px;">·불우환자지원기금</td>
                <td style="width: 130px; background-color: rgb(226, 222, 222);"></td>
                <td style="width: 70px; background-color: rgb(21, 148, 105);"></td>
                <td style="width: 50px; text-align: right; color: rgb(21, 148, 105);">35%</td>
              </tr>
            </table>
            <table>
              <tr style="height: 15px;"></tr>
              <tr>
                <td style="width: 180px; height: 20px;">·교육기금</td>
                <td style="width: 192px; background-color: rgb(226, 222, 222);"></td>
                <td style="width: 8px; background-color: rgb(21, 148, 105);"></td>
                <td style="width: 50px; text-align: right; color: rgb(21, 148, 105);">4%</td>
              </tr>
            </table>
            <table>
              <tr style="height: 15px;"></tr>
              <tr>
                <td style="width: 180px; height: 20px;">·연구기금</td>
                <td style="width: 188px; background-color: rgb(226, 222, 222);"></td>
                <td style="width: 12px; background-color: rgb(21, 148, 105);"></td>
                <td style="width: 50px; text-align: right; color: rgb(21, 148, 105);">6%</td>
              </tr>
            </table>
            <table>
              <tr style="height: 15px;"></tr>
              <tr>
                <td style="width: 180px; height: 20px;">·병원발전기금</td>
                <td style="width: 90px; background-color: rgb(226, 222, 222);"></td>
                <td style="width: 110px; background-color: rgb(21, 148, 105);"></td>
                <td style="width: 50px; text-align: right; color: rgb(21, 148, 105);">55%</td>
              </tr>
              <tr style="height: 15px;"></tr>
            </table>
            <p style="font-size: 12px;">
              ※ 불우환자지원기금에는 직원들의 급여 끝전기부인<br>
              모아사랑기금이 포함되어 있습니다.
            </p>
          </div>
          <div class="container" style="width: 60%;">
            <img id="dietImg" src="/vita/assets/image/후원현황.jpg" style="margin-top: 50px; width: 100%; height: auto;">
          </div>
        </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
