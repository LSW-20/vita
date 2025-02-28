<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.doctor.model.vo.Doctor" %>
<%@ page import="com.br.vita.reservation.model.vo.Consultation" %>
<%@ page import="com.br.vita.member.model.vo.Member" %>

<%@ page import="com.br.vita.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
List<Doctor> list = (List<Doctor>) request.getAttribute("list"); 
PageInfo pi = (PageInfo)request.getAttribute("pi");
%>    

<% List<Map<String, Object>> resultList = (List<Map<String, Object>>) request.getAttribute("resultList"); %>


<% Boolean threeType = (Boolean) request.getAttribute("threeType"); %>

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

footer {
    margin-top: 1500px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
    height: 100%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}



/* 여기부터 */
            
#title_msg { /* '예약관리 - 진료' 텍스트 */
    border-bottom: 10px solid silver;

    font-size: 40px;
    font-weight: 900;
    padding-left: 100px;
    padding-bottom: 30px;
}


#search_table { /* 검색창 '테이블' */
    margin-left: 40px;
    font-size: 18px;
}

.search_result_table th, .search_result_table td { /* 검색 결과 '테이블'의 각 셀들 */
    text-align: center;
}

.left_cell { /* 검색 테이블의 왼쪽 셀 */
    width: 70px;
    height: 50px;
}





.search_result { /* '검색 결과' 텍스트 */
    font-size: 20px;
    font-weight:600;
    margin-left: 40px;
}

.add_btn { /* 추가 버튼 가운데 정렬 */
    text-align: center;
}



.add_modal_table th { /* 추가용 modal의 테이블 왼쪽셀 */
    padding-right: 40px;
    height: 40px;           
    display: flex;
    align-items: center;
}
.add_modal_table td { /* 추가용 modal의 테이블 오른쪽셀 */
    height: 40px;

}
.add_modal_table input:not(.noselect) { /* 추가용 modal의 테이블 오른쪽셀의 input */
    width: 220px;
    height: 30px;
}

.star { /* 추가용 modal의 '*'를 빨간색으로 */
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

        <div id="title_msg">예약 관리 - 진료</div>

        <br><br><br>


        <br>
        <form action="<%= contextPath %>/searchCA.admin" method="get">
            <table id="search_table">
                <tr>
                    <td class="left_cell">진료과</td>
                    <td class="right_cell">
                        <select name="dept_name" required onchange="selectDept();" id="deptSelect">
                            <option disabled selected>선택(필수)</option>
                            <option>외과</option>
                            <option>내과</option>
                            <option>치과</option>
                            <option>안과</option>
                        </select>
                    </td>
                </tr>


                <!--  ajax 사용 전
                <tr>
                    <td class="left_cell">의료진</td>
                    <td>
                        <select name="doc_name" required>
                            <% if( list != null && !list.isEmpty() ) {
                                for(int i=0; i<list.size(); i++) { %>
                                    <option>
                                        <%= list.get(i).getDoctorName() %>(<%= list.get(i).getDeptName() %>)
                                    </option>    
                            <%  }
                            } %>    
                        </select>
                    </td>
                </tr>
                -->


                <%-- ajax 사용 후 --%>
                <tr>
                    <td class="left_cell">의료진</td>
                    <td>
                        <select name="doc_name" id="target_doctor" required >
       
                        </select>
                    </td>
                </tr>
                

                <tr>
                    <td class="left_cell">날짜</td>
                    <td class="right_cell">
                        
                            <input type="date" name="app_date1" required> 부터 &nbsp; &nbsp; 
                            <input type="date" name="app_date2" required id="end_date"> 까지 &nbsp; &nbsp;  
                            <button type="submit">검색</button>
                        
                    </td>
                </tr>
            </table>
        </form>
        <br><br><br>


        <script>

            function selectDept() {
            
                // ajax로 진료과를 보내서 db에서 진료과에 해당하는 의사들 리스트를 가져온다.
                $.ajax({
                    url: '<%= request.getContextPath() %>/searchDocByDept.admin',
                    data: {
                        dept: $('#deptSelect').val()
                    },
    
                    success: function(res) { // res에 JSONArray가 온다.
    
                        console.log(res); // ['박시우'] <- 진료과당 의사 1명임    
    
                        let doctorList = '';
                        for(let data of res){
                            doctorList += '<option>' + data + '</option>';
                        }
                        $('#target_doctor').html(doctorList); // html 태그까지 반영시키려면 text대신 html 메소드
    
                    },
                    error: function() {
                        console.log('진료과로 의사 목록 가져오기 통신 실패');
                    }
                })
    
            }
            </script>




    <!-- 진료 예약 조회할 때, 종료일을 오늘날짜로 선택된 채로 보여주기.  -->
    <script>
        window.onload = function() {

            var today = new Date().toISOString().split('T')[0]; 
            // 오늘 날짜를 가져와서, yyyy-mm-ddTHH:MM:SS.sssZ 형식으로 가져오고, 'T'를 기준으로 날짜, 시간을 나눠서 날짜만 가져온다.

            document.getElementById("end_date").value = today;
        };
    </script>
    









        <%-- 검색 이전상태랑 검색했는데 결과가 없는경우를 구분하기 위해 flag 변수 사용한다. --%> 


        <% if (threeType == null) { %>
            <!-- case1. 검색 전  -->
            <div class="search_result">검색 결과</div> 
            <br>
    
                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>진료과</th>
                        <th>의료진</th>
                        <th>예약일</th>
                        <th>예약시간</th>
                        <th>회원번호</th>
                        <th>이름</th>
                        <th>핸드폰번호</th>
                        <th>예약 상태</th>
                        <th></th>
                    </tr>
                </table>
    
                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>    

            <br><br>

        <% } else if (threeType == false) { %>

            <!-- case2. 검색 결과가 없는 경우  -->
            <div class="search_result">검색 결과</div> <br>
    
                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>진료과</th>
                        <th>의료진</th>
                        <th>예약일</th>
                        <th>예약시간</th>
                        <th>회원번호</th>
                        <th>이름</th>
                        <th>핸드폰번호</th>
                        <th>예약 상태</th>
                        <th></th>
                    </tr>
    
                    <tr>
                        <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                </table>
    
                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal">추가</button>
                </div>    
    
            <br><br>

        <% } else if (threeType == true) { %>
         
        <!-- case3. 의료진 검색 결과가 있는 경우 -->
        <div class="search_result">검색 결과</div> <br>

            <table class="table table-striped search_result_table">
                <tr>
                    <th>예약번호</th>
                    <th>진료과</th>
                    <th>의료진</th>
                    <th>예약일</th>
                    <th>예약시간</th>
                    <th>회원번호</th>
                    <th>이름</th>
                    <th>핸드폰번호</th>
                    <th>예약 상태</th>
                    <th></th>
                </tr>

                <% if(resultList != null && !resultList.isEmpty() ) {
                    for(int i=0; i<resultList.size(); i++) { 
                
                        Consultation c = (Consultation) resultList.get(i).get("c");
                        Member m = (Member) resultList.get(i).get("m");
                        Doctor d = (Doctor) resultList.get(i).get("d");     %>

                       

                        <tr>
                            <td><%= c.getAppointmentNo() %></td>
                            <td><%= d.getDeptName() %></td>
                            <td><%= d.getDoctorName() %></td>
                            <td><%= c.getAppointmentDate() %></td>
                            <td><%= c.getAppointmentTime() %></td>
                            <td><%= m.getUserNo() %></td>
                            <td><%= m.getUserName() %></td>
                            <td><%= m.getPhone() %></td>
                            <td><%= c.getCareStatus() %></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-danger del_button" data-date="<%= c.getAppointmentDate() %>" 
                                        data-name="<%= m.getUserName() %>" data-care-no="<%= c.getAppointmentNo() %>">삭제</button>
                            </td>


                        </tr>
                    <% }  
                } %>
            </table>

            <br>
            <% if(pi != null) { %>
            <ul class="pagination d-flex justify-content-center text-dark">
       
                <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : "" %>'>
                    <a class="page-link" href='<%= contextPath %>/searchCA.admin?page=<%=pi.getCurrentPage()-1%>&dept_name=<%= request.getParameter("dept_name") %>&doc_name=<%= request.getParameter("doc_name") %>&app_date1=<%= request.getParameter("app_date1") %>&app_date2=<%= request.getParameter("app_date2") %>'> Previous</a>
                  </li>

                <% for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                    <li class='page-item <%= p == pi.getCurrentPage() ? "active" : ""%>'>
                      <a class="page-link" href='<%= contextPath %>/searchCA.admin?page=<%= p %>&dept_name=<%= request.getParameter("dept_name") %>&doc_name=<%= request.getParameter("doc_name") %>&app_date1=<%= request.getParameter("app_date1") %>&app_date2=<%= request.getParameter("app_date2") %>'> <%= p %></a>
                    </li>
                <% } %>

                <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
                    <a class="page-link" href='<%= contextPath %>/searchCA.admin?page=<%= pi.getCurrentPage()+1 %>&dept_name=<%= request.getParameter("dept_name") %>&doc_name=<%= request.getParameter("doc_name") %>&app_date1=<%= request.getParameter("app_date1") %>&app_date2=<%= request.getParameter("app_date2") %>'>Next</a>
                  </li>
            </ul>
            <% } %>


            <div class="add_btn">
                <button type="button" class="btn btn-sm btn-dark" id="add_button" data-toggle="modal" data-target="#add_modal">추가</button>
            </div>   
        <br>
        <% } %>


    </div>
</div>
</section>

<!-- section end -->




<!-- 진료예약 '삭제' 기능 (이번엔 get방식 = location.href이 아닌 post 방식 = 외부 form으로 해보기)-->
<script>

    $(document).ready(function() {

        // del_button 클래스를 가진 모든 버튼에 대해 이벤트 리스너를 추가
        $('.del_button').on('click', function() {
            var date = this.getAttribute('data-date');
            var name = this.getAttribute('data-name');
            var careNo = this.getAttribute('data-care-no');

            if (confirm(name + '님의 ' + date + ' 날짜의 진료 예약을 정말 삭제하시겠습니까?')) {
                $('#hidden_data').val(careNo);
                $('#del_form').submit();
            }
        });

    });

</script>

<!-- get이 아닌 post방식으로 삭제 해보기 -->
<form action="<%= contextPath %>/deleteCA.admin" method="post" id="del_form">
    <input type="hidden" name="care_no" id="hidden_data">
</form>








<!-- 진료 예약 추가용 modal start -->

<!-- The Modal -->
<div class="modal" id="add_modal">
    <div class="modal-dialog">
    <div class="modal-content">

<!-- Modal Header -->
<div class="modal-header">
    <h4 class="modal-title">진료 예약 추가</h4>
</div>

<!-- Modal body -->
<div class="modal-body">
    <form action="<%= contextPath %>/addCA.admin" method="post">
        

        <div style="display: flex; justify-content: center;">
            <table class="add_modal_table">
                <tr>
                    <th><span class="star">*</span> 의료진</th>
                    <td>
                        <select name="doc_and_dept_name" required> 
                            <% if( list != null && !list.isEmpty() ) {
                                for(int i=0; i<list.size(); i++) { %>
                                    <option>
                                        <%= list.get(i).getDoctorName() %>(<%= list.get(i).getDeptName() %>)
                                    </option>    
                            <%  }
                            } %>    
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>예약일</th>
                    <td><input type="text" class="form-control" value="당일 예약만 가능" readonly required></td>
                </tr>
                <tr>
                    <th><span class="star">*</span> 예약시간</th>
                    <td>
                            <input type="radio" name="reservation_time" value="오전" class="noselect" checked required>&nbsp; 오전&nbsp;&nbsp;
                            <input type="radio" name="reservation_time" value="오후" class="noselect">&nbsp; 오후
                    </td>
                </tr>


                <tr>
                    <td colspan="2" style="height: 20px;"></td>
                </tr>

                <tr>
                    <th><span class="star">*</span> 이름</th>
                    <td><input type="text" class="form-control" name="name" required></td>
                </tr>
                <tr>
                    <th><span class="star">*</span> 주민등록번호</th>
                    <td><input type="text" class="form-control" placeholder="'-'를 포함하여 최대 14자" name="ssn" required maxlength="14"></td>
                </tr>
                <tr>
                    <th><span class="star">*</span> 핸드폰 번호</th>
                    <td><input type="text" class="form-control" placeholder="'-'을 포함해서 최대 13자" name="phone" maxlength="13" required></td>
                </tr>

                <tr>
                    <td colspan="2" style="height: 20px;"></td>
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
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->

</body>
</html>