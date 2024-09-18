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
            <img id="dietImg" src="/vita/assets/image/후천성면역결핍증식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>후천성면역결핍증식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>후천성 면역결핍증</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>에이즈</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            필요한 영양소를 공급하고 질병이 진행됨에 따라 영양소의 비정상적인 상태와 불내성이 나타날 때 식사를 변형, 수정하여 영양불량상태를 예방하거나 지연시키기 위해 식사조절이 필요합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 180px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 균형잡힌 식사를 합니다.<br>
            2. 단백질 식품을 충분히 섭취합니다.<br>
            3. 충분한 수분을 섭취합니다.<br>
            4. 비타민제 섭취 시에는 과잉 섭취되지 않도록 주의합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            양질의 살코기, 생선, 두부, 계란 등의 단백질 식품, 신선한 채소류, 과일류, 달지 않은 식품
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            과량의 비타민제 섭취, 사탕, 설탕 등의 과다한 단순당 섭취, 기름진 육류, 기름진 국물류, 가공식품, 인스턴트 식품(라면, 햄버거 등)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            흡수불량이 의심되는 경우에는 저지방식과 중쇄중성지방을 이용할 수 있습니다. 
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 300px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/후천성면역결핍증_식단.jpg">
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
