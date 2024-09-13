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
        height: 647;
        margin-top: 153px;
    }
    .select{
        background-color: rgb(32, 163, 245);
        color: white;
    }
    .unselected:hover{
        background-color: rgb(32, 163, 245);
        color: yellow;
        cursor: pointer;
    }
    footer{
    		margin-top: 1200px !important;
    }

    </style>
    <section>
        <br><br>
        <div class="container" style="text-align: left; font-size: 30px; width: 900px; display: plex;">
        	<div style="width: 50%"><b>진료과소개</b></div>
        	<div style="width: 50%"></div>
        </div>
        <br>
        <div class="container" style="width: 1000px; height: 1px; background: rgb(198, 214, 231);"></div><br><br>
        <div class="container" style="width: 1000px; height: 80px; font-size: 24px; display: flex;">
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce1.jsp'"><b><p></p>내과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce2.jsp'"><b><p></p>외과</b></div>
            <div class="container border select" style="width: 25%; text-align: center;"><b><p></p>치과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce4.jsp'"><b><p></p>안과</b></div>
        </div>
        <br><br><br>
        <div class="container" style="text-align: center; width: 1000px; height: 600px; font-size: 20px;">
            <p style="text-align: left;">
                최고의 의료장비로 정확한 진단부터 예방관리, 치아 보존 및 심미적 보철치료를 보장하고 있습니다.<br><br>

                진료보증제로 사후관리까지 책임집니다.<br><br>

                환자 치아에 맞는 커스텀 부품을 사용하여 아름다운 치아를 보장드립니다.<br><br>

                5,000여건 이상 임상 경험을 바탕으로한 구강외과 전문의의 진료를 받으실 수 있습니다. <br><br>

                악궁확장장치를 이용해 주걱턱,돌출입,비대칭으로 인한 부정교합을 수술없이 교정해드립니다.
            </p>
        </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>