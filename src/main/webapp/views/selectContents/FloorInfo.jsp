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
        height: 797;
        margin-top: 153px;
    }
    table,tr,td{
      border: 1px solid black;
      text-align: center;
      margin: auto;
    }
    td{
      height: 50px;
    }
    #rooftop{
      background-color: rgb(193, 231, 221);
      font-weight: 800;
    }
    #floor{
      background-color: rgb(183, 201, 250);
      font-weight: 800;
    }
    #bfloor{
      background-color: rgb(213, 174, 245);
      color: white;
      font-weight: 800;
    }
    footer{
    	margin-top: 950px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="text-align: center; width: 900px; height: 600px; background-color: rgb(243, 226, 207);">
          <br><br>
          <table>
            <tr id="rooftop">
              <td style="width: 100px;">TOP</td>
              <td style="width: 700px;">정원</td>
            </tr>
            <tr id="floor">
              <td>6F</td>
              <td>병동 601동, 병동 602동, 병동 603동, 휴게 라운지</td>
            </tr>
            <tr id="floor">
              <td>5F</td>
              <td>병동 501동, 병동 502동, 병동 503동, 휴게 라운지</td>
            </tr>
            <tr id="floor">
              <td>4F</td>
              <td>안과, 방사선실, 핵의학센터, 병동 401동, 휴게 라운지</td>
            </tr>
            <tr id="floor">
              <td>3F</td>
              <td>치과, 물리치료실, 운동치료실, 병동 301동, 휴게 라운지</td>
            </tr>
            <tr id="floor">
              <td>2F</td>
              <td>외과, 수술실, 회복실, 중환자실, 병동 201동, 휴게 라운지</td>
            </tr>
            <tr id="floor">
              <td>1F</td>
              <td>내과, 응급실, 원무팀, 약국, 진단검사의학과, 병동 101동, 휴게 라운지</td>
            </tr>
            <tr id="bfloor">
              <td>B1F</td>
              <td>주차장, 장례식장, 기계실</td>
            </tr>
            <tr id="bfloor">
              <td>B2F</td>
              <td>주차장, 장례식장</td>
            </tr>
            <tr id="bfloor">
              <td>B3F</td>
              <td>주차장, 기계실, 창고</td>
            </tr>
          </table>
        </div>  
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>