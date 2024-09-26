<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.company.model.vo.Company" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% List<Company> companyList = (List<Company>)request.getAttribute("companyList"); 
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


.select_type td, .select_type th{ /* '일반건강검진, 기업건강검진 조회하기' 테이블 */
    /* border: 1px solid black; */
}
.select_type {
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



            <div id="title_msg">예약 관리 - 건강검진</div>

            <br><br><br><br>

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
                                <form action="#" method="get" class="collapse" id="normalC">
                                    <table id="search_table">
                                        <tr>
                                            <th class="left_cell">시작일</th>
                                            <td class="right_cell">
                                                <input type="date" name="start_date">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="left_cell">종료일</th>
                                            <td class="right_cell">
                                                <input type="date" name="end_date">
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
                                <form action="#" method="get" class="collapse" id="companyC">
                                    <table id="search_table">
                                        <tr>
                                            <th class="left_cell">기업</th>
                                            <td class="right_cell">
                                                <select name="com">
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
                                                <input type="date" name="start_date">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="left_cell">종료일</th>
                                            <td  class="right_cell">
                                                <input type="date" name="end_date">
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
            <!-- case1. '일반건강검진' 검색 결과가 없는 경우  -->
            <div class="search_result">일반건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약일</th>
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

            <br><br>


            <!-- case2. '일반건강검진' 검색 결과가 있는 경우 -->
            <div class="search_result">일반건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약일</th>
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
                        <td>401</td>
                        <td>20240927</td>
                        <td>오후</td>
                        <td>50000원</td>

                        <td>asdf123</td>
                        <td>심수빈</td>

                        <td>혈압약,항혈전제</td>
                        <td>있음</td>
                        <td>맹장수술</td>
                        <td>없음</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                        </td>
                    </tr>

                    <tr>
                        <td>403</td>
                        <td>20240930</td>
                        <td>오전</td>
                        <td>35000원</td>

                        <td>kekeke223</td>
                        <td>이주형</td>

                        <td>없음</td>
                        <td>없음</td>
                        <td></td>
                        <td>없음</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                        </td>
                    </tr>
                </table>

                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_noraml">추가</button>
                </div>   
            <br>


            <br><br>
            <!-- case1. '기업건강검진' 검색 결과가 없는 경우  -->
            <div class="search_result">기업건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약일</th>
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

            <br><br>


            <!-- case4. '기업건강검진' 검색 결과가 있는 경우 -->
            <div class="search_result">기업건강검진 검색 결과</div> <br>


                <table class="table table-striped search_result_table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약일</th>
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
                        <td>1121</td>
                        <td>20241012</td>
                        <td>오후</td>
                        <td>50000원</td>

                        <td>롯데리아</td>
                        <td>20041011004</td>
                        <td>하수빈</td>

                        <td>혈압약,항혈전제</td>
                        <td>있음</td>
                        <td>맹장수술</td>
                        <td>없음</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                        </td>
                    </tr>

                    <tr></tr>
                        <td>1132</td>
                        <td>202411104</td>
                        <td>오후</td>
                        <td>50000원</td>

                        <td>맥도날드</td>
                        <td>20100415007</td>
                        <td>김맥날</td>

                        <td>없음</td>
                        <td>없음</td>
                        <td>없음</td>
                        <td>있음</td>
                        <td>
                            <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#delete_modal">삭제</button>
                        </td>
                    </tr>


                </table>

                <div class="add_btn">
                    <button type="button" class="btn btn-sm btn-dark" data-toggle="modal" data-target="#add_modal_company">추가</button>
                </div>   
            <br>


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
                    <h4 class="modal-title">건강검진 예약 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
                        <h6>예약번호 '401', 이름 '심수빈' 진료 예약을 정말 삭제하시겠습니까? </h6> <br>
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
                        <form action="#" method="">
                            <div style="display: flex; justify-content: center;">
                                <table class="add_modal_table">
                                    <tr>
                                        <th><span class="star">*</span> 예약일</th>
                                        <td><input type="date" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 예약시간</th>
                                        <td>
                                                <input type="radio" name="reservation_time" value="AM" class="noselect">&nbsp; 오전&nbsp;&nbsp;
                                                <input type="radio" name="reservation_time" value="PM" class="noselect">&nbsp; 오후
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><span class="star">*</span> 검진비용</th>
                                        <td><input type="number" class="form-control" placeholder="숫자만 입력" name="" value="" required></td>
                                    </tr>

                                    
                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>


                                    <tr>
                                        <th><span class="star">*</span> 회원ID</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 이름</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>


                                    <tr>
                                        <td colspan="2" style="height: 20px;"></td>
                                    </tr>


                                    <tr>
                                        <th> 복용중인 약</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 최근 수술 여부</th>
                                        <td>
                                            <input type="radio" name="surgery_yn" value="Y" class="noselect">&nbsp; 있음&nbsp;&nbsp;
                                            <input type="radio" name="surgery_yn" value="N" class="noselect">&nbsp; 없음
                                        </td>
                                    </tr>
                                    <tr>
                                        <th> 수술명</th>
                                        <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                    </tr>
                                    <tr>
                                        <th><span class="star">*</span> 비행 예정</th>
                                        <td>
                                            <input type="radio" name="flight_yn" value="Y" class="noselect">&nbsp; 있음&nbsp;&nbsp;
                                            <input type="radio" name="flight_yn" value="N" class="noselect">&nbsp; 없음
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
                    <form action="#" method="">
                        <div style="display: flex; justify-content: center;">
                            <table class="add_modal_table">
                                <tr>
                                    <th><span class="star">*</span> 예약일</th>
                                    <td><input type="date" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 예약시간</th>
                                    <td>
                                            <input type="radio" name="reservation_time" value="AM" class="noselect">&nbsp; 오전&nbsp;&nbsp;
                                            <input type="radio" name="reservation_time" value="PM" class="noselect">&nbsp; 오후
                                    </td>
                                </tr>

                                <tr>
                                    <th><span class="star">*</span> 검진비용</th>
                                    <td><input type="number" class="form-control" placeholder="숫자만 입력" name="" value="" required></td>
                                </tr>

                                
                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>


                                <tr>
                                    <th><span class="star">*</span> 기업명</th>
                                    <td>
                                        <select name="" id="">
                                            <option value="">기업1</option>
                                            <option value="">기업2</option>
                                            <option value="">기업3</option>
                                            <option value="">기업4</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 사번</th>
                                    <td><input type="number" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 이름</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>


                                <tr>
                                    <td colspan="2" style="height: 20px;"></td>
                                </tr>


                                <tr>
                                    <th> 복용중인 약</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 최근 수술 여부</th>
                                    <td>
                                        <input type="radio" name="surgery_yn" value="Y" class="noselect">&nbsp; 있음&nbsp;&nbsp;
                                        <input type="radio" name="surgery_yn" value="N" class="noselect">&nbsp; 없음
                                    </td>
                                </tr>
                                <tr>
                                    <th> 수술명</th>
                                    <td><input type="text" class="form-control" placeholder="" name="" value="" required></td>
                                </tr>
                                <tr>
                                    <th><span class="star">*</span> 비행 예정</th>
                                    <td>
                                        <input type="radio" name="flight_yn" value="Y" class="noselect">&nbsp; 있음&nbsp;&nbsp;
                                        <input type="radio" name="flight_yn" value="N" class="noselect">&nbsp; 없음
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







    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->


</body>
</html>