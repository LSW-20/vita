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
            <img id="dietImg" src="/vita/assets/image/화상식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>화상식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>화상</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>화상</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            화상 환자는 대사항진으로 체단백의 이화작용과 요 질소 배설이 증가되며, 단백질과 체액의 손실이 증가하여 수분 및 전해질의 불균형을 초래할 수 있어 충분한 열량과 단백질 공급이 필요합니다
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 230px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 회복을 위해 충분한 에너지, 단백질 반찬을 섭취합니다.<br>
            2. 식사를 규칙적으로 하며 편식하지 말고 골고루 섭취합니다.<br>
            3. 질이 좋은 단백질 식품(고기, 생선, 두부 등)을 끼마다 충분히 섭취합니다.<br>
            4. 신선한 채소 및 과일을 충분히 섭취합니다.<br>
            5. 지나치게 단 음식은 피합니다.<br>
            6. 수분을 충분히 섭취합니다.(2L/day)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            곡류(쌀밥, 잡곡밥, 감자, 고구마, 떡 등),육류(살코기), 어류(생선, 조개류 등), 두부, 콩, 달걀, 신선한 채소, 견과류(땅콩, 호두, 잣 등), 신선한 과일, 유제품(우유, 두유, 요구르트, 요거트, 저지방우유)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            단순당(사탕,설탕, 젤리, 물엿), 당분이 첨가된 음료수(콜라,사이다), 통조림 과일,  주류(소주, 맥주, 막걸리 등)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            1. 식사섭취량이 충분치 않을 경우 필요시 칼슘, 비타민E, 비타민A, 아연 등을 보충합니다.<br>
            2. 대사적 스트레스로 인한 고혈당을 악화시킬 수 있어 과다한 단음식은 피합니다.<br>
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 300px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/화상_식단.jpg">
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
