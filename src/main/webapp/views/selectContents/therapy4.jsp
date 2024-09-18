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
        height: 1247px;
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
        margin-top: 1400px !important;
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
            <img id="dietImg" src="/vita/assets/image/호모시스틴뇨증식.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 73%;">
            <div style="margin-top: 30px;">
              <b>호모시스틴뇨증식</b><br><br>
              <table>
                <tr>
                  <td style="width: 80px; height: 20px;">관련질환</td>
                  <td>호모시스틴뇨증</td>
                </tr>
                <tr>
                  <td>동의어</td>
                  <td>호모시스틴뇨증, 고메티오닌혈증</td>
                </tr>
              </table>
            </div>    
          </div>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 필요성</b><br><br>
          <p>
            호모시스틴 대사에 필요한 효소 결핍으로 메티오닌이 과다생성됨으로써 나타날 수 있는 여러가지 합병증을 예방하고, 정상적인 성장과 발달을 도모하기 위해 식사요법이 필요합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">식사요법의 실제</b><br><br>
          <p>
            1. 메티오닌이 제거된 특수분유(예. 메티오닌 프리 분유, Hominex)와 일반분유를 혼합하여 수유합니다.
            2. 분유량은 반드시 정확하게 계량하여 먹입니다.
            3. 성장에 따라 영양 요구량이 달라지므로 주기적으로 영양상담을 받도록 합니다.
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">권장 식품</b><br><br>
          <p>
            곡류, 채소류, 과일류, 식물성 기름 
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">주의 식품</b><br><br>
          <p>
            콩 및 두부류, 고기, 생선류 등 단백질을 많이 함유한 식품
          </p>
        </div>
        <br>
        <div class="container border-bottom" style="width: 900px; height: 110px;">
          <b style="font-size: 20px;">그 외 주의사항</b><br><br>
          <p>
            처방된 분유를 전량 먹이지 못하고 지속적으로 남기게 되면 필수영양소 결핍, 성장지연 등의 결과를 초래할 수 있습니다. 
          </p>
        </div>
        <br>
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
