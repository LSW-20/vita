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
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce3.jsp'"><b><p></p>치과</b></div>
            <div class="container border select" style="width: 25%; text-align: center;"><b><p></p>안과</b></div>
        </div>
        <br><br><br>
        <div class="container" style="text-align: center; width: 1000px; height: 600px; font-size: 20px;">
            <p style="text-align: left;">
                비타병원 안과는 최신의 진료기술과 장비를 도입하여 최상의 의료 서비스를 제공하는 것에 그치지 않고, 환자<br>
                분들이 안락하고 편안하게 치료받을 수 있도록 세심한 배려와 따뜻한 진료를 실천하기 위해 노력하고 있습니다.<br><br>
                 
                환자분들과 항상 눈과 눈을 마주치면서 공감하고, 병원이라는 공간에서 건강이라는 가치를 함께 지켜가는 파<br>
                트너로서 최선을 다하겠습니다.<br><br>

                비타병원 안과를 믿고 찾아주시는 모든 분들께 깊은 감사의 말씀을 드리며, 안과를 찾아주시는 모든 분들의<br>
                선명하고 밝은 눈 건강을 기원합니다.<br><br>

                감사합니다.
            </p>
        </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>