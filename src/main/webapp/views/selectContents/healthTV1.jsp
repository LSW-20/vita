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
        height: 1947;
        margin-top: 153px;
    }
    .Vpopup {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .Vpopup:target {
        display: block;
    }

    .Vpopup-content {   
        margin: 10% auto;
        padding: 20px;
        width: 80%;
        max-width: 1100px;
        text-align: center;
    }

    .close {
        color: white;
        float: right;
        font-size: 50px;
        font-weight: bold;
        text-decoration: none;
        margin-top: -3px;
    }
    .page-item.active .page-link {
        background-color: #007bff;
        color: white;
        border-color: #007bff;
        z-index: -1;
    }
    .disabled-link {
        pointer-events: none;
        color: gray;
        text-decoration: none;
        cursor: default;
    }
    footer{
    	margin-top: 2100px !important;
    }
    </style>
    <section>
        <div id="Vpopup1" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video1')">×</a>
                <iframe id="video1" width="1024" height="576" src="https://www.youtube.com/embed/wfdXDwZUq0M" title="우리 아이가 암 진단을 받았다면, 어떻게 알려줘야 하나요?｜암행의사" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
        <div id="Vpopup2" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video2')">×</a>
                <iframe id="video2" width="1024" height="576" src="https://www.youtube.com/embed/ovFv04tzfjU" title="뇌졸중 시야장애의 치료 | 건강플러스" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup3" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video3')">×</a>
                <iframe id="video3" width="1024" height="576" src="https://www.youtube.com/embed/EGoOnPFnLSg" title="간이식 수술 후 담즙 배액관 잠그기 연습하기" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup4" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video4')">×</a>
                <iframe id="video4" width="1024" height="576" src="https://www.youtube.com/embed/eyOFY7RiL6Y" title="암 치료 중인 우리 아이의 마음, 이렇게 읽어주세요｜암행의사" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>        
            </div>
        </div>
        <div id="Vpopup5" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video5')">×</a>
                <iframe id="video5" width="1024" height="576" src="https://www.youtube.com/embed/x424eRESe8U" title="암 환자의 가임력 보존, 치료 시작 전 미리 준비가 필요합니다 | 서울아산병원 [암행의사]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup6" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video6')">×</a>
                <iframe id="video6" width="1024" height="576" src="https://www.youtube.com/embed/G9_WqQ8Dda0" title="두개골 조기 유합증 치료는?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup7" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video7')">×</a>
                <iframe id="video7" width="1024" height="576" src="https://www.youtube.com/embed/Qr1tX_X8NKc" title="방사선 치료, 힘들거나 견디지 못 할까봐 걱정되시나요?｜암행의사" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup8" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close" onclick="stopVideo('video8')">×</a>
                <iframe id="video8" width="1024" height="576" src="https://www.youtube.com/embed/PTYBCZ8RHfU" title="X-ray 검사는 왜 매일하나요?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <br><br>
        <div class="container" style="text-align: center; font-size: 30px; height: 50px;"><b>건강TV</b></div>
        <br>
        <div class="container" style="text-align: center; width: 600px; height: 50px;">
          <p style="color: gray;">계절별로 중요한 건강정보를 영상 또는 뉴스 형태로 확인하실 수 있습니다.</p>
        </div>
        <div class="container" style="text-align: center; width: 1100px; height: 1600px;">
          <table>
            <tr>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup1"><img src="https://img.youtube.com/vi/wfdXDwZUq0M/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup2"><img src="https://img.youtube.com/vi/ovFv04tzfjU/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 100px;">
                <b>우리 아이가 암 진단을 받았다면, 어떻게 알려줘야 하나요?</b>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px;">
                <b>뇌졸중 시야장애의 치료</b>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup3"><img src="https://img.youtube.com/vi/EGoOnPFnLSg/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup4"><img src="https://img.youtube.com/vi/eyOFY7RiL6Y/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 100px;">
                <b>담즙 배액관 잠그기 연습하기</b>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px;">
                <b>암 치료 중인 우리 아이의 마음, 이렇게 읽어주세요</b>
              </td>
            </tr>
            <tr>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup5"><img src="https://img.youtube.com/vi/x424eRESe8U/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup6"><img src="https://img.youtube.com/vi/G9_WqQ8Dda0/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 100px;">
                  <b>암 환자의 가임력 보존, 치료 시작 전 미리 준비가 필요합니다</b>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px;">
                  <b>두개골 조기 유합증 치료는?</b>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup7"><img src="https://img.youtube.com/vi/Qr1tX_X8NKc/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup8"><img src="https://img.youtube.com/vi/PTYBCZ8RHfU/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 100px;">
                  <b>방사선 치료, 힘들거나 견디지 못 할까봐 걱정되시나요?</b>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px;">
                  <b>X-ray 검사는 왜 매일하나요?</b>
                </td>
              </tr>
          </table>
        </div>
        <br>
        <div class="container" style="height: 50px;">
            <ul class="pagination d-flex justify-content-center text-dark">
                <li class="page-item"><a class="page-link disabled-link" href="#">이전</a></li>
                <li class="page-item active"><a class="page-link disabled-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="<%= contextPath %>/healthTV2.do">2</a></li>
                <li class="page-item"><a class="page-link" href="<%= contextPath %>/healthTV2.do">다음</a></li>
            </ul>       
        </div>         
    </section>
    <script>
        function stopVideo(videoId) {
            var iframe = document.getElementById(videoId);
            var iframeSrc = iframe.src;
            iframe.src = iframeSrc;
        }
    </script>
<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>