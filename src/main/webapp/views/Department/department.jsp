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
    #inner:hover .inner2 {
        transform: translateY(0);
    }
    #hov1:hover {
        background-color: white;  
    }
    #hov1_b{
        color: white;
    }
    #hov1:hover #hov1_b {
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
        
        
            <div class="container border" id="inner" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
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
                    <a href="/vita/views/Department/dept_Introduce1.jsp" class="no-underline"> <!-- 내과소개링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="" class="no-underline"> <!-- 내과의료진링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
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
                    <a href="/vita/views/Department/dept_Introduce2.jsp" class="no-underline"> <!-- 외과소개링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="" class="no-underline"> <!-- 외과의료진링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
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
                    <a href="/vita/views/Department/dept_Introduce3.jsp" class="no-underline"> <!-- 치과소개링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="" class="no-underline"> <!-- 치과의료진링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
            
            
            <div class="container border" id="inner" style="width: 200px; height: 200px; position: relative; overflow: hidden;">
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
                    <a href="/vita/views/Department/dept_Introduce4.jsp" class="no-underline"> <!-- 안과소개링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px; margin-top: 30px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 60px;">소개</b>
                        </div>
                    </a>
                    <a href="" class="no-underline"> <!-- 안과의료진링크 -->
                        <div id="hov1" class="container border" style="width: 150px; height: 60px; margin: 12px; margin-left: 24px;">
                            <b id="hov1_b" style="font-size: 20px; line-height: 55px;">의료진</b>
                        </div>
                    </a>
                </div>
            </div>
        </div>   
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>