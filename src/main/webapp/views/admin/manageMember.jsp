<%@ page import="java.util.List" %>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%@ page import="com.br.vita.common.model.vo.PageInfo" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
List<Member> list = (List<Member>)request.getAttribute("list"); 
PageInfo pi = (PageInfo)request.getAttribute("pi");
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

                <form action="<%= contextPath %>/searchMem.admin" method="get">
                    <table id="search_member_table">
                        <tr>
                            <td class="left_cell">이름</td>
                            <td class="right_cell_1">
                                    <input type="text" name="user_name" size="20">
                            </td>
                        </tr>

                        <tr>
                            <td class="left_cell">아이디</td>
                            <td class="right_cell_1">
                                    <input type="text" name="user_id" size="20">
                            </td>
                        </tr>
                    </table>

                    <div style="display: flex; justify-content: center; align-items: center; margin-top: 20px;">
                        <button type="submit" class="btn btn-secondary">검색</button> &nbsp;&nbsp;
                    </div>
                </form>

                <br>





            <br><br>
            <div class="search_member_result">회원 검색 결과</div> <br>


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

                <% if(list.isEmpty()) {%>
                    <!-- case1. 회원 검색 결과가 없는 경우  -->
                    <tr>
                        <td colspan="10" style="text-align: center;">검색 결과가 없습니다.</td>
                    </tr>
                <% } else { %>
                <!-- case2. 회원 검색 결과가 있는 경우 -->
                    <% for(Member m : list) { %>
                        <tr>
                            <td><%= m.getUserId() %></td>
                            <td><%= m.getUserName() %></td>
                            <td><%= m.getUserSSN() %></td>
                            <td><%= m.getAddress() %></td>
                            <td><%= m.getEmail() %></td>
                            <td><%= m.getCallbackYN() %></td>
                            <td><%= m.getPhone() %></td>
                            <td><%= m.getEnrollDate() %></td>
                        </tr>
                    <% } %>    
                <% } %>
            </table>



            <br>
            <% if(pi != null) { %>
            <ul class="pagination d-flex justify-content-center text-dark">
       
                <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : "" %>'>
                    <a class="page-link" href='<%= contextPath %>/searchMem.admin?page=<%=pi.getCurrentPage()-1%>&user_name=<%= request.getParameter("user_name") %>&user_id=<%= request.getParameter("user_id") %>'> Previous</a>
                  </li>

                <% for(int p = pi.getStartPage(); p<=pi.getEndPage(); p++) { %>
                    <li class='page-item <%= p == pi.getCurrentPage() ? "active" : ""%>'>
                      <a class="page-link" href='<%= contextPath %>/searchMem.admin?page=<%= p %>&user_name=<%= request.getParameter("user_name") %>&user_id=<%= request.getParameter("user_id") %>'> <%= p %></a>
                    </li>
                <% } %>

                <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
                    <a class="page-link" href='<%= contextPath %>/searchMem.admin?page=<%= pi.getCurrentPage()+1 %>&user_name=<%= request.getParameter("user_name") %>&user_id=<%= request.getParameter("user_id") %>'>Next</a>
                  </li>
            </ul>
            <% } %>




        </div>
    </div>
    </section>
   
    <!-- section end -->




    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->

</body>
</html>