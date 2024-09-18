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
            <img id="dietImg" src="/vita/assets/image/항문암식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>항문암식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>항문암</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            수술 직후 회복을 위한 충분한 열량과 단백질을 섭취하도록 하며, 수술 후 약 6주 정도 섬유질 섭취를 줄여 대변 양 조절과 폐색 등의 위험을 최소화 합니다. 
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 180px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 고섬유질 식품 섭취를 줄입니다. (잡곡류, 채소 및 해조류, 과일류, 견과류 등)<br>
            2. 양질의 단백질 식품을 충분히 섭취합니다. <br>
            3. 자극성이 강한 향신료나 조미료는 피합니다. <br>
            4. 충분한 수분섭취를 합니다.(kg당 30cc)
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            수술직후 : 쌀밥, 흰국수, 생선, 계란, 두부, 육류(결체조직 및 껍질 제외), 유제품
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            수술직후 : 잡곡, 질긴 채소, 건조 과일과 껍질, 씨앗, 견과류, 자극성 식품
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 150px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            1. 수술 직후 약 6주간 고섬유식품 섭취를 줄이도록 합니다. <br>
            2. 수술 부위, 장루의 유무에 따른 식사요법이 필요합니다. (저잔사식)<br>
            3. 수술 후 2달뒤 정상식사 시 충분한 섬유소 섭취가 권장됩니다. 
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 300px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/항문암_식단.jpg">
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
