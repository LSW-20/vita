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
    footer{
    	margin-top: 950px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="text-align: center; font-size: 30px; height: 50px;"><b>오시는길</b></div>
        <br>
        <div class="container" style="text-align: center; width: 800px; height: 500px;">
          <img src="/vita/assets/image/지도.jpg" style="width: 800px; height: 500px; margin-left: -15px;">
        </div>
        <div class="container" style="text-align: center; width: 800px; height: 100px; color: gray;">
          본관<br>
          (08505)서울특별시 금천구 가산디지털2로 95(가산동,km타워)<br>
          3층 305호<br>
        </div>
           
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>