<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%@ page import="com.br.vita.doctor.model.vo.Doctor" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
%>    
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
                    <form action="<%= contextPath %>/searchDocByName.admin" method="get">
                        <td class="left_cell">이름</td>
                        <td class="right_cell_1">
                            <input type="text" name="doctor_name" size="15">  &nbsp;
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>    
                    </form>
                </tr>

                <tr>
                    <form action="<%= contextPath %>/searchDocByDNO.admin" method="get">
                        <td class="left_cell">사번</td>
                        <td class="right_cell_1">
                            <input type="text" name="doctor_no" size="15">  &nbsp;
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>
                    </form>
                </tr>

                <tr>
                    <form action="<%= contextPath %>/searchDocByDept.admin" method="get">
                        <td class="left_cell">진료과</td>
                        <td class="right_cell_2">
                            <input type="radio" name="dept" value="전체" id="label_all"><label for="label_all">&nbsp전체&nbsp&nbsp</label>
                            <input type="radio" name="dept" value="외과" id="label_surgery"><label for="label_surgery">&nbsp외과&nbsp&nbsp</label>
                            <input type="radio" name="dept" value="내과" id="label_medicine"><label for="label_medicine">&nbsp내과&nbsp&nbsp</label>
                            <input type="radio" name="dept" value="치과" id="label_dentisty"><label for="label_dentisty">&nbsp치과&nbsp&nbsp</label>
                            <input type="radio" name="dept" value="안과" id="label_eye"><label for="label_eye">&nbsp안과&nbsp&nbsp</label>
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>
                    </form>
                </tr>
            </table>

            <br>

               
       


        <br><br>

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

                <% if(list.isEmpty()) { %>
                    <!-- case1. 의료진 검색 결과가 없는 경우  -->
                    <tr>
                        <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>

                <% } else { %>
                    <!-- case2. 의료진 검색 결과가 있는 경우 -->

                    <% 
                    for(Map<String, Object> docMap : list) { 

                        Doctor d = (Doctor)docMap.get("doctor");
                        Member m = (Member)docMap.get("member");

                    %>

                    <tr>
                        <td><input type="checkbox" name="delete"></td>
                        <td><%= d.getDoctorNo() %></td>
                        <td><%= d.getDoctorName() %></td>
                        <td><%= m.getUserSSN() %></td>
                        <td><%= d.getDeptName() %></td>
                        <td><%= d.getLicenceNo() %></td>
                        <td><%= m.getPhone() %></td>
                        <td><%= m.getAddress() %></td>
                        <td><%= d.getHireDate() %></td>
                        <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_modal">수정</button></td>
                    </tr>

                    <% } %>

                <% } %>    

            </table>


            <% if(list.isEmpty()) { %>
                <div class="del_add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>
            <% } else { %>
                <div class="del_add_btn">
                    <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>
            <% } %>


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
                    <form action="<%= contextPath %>/addD.admin" method="post">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_update_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" name="doctor_name" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 주민등록번호</th>
                                    <td><input type="text" class="form-control" placeholder="-를 포함하여 최대 14자리" maxlength="14" name="doctor_ssn" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 면허번호</th>
                                    <td><input type="number" class="form-control" name="licence_no" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 진료과</th>
                                    <td>
                                        <input type="radio" class="select_dept" name="dept" value="외과">&nbsp외과&nbsp&nbsp
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
                                    <td><input type="text" class="form-control" name="doctor_id" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비밀번호</th>
                                    <td><input type="password" class="form-control" name="doctor_pass1" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비밀번호 확인</th>
                                    <td><input type="password" class="form-control" name="doctor_pass2" required></td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th>&nbsp;&nbsp;전화번호</th>
                                    <td><input type="text" class="form-control" placeholder="'-'를 포함하여 최대 13자리" maxlength="13" name="doctor_phone"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;주소</th>
                                    <td><input type="text" class="form-control" name="doctor_address"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;이메일</th>
                                    <td><input type="email" class="form-control" placeholder="'@'를 포함하여 입력" name="doctor_email"></td>
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
                    <form action="<%= contextPath %>/updateD.admin" method="post">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_update_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" name="doctor_name" value="가가가" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 주민등록번호</th>
                                    <td><input type="text" class="form-control" maxlength="14" name="doctor_ssn" value="700624-1248547" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 면허번호</th>
                                    <td><input type="number" class="form-control" name="licence_no" value="12345" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 진료과</th>
                                    <td>
                                        <input type="radio" class="select_dept" name="dept" value="외과">&nbsp외과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="내과">&nbsp내과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="치과">&nbsp치과&nbsp&nbsp
                                        <input type="radio" class="select_dept" name="dept" value="안과">&nbsp안과
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>

                                <tr>
                                    <th>&nbsp;&nbsp;전화번호</th>
                                    <td><input type="text" class="form-control" maxlength="13" name="doctor_phone" value="010-1111-1111"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;주소</th>
                                    <td><input type="text" class="form-control" name="doctor_address" value="서울시 강동구 강동대로 53길 76 (성내동)"></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;&nbsp;이메일</th>
                                    <td><input type="email" class="form-control" name="doctor_email" value="abc123@naver.com"></td>
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