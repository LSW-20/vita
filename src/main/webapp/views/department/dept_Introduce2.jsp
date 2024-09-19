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
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/department/dept_Introduce1.jsp'"><b><p></p>내과</b></div>
            <div class="container border select" style="width: 25%; text-align: center;"><b><p></p>외과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/department/dept_Introduce3.jsp'"><b><p></p>치과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/department/dept_Introduce4.jsp'"><b><p></p>안과</b></div>
        </div>
        <br><br><br>
        <div class="container" style="text-align: center; width: 1000px; height: 600px; font-size: 20px;">
            <p style="text-align: left;">
                외과는 위암, 간암, 대장암, 유방암, 갑상선암 그 밖에 여러 암들을 수술로 치료하는 과입니다.<br><br>
                
                또한, 탈장, 충수돌기염, 치핵, 치열 등의 항문질환, 하지정맥류, 복부 양성 종양, 양성 유방질환,<br> 
                양성 갑상선질환, 장기 이식 등 수 많은 질환을 수술로 치료하는 과입니다.<br><br>

                지역 주민들이 소중한 몸을 믿고 맡겨주신 덕분에 여러 선생님들이 긴 시간 동안 자리를 지키며 외과<br>
                환자들을 치료해 왔습니다.<br><br>

                중부권 최초로 간이식을 성공하였으며 대전 중부권에서 유일하게 로봇 수술을 받을 수 있는 병원입니다.<br><br>

                앞으로 더욱 좋은 시설과 시스템, 최고의 의학지식 및 의료기술로 지역사회, 지역주민들에게 보답하도록<br> 
                하겠습니다.  
            </p>
        </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>