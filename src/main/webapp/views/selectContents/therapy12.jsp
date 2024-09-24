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
        height: 1747px;
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
        margin-top: 1900px !important;
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
            <img id="dietImg" src="/vita/assets/image/저퓨린식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>저퓨린식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>통풍</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>통풍 조절식</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            통풍이나 신결석 혹은 고요산혈증 환자에게 적용되며, 퓨린 섭취를 1일 150mg 정도로 제한하여 체내의 요산 축척을 줄임으로써 통풍이나 신결석의 발생 및 재발을 예방하기 위한 식사입니다
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 250px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 과식하지 않고 정상 체중을 유지하도록 합니다.<br>
            2. 퓨린 함량이 높은 식품의 섭취량을 피하고 보통 정도의 중간식품은 가끔 선택하도록 하며 주로 퓨린 함량이 낮은 권장식품을 선택하도록 합니다.<br>
            3. 술은 체내 요산수치를 증가시키므로 피하도록 합니다.<br>
            4. 단백질 식품은 계란, 두부, 치즈, 흰살 생선, 살코기 위주로 섭취합니다.<br>
            5. 지방은 적당량 섭취합니다.<br>
            6. 과일과 야채, 수분을 충분히 섭취합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            식품100g 당 퓨린 질소 함량
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 150px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            1. 체중감소를 위하여 지나친 음식 섭취 감소는 혈액 속 요산 농도를 오히려 상승시켜 통풍을 악화시킬 수 있습니다.<br>
            2. 고혈압, 당뇨, 고지혈증 등의 합병증의 우려가 있으므로 염분은 가급적 제한하는 것이 바람직합니다.<br>
            3. 고지방 식사는 요산의 정상적 배설을 방해하므로 튀김, 전 등의 섭취를 제한합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 540px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/통풍_식단.jpg">
          <img src="/vita/assets/image/통풍_식단2.jpg">
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
