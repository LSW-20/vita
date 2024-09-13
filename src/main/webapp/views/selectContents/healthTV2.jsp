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
    }
    footer{
    	margin-top: 2100px !important;
    }
    </style>
    <section>
        <div id="Vpopup1" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/tiWtrMyCYkU" title="X-ray 검사 임산부도 괜찮은가요?" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup2" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/-4a1La1t_rA" title="비염 낫는 치료법, 직접 보여드립니다 ㅣ Q&amp;A - 몇 살부터 비염 치료 가능한가요? l 얼마나 사용해야 하나요? 부작용 대처법? 코세척 방법까지" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup3" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/1-ZOkpJKyD4" title="뱃속의 시한폭탄 복부 대동맥류 안전하게 치료할 수 있습니다!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup4" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/5QD_4dt5-pw" title="암 환자의 임신, 임신 후 재발된 암... 어떻게 해야할까요? | 서울아산병원 [암행의사]" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup5" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/Kq-yn8Otanc" title="소아기 특발성 대퇴골두 무혈성 괴사 (LCP) | 건강플러스" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup6" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/b_Om_fY8jUY" title="소아 악성 림프종, 4기여도 완치할 수 있습니다!｜암행의사" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup7" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/K234y7IQ__k" title="병원균이 눈에 보인다고?!" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
            </div>
        </div>
        <div id="Vpopup8" class="Vpopup">
            <div class="Vpopup-content">
                <a href="#" class="close">×</a>
                <iframe width="1024" height="576" src="https://www.youtube.com/embed/7AfAwBfmMRk" title="모두가 웃을 수 있도록 ^0^" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>            
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
                <a href="#Vpopup1"><img src="https://img.youtube.com/vi/tiWtrMyCYkU/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup2"><img src="https://img.youtube.com/vi/-4a1La1t_rA/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 100px;">
                <b>X-ray 검사 임산부도 괜찮은가요?</b>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px;">
                <b>비염 완치법 보여드립니다</b>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup3"><img src="https://img.youtube.com/vi/1-ZOkpJKyD4/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px; height: 300px;">
                <a href="#Vpopup4"><img src="https://img.youtube.com/vi/5QD_4dt5-pw/0.jpg" style="width: 100%; height: 100%;"></a>
              </td>
            </tr>
            <tr>
              <td style="width: 500px; height: 100px;">
                <b>뱃속의 시한폭탄 복부 대동맥류 안전하게 치료할 수 있습니다!</b>
              </td>
              <td style="width: 100px;"></td>
              <td style="width: 500px;">
                <b>암 환자의 임신, 임신 후에 재발된 암... 어떻게 해야할까요?</b>
              </td>
            </tr>
            <tr>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup5"><img src="https://img.youtube.com/vi/Kq-yn8Otanc/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup6"><img src="https://img.youtube.com/vi/b_Om_fY8jUY/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 100px;">
                  <b>소아기 특발성 대퇴골두 무혈성 괴사 (LCP)</b>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px;">
                  <b>소아 악성 림프종, 4기여도 완치할 수 있습니다!</b>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup7"><img src="https://img.youtube.com/vi/K234y7IQ__k/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px; height: 300px;">
                  <a href="#Vpopup8"><img src="https://img.youtube.com/vi/7AfAwBfmMRk/0.jpg" style="width: 100%; height: 100%;"></a>
                </td>
              </tr>
              <tr>
                <td style="width: 500px; height: 100px;">
                  <b>병원균이 눈에 보인다고?!</b>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 500px;">
                  <b>모두가 웃을 수 있도록 ^0^</b>
                </td>
              </tr>
          </table>
        </div>
        <br>
        <div class="container" style="height: 50px;">
            <ul class="pagination d-flex justify-content-center text-dark">
                <li class="page-item"><a class="page-link" href="/vita/views/selectContents/healthTV1.jsp">이전</a></li>
                <li class="page-item"><a class="page-link" href="/vita/views/selectContents/healthTV1.jsp">1</a></li>
                <li class="page-item active"><a class="page-link" href="#" disabled>2</a></li>
                <li class="page-item"><a class="page-link" href="#" disabled>다음</a></li>
            </ul>       
        </div>         
    </section>
    
<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>