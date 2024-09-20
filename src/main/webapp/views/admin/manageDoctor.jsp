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
<%@ include file = "/views/common/header.jsp"%>
<!-- header end -->

<!-- sideBar start -->
<%@ include file="/views/common/adminSideBar.jsp" %>
<!-- sideBar end-->




<!-- section start -->
 <style>


/* 여기부터 */
footer {
    margin-top: 1750px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
    height: 130%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}


            
    #title_msg { /* '의료진 계정 관리' 텍스트 */
        border-bottom: 10px solid silver;

        font-size: 40px;
        font-weight: 900;
        padding-left: 100px;
        padding-bottom: 30px;
    }

    #search_doctor { /* '의료진 검색' 텍스트 */
        font-size: 20px;
        font-weight:600;
        margin-left: 40px;
    }


    #search_doctor_table { /* 의료진 검색 '테이블' */
        width: 100%;
    }

    #search_doctor_table td { /* 의료진 검색 '테이블'의 각 셀들 */
        border: 1px solid rgb(201, 193, 193);
    }

    .left_cell { /* 의료진 검색 테이블의 왼쪽 셀 */
        width: 250px; 
        padding-left: 40px; 
        background-color: rgb(235, 233, 233);
    }

    .right_cell_1 { /* 의료진 검색 테이블의 오른쪽 셀 첫 2개 */
        padding-left: 20px; 
        padding-top:  10px;
        padding-bottom: 10px;
    }

    .right_cell_2 { /* 의료진 검색 테이블의 오른쪽 셀 마지막 1개 */
        padding-left: 20px; 
        padding-top:  15px;
        padding-bottom: 5px;
    }



    .search_doctor_result { /* '의료진 검색 결과' 텍스트 */
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



        <div id="title_msg">의료진 계정 관리</div>

        <br><br><br>


            <div id="search_doctor">의료진 검색</div>
            <br>

            <table id="search_doctor_table">
                <tr>
                    <form action="#" method="">
                        <td class="left_cell">이름</td>
                        <td class="right_cell_1">
                            <input type="text" name="이름" size="15">  &nbsp;
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>    
                    </form>
                </tr>

                <tr>
                    <form action="#" method="">
                        <td class="left_cell">사번</td>
                        <td class="right_cell_1">
                            <input type="text" name="사번" size="15">  &nbsp;
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>
                    </form>
                </tr>

                <tr>
                    <form action="#" method="">
                        <td class="left_cell">진료과</td>
                        <td class="right_cell_2">
                            <input type="radio" name="search_dept" value="전체" id="label_all"><label for="label_all">&nbsp전체&nbsp&nbsp</label>
                            <input type="radio" name="search_dept" value="외과" id="label_surgery"><label for="label_surgery">&nbsp외과&nbsp&nbsp</label>
                            <input type="radio" name="search_dept" value="내과" id="label_medicine"><label for="label_medicine">&nbsp내과&nbsp&nbsp</label>
                            <input type="radio" name="search_dept" value="치과" id="label_dentisty"><label for="label_dentisty">&nbsp치과&nbsp&nbsp</label>
                            <input type="radio" name="search_dept" value="안과" id="label_eye"><label for="label_eye">&nbsp안과&nbsp&nbsp</label>
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>
                    </form>
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
        <% } %>    
        --%> 


        <br><br>
        <!-- case1. 의료진 검색 결과가 없는 경우  -->
        <div class="search_doctor_result">의료진 검색 결과</div> <br>


            <table class="table table-striped">
                <tr>
                    <th></th>
                    <th>사번</th>
                    <th>이름</th>
                    <th>주민등록번호</th>
                    <th>진료과</th>
                    <th>면허번호</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>입사일</th>
                    <th></th>
                </tr>

                <tr>
                    <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                </tr>
            </table>

            <div class="del_add_btn"><button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button></div>


        <br><br>

        <!-- case2. 의료진 검색 결과가 있는 경우 -->
        <div class="search_doctor_result">의료진 검색 결과</div> <br>


            <table class="table table-striped">
                <tr>
                    <th></th>
                    <th>사번</th>
                    <th>이름</th>
                    <th>주민등록번호</th>
                    <th>진료과</th>
                    <th>면허번호</th>
                    <th>전화번호</th>
                    <th>주소</th>
                    <th>입사일</th>
                    <th></th>
                </tr>

                <tr>
                    <td><input type="checkbox" name="delete"></td>
                    <td>105000</td>
                    <td>가가가</td>
                    <td>700624-1248547</td>
                    <td>외과</td>
                    <td>12345</td>
                    <td>010-1111-1111</td>
                    <td>서울시 강동구 강동대로 53길 76 (성내동)</td>
                    <td>20100310</td>
                    <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_modal">수정</button></td>
                </tr>

                <tr>
                    <td><input type="checkbox" name="delete"></td>
                    <td>106000</td>
                    <td>나나나</td>
                    <td>641007-2468217</td>
                    <td>내과</td>
                    <td>64333</td>
                    <td>010-2222-2222</td>
                    <td>서울특별시 강동구 양재대로 1571</td>
                    <td>20150111</td>
                    <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_modal">수정</button></td>
                </tr>

                <tr>
                    <td><input type="checkbox" name="delete"></td>
                    <td>107000</td>
                    <td>다다다</td>
                    <td>810607-1554264</td>
                    <td>치과</td>
                    <td>24811</td>
                    <td>010-3333-3333</td>
                    <td>서울특별시 강동구 구천면로34길 52</td>
                    <td>20030220</td>
                    <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_modal">수정</button></td>
                </tr>

                <tr>
                    <td><input type="checkbox" name="delete"></td>
                    <td>108000</td>
                    <td>라라라</td>
                    <td>840401-2347756</td>
                    <td>안과</td>
                    <td>30012</td>
                    <td>010-4444-4444</td>
                    <td>서울특별시 강동구 구천면로 452</td>
                    <td>20000717</td>
                    <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_modal">수정</button></td>
                </tr>

            </table>

            <div class="del_add_btn">
                <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
            </div>








    </div>
</div>
</section>

<!-- section end -->



<!-- 삭제용 modal start -->

    <!-- The Modal -->
    <div class="modal" id="delete_modal">
        <div class="modal-dialog">
        <div class="modal-content">
    
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">의료진 계정 삭제</h4>
            </div>
    
            <!-- Modal body -->
            <div class="modal-body">
                <form action="#" method="">
                    <h6>사번 '105680', 이름 '가가가' 계정을 정말 삭제하시겠습니까? </h6> <br>
                    <div style="text-align: right;">
                        <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                        <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
    
        </div>
        </div>
    </div>

<!-- 삭제용 modal end -->




<!-- 추가용 modal start -->
    <!-- 회원 테이블, 의료진 테이블, 근무 일정 테이블 순서대로 insert해야 한다. -->

        <!-- The Modal -->
        <div class="modal" id="add_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">의료진 계정 추가</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_update_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 사번</th>
                                    <td><input type="number" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 주민등록번호</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 면허번호</th>
                                    <td><input type="number" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 진료과</th>
                                    <td>
                                        <input type="radio" class="select_dept" name="dept" value="외과" checked>&nbsp외과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="내과">&nbsp내과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="치과">&nbsp치과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="안과">&nbsp안과
                                        
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th><span class="star">*</span> 아이디</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비밀번호</th>
                                    <td><input type="password" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비밀번호 확인</th>
                                    <td><input type="password" class="form-control" placeholder=""  required></td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th>&nbsp;&nbsp;전화번호</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value=""></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;주소</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value=""></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;이메일</th>
                                    <td><input type="email" class="form-control" placeholder="" name="" value=""></td>
                                </tr>


                            </table>
                        </div>

                        <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-success">추가</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>

<!-- 추가용 modal end -->





<!-- 수정용 modal start -->

        <!-- The Modal -->
        <div class="modal" id="update_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">의료진 계정 수정</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_update_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 사번</th>
                                    <td><input type="number" class="form-control" placeholder="" name="" value="105000" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="가가가" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 주민등록번호</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="700624-1248547" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 면허번호</th>
                                    <td><input type="number" class="form-control" placeholder="" name="" value="12345" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 진료과</th>
                                    <td>
                                        <input type="radio" class="select_dept" name="dept" value="외과" checked>&nbsp외과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="내과">&nbsp내과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="치과">&nbsp치과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="안과">&nbsp안과
                                    </td>
                                </tr>


                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th><span class="star">*</span> 아이디</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="lottt3" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비밀번호</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="va123" required></td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th>&nbsp;&nbsp;전화번호</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="010-1111-1111"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;주소</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="서울시 강동구 강동대로 53길 76 (성내동)"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;이메일</th>
                                    <td><input type="email" class="form-control" placeholder="" name="" value="abc123@naver.com"></td>
                                </tr>


                            </table>
                        </div>

                        <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-success">추가</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>


<!-- 수정용 modal end -->



<!-- footer start -->
<%@ include file = "/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>