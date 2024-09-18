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
            <img id="dietImg" src="/vita/assets/image/협심증식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>협심증식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>협심증</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 150px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            협심증은 심장에 산소와 영양을 공급하는 관상동맥이 좁아져 정상적인 혈액공급이 방해받는 상태로 심한 가슴통증을 유발하게 됩니다. 주된 원인은 혈관 속의 지방 축적이므로 정상 체중을 유지하고 비만인 경우는 체중을 감소시키는 것이 꼭 필요합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 320px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 밥은 현미, 보리 등을 섞은 잡곡밥이 좋으며 기호에 따라 적정량 혼식합니다. 단, 입맛에 맞지 않을 경우 무리하게 잡곡밥을 고집하지 말고 쌀밥을 섭취합니다.<br>
            2. 고기, 두부, 생선 등의 단백질 반찬도 골고루 섭취하되 고기는 기름기와 껍질을 제거한 살코기로 섭취합니다.<br>
            3. 채소찬은 제철 채소를 이용하여 싱겁게 조리하되 장아찌, 김치 등의 염장식품은 지양합니다.<br>
            4. 간식은 정규 식사 사이에 제철 과일과 우유로 섭취합니다.<br>
            5. 전체적인 조리 방법은 지방 섭취를 줄이기 위해 튀기거나 부치는 대신 굽기, 찜, 삶는 방법을 주로 선택하나 맛을 내기 위해 적당량의 식물성기름(참기름, 들기름 등)은 사용합니다.<br>
            6. 또한 염분량은 소금을 기준으로 1일 6g만 추가하도록 합니다. <br>
            7. 저염식 적응을 위해 조리 시 미리 염분을 넣는 것보다 무염 조리 후 따로 분량의 저염 소스를 곁들이는 것이 더욱 효과적입니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            신선한 채소를 비롯한 잡곡, 저지방 어육류, 생선, 두부 그리고 제철 과일과 우유 등 균형잡힌 식사
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 230px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            고지방 어육류 : 갈비, 삼겹살, 육류의 껍질과 기름, 장어, 햄류<br>
            고콜레스테롤 식품 : 내장류, 새우, 오징어, 계란노른자<br>
            기름진 음식 : 탕류, 중국음식, 튀김류, 전류<br>
            염장 식품 : 김치류, 젓갈류, 장아찌류, 건어물 및 자반 생선류<br>
            가공식품 : 햄류, 통조림류, 라면<br>
            국물류 : 국, 찌개 
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 200px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            소량씩 자주 먹습니다.<br>
            상태에 따라 포화지방산, 콜레스테롤, 염분 섭취를 제한합니다.<br>
            섬유소 섭취를 점차로 증가시키며 이때 수분도 부족하지 않게 섭취합니다.<br>
            카페인 섭취를 줄입니다.<br>
            과체중인 경우 열량제한식을 병행합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 320px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/협심증_식단.jpg">
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
