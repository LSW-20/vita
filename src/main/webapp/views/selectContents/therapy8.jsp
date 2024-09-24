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
            <img id="dietImg" src="/vita/assets/image/프로피온산혈증.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>프로피온산혈증, 프로피온산증</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>프로피온산증</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>프로피온산혈증, 프로피온산증, 유기산혈증</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 220px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            발린, 이소로이신, 메치오닌, 스레오닌과 같은 아미노산의 대사에 관여하는 propionyl CoA carboxylase라는 효소의 장애로 프로피오닌산이 축적되어 뇌손상, 혈액의 산성화, 암모니아의 증가 등을 초래합니다.<br> 
            상염색체열성유전을 하며 발생빈도는 100,000명중 한 명입니다.<br> 
            장기적으로는 고탄수화물 식이와, 이소로이신, 발린, 메치오닌, 스레오닌이라는 아미노산을 작은 양으로 제한한 식이를 합니다.<br>
            이들 아미노산이 없는 특수분유제제와 일반식이를 혼합하여 식이요법을 합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 320px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 루이신, 이소루이신, 발린, 메티오닌, 트레오닌 등 프로피온산의 전구물질이 될 수 있는 아미노산을 제거한 특수분유를 사용합니다.  <br>                                                              
            2. 국내에서 생산되는 특수분유는 MPA 1 과 2가 있으며 MPA 2는 1에 비해 열량이 적은 대신 단백질 함량이 두배이고, 다른 영양소들은 비슷하게 함유하고 있어 식사량이 충분한 소아청소년기에 처방하기에 적절합니다.  <br>
            3. 발린이 가장 중요한 아미노산이므로 발린의 섭취를 기준으로 식이요법을 실시하며, 다른 아미노산들은 적당한 비율로 조절합니다. 제한되는 아미노산들은 필수 아미노산이므로 분유만 섭취하는 영아의 경우, 반드시 일반분유를 특수분유와 함께 처방받아 먹여야 필수 아미노산 결핍증을 막을 수 있습니다.<br>
            4. 아이가 나이가 들면서 식사를 잘하게 되면 일반분유는 필요하지 않게 되며, MPA 2 분유로 바꾸어 먹을 수 있습니다. <br>        
            5. 후기 발병형의 환자들은 아미노산의 투여를 잘 견딜 수 있고, 발린의 섭취까지 계산하지 않고 단백질의 섭취량을 계산하는 정도로도 치료할 수 있으므로 훨씬 쉽다고 할 수 있습니다. 
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            쌀, 고구마, 감자 등 탄수화물 식품과 식물성 기름, 버터류, 모든 채소와 과일류
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            쇠고기, 돼지고기, 닭고기, 생선 및 가공품, 우유 및 유제품 등 발린 함량이 높은 식품들
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 250px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            여러가지 감염, 예방접종, 외상, 마취 및 수술과 같은 상황이 발생하면 단백질 섭취를 제한하고 탄수화물 섭취를 늘리는 것이 필요합니다. <br>
            이러한 상황들의 일부는 예측이 가능하며, 환자의 질병 종류와 대사 상태에 따라서 식이요법을 조정할 필요가 있습니다.<br>
            하지만 감염과 같은 경우는 예측이 불가능하며 따라서 악화되지 않도록 미리 예방하는 것이 어렵습니다.<br> 
            미리 예방하기 위해 지속적으로 단백질을 더 제한한다면 만성 영양결핍과 대사의 불균형 상태를 초래할 수 있으므로 단백질의 과다한 투여를 피하고, 단백질의 분해와 대사의 불균형이 초래될 수 있는 상황을 빨리 알 수 있도록 보호자는 지속적으로 교육을 받아야 합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 310px;">
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
