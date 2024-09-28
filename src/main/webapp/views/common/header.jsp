<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.br.vita.member.model.vo.Member" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.br.vita.doctor.model.vo.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

		<!-- 슬릭 -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>
    
    
    
    <% 
    
	    String contextPath = request.getContextPath();
	    Member loginUser = (Member)session.getAttribute("loginUser");
	    String alertMsg = (String)session.getAttribute("alertMsg");
  
    
    %> <!-- 메인변수 정의 -->
    
    <%
	    Map<String, Object> map = (Map<String, Object>) request.getAttribute("Map");
    
			
		%>

    	
	
   
</head>
<body>

<% if(alertMsg != null) { %>
<script>
	alert('<%=alertMsg%>');
</script>
<% session.removeAttribute("alertMsg"); } %>

       <!-- header start -->
       <style>
        body{margin: 0;}
         * {
             box-sizing: border-box;
             margin: 0;
             /* border: 1px solid black; */
             
         }
         #headerDiv{
             box-shadow: 2px 3px 7px black;
             position: fixed;
             width: 100%;
             z-index: 20;
         }
         .header-top{
             display: flex;
             justify-content: space-evenly;
             background-color: white;
         }
         
         #vpMark{
             width: 200px;
             height: 70px;
             cursor: pointer;
         }
         #vpNum,#vpWork,#vpLoc{
             width: 200px;
             height: 70px;
         }
         #topimgDiv1{
             margin-right: 200px;
         }
         /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
         #mainMenu{
             display: flex;
             flex-direction: column;
             background-color: #1F2B6C;           

         }
         #mainMenuList{
             display: flex;
             justify-content: center;
             padding-top: 26px;
             margin-bottom: 10px;
             font-size: 20px;
             list-style: none;
             margin-left: -50px;
             
         }
         #List-1:hover,#List-2:hover,#List-3:hover,#List-4:hover,#List-5:hover,#List-6:hover{
            text-decoration: underline;
            color: white;
         }
         #mainMenuList li{
             margin-right: 60px;
             cursor: pointer;
 
         }
         #mainMenuList li>a{
             color: white;
             text-align: center;
             padding-top: 10px;
         }
         #vpButton{
             width: 200px;
             justify-content: center;
             margin-top: -20px;
         }
 
         .sub{
            border: 1px solid rgba(0, 0, 0, 0.158);
            width: 30%;
         }
         .container1,.container2,.container3,.container4,.container5,.container6{
             display: none;
         }
 
         .submenuContainer-1,.submenuContainer-2,.submenuContainer-3,.submenuContainer-4,.submenuContainer-5,.submenuContainer-6{
             border: 1px solid rgba(0, 0, 0, 0.159);
             display: flex;
             position: fixed;
             top: 146px;
             z-index: 25;
             background-color: white;
             min-height: 300px;
             width:100%;
             
         }

         #loginMenu{
            padding-left: 120px;
            background-color: rgb(198, 214, 231);
            padding-top: 20px;
            font-size: 18px;
         }
         
         a {
            text-decoration: none; /* 밑줄 제거 */
            color: inherit; /* 부모 요소의 색상 상속 */
            font-weight: normal; /* 글꼴 굵기 설정 */
        }
        .popup {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .popup:target {
            display: block;
        }

        .popup-content {   
            margin: 15% auto;
            padding: 20px;
            width: 80%;
            max-width: 1100px;
            text-align: center;
        }

        .close {
            color: white;
            float: right;
            font-size: 50px;
            font-weight: bold;
            text-decoration: none;
            margin-top: -3px;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        #searchInput {
            width: 1000px;
            padding: 10px;
            margin-left: -80px;
            border: 5px solid orange;
        }
        .searchBtn:hover{
            height: auto;
            filter: sepia(10%);
        }
        #searchBtn {
        background: none;
        border: none;
        padding: 0;
        cursor: pointer;
		    }
		    #searchBtn i {
		        font-size: 1.5em; /* 아이콘 크기 조절 */
		    }
    

     </style>

    <header id="headerDiv"> 
        <div class="header-top"> 
            <!-- 현재 이미지 위치 = semi>image>이미지-->
            <!-- 현재 HTML 위치  = semi>project>semi.html -->
            <div class="top-img" id="topimgDiv1"><a href="<%= contextPath %>"><img id="vpMark" src="/vita/assets/image/vp마크.png"></a></div>
            <div class="top-img" id="topimgDiv2"><img id="vpNum" src="/vita/assets/image/vp전화번호.png"></div>
            <div class="top-img" id="topimgDiv3"><img id="vpWork" src="/vita/assets/image/vp병원영업시간.png"></div>
            <div class="top-img" id="topimgDiv4"><a href="<%= contextPath %>/directions.do"><img id="vpLoc" src="/vita/assets/image/vp위치.png" style="cursor: pointer;"></a></div>
        </div>
        
        <div id="mainMenu"> 
            <ul id="mainMenuList">
                <li id="List-1"><a href="" style="text-decoration: none;">의료진/진료과</li>
                <li id="List-2"><a href="" style="text-decoration: none;">진료예약/안내</a></li>
                <li id="List-3"><a href="" style="text-decoration: none;">건강정보</a></li>
                <li id="List-4"><a href="" style="text-decoration: none;">고객서비스</a></li>
                <li id="List-5"><a href="" style="text-decoration: none;">병원이야기</a></li>
                <li id="List-6"><a href="" style="text-decoration: none;">병원소개</a></li>
                <li id="vpButton">
                    <a href="#popup" class="button"><img src="/vita/assets/image/검색버튼.png" class="searchBtn"></a>
                </li>
                <div id="popup" class="popup">
								    <div class="popup-content">
								        <a href="#" class="close">×</a>
								        <form action="<%= contextPath %>/search.do" method="get" id="searchForm">
								            <input type="text" id="searchInput" name="search" placeholder="검색어를 입력하세요" required>
								            <button type="submit" id="searchBtn" style="margin: -50px;"><i class="bi bi-search"></i></button>
								        </form>
								    </div>
								</div>
								
								<script>
								    document.getElementById('searchInput').addEventListener('keypress', function(event) {
								        if (event.key === 'Enter') {
								            event.preventDefault();
								            document.getElementById('searchBtn').click();
								        }
								    });
								</script>
            </ul>
        </div>
    </header>

<div class="container1">
    <div class="submenuContainer-1">

			<%@ include file="/views/common/loginmenu.jsp" %>
         
         
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;의료진/진료과 ></b></div>
        <div class="sub"><br><b>&nbsp;의료진</b></a><br>
        		<a style="text-decoration: none;" href="<%= contextPath %>/schedule.doc?dept=내과">&nbsp;내과</a><br>
        		<a style="text-decoration: none;" href="<%= contextPath %>/schedule.doc?dept=외과">&nbsp;외과</a><br>
        		<a style="text-decoration: none;" href="<%= contextPath %>/schedule.doc?dept=치과">&nbsp;치과</a><br>
        		<a style="text-decoration: none;" href="<%= contextPath %>/schedule.doc?dept=안과">&nbsp;안과</a><br>
        </div> 
        <div class="sub"><a href="<%= contextPath %>/department.do" style="text-decoration: none;"><br><b>&nbsp;진료과</b></a></div> 
        <div class="sub"></div>
       
    </div>
</div>



<div class="container2">
    <div class="submenuContainer-2">
    
    
        
        <%@ include file="/views/common/loginmenu.jsp" %>
        
        
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;진료예약/안내 ></b></div>
        <div class="sub">
            <b><br>&nbsp;안내</b><br>
            <a href="<%= contextPath %>/directions.do" style="text-decoration: none;">&nbsp;오시는길</a><br>
            <a href="<%= contextPath %>/parkingInfo.do" style="text-decoration: none;">&nbsp;주차안내</a><br>
            <a href="<%= contextPath %>/floor.do" style="text-decoration: none;">&nbsp;층별안내</a>
        </div>
        <div class="sub">
            <b><br>&nbsp;외래진료안내</b><br>
            <% if(loginUser != null) { %>
            <a href="<%= contextPath %>/consultationAL.rv" style="text-decoration: none;">&nbsp;진료예약</a><br>
            <%} else { %>
            <a href="<%= contextPath %>/consultationBL.rv" style="text-decoration: none;">&nbsp;진료예약</a><br>
            <%} %>
            <a href="<%= contextPath %>" style="text-decoration: none;">&nbsp;진료검진예약</a><br>
            <a href="<%= contextPath %>" style="text-decoration: none;">&nbsp;전화/방문예약</a><br>
            <a href="<%= contextPath %>/list.rv" style="text-decoration: none;">&nbsp;예약내역 조회</a>
        </div>
        <div class="sub"></div>
       
        
        
        
    </div>
</div>


<div class="container3">
    <div class="submenuContainer-3">
    
       <%@ include file="/views/common/loginmenu.jsp" %>
          
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;건강정보 ></b></div>
        <div class="sub">
            <b><br>&nbsp;의료정보</b><br>
            <a href="<%= contextPath %>/dietTherapy.do" style="text-decoration: none;">&nbsp;식사요법</a>
        </div>
        <div class="sub"><a href="<%= contextPath %>/healthTV1.do" style="text-decoration: none;"><b><br>&nbsp;건강TV</b></a></div>
        <div class="sub"></div>
    </div>
</div>


<div class="container4">
    <div class="submenuContainer-4">
    
    
       <%@ include file="/views/common/loginmenu.jsp" %>
          
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;고객서비스 ></b></div>
        <div class="sub">
            <b><br>&nbsp;발급안내</b><br>
            <a href="<%= contextPath %>/certificate.go" style="text-decoration: none;">&nbsp;증명서</a>
        </div>
        <div class="sub">
            <b><br>&nbsp;고객서비스</b><br>
            <a href="<%= contextPath %>/list.cs" style="text-decoration: none;">&nbsp;고객의소리</a><br>
            <a href="<%= contextPath %>/list.cs" style="text-decoration: none;">&nbsp;칭찬코너</a>
        </div>
        <div class="sub"></div>
    </div>
</div>


<div class="container5">
    <div class="submenuContainer-5">
    
       <%@ include file="/views/common/loginmenu.jsp" %>
          
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;병원이야기 ></b></div>
        <div class="sub">
            <b><br>&nbsp;후원</b><br>
            <a href="<%= contextPath %>/sponsorship.do" style="text-decoration: none;">&nbsp;후원</a><br>
            <a href="<%= contextPath %>/sponsorshipStatus.do" style="text-decoration: none;">&nbsp;후원현황</a>
        </div>
        <div class="sub">
            <b><br>&nbsp;자원봉사</b><br>
            <a href="<%= contextPath %>/service.do" style="text-decoration: none;">&nbsp;안내</a>
        </div>
        <div class="sub"></div>
    </div>
</div>


<div class="container6">
    <div class="submenuContainer-6">
    
    
       <%@ include file="/views/common/loginmenu.jsp" %>
          
        <div class="sub" style="font-size: 17px;"><br><b>&nbsp;병원소개 ></b></div>
        <div class="sub">
            <b><br>&nbsp;병원소개</b><br>
            <a href="<%= contextPath %>/greetings.do" style="text-decoration: none;">&nbsp;병원장인사말</a><br>
            <a href="<%= contextPath %>/hospitalInfo.do" style="text-decoration: none;">&nbsp;병원안내</a>
        </div>
        <div class="sub">
            <b><br>&nbsp;소식</b><br>
            <a href="<%= contextPath %>/list.no" style="text-decoration: none;">&nbsp;공지사항</a><br>
            <a href="<%= contextPath %>/list.ns" style="text-decoration: none;">&nbsp;뉴스</a>
        </div>
        <div class="sub"></div>
    </div>
</div>
    
    <script>
    
    	
    
    
    
    
    
    
       $(document).ready(function() {

        var menuItems = {
            '#List-1': '.container1',
            '#List-2': '.container2',
            '#List-3': '.container3',
            '#List-4': '.container4',
            '#List-5': '.container5',
            '#List-6': '.container6'
         };

    // 마우스가 메뉴 항목 위에 올려졌을 때
    $.each(menuItems, function(selector, containerClass) {
        $(selector).mouseenter(function() {
            // 모든 메뉴 숨기기
            $.each(menuItems, function(x,container) {
                $(container).hide();
            });
            // 현재 메뉴 표시
            $(containerClass).show();
        });
    });

    // 메뉴에서 마우스가 나갈 때
    $('.container1, .container2, .container3, .container4, .container5, .container6').mouseleave(function() {
        $(this).hide(); // 해당 메뉴 숨기기
    });



});
        
    </script>
    <!-- header end -->
</body>
</html>