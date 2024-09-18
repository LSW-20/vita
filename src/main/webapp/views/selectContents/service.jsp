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
        width: 200px;
        height: auto;
        border: 1px solid rgb(228, 225, 225);
    }
    td{
      text-align: left;
      font-size: 14px;
    }
    footer{
        margin-top: 1300px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 900px;">
          <b class="container" style="font-size: 30px;">안내</b>
        </div>
        <br>
        <div class="container" style="width: 900px; height: 130px;">
          <b style="font-size: 24px; color: rgb(21, 148, 105);">자원봉사안내</b><br>
          <p>
            1989년 병원 개원 당시부터 시작된 자원봉사 활동은 성인자원봉사자, 대학생 봉사자, 동/하계 중고등학생 봉사자로 구성되어 있으며 교육 후
            지역사회 구성원에게 봉사활동의 장을 제공하고 있습니다.
          </p>
        </div>
        <div class="container" style="width: 900px; height: 420px;">
          <b style="font-size: 24px; color: rgb(21, 148, 105);">봉사활동 종류</b><br>
          <table>
            <tr style="border-bottom: 1px solid rgb(226, 222, 222); border-top: 2px solid rgb(21, 148, 105);">
              <td style="width: 150px; height: 100px; border-right: 1px solid rgb(226, 222, 222);">
                <img src="/vita/assets/image/외래봉사활동.jpg" style="width: 100%; height: auto;">
              </td>
              <td style="width: 750px;">
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>안내 봉사 :</b> 동.서.신관 1층, 2층에서 병원 위치안내, 진료절차안내, 검사실 안내 등 병원 이용에 대한 전반적인 안내<br>
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>외래 진료실 봉사 :</b> 외래 진료과 신체계측실, 문진대 등
              </td>
            </tr>
            <tr style="border-bottom: 1px solid rgb(226, 222, 222);">
              <td style="width: 150px; height: 100px; border-right: 1px solid rgb(226, 222, 222);">
                <img src="/vita/assets/image/병동봉사활동.jpg" style="width: 100%; height: auto;">
              </td>
              <td style="width: 750px;">
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>병동, 중환자실, 응급실 :</b> 병동업무 지원, 퇴원진료비 수납기 안내 등<br>
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>어린이병원 병원학교 :</b> 수업지도 및 보조교사
              </td>
            </tr>
            <tr style="border-bottom: 1px solid rgb(226, 222, 222);">
              <td style="width: 150px; height: 100px; border-right: 1px solid rgb(226, 222, 222);">
                <img src="/vita/assets/image/기타봉사활동.jpg" style="width: 100%; height: auto;">
              </td>
              <td style="width: 750px;">
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>통역서비스 :</b> 외국인 환자들을 위한 통역봉사 시행 (영어, 일어, 중국어, 러시아어, 몽골어 등)<br>
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                <b>암병원 :</b>  암환자 교육프로그램(노래교실, 웃음치료 등) 지원<br>
                <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                내원객을 위한 지원 활동
              </td>
            </tr>
          </table> 
        </div>
        <div class="container" style="width: 900px; height: 250px;">
          <b style="font-size: 24px; color: rgb(21, 148, 105);">자원봉사자 요건 및 시간</b><br>
          <table>
            <tr style="border-bottom: 1px solid rgb(226, 222, 222); border-top: 2px solid rgb(21, 148, 105);">
              <td style="text-align: center; width: 500px; height: 50px; border-right: 1px solid rgb(226, 222, 222); background-color: rgb(248, 247, 247);">
                <b style="font-size: 16px; color: rgb(21, 148, 105);">자원봉사자 요건</b>
              </td>
              <td style="text-align: center; width: 400px; background-color:rgb(248, 247, 247);">
                <b style="font-size: 16px; color: rgb(21, 148, 105);">자원봉사자 시간</b>  
              </td>
            </tr>
            <tr style="border-bottom: 1px solid rgb(226, 222, 222);">
              <td style="height: 100px; border-right: 1px solid rgb(226, 222, 222); padding: 10px;">
                <p>
                  · 자원봉사의 의미를 이해하고,<br>
                  &nbsp;&nbsp;서울아산병원 자원봉사자회의 규정을 성실히 따르실 수 있는 분<br>
                  · 성인: 6개월 이상, 주 1회 이상 꾸준히 봉사가 가능하신 분<br>
                  · 대학생: 4개월 이상, 주 1회 꾸준히 봉사가 가능하신 분
                </p>
              </td>
              <td style="padding: 10px;">
                <p>
                  <b>주 1회, 3시간 30분</b><br>
                  · 09:00 ~ 12:30(월~금요일)<br>
                  · 12:30 ~ 16:00(월~금요일)<br>
                  · 종일 09:00 ~ 16:00
                </p>
              </td>
            </tr>
          </table>
          <p style="font-size: 14px;">※ 봉사 전 신입봉사 교육 참석 필수</p>
        </div>
        <div class="container" style="width: 950px; height: 130px;">
          <div class="container border" style="width: 870px; height: 100px; padding-left: 20px;">
            <br>
            <table>
              <tr>
                <td colspan="2">
                  <b style="font-size: 18px; color: rgb(21, 148, 105);">상담 및 전화</b><br>
                </td>
              </tr>
              <tr>
                <td style="width: 300px;">
                  <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                  <b>자원봉사자실 :</b> 02-1234-1212
                </td>
                <td>
                  <b style="font-size: 10px; color: rgb(21, 148, 105);">▶</b>
                  <b>사회복지팀 :</b> 02-1234-2424
                </td>
              </tr>
            </table>
            
            
          </div>   
        </div>

        
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
