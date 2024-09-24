<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


 

</head>
<body>



    <!-- section start -->
    
    <style>
        section {
            position: absolute;
            width: 100%;
            /* height: 1700px; */ /*  jsp 만들때 따로 만드셈!*/
            margin-top: 153px;
        }

        .sidemenuDiv {
            width: 100%;
            height: 100%;
            display: flex;
        }

        #sideMenu {
            background-color: rgb(55, 107, 228);
            width: 20%;
            /* height: 100%; */ /* jsp 만들때 따로 만드셈! */
        }

        #navContent {
            width: 80%;
            height: 100%;
        }

        #doctorPage {
            background-color: rgb(44, 97, 196);
            color: white;
            font-size: 30px;
            font-weight: 900;
            padding: 30px;
            text-align: center;
        }

        .sideMenu {
            text-align: center;
            padding: 20px;
            font-size: 20px;
            color: white;
            cursor:pointer;
        }

        .sideMenu:hover {
            background-color: rgb(80, 182, 237);
        }

        .d_submenu_item1,.d_submenu_item2 {
            margin-left: 60px;
            padding-top: 10px;
            font-size: 15px;
            margin-top: 15px;
            margin-right: 86px;
            display: none;
        }

        #buttonDiv {
            display: flex;
            justify-content: right;
        }
    </style>
    <section>
        
        <script>
           

          $(document).ready(function () {
               $('#d_submenu1').click(function () {
                   $(this).find('.d_submenu_item1').slideToggle();
               });


               $('#d_submenu2').click(function () {
                   $(this).find('.d_submenu_item2').slideToggle();
               });

          });
          
          function fnschedule(){
        	  location.href = '<%= contextPath %>/schedule.go';
        	  
          }
         

        
        </script>

        <nav class="sidemenuDiv">
            <div id="sideMenu">
                <div id="doctorPage">의료진 페이지</div>
                <div class="sideMenu" id="scheduleDiv" onclick="fnschedule();"><a href="#" style="text-decoration: none;">의료 일정 관리</a></div>

                <div class="sideMenu" id="d_submenu1">발급 신청 관리
                  <ul class="d_submenu_item1">
                    <li><a href="<%= contextPath %>/diaList.go" style="text-decoration: none;">진단서</a></li>
                    <!-- 여기로 포워딩할 예정 /di_list.re -->
                    <li><a href="<%= contextPath %>/diaList2.go" style="text-decoration: none;">진료확인서</a></li>
                  </ul>
                </div>

                <div class="sideMenu" id="d_submenu2">진료 기록 관리
                    <ul class="d_submenu_item2">
                        <li><a href="/vita/views/doctor/treatmentRoom.jsp" style="text-decoration: none;">진료실</a></li>
                        <li><a href="/vita/views/doctor/m_records.jsp" style="text-decoration: none;">진료기록</a></li>
                    </ul>
                </div>
            </div>
            
            
       
             

</body>
</html>