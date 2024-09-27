<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.company.model.vo.Company" %>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%@ page import="com.br.vita.employee.model.vo.Employee" %>
<%@ page import="com.br.vita.reservation.model.vo.CheckList" %>
<%@ page import="com.br.vita.reservation.model.vo.HealthCheck" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<Company> companyList = (List<Company>)request.getAttribute("companyList"); %>

<% List<Map<String, Object>> listN = (List<Map<String, Object>>) request.getAttribute("listN"); %>
<% List<Map<String, Object>> listC = (List<Map<String, Object>>) request.getAttribute("listC"); %>


<% Boolean NthreeType = (Boolean) request.getAttribute("NthreeType"); %>
<% Boolean CthreeType = (Boolean) request.getAttribute("CthreeType"); %>

    

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
    margin-top: 2200px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
    height: 160%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}


            
#title_msg { /* '예약관리 - 건강검진' 텍스트 */
    border-bottom: 10px solid silver;

    font-size: 40px;
    font-weight: 900;
    padding-left: 100px;
    padding-bottom: 30px;
}


.select_type { /* '일반건강검진, 기업건강검진 조회하기' 테이블 */
    text-align: center;
}





#search_table { /* 검색창 '테이블' */
    font-size: 18px;
}

.left_cell {
    width: 100px;
    height: 50px;
}
.right_cell {
    width: 200px;
}
.cell2 {
    height: 55px;
}



.search_result_table th, .search_result_table td { /* 검색 결과 '테이블'의 각 셀들 */
    text-align: center;
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
.add_modal_table input:not(.no_select) { /* 추가용 modal의 테이블 오른쪽셀의 input */
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



            <div id="title_msg">예약 관리 - 건강검진</div>

            <br><br><br><br>

            <!-- 일반, 기업 건강검진 조회하는 부분 START -->
            <div style="display: flex; justify-content: center;">
                <table class="select_type" style="width: 90%;">
                        <tr>
                            <td style="width: 45%;">
                                <button type="button" class="btn btn-lg btn-primary"
                                    data-toggle="collapse" data-target="#normalC">일반건강검진 조회하기</button>
                            </td>
                            <td style="width: 10%;"></td>
                            <td style="width: 45%;">
                                <button type="button" class="btn btn-lg btn-danger"
                                    data-toggle="collapse" data-target="#companyC">기업건강검진 조회하기</button>
                            </td>
                        </tr>

                        <tr>
                            <td style="display: flex; justify-content: center; margin-top: 30px;" >
                                <!-- 일반건강검진 -->
                                <form action="<%= contextPath %>/searchCHN.admin" method="get" class="collapse" id="normalC">
                                    <table id="search_table">
                                        <tr>
                                            <th class="left_cell">시작일</th>
                                            <td class="right_cell">
                                                <input type="date" name="start_date" class="reservation_date" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="left_cell">종료일</th>
                                            <td class="right_cell">
                                                <input type="date" name="end_date" class="reservation_date" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="cell2"><button type="submit" class="btn btn-sm btn-success">검색</button></td> 
                                        </tr>
                                    </table>
                                </form>
                            </td>

                            <td></td>

                            <td style="display: flex; justify-content: center; margin-top: 30px;">
                                <!-- 기업건강검진-->
                                <form action="<%= contextPath %>/searchCHC.admin" method="get" class="collapse" id="companyC">
                                    <table id="search_table">
                                        <tr>
                                            <th class="left_cell">기업</th>
                                            <td class="right_cell">
                                                <select name="com" required>
                                                    <% if(companyList != null && !companyList.isEmpty()) {
                                                        for(int i=0; i<companyList.size(); i++) { %>
                                                            <option><%= companyList.get(i).getCompName() %></option>     
                                                    <% }
                                                    } %>
                                                </select>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th class="left_cell">시작일</th>
                                            <td  class="right_cell">
                                                <input type="date" name="start_date" class="reservation_date" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="left_cell">종료일</th>
                                            <td  class="right_cell">
                                                <input type="date" name="end_date" class="reservation_date" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="cell2"><button type="submit" class="btn btn-sm btn-success">검색</button></td> 
                                        </tr>
                                    </table>
                                </form>
                            </td>
                        </tr>
                </table>
            </div>
            <!-- 일반, 기업 건강검진 조회하는 부분 END -->
            

            <br>







            <%-- 조건처리. 검색 이전상태랑 검색했는데 결과가 없는경우를 구분하기 위해 flag 변수 사용한다. --%>

            <% if (NthreeType == null) { %>
                <%-- 일반 건강검진 예약 검색 이전 상태 (아무것도 없음) --%>


            <% } else if (NthreeType == false) { %>
                <%-- 일반 건강검진 예약을 검색했지만 결과가 없는 경우 --%>

                <div class="search_result">일반건강검진 검색 결과</div> <br>

                    <table class="table table-striped search_result_table">
                        <tr>
                            <th>예약번호</th>
                            <th>검진일</th>
                            <th>예약시간</th>
                            <th>검진비용</th>

                            <th>회원아이디</th>
                            <th>이름</th>

                            <th>복용중인 약</th>
                            <th>최근 수술 여부</th>
                            <th>수술명</th>
                            <th>비행예정</th>
                            <th></th>
                        </tr>

                        <tr>
                            <td colspan="11" style="text-align: center;">검색 결과가 없습니다.</td>
                        </tr>
                    </table>

                    <div class="add_btn">
                        <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_noraml">추가</button>
                    </div>    

            <% } else if (NthreeType == true) { %>
                <%-- 일반 건강검진 예약을 검색했는데 결과가 있는 경우 --%>

                <div class="search_result">일반건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>검진일</th>
                        <th>예약시간</th>
                        <th>검진비용</th>

                        <th>회원아이디</th>
                        <th>이름</th>

                        <th>복용중인 약</th>
                        <th>최근 수술 여부</th>
                        <th>수술명</th>
                        <th>비행예정</th>
                        <th></th>
                    </tr>

                    <% if(listN != null && !listN.isEmpty() ) {
                        for(int i=0; i<listN.size(); i++) { 
                    
                            HealthCheck h = (HealthCheck) listN.get(i).get("h");
                            Member m = (Member) listN.get(i).get("m");
                            CheckList c = (CheckList) listN.get(i).get("c");     %>

                    <tr>
                        <td><%= h.getAppointmentNo() %></td>
                        <td><%= h.getCheckUpDate() %></td>
                        <td><%= h.getAppointmentTime() %></td>
                        <td><%= h.getTotalPrice() %>원</td>

                        <td><%= m.getUserId() %></td>
                        <td><%= m.getUserName() %></td>

                        <td><%= c.getMediList() %></td>
                        <td><%= c.getSurgeryYN() %></td>
                        <td><%= c.getSurgeryName() %></td>
                        <td><%= c.getFlyYN() %></td>
                        <td>
                            <button type="button" class="btn btn-sm btn-danger del_button" data-app-no="<%= h.getAppointmentNo() %>"
                                data-date="<%= h.getCheckUpDate() %>" data-name="<%= m.getUserName() %>" data-type="일반">삭제</button>
                        </td>
                    </tr>

                        <% }  
                    } %>
                </table>

                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_noraml">추가</button>
                </div>   
        
            <% } %>




            <!-- 일반건강검진, 기업건강검진 '삭제' 기능 (get방식 = location.href이 아닌 post 방식 = 외부 form으로 해보기)-->
            <script>

                $(document).ready(function() {

                    // del_button 클래스를 가진 모든 버튼에 대해 이벤트 리스너를 추가
                    $('.del_button').on('click', function() {
                        var date = this.getAttribute('data-date');
                        var name = this.getAttribute('data-name');
                        var appNo = this.getAttribute('data-app-no');
                        var type = this.getAttribute('data-type');
                        var com = this.getAttribute('data-com');
                        if(com == null) {
                            com = ''; // com이 없으면 빈문자열
                        } else {
                            com += ' '; // com이 있으면 뒤에 한칸 띄기
                        }
                        

                        if (confirm(com + name + '님의 ' + date + ' 날짜의 ' + type + '건강검진 예약을 정말 삭제하시겠습니까?')) {
                            $('#hidden_data').val(appNo);
                            $('#del_form_n').submit();
                        }
                    });

                });

            </script>

            <!-- get이 아닌 post방식으로 삭제 해보기 -->
            <form action="<%= contextPath %>/deleteCH.admin" method="post" id="del_form_n">
                <input type="hidden" name="app_no" id="hidden_data">
            </form>








            <% if (CthreeType == null) { %>
                <%-- 기업 건강검진 예약 검색 이전 상태 (아무것도 없음) --%>


            <% } else if (CthreeType == false) { %>
                <%-- 기업 건강검진 예약을 검색했지만 결과가 없는 경우 --%>

                <div class="search_result">기업건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>검진일</th>
                        <th>예약시간</th>
                        <th>검진비용</th>

                        <th>기업명</th>
                        <th>사번</th>
                        <th>이름</th>

                        <th>복용중인 약</th>
                        <th>최근 수술 여부</th>
                        <th>수술명</th>
                        <th>비행예정</th>
                        <th></th>
                    </tr>

                    <tr>
                        <td colspan="12" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                </table>

                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_company">추가</button>
                </div>    


            <% } else if (CthreeType == true) { %>
                <%-- 기업 건강검진 예약을 검색했는데 결과가 있는 경우 --%>

                <div class="search_result">기업건강검진 검색 결과</div> <br>

                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>검진일</th>
                        <th>예약시간</th>
                        <th>검진비용</th>

                        <th>기업명</th>
                        <th>사번</th>
                        <th>이름</th>

                        <th>복용중인 약</th>
                        <th>최근 수술 여부</th>
                        <th>수술명</th>
                        <th>비행예정</th>
                        <th></th>
                    </tr>

                    
                    <% if(listC != null && !listC.isEmpty() ) {
                        for(int i=0; i<listC.size(); i++) { 
                    
                            HealthCheck h = (HealthCheck) listC.get(i).get("h");
                            Employee e = (Employee) listC.get(i).get("e");
                            CheckList c = (CheckList) listC.get(i).get("c");
                            String com = (String) listC.get(i).get("com");     %>

                        <tr>
                            <td><%= h.getAppointmentNo() %></td>
                            <td><%= h.getCheckUpDate() %></td>
                            <td><%= h.getAppointmentTime() %></td>
                            <td><%= h.getTotalPrice() %>원</td>

                            <td><%= com %></td>
                            <td><%= e.getEmpNo() %></td>
                            <td><%= e.getEmpName() %></td>

                            <td><%= c.getMediList() %></td>
                            <td><%= c.getSurgeryYN() %></td>
                            <td><%= c.getSurgeryName() %></td>
                            <td><%= c.getFlyYN() %></td>
                            <td>
                                <button type="button" class="btn btn-sm btn-danger del_button" 
                                data-app-no="<%= h.getAppointmentNo() %>" data-date="<%= h.getCheckUpDate() %>" 
                                data-name="<%= e.getEmpName() %>" data-type="기업" data-com="<%= com %>">삭제</button>
                            </td>
                        </tr>

                        <% }  
                    } %>
                </table>

                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_company">추가</button>
                </div>   
            <% } %>



 

        </div>
    </div>
    </section>
   
    <!-- section end -->








    <!-- '일반건강검진' 추가용 modal start -->

            <!-- The Modal -->
            <div class="modal" id="add_modal_noraml">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">일반건강검진 예약 추가</h4>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%= contextPath %>/addCHN.admin" method="post">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 예약일</th>
                                        <td><input type="date" class="form-control reservation_date" name="date" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 예약시간</th>
                                        <td>
                                                <input type="radio" name="time" value="오전" class="no_select" checked>&nbsp; 오전&nbsp;&nbsp;
                                                <input type="radio" name="time" value="오후" class="no_select">&nbsp; 오후
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 검진비용</th>
                                        <td><input type="number" class="form-control" placeholder="숫자만 입력" name="price" required></td>
                                    </tr>

                                    
                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>


                                    <tr>
                                        <th><span class="star">*</span> 회원ID</th>
                                        <td><input type="text" class="form-control" placeholder="이미 존재하는 회원이어야 합니다." name="user_id" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 이름</th>
                                        <td><input type="text" class="form-control" placeholder="이미 존재하는 회원이어야 합니다." name="user_name" required></td>
                                    </tr>


                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>


                                    <tr>
                                        <th> 복용중인 약</th>
                                        <td><input type="text" class="form-control" name="medilist"></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 최근 수술 여부</th>
                                        <td>
                                            <input type="radio" name="surgery_yn" value="Y" class="no_select" checked>&nbsp; 있음&nbsp;&nbsp;
                                            <input type="radio" name="surgery_yn" value="N" class="no_select">&nbsp; 없음
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 수술명</th>
                                        <td><input type="text" class="form-control" name="surgery_name"></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 비행 예정</th>
                                        <td>
                                            <input type="radio" name="flight_yn" value="Y" class="no_select" checked>&nbsp; 있음&nbsp;&nbsp;
                                            <input type="radio" name="flight_yn" value="N" class="no_select">&nbsp; 없음
                                        </td>
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

    <!-- '일반건강검진' 추가용 modal end -->



    <!-- '기업건강검진' 추가용 modal start -->

        <!-- The Modal -->
        <div class="modal" id="add_modal_company">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">기업건강검진 예약 추가</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="<%= contextPath %>/addCHC.admin" method="post">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 예약일</th>
                                    <td><input type="date" class="form-control reservation_date" name="date" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 예약시간</th>
                                    <td>
                                            <input type="radio" name="time" value="오전" class="no_select" checked>&nbsp; 오전&nbsp;&nbsp;
                                            <input type="radio" name="time" value="오후" class="no_select">&nbsp; 오후
                                    </td>
                                </tr>

                                <tr>
                                    <th><span class="star">*</span> 검진비용</th>
                                    <td><input type="number" class="form-control" placeholder="숫자만 입력" name="price" required></td>
                                </tr>

                                
                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>


                                <tr>
                                    <th><span class="star">*</span> 기업명</th>
                                    <td>
                                        <select name="com" required>
                                            <% if(companyList != null && !companyList.isEmpty()) {
                                                for(int i=0; i<companyList.size(); i++) { %>
                                                    <option><%= companyList.get(i).getCompName() %></option>     
                                            <% }
                                            } %>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" placeholder="이미 존재하는 회원이어야 합니다." name="name" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 주민등록번호</th>
                                    <td><input type="text" class="form-control" placeholder="'-'를 포함하여 최대 14자" name="ssn" required maxlength="14"></td>
                                </tr>



                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>


                                <tr>
                                    <th> 복용중인 약</th>
                                    <td><input type="text" class="form-control" name="medilist"></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 최근 수술 여부</th>
                                    <td>
                                        <input type="radio" name="surgery_yn" value="Y" class="no_select" checked>&nbsp; 있음&nbsp;&nbsp;
                                        <input type="radio" name="surgery_yn" value="N" class="no_select">&nbsp; 없음
                                    </td>
                                </tr>
                                <tr>
                                    <th> 수술명</th>
                                    <td><input type="text" class="form-control" name="surgery_name"></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비행 예정</th>
                                    <td>
                                        <input type="radio" name="flight_yn" value="Y" class="no_select" checked>&nbsp; 있음&nbsp;&nbsp;
                                        <input type="radio" name="flight_yn" value="N" class="no_select">&nbsp; 없음
                                    </td>
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

    <!-- '기업건강검진' 추가용 modal end -->




    <!-- 예약일이 오늘날짜보다 이전으로 설정되지 않게끔 설정 + date 타입 input에 시작일을 오늘날짜로 설정하기  -->
    <script>
        window.onload = function() {

            var today = new Date().toISOString().split('T')[0]; 
            // 오늘 날짜를 가져와서, yyyy-mm-ddTHH:MM:SS.sssZ 형식으로 가져오고, 'T'를 기준으로 날짜, 시간을 나눠서 날짜만 가져온다.

            var two = document.getElementsByClassName("reservation_date");


            for (var i = 0; i < two.length; i++) {
                two[i].setAttribute("min", today);
                two[i].value = today;
            }
            // 예약일 input 필드에 min 속성으로 오늘 날짜를 주면 오늘보다 이전 날짜는 선택되지 않는다.
        };
    </script>
    



    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->


</body>
</html>