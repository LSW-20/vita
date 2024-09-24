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
        height: 1147px;
        margin-top: 153px;
    }
    #dietImg{
        width: 300px;
        height: auto;
        border: 1px solid rgb(228, 225, 225);
    }
    p{
      text-align: left;
      font-size: 15px;
    }
    footer{
        margin-top: 1300px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 900px;">
          <b class="container" style="font-size: 30px;">후원</b>
        </div>
        <br>
        <div class="container border" style="width: 900px; height: 240px; display: flex; background-color: rgb(248, 247, 247);">
          <div class="container" style="width: 40%;">
            <img id="dietImg" src="/vita/assets/image/후원.jpg" style="margin-top: 30px;">
          </div>
          <div class="container" style="width: 60%;">
            <div style="margin-top: 30px;">
              <b style="font-size: 20px; color: rgb(34, 155, 18);">'나눔의 품격' 이란</b><br>
              <p>
                후원자와 비타병원이 상호간의 존중과 배려를 바탕으로
                소중한 후원이 감동으로 전해질 수 있도록 하겠다는 비타병원의 약속입니다.<br><br>
                
                여러분의 후원은 비타병원의 앞선 의술을 더욱 발전시키고<br>
                어려움을 겪는 환자와 이웃들에게 희망이 됩니다.
              </p>
            </div>    
          </div>
        </div>
        <br><br>
        <div class="container" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">불우환자지원기금</b><br><br>
          <p>
            불우환자지원기금은 병마와 싸우며 힘든 투병생활을 하고 있는 우리의 불우이웃을 위해 치료비와 수술비를 지원하기 위한 기금입니다.          </p>
        </div>
        <div class="container" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">교육기금</b><br><br>
          <p>
            비타병원 의료진은 인류의 건강하고 행복한 삶을 위해 끊임없는 도전과 열정을 다하고 있습니다.
            교육기금은 의료진 교육과 육성을 통해 치료기술 개발과 생명과학 발전에 도움을 주는 기금입니다.       
        </div>
        <div class="container" style="width: 900px; height: 130px;">
          <b style="font-size: 20px;">연구기금</b><br><br>
          <p>
            비타병원은 개원 초기부터 인간의 생명, 질병에 관한 지속적인 연구를 통해 국내 최고 연구중심병원으로서의 역할과 소임을 다하고 있습니다. 
            연구기금은 신기술 개발과 생명과학 발전을 통해 ‘앞선 의술, 더 큰 사랑’을 실천하기 위한 기금입니다.    
        </div>
        <div class="container" style="width: 900px; height: 150px;">
          <b style="font-size: 20px;">병원발전기금</b><br><br>
          <p>
            비타병원은 변함 없는 이웃사랑을 실천하며 ‘환자중심병원’으로서의 역할과 소임을 다하고 있습니다. 
            병원발전기금은 환자를 위한 진료시설, 의료환경 개선을 통해 더 나은 병원 환경을 구축하기 위한 기금입니다.  
        </div>
        <div class="container" style="display:flex;">
	        <div class="container border" style="text-align: center; border-radius: 15px; width: 240px; height: 120px; background-color: #f7f7f8;">
	            <h4><br><b>후원문의</b></h4>
	            <b style="font-size: 20px; color: green;">02-1234-9876</b>
	        </div>
					<div id="directionsLink" class="container border" style="text-align: center; border-radius: 15px; width: 240px; height: 120px; background-color: rgb(55, 107, 228); color: white; cursor: pointer;">
	            <h4><br><b>후원현황보기</b></h4>
	            <i class="bi bi-arrow-right" style="font-size: 30px;"></i>
	        </div>
        </div>
        <script>
          document.getElementById("directionsLink").addEventListener("click", function() {
              window.location.href = "<%= contextPath %>/sponsorshipStatus.do";
          });
        </script>  
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
