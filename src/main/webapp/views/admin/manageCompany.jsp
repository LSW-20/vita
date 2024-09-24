<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.company.model.vo.Company" %>
<%@ page import="com.br.vita.employee.model.vo.Employee" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<Company> list = (List<Company>)request.getAttribute("list");
%>


<% Boolean threeType = (Boolean) request.getAttribute("threeType"); %>
<% List<Map<String, Object>> empList = (List<Map<String, Object>>) request.getAttribute("empList"); %>
<% String selectCom = "[" + (String) request.getAttribute("selectCom") + "]"; %>


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
    margin-top: 1700px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
    height: 120%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}


        
#title_msg { /* '건강검진 연계기업 관리' 텍스트 */
    border-bottom: 10px solid silver;

    font-size: 40px;
    font-weight: 900;
    padding-left: 100px;
    padding-bottom: 30px;
}

#company_list, #search_company { /* '전체 연계기업 목록', '기업검색' 텍스트 */
    font-size: 20px;
    font-weight:600;
    margin-left: 40px;
}


#company_list_table { /* 전체 연게기업 목록 테이블 */
    margin-left: 50px;
    margin-top: 10px;
    font-size: 18px;
    text-align: center;
}
.company_cell1 { /* 전체 연게기업 목록 테이블의 1 셀 */
    border: 1px solid silver;
    width: 60px;
    text-align: center;
}
.company_cell2 { /* 전체 연게기업 목록 테이블의 2 셀 */
    border: 1px solid silver;
    width: 160px;

}
#company_list_table td:not(.company_cell1):not(.company_cell4) {
    padding-left: 10px;
}
.company_cell3 { /* 전체 연게기업 목록 테이블의 3 셀 */
    border: 1px solid silver;
    width: 160px;
    
}
.company_cell4 { /* 전체 연게기업 목록 테이블의 4 셀 */
    border: 1px solid silver;
    width: 60px;
    text-align: center;
}
#company_list_table th { /* 전체 연게기업 목록 테이블의 테이블헤더셀 */
    text-align: center;
}      
.company_del_add_btn { /* 전체 연계기업 목록 테이블의 삭제, 추가 버튼 */
    margin-top: 20px;
    margin-left: 50px;
}



#search_company_table { /* 기업 검색 테이블 */
    margin-left: 40px;
    margin-top: 10px;
    font-size: 18px;
}
.search_company_left_cell { /* 기업 검색 테이블의 1번째 셀 */
    width: 80px; 
    padding-left: 10px; 
}
.search_comapny_right_cell { /* 기업 검색 테이블의 2번째 셀 */
    padding-left: 20px; 
    padding-top:  10px;
    padding-bottom: 10px;
}





.search_company_result { /* '기업 검색 결과' 텍스트 */
    font-size: 20px;
    font-weight:600;
    margin-left: 40px;
}

.search_company_result_table th, .search_company_result_table td { /* 기업 검색 결과 테이블 셀들 */
    text-align: center;
}


.company_result_del_add_btn { /* 삭제, 추가 버튼 가운데 정렬 */
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
            관리자 xxx님
        </div>

        <br><br><br>
  --> 


            <!-- section 나머지 start -->

            <div id="title_msg">건강검진 연계기업 관리</div>

            <br><br><br>

            <div style="display: flex; align-items: center;">
                <!-- 추가는 modal, 삭제는 여기서 submit, 수정은 이벤트리스너 + form -->
                <form action="<%= contextPath %>/deleteCOM.admin" method="post" id="com_del_form">
                    <div id="company_list">전체 연계기업 목록</div>
                    <br>

                    <table id="company_list_table">
                        <tr>
                            <th class="company_cell1"><button class="btn btn-sm btn-warning" type="button" id="all_btn">all</button></th>
                            <th class="company_cell2">기업번호</th>
                            <th class="company_cell3">기업명</th>
                            <th class="company_cell4"></th>
                        </tr>

                        <% if(list != null && !list.isEmpty()) {
                                for(int i=0; i<list.size(); i++) { %>
                                    <tr>
                                        <td class="company_cell1"><input type="checkbox" name="del_com_list" value="<%= list.get(i).getCompNo() %>"></td>
                                        <td class="company_cell2"><%= list.get(i).getCompNo() %></td>
                                        <td class="company_cell3"><%= list.get(i).getCompName() %></td>
                                        <td class="company_cell4">
                                            <button type="button" class="btn btn-sm btn-primary up_btn"
                                                data-compno="<%= list.get(i).getCompNo() %>" data-compname="<%= list.get(i).getCompName() %>">수정</button>
                                        </td>
                                    </tr>
                            <% }    
                        } %>
                    </table>


                    <div class="company_del_add_btn">
                        <button type="button" class="btn btn-sm btn-danger" id="company_del_btn">삭제</button>
                        <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_modal">추가</button>
                    </div>

                </form>

                <!-- 기업 목록 수정 form (토글) -->
                <form action="<%= contextPath %>/updateCOM.admin" method="post">
                    <input type="hidden" name="orgin_comp_no" id="origin_comp_no">
                    <table id="up">
                            <tr>
                                <th colspan="2" style="height: 50px;">기업 정보 수정 화면</th>
                            </tr>
                            <tr>
                                <th style="width: 90px; height: 50px;">기업번호</th>
                                <th style="height: 50px; text-align: center;"><input type="text" class="form-control" id="up_input1" name="comp_no"></th>     
                            </tr>
                            <tr>
                                <th style="width: 90px; height: 50px;">기업명</th>
                                <th style="height: 50px; text-align: center;"><input type="text" class="form-control" id="up_input2" name="comp_name"></th>
                            </tr>
                            <tr>
                                <th colspan="2" style="height: 40px;">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                </th> 
                            </tr>
                    </table>
                </form>

                <!-- 기업 목록 수정 테이블 테두리 스타일 주기 -->
                <style>
                    #up {
                        margin-left: 100px; 
                        text-align: center; 
                        height: 50%; 
                        display: none;
                    }
                    #up td, #up th{
                        border: 1px solid silver; 
                    }
                    #up input{
                        width: 80%;
                        display: inline-block; /*  */
                    }
                </style>

                <!-- 기업 목록 수정 버튼에 클릭 이벤트 주기 -->
                <script>
                    $(document).ready(function() {

                        $(".up_btn").click(function() {
      
                            var compNo = $(this).data("compno");
                            var compName = $(this).data("compname");

                            $("#up").toggle();

                            $("#up_input1").val(compNo);
                            $("#origin_comp_no").val(compNo); // 히든으로 넘겨서 조건으로 사용할 값.
                            $("#up_input2").val(compName);
                        });

                    });
                </script>

            </div>



            <!-- 삭제를 위해 전체 선택하는 버튼 -->
            <script>
                document.getElementById('all_btn').addEventListener('click', function() {

                    var checkboxEl = document.querySelectorAll('#company_list_table input[type="checkbox"]'); // 체크박스들을 배열로 모음.

                    var flag = true; // 토글식으로 일부 선택되어 있는 상태에서는 전체 선택된 결과가 나오지 않는다.

                    for(var i = 0; i<checkboxEl.length; i++) {
                        if(!checkboxEl[i].checked) {  
                            checkboxEl[i].checked = true; 
                            flag = false;      // falg가 true라는 뜻은 모든 체크박스가 이미 checked 되어있는 상태라는 뜻이다. 
                        }
                    }

                    if(flag == true) {
                        for(var i = 0; i<checkboxEl.length; i++) {
                            checkboxEl[i].checked = false; // 모든 체크박스가 이미 checked 되어있으면 모두 체크 해제한다.
                        }
                    }

                });    
            </script> 




            <!-- 삭제 버튼 클릭시 submit이라 바로 제출됨. 바로 제출되는 걸 막고 한번 확인창 띄우기 -->
            <script>
                document.getElementById('company_del_btn').addEventListener('click', function() {

                    if (confirm('정말 삭제하시겠습니까?')) {
                        document.getElementById('com_del_form').submit();
                    }

                });
            </script>






            <!-- 위에까지는 Company, 여기부터는 Employee. (기업에 소속된 사원 정보 검색) -->

            <br><br><br><br>
            <div id="search_company">기업 검색</div>
            <br>


            <form action="<%= contextPath %>/searchEMP.admin" method="get">
                <table id="search_company_table">
                    <tr>
                        <td class="search_company_left_cell">기업명</td>
                        <td class="search_company_right_cell" style="display: flex;">

                            <select name="select_com" style="width: 200px;">
                                <option>전체</option> 

                              <% if(list != null) { %>  
                                <% for(int i=0; i<list.size(); i++) { %>
                                    <option><%= list.get(i).getCompName() %></option>
                                <% } %>        
                              <% } %>  
                            </select>
                            <%-- option에 value 안주면 텍스트가 value로 넘어간다.--%>

                            &nbsp;&nbsp;
                            <button type="submit" class="btn btn-sm btn-secondary">검색</button>
                        </td>
                    </tr>
                </table>
            </form>

            <br>



            <!-- text-align 속성은 텍스트뿐만 아니라 인라인 요소(inline elements)들을 정렬할 때도 사용됩니다. 
            HTML에서 <button>, <input>, <label> 등은 기본적으로 인라인 요소로 취급됩니다. 
            그래서 text-align: center;를 사용하면 버튼과 같은 인라인 요소도 부모 컨테이너 안에서 가운데로 정렬됩니다.
            중요한건 버튼의 상위 요소에 text-align: center를 줘야 함. -->
            <!-- input 요소는 text-align을 상위에 줘도 안돼서 display:inline-block;을 주거나 display:flex를 줘서 따로 정렬-->
            


            <%-- 조건처리하는법. 검색 이전상태랑 검색했는데 결과가 없는 경우를 구분하기 위해 flag 변수를 사용한다. --%>

            <%-- Boolean threeType = (Boolean) request.getAttribute("threeType"); --%>

            <%-- 
                (1) 처음 기업관리 페이지를 오는 경우. threeType은 null이다.
                (2) 기업관리 페이지에서 검색해서 서블릿에서 forward로 다시 오면서 검색 결과가 없으면 false를 담는다.
                (3) 기업관리 페이지에서 검색해서 서블릿에서 forward로 다시 오면서 검색 결과가 있으면 true를 담는다.
            --%>

            <%-- 
                [boolean vs Boolean]
                boolean 기본형 ( primitive type ): 메모리에 직접 값을 저장. null을 담을 수 없으며 true,false만 담을 수 있다.
                Boolean 참조형 ( reference type ): 참조값 ( 주소 ) 을 가진다. null을 담을 수 있다.
            --%>



            <% if (threeType == null) { %>
                <!-- case1. 검색 이전 화면 -->
                <br><br>
                <div class="search_company_result">기업 검색 결과</div> <br>


                <table class="table table-striped search_company_result_table">
                    <tr>
                        <th></th>
                        <th>기업번호</th>
                        <th>기업명</th>
                        <th>사번</th>
                        <th>사원명</th>
                        <th>주민등록번호</th>
                        <th></th>
                    </tr>

                    <tr>
                        <td colspan="7" style="text-align: center;"></td>
                    </tr>
                </table>

                <div class="company_result_del_add_btn"><button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_result_modal">추가</button></div>


                <br><br>
            <% } else if(threeType == false) { %>

                <!-- case2. 기업의 사원 검색 결과가 없는 경우  -->
                <br><br>
                <div class="search_company_result"><span style="color: red;"><%= selectCom %> 검색 결과</span></div> <br>


                    <table class="table table-striped search_company_result_table">
                        <tr>
                            <th></th>
                            <th>기업번호</th>
                            <th>기업명</th>
                            <th>사번</th>
                            <th>사원명</th>
                            <th>주민등록번호</th>
                            <th></th>
                        </tr>

                        <tr>
                            <td colspan="7" style="text-align: center;">기업에 소속된 사원이 없습니다.</td>
                        </tr>
                    </table>

                    <div class="company_result_del_add_btn"><button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_result_modal">추가</button></div>


                <br><br>

            <% } else if(threeType == true) { %>
                
                <%-- List<Map<String, Object>> empList = (List<Map<String, Object>>) request.getAttribute("empList") --%>

                <!-- case3. 기업의 사원 검색 결과가 있는 경우 -->
                <br><br>
                <div class="search_company_result"><span style="color: red;"><%= selectCom %></span> 검색 결과</div> <br>


                <table class="table table-striped search_company_result_table">
                    <tr>
                        <th></th>
                        <th>기업번호</th>
                        <th>기업명</th>
                        <th>사번</th>
                        <th>사원명</th>
                        <th>주민등록번호</th>
                        <th></th>
                    </tr>

                    <%  if(empList != null) {
                            for(int i=0; i<empList.size(); i++) { 
                            
                            Company c = (Company)empList.get(i).get("com"); 
                            Employee e = (Employee)empList.get(i).get("emp"); 
                    %> 

                            <tr>
                                <td><input type="checkbox" name="delete"></td>
                                <td><%= c.getCompNo() %></td>
                                <td><%= c.getCompName() %></td>
                                <td><%= e.getEmpNo() %></td>
                                <td><%= e.getEmpName() %></td>
                                <td><%= e.getSsn() %></td>
                                <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_company_result_modal">수정</button></td>
                            </tr>
                            <% } %>
                    <% } %>


                </table>

                <div class="company_result_del_add_btn">
                    <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_company_result_modal">삭제</button>
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_result_modal">추가</button>
                </div>

            <% } %> 



        </div>
    </div>
    </section>
   
    <!-- section end -->


    <% if(list != null && !list.isEmpty()) {
        for(int i=0; i<list.size(); i++) { %>
            <tr>
                <td class="company_cell1"><input type="checkbox" name="del_com_list" value="<%= list.get(i).getCompNo() %>"></td>
                <td class="company_cell2"><%= list.get(i).getCompNo() %></td>
                <td class="company_cell3"><%= list.get(i).getCompName() %></td>
                <td class="company_cell4">
                    <button type="button" class="btn btn-sm btn-primary up_btn"
                        data-compno="<%= list.get(i).getCompNo() %>" data-compname="<%= list.get(i).getCompName() %>">수정</button>
                </td>
            </tr>
        <% }    
    } %>

    <!-- 연계기업 목록 추가용 modal start -->

            <!-- The Modal -->
            <div class="modal" id="add_company_modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">연계기업 추가</h4>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%= contextPath %>/addCOM.admin" method="post">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_update_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 기업번호</th>
                                        <td><input type="text" class="form-control" placeholder="'xxx-xx-xxxxx' 형식으로 입력" name="comp_no" maxlength="12" required></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 기업명</th>
                                        <td><input type="text" class="form-control" name="comp_name" required></td>
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

    <!-- 연계기업 목록 추가용 modal end -->





  



    <!-- 기업검색결과 추가용 modal start -->

            <!-- The Modal -->
            <div class="modal" id="add_company_result_modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">연계기업 사원 목록 추가</h4>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="<%= contextPath %>/addEMP.admin" method="post">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_update_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 기업선택</th>
                                        <td>
                                            <select name="comp_name">
                                                <% if(list != null && !list.isEmpty()) {
                                                    for(int i=0; i<list.size(); i++) { %>
                                                        <option><%= list.get(i).getCompName() %></option>
                                                    <% } %>   
                                                <% } %>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 사번</th>
                                        <td><input type="text" class="form-control" name="emp_no" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 사원명</th>
                                        <td><input type="text" class="form-control" name="emp_name" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 사원 주민등록번호</th>
                                        <td><input type="text" class="form-control" placeholder="'-'를 포함하여 최대 14자" name="emp_ssn" required maxlength="14"></td>
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

    <!-- 기업검색결과 추가용 modal end -->







    <!-- 기업검색결과 삭제용 modal start -->
  
        <!-- The Modal -->
        <div class="modal" id="delete_company_result_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">연계기업 사원 목록 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
                        <h6>기업명 '롯데리아', 사번 '465432', 회원아이디 'kiosk223' 사원 목록을 정말 삭제하시겠습니까? </h6> <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>

    <!-- 기업검색결과 삭제용 modal end -->










    <!-- 기업검색결과 수정용 modal start -->

            <!-- The Modal -->
            <div class="modal" id="update_company_result_modal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">연계기업 사원목록 수정</h4>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="#" method="">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_update_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 기업번호</th>
                                        <td><input type="number" class="form-control" placeholder="" name="" value="271" required></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 기업명</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="롯데리아" required></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 사번</th>
                                        <td><input type="number" class="form-control" placeholder="" name="" value="465432" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 사원명</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="박첨지" required></td>
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


    <!-- 기업검색결과 수정용 modal end -->




    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->

</body>
</html>