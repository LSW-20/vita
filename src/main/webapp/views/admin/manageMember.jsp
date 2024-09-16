<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- header start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- header end -->

    <!-- sideBar start -->
    <%@ include file="/views/common/adminSideBar.jsp" %>
    <!-- sideBar end-->



    <style>

    /* 여기부터 */
    footer {
        margin-top: 1750px; /* 페이지마다 footer 조금씩 조정 */
    }
    #side_menu {
        height: 130%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
    }



                
    #title_msg { /* '회원 계정 관리' 텍스트 */
        border-bottom: 10px solid silver;

        font-size: 40px;
        font-weight: 900;
        padding-left: 100px;
        padding-bottom: 30px;
    }

    #search_member { /* '회원 검색' 텍스트 */
        font-size: 20px;
        font-weight:600;
        margin-left: 40px;
    }


    #search_member_table { /* 회원 검색 '테이블' */
        width: 100%;
    }

    #search_member_table td { /* 회원 검색 '테이블'의 각 셀들 */
        border: 1px solid rgb(201, 193, 193);
    }

    .left_cell { /* 회원 검색 테이블의 왼쪽 셀 */
        width: 250px; 
        padding-left: 40px; 
        background-color: rgb(235, 233, 233);
    }

    .right_cell_1 { /* 회원 검색 테이블의 오른쪽 셀 첫 2개 */
        padding-left: 20px; 
        padding-top:  10px;
        padding-bottom: 10px;
    }

    .right_cell_2 { /* 회원 검색 테이블의 오른쪽 셀 마지막 1개 */
        padding-left: 20px; 
        padding-top:  15px;
        padding-bottom: 5px;
    }



    .search_member_result { /* '회원 검색 결과' 텍스트 */
        font-size: 20px;
        font-weight:600;
        margin-left: 40px;
    }

    .del_add_btn { /* 삭제, 추가 버튼 가운데 정렬 */
        text-align: center;
    }



    .add_update_modal_table th { /* 추가, 수정용 modal의 테이블 왼쪽셀 */
        padding-right: 40px;
        height: 40px;
    }
    .add_update_modal_table td { /* 추가, 수정용 modal의 테이블 오른쪽셀 */
        height: 40px;
        
    }
    .add_update_modal_table input:not(.select_dept) { /* 추가, 수정용 modal의 테이블 오른쪽셀의 input */
        width: 220px;
    }
    .star { /* 추가, 수정용 modal의 '*'를 빨간색으로 */
        color: red;
    }

    </style>






    <!-- section 나머지 여기부터 start -->

  <!--  
    <div id="content" > 

     
        <br><br>

        <div id="admin_name">
            관리자 강보람님
        </div>

        <br><br><br>
  --> 

            <div id="title_msg">회원 계정 관리</div>

            <br><br><br>


                <div id="search_member">회원 검색</div>
                <br>

                <table id="search_member_table">
                    <tr>
                        <td class="left_cell">이름</td>
                        <td class="right_cell_1">
                            <form action="" method="">
                                <input type="text" name="이름" size="20">
                                <button type="submit" class="btn btn-secondary" style="margin-left: 20px;">검색</button>
                            </form>
                        </td>
                    </tr>

                    <tr>
                        <td class="left_cell">아이디</td>
                        <td class="right_cell_1">
                            <form action="" method="">
                                <input type="text" name="사번" size="20">
                                <button type="submit" class="btn btn-secondary" style="margin-left: 20px;">검색</button>
                            </form>
                        </td>
                    </tr>
                </table>

                <br>



            <%-- 조건처리하는법. 검색 이전상태랑 검색했는데 결과가 없는경우를 구분하기 위해 flag 변수 사용한다.
            <% boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed"); %>

            <% if (!searchPerformed) { %>
               검색 이전 상태
                초기 화면을 표시 
            <% } else if (doctorList.isEmpty()) { %>
                검색했지만 결과가 없는 경우
                <div class="search_doctor_result">의료진 검색 결과</div>
                <table class="table table-striped">
                    <tr>
                        <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                </table>
            <% } else { %>
                검색 결과가 있는 경우 
            --%> 


            <br><br>
            <!-- case1. 회원 검색 결과가 없는 경우  -->
            <div class="search_member_result">회원 검색 결과</div> <br>

            <form action="">
                <table class="table table-striped">
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>주민등록번호</th>
                        <th>주소</th>
                        <th>이메일</th>
                        <th>수신여부</th>
                        <th>핸드폰 번호</th>
                        <th>회원가입일</th>
                    </tr>

                    <tr>
                        <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                </table>

            </form>

            <br><br>

            <!-- case2. 의료진 검색 결과가 있는 경우 -->
            <div class="search_member_result">회원 검색 결과</div> <br>

            <form action="">
                <table class="table table-striped">
                    <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>주민등록번호</th>
                        <th>주소</th>
                        <th>이메일</th>
                        <th>수신여부</th>
                        <th>핸드폰 번호</th>
                        <th>회원가입일</th>
                    </tr>

                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>
                    <tr>
                        <td>abcd111</td>
                        <td>가가가</td>
                        <td>901011-2154687</td>
                        <td>서울 강동구 강동대로51길 56-2, 201호</td>
                        <td>abcd111@gmail.com</td>
                        <td>Y</td>
                        <td>010-6542-4633</td>
                        <td>2020-07-03</td>
                    </tr>

                </table>

            </form>


            <br>
            <ul class="pagination d-flex justify-content-center text-dark">
                <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="">1</a></li>
                <li class="page-item"><a class="page-link" href="">2</a></li>
                <li class="page-item"><a class="page-link" href="">3</a></li>
                <li class="page-item"><a class="page-link" href="">4</a></li>
                <li class="page-item"><a class="page-link" href="">5</a></li>
                <li class="page-item"><a class="page-link" href="">Next</a></li>
            </ul>




        </div>
    </div>
    </section>
   
    <!-- section end -->




    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->

</body>
</html>