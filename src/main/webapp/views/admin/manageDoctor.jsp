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



    .add_modal_table th { /* 추가 modal의 테이블 왼쪽셀 */
        padding-right: 40px;
        height: 40px;
    }
    .add_modal_table td { /* 추가 modal의 테이블 오른쪽셀 */
        height: 40px;
        
    }
    .add_modal_table input:not(.select_dept) { /* 추가 modal의 테이블 오른쪽셀의 input */
        width: 220px;
    }
    .star { /* 추가 modal의 '*'를 빨간색으로 */
        color: red;
    }


    /* 의료진 검색 결과 테이블과 셀들 */
    .aa { 
        width: 100%;
    }
    .aa td, .aa th{
        height: 40px;
        text-align: center;
    }
    .aa td:not(.nono), .aa th:not(.nono){
        border: 1px solid silver;
    }
    .aa th:not(.update_table th) {
        background-color: rgb(196, 239, 245);
    }
    .aa td {
        background-color: rgb(253, 247, 239);
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


            <table class="aa">
                <tr>
                    <th><button class="btn btn-sm btn-warning" type="button" id="all_btn">전체</button></th>
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
                            <td><input type="checkbox" id="<%= m.getUserSSN() %>"></td>
                            <td><%= d.getDoctorNo() %></td>
                            <td><%= d.getDoctorName() %></td>
                            <td><%= m.getUserSSN() %></td>
                            <td><%= d.getDeptName() %></td>
                            <td><%= d.getLicenceNo() %></td>
                            <td><%= m.getPhone() %></td>
                            <td><%= m.getAddress() %></td>
                            <td><%= d.getHireDate() %></td>
                            <td><button type="button" class="btn btn-sm btn-primary" data-toggle="collapse" data-target="#modify<%= d.getDoctorNo() %>">수정</button></td>
                        </tr>
                        
                        <tr class="collapse" id="modify<%= d.getDoctorNo() %>">
                            <td colspan="10">
                                <form action="<%= contextPath %>/updateD.admin" method="post">
                                    <input type="hidden" name="uq_licence_no" value="<%= d.getLicenceNo() %>"> <%-- doctor 업데이트 조건 --%>
                                    <input type="hidden" name="uq_doctor_ssn" value="<%= m.getUserSSN() %>"> <%-- member 업데이트 조건 --%>

                                    <div style="display: flex; justify-content: center;">
                                        <table class="update_table">
                                            <tr>
                                                <td class="nono" colspan="2" style="height: 20px;"></td>
                                            </tr>

                                            <tr>
                                                <th class="nono"><span class="star">*</span> 이름</th>
                                                <td class="nono"><input type="text" class="form-control" name="doctor_name" value="<%= d.getDoctorName() %>" required></td>
                                            </tr>
                                            <tr>
                                                <th class="nono"><span class="star">*</span> 주민등록번호</th>
                                                <td class="nono"><input type="text" class="form-control" maxlength="14" name="doctor_ssn" value="<%= m.getUserSSN() %>" required></td>
                                            </tr>
                                            <tr>
                                                <th class="nono"><span class="star">*</span> 면허번호</th>
                                                <td class="nono"><input type="number" class="form-control" name="licence_no" value="<%= d.getLicenceNo() %>" required></td>
                                            </tr>
                                            <tr>
                                                <th class="nono"><span class="star">*</span> 진료과</th>
                                                <td class="nono">
                                                    <input type="radio" class="select_dept" name="dept" value="외과" <%= "외과".equals(d.getDeptName()) ? "checked" : "" %>>&nbsp외과&nbsp&nbsp
                                                    <input type="radio" class="select_dept" name="dept" value="내과" <%= "내과".equals(d.getDeptName()) ? "checked" : "" %>>&nbsp내과&nbsp&nbsp
                                                    <input type="radio" class="select_dept" name="dept" value="치과" <%= "치과".equals(d.getDeptName()) ? "checked" : "" %>>&nbsp치과&nbsp&nbsp
                                                    <input type="radio" class="select_dept" name="dept" value="안과" <%= "안과".equals(d.getDeptName()) ? "checked" : "" %>>&nbsp안과
                                                </td>
                                            </tr>
            
                                            <tr>
                                                <td class="nono" colspan="2" style="height: 20px;"></td>
                                            </tr>
            
                                            <tr>
                                                <th class="nono">전화번호</th>
                                                <td class="nono"><input type="text" class="form-control" maxlength="13" name="doctor_phone" value="<%= m.getPhone() %>"></td>
                                            </tr>
                                            <tr>
                                                <th class="nono">주소</th>
                                                <td class="nono"><input type="text" class="form-control" name="doctor_address" value="<%= m.getAddress() %>"></td>
                                            </tr>
                                            <tr>
                                                <th class="nono">입사일</th>
                                                <td class="nono"><input type="date" class="form-control" name="hire_date" value="<%= d.getHireDate() %>"></td>
                                            </tr>

                                            <tr>
                                                <td class="nono" colspan="2" style="height: 10px;"></td>
                                            </tr>

                                            <tr>
                                                <td class="nono" colspan="2"><button type="submit" class="btn btn-sm btn-success">수정</button></td> 
                                            </tr>

                                            <tr>
                                                <td class="nono" colspan="2" style="height: 10px;"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </form>
                            </td>
                        </tr>
                    
                    <% } %>

                <% } %>    
            </table>

            <br>
            <% if(list.isEmpty()) { %>
                <div class="del_add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>
            <% } else { %>
                <div class="del_add_btn">
                    <button type="button" class="btn btn-sm btn-danger" id="del_button">삭제</button>
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>
            <% } %>
     

        <script>

            document.getElementById('del_button').addEventListener('click', function() {

                var checkboxEl = document.querySelectorAll('input[type="checkbox"]'); // 체크박스들을 배열로 모음.

                var checked_list = []; // 각 체크박스들의 id 속성값을 담을 배열.

                for(var i = 0; i<checkboxEl.length; i++) {
                    if(checkboxEl[i].checked) {
                        checked_list.push(checkboxEl[i].id);
                    }
                }

                if(confirm('정말 삭제하시겠습니까?')) {
                    var link = "<%= contextPath %>/deleteD.admin" + "?ssn=" + checked_list.join(',');
                    location.href=link;
                }
            
            });    
        </script>
        <!-- (1) 삭제 기능
            form 안에 form이 있으면 안 된다. 이미 수정용 modal이 collapse로 테이블 안에 있다.
            바깥 쪽을 form으로 감싸고 삭제 submit 하면, 안쪽 form의 submit을 했는데 바깥쪽 form 요청이 되어버림.
            수정도 삭제도 modal을 쓰지 않기로 결정. checkbox들의 id를 동적으로 다 다르게 준다.
            삭제 버튼에 이벤트 리스너로 클릭 이벤트를 연결한다. checked된 checkbox 들의 id와 다음 셀들의 값도 가져와서
            배열에 담는다. 팝업창(confirm)에서 확인/취소 받은 다음에 확인의 경우(true) if문 조건으로
            서블릿을 요청한다(location.href).
            서블릿을 요청하면서 checkbox들의 id들을 배열에 담고, join 메소드로 한 문자열로 만들어서 넘긴다. -->


        <!-- (2) 삭제를 위해 전체 선택하는 버튼 -->
        <script>
            document.getElementById('all_btn').addEventListener('click', function() {

                var checkboxEl = document.querySelectorAll('input[type="checkbox"]'); // 체크박스들을 배열로 모음.

                for(var i = 0; i<checkboxEl.length; i++) {
                    if(checkboxEl[i].checked) {  // 모든 동적으로 생성된 체크박스들에 checked 속성 반전
                        checkboxEl[i].checked = false; 
                    } else {
                        checkboxEl[i].checked = true;
                    }   
                }

            });    
        </script> 


    </div>
</div>
</section>

<!-- section end -->








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
                            <table class="add_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" name="doctor_name" value="" required></td>
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
                                    <td><input type="email" class="form-control" name="doctor_email"></td>
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









<!-- footer start -->
<%@ include file = "/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>