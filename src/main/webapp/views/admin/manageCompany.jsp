<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.company.model.vo.Company" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<Company> list = (List<Company>)request.getAttribute("list");
%>


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
    width: 40px;
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
                <!-- 추가는 modal, 삭제는 form + 이벤트리스너, 수정은 이벤트리스너 -->
                <form action="#" method="">
                    <div id="company_list">전체 연계기업 목록</div>
                    <br>

                    <table id="company_list_table">
                        <tr>
                            <th class="company_cell1"></th>
                            <th class="company_cell2">기업번호</th>
                            <th class="company_cell3">기업명</th>
                            <th class="company_cell4"></th>
                        </tr>

                        <% if(!list.isEmpty()) {
                                for(int i=0; i<list.size(); i++) { %>
                                    <tr>
                                        <td class="company_cell1"><input type="checkbox" name="delete"></td>
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
                        <button type="submit" class="btn btn-sm btn-danger" id="company_del_btn">삭제</button>
                        <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_modal">추가</button>
                    </div>

                </form>

                <form action="<%= contextPath %>/updateCOM.admin" method="post">
                    <input type="hidden" name="orgin_comp_no" id="origin_comp_no">
                    <table style="margin-left: 100px; text-align: center; height: 50%; display:none;" id="up">
                            <tr>
                                <th colspan="2" style="height: 50px;">기업 정보 수정 화면</th>
                            </tr>
                            <tr>
                                <th  style="width: 90px; height: 50px;">기업번호</th>
                                <td><input type="text" class="form-control" id="up_input1" name="comp_no"></td>     
                            </tr>
                            <tr>
                                <th  style="width: 90px; height: 50px;">기업명</th>
                                <td><input type="text" class="form-control" id="up_input2" name="comp_name"></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="height: 40px;">
                                    <button type="submit" class="btn btn-sm btn-primary">수정</button>
                                </td> 
                            </tr>
                    </table>
                </form>

                <style>
                    #up td, #up th{
                        border: 1px solid black;
                    }
                </style>

                <script>
                    $(document).ready(function() {

                        $(".up_btn").click(function() {
      
                            var compNo = $(this).data("compno");
                            var compName = $(this).data("compname");

                            $("#up").toggle();

                            $("#up_input1").val(compNo);
                            $("#origin_comp_no").val(compNo);
                            $("#up_input2").val(compName);
                        });

                    });
                </script>

            </div>

            <br><br><br><br>
            <div id="search_company">기업 검색</div>
            <br>


            <form action="#">
                <table id="search_company_table">
                    <tr>
                        <td class="search_company_left_cell">기업명</td>
                        <td class="search_company_right_cell" style="display: flex;">
                            <select name="" style="width: 200px;">
                                <option value="">전체</option>
                                <option value="">롯데리아</option>
                                <option value="">맥도날드</option>
                                <option value="">맘스터치</option>
                                <option value="">네네치킨</option>
                                <option value="">교촌치킨</option>
                                <option value="">부어치킨</option>
                            </select>

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
            <!-- case1. 기업 검색 결과가 없는 경우  -->
            <div class="search_company_result">기업 검색 결과</div> <br>


                <table class="table table-striped search_company_result_table">
                    <tr>
                        <th></th>
                        <th>기업번호</th>
                        <th>기업명</th>
                        <th>사번</th>
                        <th>사원명</th>
                        <th>회원번호</th>
                        <th>회원아이디</th>
                        <th></th>
                    </tr>

                    <tr>
                        <td colspan="8" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                </table>

                <div class="company_result_del_add_btn"><button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_result_modal">추가</button></div>


            <br><br>

            <!-- case2. 기업 검색 결과가 있는 경우 -->
            <div class="search_company_result">기업 검색 결과</div> <br>


                <table class="table table-striped search_company_result_table">
                    <tr>
                        <th></th>
                        <th>기업번호</th>
                        <th>기업명</th>
                        <th>사번</th>
                        <th>사원명</th>
                        <th>회원번호</th>
                        <th>회원아이디</th>
                        <th></th>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="delete"></td>
                        <td>271</td>
                        <td>롯데리아</td>
                        <td>465432</td>
                        <td>박첨지</td>
                        <td>046</td>
                        <td>kiosk223</td>
                        <td><button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#update_company_result_modal">수정</button></td>
                    </tr>

                </table>

                <div class="company_result_del_add_btn">
                    <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_company_result_modal">삭제</button>
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_company_result_modal">추가</button>
                </div>

        </div>
    </div>
    </section>
   
    <!-- section end -->



    <!-- 연계기업 목록 삭제용 modal start -->
  
        <!-- The Modal -->
        <div class="modal" id="delete_company_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">연계기업 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
                        <h6>기업번호 '271', 기업명 '롯데리아' 계정을 정말 삭제하시겠습니까? </h6> <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>

    <!-- 연계기업 목록 삭제용 modal end -->




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





    <!-- 연계기업 목록 수정용 modal start -->
                        <form action="#" method="">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_update_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 기업번호</th>
                                        <td><input type="number" class="form-control" name="" value="271" required></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 기업명</th>
                                        <td><input type="text" class="form-control" name="" value="롯데리아" required></td>
                                    </tr>
                                </table>
                            </div>

                            <br>
                            <div style="text-align: right;">
                                <button type="submit" class="btn btn-sm btn-success">추가</button>
                                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                            </div>
                        </form>
    <!-- 연계기업 목록 수정용 modal end -->





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
                        <form action="#" method="">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_update_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 기업번호</th>
                                        <td><input type="number" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 기업명</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 사번</th>
                                        <td><input type="number" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 사원명</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
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