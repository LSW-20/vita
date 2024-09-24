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
        height: 2447px;
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
        margin-top: 2600px !important;
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
            <img id="dietImg" src="/vita/assets/image/허혈성심장질환식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>허혈성심장질환식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>허혈성 심질환</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>심장병식사</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 680px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            심장질환 시 식사요법은 크게 3가지로 나누어 생각할 수 있습니다. <br><br>

            [콜레스테롤에 대한 식사요법]<br>
            혈액내 콜레스테롤의 ⅔ ~ ¾ 정도는 몸 안에서 형성된 것으로 식사를 변화시킴으로써 감소시킬 수 있습니다.<br>
            보통 콜레스테롤의 1일 섭취량을 100㎎ 이하로 줄이는 경우에는 현저한 콜레스테롤의 감소가 생기지만 사실상 실천이 불가능하며, 1일 섭취량을 300㎎정도로 유지하면 혈액내의 콜레스테롤 양이 10%정도 감소합니다.<br>
            콜레스테롤은 주로 계란노른자, 오징어, 새우 그리고 기름진 생선 등에 많으며 육류의 기름에도 많이 함유되어 있습니다.<br> 
            따라서 콜레스테롤 수치가 높을 경우 월 2~3회 정도로 고콜레스테롤 함유 식품 섭취를 줄이고 육류 섭취 시 껍질과 기름기를 제거한 살코기로 섭취해야 합니다.<br><br>

            [저염식]<br>
            보통 한국인은 1일 20g 이상의 소금을 섭취하나 실제로 꼭 필요한 양은 5g 이하이므로 고혈압 치료를 목표로 할 때는 소금의 섭취를 절대적으로 줄여야 합니다.<br> 
            실제로 소금의 섭취를 줄이는 방법은 식성을 변화시키고자 하는 노력이 중요합니다.<br> 
            조리를 할 때 차츰 차츰 첨가되는 소금을 줄이고 소금 성분이 많은 양념이나 조미료 등도 주의해야 합니다.<br> 
            그리고 한국인 식습관의 특징인 국이나 찌개 국물 그리고 염장식품 섭취를 지양함으로써 소금 섭취를 줄이는 것이 중요합니다.<br><br> 

            [비만의 개선을 위한 식사요법]<br>
            체중이 증가한다는 것은 소모 열량보다 섭취 열량이 과다하다는 것을 의미합니다.<br> 
            이상적인 체중 감량은 1달에 2㎏ 정도 감량하는 것인데 이를 위해서는 하루에 500kcal씩 적게 먹든지, 아니면 500kcal씩 더 열량을 소비해야 가능합니다.<br>
            하지만 섭취량에는 식사 뿐 아니라 간식이나 술의 영향이 더욱 큰 문제가 될 수 있으며 식사 감량만으로는 체중 감소의 속도가 떨어지거나 다시 체중이 증가될 수 있으므로, 운동을 병행하는 것이 더욱 효과적입니다.<br> 
            따라서 체중 감소 시 전문가와의 상담을 통해 실천하는 것이 중요합니다.
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
            6. 저염식 적응을 위해 조리 시 미리 염분을 넣는 것보다 무염 조리 후 따로 분량의 저염 소스를 곁들이는 것이 더욱 효과적입니다.<br>
            7. 콜레스테롤이 높은 식품은 월 2~3회로 줄여서 섭취합니다.
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
        <div class="container border-bottom" style="width: 900px; height: 220px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            고지방 어육류 : 갈비, 삼겹살, 육류의 껍질과 기름, 장어, 햄류<br>
            고콜레스테롤 식품 : 내장류, 새우, 오징어, 계란노른자<br>
            기름진 음식 : 탕류, 중국음식, 튀김류, 전류<br>
            염장 식품 - 김치류, 젓갈류, 장아찌류, 건어물 및 자반 생선류<br>
            가공식품 - 햄류, 통조림류, 라면<br>
            국, 찌개 국물류
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 210px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            메가-3 지방산은 에이코사펜타엔산(EPA), 도코사헥사엔산(DHA) 등으로 주로 생선기름에 많이 포함되어 있습니다.<br>
            생선을 많이 먹는 알래스카 원주민에서 심혈관계 질환의 사망률이 낮은 것이 관찰되었고 이후 오메가-3의 효능에 대한 많은 연구들에서 오메가-3가 심혈관계 사망률을 낮춘다는 결과를 보고하였습니다.<br> 
            오메가-3는 혈소판 응집과 염증반응을 감소시키고, 혈중 중성지방의 농도를 감소시키고, 심박수와 혈압을 강하시켜 심혈관계 질환으로 인한 사망을 감소시키는 것으로 생각되고 있습니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 310px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/허혈성심질환_식단.jpg">
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
