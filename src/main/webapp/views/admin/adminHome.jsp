<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- http://localhost:9999/vita/views/admin/adminHome.jsp로 확인 -->

    <style>
        footer {
            margin-top: 1220px; /* 페이지마다 footer 조금씩 조정 */
        }
        #side_menu {
            height: 100%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
        }

                    
        #container111, #container222 {
                display: flex;
                justify-content: space-around;
                height: 300px;
        }
        .menu {
            border: 1px solid #777a88;
            border-radius: 20px;

            width: 35%;
            height: 100%;

            background-color: rgb(77, 49, 202);
        }
        .menu td {
            color: white;
        }
           

    </style>


    <!-- header start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- header end -->


    <!-- sideBar start -->
    <%@ include file="/views/common/adminSideBar.jsp" %>
    <!-- sideBar end-->

    

    <!-- section 나머지 여기부터 start -->

  <!--  
    <div id="content" > 

     
        <br><br>

        <div id="admin_name">
            관리자 강보람님
        </div>

        <br><br><br>
  --> 


        <div id="container111"> <!-- 첫번째 container. 부트스트랩과 겹치지 않게 class 이름 줬다. -->

            <div class="menu">
                <table style="width: 100%;">
                    <tr>
                        <td style="height: 70px; text-align: center; font-size: 25px;">계정 관리 메뉴</td>
                    </tr>

                    <tr>
                        <td style="height: 25px; width: 100%; background-color: rgb(185, 185, 185)"></td>
                    </tr>

                    <tr>
                        <td style="height: 90px; padding-left: 40px; font-size: 20px;"><a href="/vita/views/admin/manageDoctor.jsp">▷ 의료진 계정 관리</a></td>
                    </tr>

                    <tr>
                        <td style="height: 90px; padding-left: 40px; font-size: 20px;"><a href="/vita/views/admin/manageMember.jsp">▷ 회원 계정 관리</a></td>
                    </tr>
                </table>
            </div>


                <div class="menu">
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 70px; text-align: center; font-size: 25px;">사이트 관리 메뉴</td>
                        </tr>

                        <tr>
                            <td style="height: 25px; width: 100%; background-color: rgb(185, 185, 185)"></td>
                        </tr>

                        <tr>
                            <td style="height: 90px; padding-left: 40px; font-size: 20px;"><a href="/vita/views/notice/noticeM.jsp">▷ 공지사항 관리</a></td>
                        </tr>
                        
                    </table>
                </div>

        </div>


        <br><br><br><br>

        <div id="container222"> <!-- 두번째 container -->


            <div class="menu">
                <table style="width: 100%;">
                    <tr>
                        <td style="height: 70px; text-align: center; font-size: 25px;">예약 관리 메뉴</td>
                    </tr>

                    <tr>
                        <td style="height: 25px; width: 100%; background-color: rgb(185, 185, 185)"></td>
                    </tr>

                    <tr>
                        <td style="height: 65px; padding-left: 40px; font-size: 20px;"><a href="">▷ 진료 예약 관리</a></td>
                    </tr>

                    <tr>
                        <td style="height: 65px; padding-left: 40px; font-size: 20px;"><a href="">▷ 건강검진 예약 관리</a></td>
                    </tr>

                    <tr>
                        <td style="height: 65px; padding-left: 40px; font-size: 20px;"><a href="">▷ 건강검진 연계기업 관리</a></td>
                    </tr>
                </table>
            </div>


                <div class="menu">
                    <table style="width: 100%;">
                        <tr>
                            <td style="height: 70px; text-align: center; font-size: 25px;">고객의 소리 관리 메뉴</td>
                        </tr>

                        <tr>
                            <td style="height: 25px; width: 100%; background-color: rgb(185, 185, 185)"></td>
                        </tr>

                        <tr>
                            <td style="height: 90px; padding-left: 40px; font-size: 20px;"><a href="">▷ Q&A 답변 및 관리</a></td>
                        </tr>
                    </table>
                </div>

        </div>



    </div>
</div>
</section>

<!-- section end -->







    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->

</body>
</html>