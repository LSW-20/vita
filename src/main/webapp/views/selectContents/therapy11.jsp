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
        height: 1647px;
        margin-top: 153px;
    }
    #dietImg{
        width: 200px;
        height: auto;
        border: 1px solid rgb(228, 225, 225);
    }
    td{
      text-align: left;
      font-size: 14px;
    }
    footer{
        margin-top: 1800px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 900px;">
          <b class="container" style="font-size: 30px;">식사요법</b>
        </div>
        <br>
        <div class="container border" style="width: 900px; height: 240px; display: flex; background-color: rgb(248, 247, 247);">
          <div class="container" style="width: 27%;">
            <img id="dietImg" src="/vita/assets/image/패혈증식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>패혈증식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>패혈증</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>패혈증</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            패혈증 시에는 대사항진과 체단백의 이화작용으로 인하여 영양상태가 불량해지므로 적당량의 필수영양소를 공급하는 것이 매우 중요하므로 적절한 식사조절이 필요하게 됩니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 200px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 균형잡힌 섭취를 합니다.<br>
            2. 과식을 피합니다.<br>
            3. 충분한 단백질식품을 섭취합니다.<br>
            4. 신선한 채소를 매끼 섭취합니다. <br>
            5. 유제품을 챙겨 먹습니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            양질의 살코기, 생선, 두부, 계란 등의 단백질식품, 신선한 채소류, 과일류, 달지 않은 식품
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            사탕, 설탕 등의 과다한 단순당 섭취, 기름진 육류, 기름진 국물류, 가공식품, 익히지 않은 동물성식품(생선회, 육회, 생굴 등)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            심한 패혈증의 경우 환자가 혈류 역학적으로 불안정하고 조직 내로 산소운반이 부적절할 경우에는 당분간 구강 영양지원을 중단하는 것이 좋습니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 310px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/패혈증_식단.jpg">
        </div>
        <div class="container" style="width: 900px; height: 300px;">
          <div id="therapyList" class="container border" style="width: 70px; height: 35px; text-align: center; padding-top: 5px; cursor: pointer;">목록</div>
        </div>
        <script>
          document.getElementById("therapyList").addEventListener("click", function() {
              window.location.href = "/vita/views/selectContents/dietTherapy.jsp";
          });
        </script>  
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
