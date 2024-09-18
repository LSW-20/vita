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
            <img id="dietImg" src="/vita/assets/image/폐렴식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>폐렴식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>폐렴</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>감기, 인플루엔자</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            증상의 진행 중 식사량 감소로 인한 체중감소와 체조직 소모를 방지하기 위하여 충분한 에너지와 단백질의 섭취가 매우 중요합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 180px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 과식보다는 간식과 함께 소량씩 자주 섭취합니다.<br>
            2. 매끼 양질의 어육류나 두부, 계란등을 챙겨서 섭취합니다.<br>
            3. 숨이 찰때는 부드러운 식품을 이용하여 합니다.<br>
            4. 수분을 소량씩 자주 보충합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            부드러운 살코기, 생선, 요구르트, 다양한 색상의 과일이나 채소
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            튀김, 육류의 기름
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            잦은 가래 배출로 몸에 수분이 부족하기 쉬우므로 수시로 과일쥬스나 물 등으로 보충하도록 합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 310px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/폐렴_식단.jpg">
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
