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
            <img id="dietImg" src="/vita/assets/image/프라더월리증후군식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>프라더 윌리 증후군식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>프라더 윌리 증후군</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>프라더 윌리 증후군, 비만</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            비만으로 인한 합병증을 조절하기 위해 필요합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 180px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 보통의 비만아보다 더 강하게 열량을 제한합니다.<br>
            2. 당뇨가 동반된 경우 당뇨 식사요법의 기준에 따릅니다.<br>
            3. 고지혈증, 고혈압이 있을 경우 저열량 조리법을 이용한 음식을 주로 섭취하고, 싱겁게 먹습니다.<br>
            4. 규칙적으로 운동합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            잡곡밥, 신선한 채소와 과일(당뇨가 있는 경우는 별도의 양 조절 필요), 해조류, 콩 및 두부류
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            사탕이나 초컬렛, 청량음료, 단 빵류 (케익 포함) 와 같이 단순당 또는 단순당이 포함된 음식, 치킨이나 도우넛, 팝콘 등 기름에 튀기거나 볶은 음식, 삼겹살, 갈비류, 소시지, 햄버거, 햄, 베이컨 등 고지방 식품은 최대한 먹지 않아야 합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            기름지지 않은 음식이라 하더라도 식욕만큼 배를 채우게 되면 체중이 쉽게 늘어나므로 전체 섭취량을 조절하는 것이 중요합니다.
          </p>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 300px;">
          <b style="font-size: 20px;">추천 식단</b><br><br>
          <img src="/vita/assets/image/프라더월리증후군_식단.jpg">
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
