<%@ page import="com.br.vita.cs.model.vo.Cs" %>
<%@ page import="com.br.vita.member.model.vo.Member" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Cs board = (Cs)request.getAttribute("board");
	Member m = (Member)request.getAttribute("m");
	String category = request.getParameter("category") == null ? "C" : request.getParameter("category");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* 고객의소리 table 배경색 지정 */
#csUserInfo th{
    background-color:#eaf3fa;
}
#compliment_table th{
    background-color:#eaf3fa;
}
#other_table th{
    background-color:#eaf3fa;
} 

/* 고객의소리 게시글리스트 thead색 */
#csthead{
    background-color:#eaf3fa;
}

/* 사이드메뉴 길이 100->120 수정 -보겸 */
#sideMenu{
    background-color: rgb(54, 99, 204);
    width: 20%;
    height: 220%;
}
footer{
    margin-top: 2000px;
} 



/* 로그인한 회원에 따라 달라지는 버튼 요소들 - 상우 */
#if_btn {
    /* border: 1px solid red; */
    display: flex;
    flex-direction: column;
    align-items: end;
}

/* 각 테이블에 m-4 빼고 수동으로 margin 주기 - 상우 */
#csUserInfo, #other_table, #compliment_table {
    margin-left: 24px;
    width: calc(100% - 25px); /* 테이블이 화면을 벗어나지 않도록 너비를 조정.  
                                    부모 요소의 너비의 100%를 차지하되, 
                                    그 전체 너비에서 25px만큼을 뺀 크기로 설정 */
}

.reply_table {
    margin-left: 24px;
    width: calc(100% - 25px) !important;
}


/* 답변 테이블 - 상우 */
.reply_table th {
    background-color:#eaf3fa;
}
.reply_table td {
    background-color:#c7e0dd;
}

/* '답변하기(#reply_write_btn)' 버튼 클릭시 보였다 안보였다 하는 답변 요소 - 상우*/
#reply_div {
    display: none;
}
.show_and_hide {
    display: block !important;
}

/* 답변 테이블 아래 '작성' 버튼을 감싸는 div - 상우*/
#reply_write_btn_div {
    display: flex;
    justify-content: end;
}



/* csDetail에 관리자 사이드바를 붙이면서 사이드메뉴 길이를 변경했습니다 - 상우 */
#side_menu {
    height: 1980px !important;
}

    
</style>


</head>



<body>

	<%@ include file="/views/common/header.jsp" %>
    <%@ include file="/views/common/adminSideBar.jsp" %>


    <script>
        // '답변하기' 버튼 클릭시 보였다 사라졌다 할 답변 form 요소 - 상우
        $(document).ready(function() {
            $('#reply_write_btn').on("click", function(evt){
                $('#reply_div').toggleClass('show_and_hide');
            })
        })
        
    </script>




  <div class="container" id="navContent" style="margin: 0px;">
		<br>
        <h2><b>&nbsp; 고객의 소리</h2> 
        <br>
		
    <table id="csUserInfo" class="table">
			<tr>
				<th width="130px" id="category" value="<%= board.getCategory() %>">카테고리</th>
				<td>
				<%if(board.getCategory().equals("Q")) {%>
					QnA
				<%}else if(board.getCategory().equals("S")){ %>
					문의합니다
				<%}else{ %>
					칭찬합니다
				<%} %>
				</td>
			</tr>
        <tr>
            <th>보내는사람</th>
            <td><%= board.getUserName() %></td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><%= board.getPhone() %></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%= board.getEmail() %></td>
        </tr>       

        <tr>
            <th>환자 정보</th>
            <td style="min-height: 20px;">
            <p style="font-size: 10px;">*환자 정보는 정확한 업무처리를 위해 필요한 부분이므로, 재차 확인해 주시길 바랍니다.</p>
            환자이름 <input type="text" name="patientName" value="<%= board.getUserName() %>" readonly>&nbsp;&nbsp;
            환자 본인<br> 
            등록번호 <input type="text" name="patientId" value="<%= board.getBoardWriter() %>" readonly>&nbsp;&nbsp;   
            생년월일 <input type="text" name="patientBirth" value="<%= board.getUserDate() %>" readonly>
            </td>
        </tr>
    </table>


    <!-- 고객의소리 칭찬합니다일 경우 이 테이블을 뿌림 -->
 			<% if(board.getCategory().equals("C")) {%>
        <table id="compliment_table" class="table" >
            <tr>
	            <th width="130px">칭찬직원</th>
	            <td><%= board.getcEmp() %></td>
	            <td width="130px" style="background-color:#eaf3fa;">장소(부서)</td>
	            <td><%= board.getcDept() == null ? "" : board.getcDept()  %></td>           
            </tr>
            <tr>
            <th>제목</th>
            <td colspan="3"><%= board.getBoardTitle() %></td>
            </tr>
            <tr>
            <th>내용</th>
            <td colspan="3"><p style="min-height:250px;"><%= board.getBoardContent() %></p></td>
            </tr>
        </table>
			<%} else{ %>
    <!-- 나머지 게시판일 경우 이 테이블을 뿌림 -->
    <table id="other_table" class="table">
        <tr>
            <th width="130px">제목</th>
            <td><%= board.getBoardTitle() %></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><p style="min-height:300px;"><%= board.getBoardContent() %></p></td>
        </tr>
    </table>  
		<%} %>


    <!-- 로그인한 회원에 따라 달라지는 버튼 요소들 - 상우 -->
	<div id="if_btn">

	   
	    <% if(loginUser == null) {%>
            <!-- case0. 비회원일 경우 -->
            <br>
            <div>
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div>

        <%} else if(!loginUser.getUserId().equals(board.getBoardWriter()) && !loginUser.getUserType().equals("A") ){ %>    
            <!-- case1. 회원이지만 글 작성자가 아닌 경우 + 관리자도 아닌 경우 -->
            <br>
            <div>
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div>

        <%}else if(loginUser.getUserId().equals(board.getBoardWriter())) {%>
            <!-- case2. 회원이면서 글 작성자인 경우 -->
            <br>
            <div>
                <a href="<%= contextPath %>/modify.cs?category=<%= board.getCategory() %>&no=<%= board.getBoardNo() %>" class="btn btn-secondary btn-sm">수정하기</a> &nbsp;
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div> 

        <%} else if(loginUser.getUserType().equals("A") && !board.getCategory().equals("Q")) { %>
            <!-- case3. 현재 로그인되어있는 회원이 관리자이고, qna 게시판이 아닌 경우 -->
            <br>
            <div>
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div>

        <%} else if(loginUser.getUserType().equals("A") && board.getAnswerContent()==null && board.getCategory().equals("Q")){ %>
            <!-- case4. 현재 로그인되어있는 회원이 관리자이고, 답변이 달려있지 않을 때 보여지는 요소 + QNA게시판인 경우에만 -->
            <br>
            <div>
                <button type="button" class="btn btn-secondary btn-sm"  id="reply_write_btn">답변하기</button> &nbsp;
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div>

        <%} else if(loginUser.getUserType().equals("A") && board.getAnswerContent()!=null && board.getCategory().equals("Q")){ %>
            <!-- case5. 현재 로그인되어있는 회원이 관리자이고, 답변이 달려있을 때 보여지는 요소 + QNA게시판인 경우에만 -->
            <br> 
            <div>
                <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
                <a href="<%= contextPath %>/list.cs?category=<%= board.getCategory() %>" class="btn btn-warning btn-sm">목록가기</a>
            </div>

        <%}%>
	</div>
    

    <!-- 이 게시글에 답변이 있는 경우 보여줄 '답변 조회 테이블' -->
    <% if(board.getAnswerContent() != null) {%>
        <br><br>
        <table class="table reply_table">
            <tr>
                <th width="130px">제목</th>
                <td>RE: <%= board.getBoardTitle() %></td>
            </tr>

            <tr>
                <th>내용</th>
                <td><p style="min-height:300px;"><%= board.getAnswerContent() %></p></td>
            </tr>
        </table>    

        <div style="display: flex; flex-direction: column; align-items: end;" >
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#reply_delete_modal">답변 삭제</button>
        </div>
    <%} %>




    <!-- '답변 작성 테이블' - 상우 -->
    <!-- '답변하기(#reply_write_btn)' 버튼 클릭시 toggle로 보였다 안보였다 하는 테이블이다.  -->
    <div id="reply_div">
        <form action="<%= contextPath %>/addAdmQNA.admin?board_no=<%=board.getBoardNo()%>" method="post">
            <br><br>
            <table class="table reply_table">
                <tr>
                    <th width="130px">제목</th>
                    <td>RE: <%=board.getBoardTitle() %></td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td><textarea style="min-height:300px; resize:none; background-color: #c7e0dd;" class="form-control" required name="reply_content"></textarea></td>
                    <!-- textarea도 name 속성을 주면 form에서 input처럼 값을 넘길 수 있다. -->
                </tr>
            </table>    

            <div id="reply_write_btn_div">
                <button type="submit" class="btn btn-secondary">작성</button>
            </div>
        </form>
    </div>


  </div>

<!-- nav, section 별도로 닫아주기-->
<!-- </nav> adminSideBar에는 nav 태그가 없음.-->




</section>
<!-- section end -->



    <!-- 게시글 삭제용 modal start - 보겸 -->
  
        <!-- The Modal -->
        <div class="modal" id="delete_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">게시글 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="<%=contextPath %>/delete.cs?no=<%= board.getBoardNo() %>" method="post">
                        <h6>정말 게시글을 삭제하시겠습니까? </h6> <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>

    <!-- 게시글 삭제용 modal end -->

    
    <!-- 답변 삭제용 modal start - 상우 -->
  
        <!-- The Modal -->
        <div class="modal" id="reply_delete_modal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">답변 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="<%=contextPath %>/deleteAdmQNA.admin?board_no=<%= board.getBoardNo() %>" method="post">
                        <h6>정말 답변을 삭제하시겠습니까? </h6> <br>
                        <div style="text-align: right;">
                            <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                            <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">취소</button>
                        </div>
                    </form>
                </div>
        
            </div>
            </div>
        </div>

    <!-- 답변 삭제용 modal end -->



    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end --> 


</body>
</html>