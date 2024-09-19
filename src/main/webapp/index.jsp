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



<!-- section start -->
     <style>
        section{
            position:absolute;
            width: 100%;
            height: 3000px;
            margin-top: 153px;
        }
        #mainService{
            margin-top: 40px;
            width: 200;
            height: 120px;
            border-right: solid 1px #dee2e6;
            text-align: center;        
        } 
        .linkText {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            font-size: 20px;
            font-weight: bold;
            text-decoration: none;
        }
        .linkText:hover{
            color:white;
        }
        .carousel-indicators li {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background-color: white; /* Change this to your desired color */
        }
        .carousel-indicators .active {
            background-color: orange; /* Change this to your desired active color */
        }
        .carousel-item {
            text-align: center;
        }
        .carousel-item img {
            display: inline-block;
            width: 180px; /* 이미지 크기를 줄여 한 줄에 맞추기 */
            height: 130px;
            margin: 10px;
            margin-top: 40px;
        }
        .carousel-caption {
            position: static;
            text-align: center;
            margin: 30px;
        }
        .carousel-control-prev, .carousel-control-next {
            width: 5%;
        }
     </style>
    <section>
        <div>
            <div id="meinBanner" class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#meinBanner" data-slide-to="0" class="active"></li>
                    <li data-target="#meinBanner" data-slide-to="1"></li>
                    <li data-target="#meinBanner" data-slide-to="2"></li>
                    <li data-target="#meinBanner" data-slide-to="3"></li>
                    <li data-target="#meinBanner" data-slide-to="4"></li>
                </ul>
                
                 <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                    <img id="main-img1" style="width: 100%; height: 400px; margin: 0px;" src="/vita/assets/image/배경1.png">
                    </div>
                    <div class="carousel-item">
                    <img id="main-img2" style="width: 100%; height: 400px; margin: 0px;" src="/vita/assets/image/배경2.png">
                    </div>
                    <div class="carousel-item">
                    <img id="main-img3" style="width: 100%; height: 400px; margin: 0px;" src="/vita/assets/image/배경3.png">
                    </div>
                    <div class="carousel-item">
                    <img id="main-img4" style="width: 100%; height: 400px; margin: 0px;" src="/vita/assets/image/배경4.png">
                    </div>
                    <div class="carousel-item">
                    <img id="main-img5" style="width: 100%; height: 400px; margin: 0px;" src="/vita/assets/image/배경5.png">
                    </div>
                </div>       
            </div>
        </div>
        <div style="text-align: center;">
            <br><br>
            <h1><b>주요 서비스</b></h1>
            <br><br>
        </div>
        <div class="container border" style="height: 200px; border-radius: 15px; display:flex; background: #f7f7f8;">
            <div class="container" id="mainService"><a href=""><img src="/vita/assets/image/아이콘1.jpg" style="width: 80px; height: 80px;"><br><br><b>의료진 찾기</b></a></div>
            <div class="container" id="mainService"><a href=""><img src="/vita/assets/image/아이콘2.jpg" style="width: 80px; height: 80px;"><br><br><b>진료과 찾기</b></a></div>
            <div class="container" id="mainService"><a href=""><img src="/vita/assets/image/아이콘3.jpg" style="width: 80px; height: 80px;"><br><br><b>진료예약</b></a></div>
            <div class="container" id="mainService"><a href=""><img src="/vita/assets/image/아이콘4.jpg" style="width: 80px; height: 80px;"><br><br><b>첫방문 고객 예약 상담</b></a></div>
            <div class="container" id="mainService" style="border: 0px;"><a href=""><img src="/vita/assets/image/아이콘5.jpg" style="width: 80px; height: 80px;"><br><br><b>나의차트</b></a></div>
        </div>
        <br><br>
        <div class="container" style="height: 150px; display:flex;">
            <div class="container border" style="border-radius: 15px; width: 500px; padding-left: 20px; padding-top: 10px; background: #f7f7f8; display: flex;">
                <div class="container">
                    <b><br>전화예약 및 문의<br></b>
                    <h1 style="padding-top: 10px; color: green;">1234-1234</h1>
                </div>
                <div class="container" style="text-align: center; line-height: 120px;">
                    <i class="bi bi-telephone" style="font-size: 70px; padding-left: 70px;"></i>
                </div>      
            </div>
            <div class="container border" style="border-radius: 15px; width: 500px; display: flex;">
                <div class="container" style="width: 350px;">
                    <h4 style="line-height: 150px;"><b>건강검진센터</b></h4>
                </div>
                <div class="container" style="width: 500px;">
                    <div class="container" style="height: 70px; color: green;">
                        <b><br>상담 및 예약 : 02-1234-5678</b>
                    </div>
                    <div class="container" style="height: 70px; text-align: center;">
                        <a href="" type="button" class="btn btn-warning" style="padding-left: 30px; padding-right: 30px; color: white;"><b>건강검진 예약 신청</b></a>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="container" style="height: 120px; display:flex;">
            <div class="container" style="display:flex;">
                <div class="container border" style="border-radius: 15px; width: 240px;">
                    <h4><br><b>암병원</b></h4>
                    <b style="font-size: 13px; color: green;">첫방문 고객 상담 : 02-1234-5678</b>
                </div>
                <div class="container border" style="border-radius: 15px; width: 240px;">
                    <h4><br><b>어린이병원</b></h4>
                    <b style="font-size: 13px; color: green;">첫방문 고객 상담 : 02-1234-5678</b>
                </div>
            </div>
            <div class="container" style="display:flex;">
                <div class="container border" style="border-radius: 15px; width: 240px; position: relative; display: inline-block;">
                    <a href=""><img src="/vita/assets/image/배경1.png" style="border-radius: 15px; width: 240px; height: 120px; margin-left: -15px; display: block;"></a>
                    <a href="" class="linkText">링크 1</a>
                </div>
                <div class="container border" style="border-radius: 15px; width: 240px; position: relative; display: inline-block;">
                    <a href=""><img src="/vita/assets/image/배경2.png" style="border-radius: 15px; width: 240px; height: 120px; margin-left: -15px; display: block;"></a>
                    <a href="" class="linkText">링크 2</a>     
                </div>
            </div>
        </div>
        <br>
        <div style="width: 100%; height: 700px; background: #f7f7f8;">
            <div style="height: 200px; text-align: center; font-size: 50px;">
                <b><br>건강 이야기<br></b>
            </div>
            <div class="container" style="width: 1300px; height: 450px; display: flex; padding-top: 25px;">
                <div class="container border" style="border-radius: 15px; width: 500px; height: 350px; background: white;">
                    <div class="container" style="width: 500px; height: 80px; margin-left: -15px; text-align: center;">
                        <h4><b><br>식사요법</b></h4>
                    </div>
                    <div class="container" style="width: 500px; height: 270px; margin-left: -15px;">
                        <div id="demo" class="carousel slide" data-ride="carousel" data-wrap="true">
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <a href="/vita/views/selectContents/therapy1.jsp"><img src="/vita/assets/image/후천성면역결핍증식.jpg" alt="Image 1"></a>
                                    <a href="/vita/views/selectContents/therapy2.jsp"><img src="/vita/assets/image/후두암식.jpg" alt="Image 2"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/therapy1.jsp"><b style="color: black;">후천성면역결핍증식</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/therapy2.jsp"><b style="color: black;">후두암식</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a href="/vita/views/selectContents/therapy3.jsp"><img src="/vita/assets/image/화상식.jpg" alt="Image 3"></a>
                                    <a href="/vita/views/selectContents/therapy4.jsp"><img src="/vita/assets/image/호모시스틴뇨증식.jpg" alt="Image 4"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/therapy3.jsp"><b style="color: black;">화상식</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/therapy4.jsp"><b style="color: black;">호모시스틴뇨증식</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a href="/vita/views/selectContents/therapy5.jsp"><img src="/vita/assets/image/협심증식.jpg" alt="Image 5"></a>
                                    <a href="/vita/views/selectContents/therapy6.jsp"><img src="/vita/assets/image/허혈성심장질환식.jpg" alt="Image 6"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/therapy5.jsp"><b style="color: black;">협심증식</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/therapy6.jsp"><b style="color: black;">허혈성심장질환식</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                            </div>
                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">                   
                                <img src="/vita/assets/image/왼쪽화살표.png" style="width: 20px; height: 40px; margin-top: -70px;">
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                              <img src="/vita/assets/image/오른쪽화살표.png" style="width: 20px; height: 40px; margin-top: -70px;">
                            </a>
                        </div>
                    </div>   
                </div>
                <div class="container border" style="border-radius: 15px; width: 500px; height: 350px; background: white;">
                    <div class="container" style="width: 500px; height: 80px; margin-left: -15px; text-align: center;">
                        <h4><b><br>건강TV</b></h4>
                    </div>
                    <div class="container" style="width: 500px; height: 270px; margin-left: -15px;">
                        <div id="demo2" class="carousel slide" data-ride="carousel" data-wrap="true">
                            <!-- The slideshow -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup1"><img src="https://img.youtube.com/vi/wfdXDwZUq0M/0.jpg" alt="Image 1"></a>
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup2"><img src="https://img.youtube.com/vi/ovFv04tzfjU/0.jpg" alt="Image 2"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup1"><b style="color: black;">우리 아이가 암 진단을 받았다면, 어떻게 알려줘야 하나요?</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup2"><b style="color: black;">뇌졸중 시야장애의 치료</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup3"><img src="https://img.youtube.com/vi/EGoOnPFnLSg/0.jpg" alt="Image 3"></a>
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup4"><img src="https://img.youtube.com/vi/eyOFY7RiL6Y/0.jpg" alt="Image 4"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup3"><b style="color: black;">담즙 배액관 잠그기 연습하기</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup4"><b style="color: black;">암 치료 중인 우리 아이의 마음, 이렇게 읽어주세요</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup5"><img src="https://img.youtube.com/vi/x424eRESe8U/0.jpg" alt="Image 5"></a>
                                    <a href="/vita/views/selectContents/healthTV1.jsp#Vpopup6"><img src="https://img.youtube.com/vi/G9_WqQ8Dda0/0.jpg" alt="Image 6"></a>
                                    <div class="carousel-caption" style="display: flex; margin-top: -20px;">
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup5"><b style="color: black;">암 환자의 가임력 보존, 치료 시작 전 미리 준비가 필요합니다</b></a></div>
                                        <div class="container"><a href="/vita/views/selectContents/healthTV1.jsp#Vpopup6"><b style="color: black;">두개골 조기 유합증 치료는?</b></a></div>
                                        <br><br>
                                    </div>
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="carousel-control-prev" href="#demo2" data-slide="prev">                         
                                <img src="/vita/assets/image/왼쪽화살표.png" style="width: 20px; height: 40px; margin-top: -70px;">
                            </a>
                            <a class="carousel-control-next" href="#demo2" data-slide="next">                                
                                <img src="/vita/assets/image/오른쪽화살표.png" style="width: 20px; height: 40px; margin-top: -70px;">        
                            </a>
                        </div>
                    </div> 
                </div>
            </div>
        </div> 
        <br><br><br>    
        <div class="container" style="width: 1300px; height: 50px; display: flex; padding-top: 25px;">
            <div class="container" style="width: 500px; height: 50px;">
                <h4><b>공지사항</b></h4>
            </div>
            <div class="container" style="width: 500px; height: 50px;">
                <h4><b>뉴스</b></h4>
            </div>
        </div> 
        <div class="container" style="width: 1300px; height: 200px; display: flex; padding-top: 25px;">
            <div class="container border" style="border-radius: 15px; width: 500px; height: 200px; display: flex; padding-top: 30px; padding-bottom: 30px;">
                <table>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">비타병원 개인정보처리방침 개정</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">비타병원 개인정보처리방침 개정</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">비타병원 개인정보처리방침 개정</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                </table>
            </div>
            <div class="container border" style="border-radius: 15px; width: 500px; height: 200px; display: flex; padding-top: 30px; padding-bottom: 30px;">
                <table>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">9번째 'NEJM' 심방세동 있는 관상동맥질환자 ..</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">비타병원, 전립선암 혁신 치료제 '빅루빅토' 본격 ..</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                    <tr>
                        <th style="width: 380px; padding-left: 10px;"><a href="">심폐소생술시 에크모 조기 시행해야 생존 확률 높 ..</a></th>
                        <td style="font-size: 15px; color: gray;">2024.08.24</td>
                    </tr>
                </table>        
            </div>    
        </div> 
        <br><br>
        <div class="container" style="width: 1300px; height: 200px; display: flex; padding-top: 25px;">
            <div class="container border" style="border-radius: 15px; width: 500px; height: 150px;">
                <a href=""><img src="/vita/assets/image/배경1.png" style="border-radius: 15px; width: 500px; height: 150px; margin-left: -15px;"></a>
            </div>
            <div class="container border" style="border-radius: 15px; width: 500px; height: 150px;">
                <a href=""><img src="/vita/assets/image/배경2.png" style="border-radius: 15px; width: 500px; height: 150px; margin-left: -15px;"></a>
            </div>
        </div>
        <br>
        <div class="container border" style="border-radius: 15px; width: 1050px; height: 150px;">
            <a href=""><img src="/vita/assets/image/배경3.png" style="border-radius: 15px; width: 1050px; height: 150px; margin-left: -15px;"></a>
        </div>
        <br><br><br><br><br>
        <style>
        .autoplay {
            width: 100%;
            margin: auto;
            padding-left: 65px;
            padding-top: 40px;
        }
        .slick-slide img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .slick-slide img:hover {
            transform: scale(1.05);
        }
        .slick-prev:before, .slick-next:before {
            color: #333;
            font-size: 50px;
            margin-left: -15px;
        }
        #slideImg2{
            border: solid 1px f7f7f8;
        }
        footer{
	        margin-top: 3153px !important;;
        } 
        </style>
        <div class="container" style="width: 1000px; height: 200px;">
            <div class="autoplay">
                <div><a href=""><img src="/vita/assets/image/아이콘1.jpg" alt="Image 1" id="slideImg2"></a></div>
                <div><a href=""><img src="/vita/assets/image/아이콘2.jpg" alt="Image 2" id="slideImg2"></a></div>
                <div><a href=""><img src="/vita/assets/image/아이콘3.jpg" alt="Image 3" id="slideImg2"></a></div>
                <div><a href=""><img src="/vita/assets/image/아이콘4.jpg" alt="Image 4" id="slideImg2"></a></div>
                <div><a href=""><img src="/vita/assets/image/아이콘5.jpg" alt="Image 5" id="slideImg2"></a></div>
                <div><a href=""><img src="/vita/assets/image/아이콘1.jpg" alt="Image 6" id="slideImg2"></a></div>
            </div>
        
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function(){
                    $('.autoplay').slick({
                        slidesToShow: 5,
                        slidesToScroll: 1,
                        autoplay: true,
                        autoplaySpeed: 2000,
                    });
                });    
            </script>    
        </div>

    </section>
   
    
    <!-- section end -->



<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>