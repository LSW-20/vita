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
        height: 847px;
        margin-top: 153px;
    }
    footer{
        margin-top: 1000px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 900px;">
          <b class="container" style="font-size: 30px;">병원장인사말</b>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 600px; display: flex;">
          <div class="container" style="width: 600px; height: 550px;">
            <p>
              개원이래로 늘 최상의 의료서비스 제공을 위해 진료시스템 개선과 <br>
              권역응급의료센터, 다양한 연구기관 운영등 지역사회 건강과 안녕을 <br>
              위해 끊임없이 고민하며 발전을 거듭해왔습니다.<br><br>

              특히 의료전문성 외에도 식물을 이용한 원내 자연 환경을 조성, <br>
              물리적인'치료'를 넘어 환자와 고객이 편하게 쉴 수 있는 심리적'치유'<br>
              까지 고려한 환자 친화적 공간을 운영하고 있습니다.<br><br>

              또 지역사회와 유기적 연계를 핵심가치로,'의료를 통한 나눔'과 <br>
              '협력을 통한 발전'을 도모하여 더 건강한 지역 사회 구축을 위해 <br>
              노력하고 있습니다.<br><br>

              앞으로도 저희 비타병원은 환자와 고객의 믿음에 최고의 치료로 <br>
              보답할 수 있도록 의료서비스의 질적 향상은 물론, 다양한 연구를 통해 <br>
              대한민국 미래의료의 새 지평을 이룩하는데 중추적 역할을 펼쳐갈 <br>
              것입니다.<br><br>

              항상 따듯한 애정과 신뢰를 보내주시는 여러분께 깊은 감사를 드리며,<br> 
              밝고 건강한 사회를 만들어가는 비타병원이 될 수 있도록 늘 노력하겠<br>
              습니다.<br><br>

              감사합니다.
            </p>
          </div>
          <div class="container" style="width: 300px; height: 600px;">
            <div class="container" style="width: 270px; height: 350px;">
              <img src="/vita/assets/image/병원장.jpg" style="width: 100%; height: 100%;">
            </div>
            <br>
            <div class="container" style="width: 200px; height: 30px;">
              <p>병원장 <b>김진구</b></p>
            </div>
          </div>
        </div>

        
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
