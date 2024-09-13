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
            <div class="container border select" style="width: 25%; text-align: center;"><b><p></p>내과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce2.jsp'"><b><p></p>외과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce3.jsp'"><b><p></p>치과</b></div>
            <div class="container border unselected" style="width: 25%; text-align: center;" onclick="location.href='/vita/views/Department/dept_Introduce4.jsp'"><b><p></p>안과</b></div>
        </div>
        <br><br><br>
        <div class="container" style="text-align: center; width: 1000px; height: 600px; font-size: 20px;">
            <p style="text-align: left;">
                우리 내과가 추구하고자 하는 핵심가치(core values)로서<br><br>

                중요한 사안에는 일치를<br> 
                (Unity in essentials.)<br><br>                

                그렇지 않은 사안에는 자유를<br> 
                (Liberty in non-essentials.)<br><br>

                모든 일에는 사랑과 관용을<br>
                (Charity in everything.)
            </p>
        </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>