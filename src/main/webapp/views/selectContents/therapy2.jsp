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
        height: 1947px;
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
        margin-top: 2100px !important;
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
            <img id="dietImg" src="/vita/assets/image/후두암식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>후두암식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>후두암</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>후두암의 식사, 암환자의 영양</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 200px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            후두암 진단 이후 치료를 받기위해 충분한 영양공급을 통해 암 치료를 돕고 부작용을 최소화 하기위해 식사요법이 필요합니다.<br>
            후두암의 치료는 병기나 종류에 따라 다르며 크게 수술적치료, 항암치료, 방사선치료 등이 사용됩니다.<br> 
            따라서 각 치료방법을 이해하고 치료에 따르는 부작용으로 인한 영양문제의 대처방법을 숙지하여 영양불량이 되지않도록 합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 420px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            암을 치료하는 특별한 식품이나 영양소는 없으며 균형잡힌 식사로 좋은 영양상태를 유지하는것이 중요합니다.<br> 
            그러기 위해서는 충분한 에너지와 단백질, 비타민 및 무기질을 공급할 수 있는 식사를 섭취해야 하며, 이는 여러가지 음식을 골고루 먹음으로써 가능합니다.<br><br>
            암환자의 일반적인 식사지침<br>
            1. 아침,점심,저녁을 규칙적으로 섭취하고 반찬은 골고루 먹습니다.<br>
            2. 매끼 단백질 반찬을 꼭 먹습니다.(고기, 생선이 싫다면 대신 달걀, 두부, 콩, 치즈 등을 먹습니다.)<br>
            3. 채소반찬은 매끼 2가지 이상 충분히 먹습니다.(씹기 힘든 경우나 삼키기 힘든 경우에는 다지거나 갈아서 먹습니다.)<br>
            4. 과일은 하루 1~2번, 1가지 이상 먹습니다.(면역력이 저하된 경우 잘 씻어 껍질을 제거하거나 통조림, 주스로 먹습니다.)<br>
            5. 유제품을 하루 1컵 마십니다.(우유가 맞지 않을 경우에는 요쿠르트, 두유, 치즈, 아이스크림으로 대체합니다.)<br>
            6. 밥은 매끼 1그릇정도 먹습니다.(밥 섭취가 어려울 경우 죽, 빵, 크래커, 떡, 감자, 고구마, 국수, 미숫가루 등으로 대체하며, 밥 섭취량이 적을 경우에는 간식으로 보충합니다.)<br>
            7. 열량보충이 필요하다면 식물성 기름과 견과류를 충분히 사용합니다.<br>
            8. 양념과 조미료는 적당히 사용합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            현미, 보리, 서리태와 같은 잡곡 및 두류<br>
            파프리카, 당근, 단호박, 양배추, 케일, 가지등의 다양한 색의 채소, 과일류
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            술, 비위생적인 식품, 가공식품, 탄 음식
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 180px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            환자의 질환과 치료상태에 따라 식사요법의 원칙이 달라질수 있으므로 의료진, 영양전문가와 상의합니다.<br>
            항암-방사선 병용요법으로 치료를 받은경우 충분한 열량과 단백질(고기, 생선, 콩, 두부, 계란, 해물)을 섭취하여 체중이 감소되지 않도록 주의하며 필요에 따라 상업용 영양보충음료를 병행하도록 합니다.<br> 
            절대적으로 금연합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 300px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/후두암_식단.jpg">
        </div>
        <div class="container" style="width: 900px; height: 300px;">
          <div id="therapyList" class="container border" style="width: 70px; height: 35px; text-align: center; padding-top: 5px; cursor: pointer;">목록</div>
        </div>
        <script>
          document.getElementById("therapyList").addEventListener("click", function() {
              window.location.href = "<%= contextPath %>/dietTherapy.do";
          });
        </script>   
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
