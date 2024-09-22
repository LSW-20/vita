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
        height: 747;
        margin-top: 153px;
    }
    .inner {
        width: 100%;
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        transition: transform 0.5s;
    }
    .inner img {
        width: 120px;
        height: 120px;
        z-index: 5;
    }
    .inner2 {
        transform: translateY(100%);
        z-index: 10;
    }
    #inner1:hover .inner2,#inner2:hover .inner2,#inner3:hover .inner2,#inner4:hover .inner2 {
        transform: translateY(0);
    }
    
    
    #hov1:hover {
        background-color: white;  
    }
    #hov2:hover {
        background-color: white;  
    }
    #hov3:hover {
        background-color: white;  
    }
    #hov4:hover {
        background-color: white;  
    }
    #hov5:hover {
        background-color: white;  
    }
    #hov6:hover {
        background-color: white;  
    }
    #hov7:hover {
        background-color: white;  
    }
    #hov8:hover {
        background-color: white;  
    }
    
    
    
    
    #hov1_b{
        color: white;
    }
    #hov1:hover #hov1_b {
        color: rgb(32, 163, 245);
    }
    
    #hov2_b{
        color: white;
    }
    #hov2:hover #hov2_b {
        color: rgb(32, 163, 245);
    }
    
    #hov3_b{
        color: white;
    }
    #hov3:hover #hov3_b {
        color: rgb(32, 163, 245);
    }
    
    #hov4_b{
        color: white;
    }
    #hov4:hover #hov4_b {
        color: rgb(32, 163, 245);
    }
    
    #hov5_b{
        color: white;
    }
    #hov5:hover #hov5_b {
        color: rgb(32, 163, 245);
    }
    
    #hov6_b{
        color: white;
    }
    #hov6:hover #hov6_b {
        color: rgb(32, 163, 245);
    }
    
    #hov7_b{
        color: white;
    }
    #hov7:hover #hov7_b {
        color: rgb(32, 163, 245);
    }
    
    
    #hov8_b{
        color: white;
    }
    #hov8:hover #hov8_b {
        color: rgb(32, 163, 245);
    }
    
    
    
    
    
    
    
    
    a.no-underline {
        text-decoration: none;
    }
    footer{
    		margin-top: 900px !important;
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
        <div class="container" style="text-align: center; width: 1000px; height: 300px; display: flex;">
        
        
            <div class="container border" id="inner1" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
                <table class="inner inner1">
                    <tr>
                        <td>
                            <img src="/vita/assets/image/내과.jpg" style="width: 120px; height: 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>내과</b>
                        </td>
                    </tr>
                </table>
                <div class="inner inner2" style="background-color: rgb(32, 163, 245); display: block;">
                    <a href="/vita/views/department/dept_Introduce1.jsp" class="no-underline"> <!-- 내과소개링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="#" class="no-underline" > <!-- 내과의료진링크 -->
                        <div id="hov2" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;" onclick="fnintro1();">
                            <b id="hov2_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner2" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
                <table class="inner inner1">
                    <tr>
                        <td>
                            <img src="/vita/assets/image/외과.jpg" style="width: 120px; height: 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>외과</b>
                        </td>
                    </tr>
                </table>
                <div class="inner inner2" style="background-color: rgb(32, 163, 245); display: block;">
                    <a href="/vita/views/department/dept_Introduce2.jsp" class="no-underline"> <!-- 외과소개링크 -->
                        <div id="hov3" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov3_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="#" class="no-underline"> <!-- 외과의료진링크 -->
                        <div id="hov4" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;" onclick="fnintro2();">
                            <b id="hov4_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner3" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
                <table class="inner inner1">
                    <tr>
                        <td>
                            <img src="/vita/assets/image/치과.jpg" style="width: 120px; height: 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>치과</b>
                        </td>
                    </tr>
                </table>
                <div class="inner inner2" style="background-color: rgb(32, 163, 245); display: block;">
                    <a href="/vita/views/department/dept_Introduce3.jsp" class="no-underline"> <!-- 치과소개링크 -->
                        <div id="hov5" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov5_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="#" class="no-underline"> <!-- 치과의료진링크 -->
                        <div id="hov6" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;" onclick="fnintro3();">
                            <b id="hov6_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner4" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
                <table class="inner inner1">
                    <tr>
                        <td>
                            <img src="/vita/assets/image/안과.jpg" style="width: 120px; height: 120px;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <b>안과</b>
                        </td>
                    </tr>
                </table>
                <div class="inner inner2" style="background-color: rgb(32, 163, 245); display: block;">
                    <a href="/vita/views/department/dept_Introduce4.jsp" class="no-underline"> <!-- 안과소개링크 -->
                        <div id="hov7" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov7_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="#" class="no-underline"> <!-- 안과의료진링크 -->
                        <div id="hov8" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;" onclick="fnintro4();">
                            <b id="hov8_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
        </div>   
    </section>
    
    
    
    <script>
    
    function fnintro1(){
    	location.href = '<%= contextPath %>/schedule.doc?dept=내과';
    }
    function fnintro2(){
    	location.href = '<%= contextPath %>/schedule.doc?dept=외과';
    }
    function fnintro3(){
    	location.href = '<%= contextPath %>/schedule.doc?dept=치과';
    }
    function fnintro4(){
    	location.href = '<%= contextPath %>/schedule.doc?dept=안과';
    }
    		
    		
    	
    
    	
    
    
    </script>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>