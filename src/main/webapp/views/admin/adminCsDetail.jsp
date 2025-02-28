<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
footer {
    margin-top: 2500px; /* 페이지마다 footer 조금씩 조정 */
}
#side_menu {
    height: 180%; /* 페이지마다 side_menu 조금씩 조정. 기본값 100% */
}



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





/* 로그인한 회원에 따라 달라지는 버튼 요소들 - 상우 */
#if_btn {
    border: 1px solid red;
    display: flex;
    flex-direction: column;
    align-items: end;
}

/* 각 테이블에 m-4 빼고 수동으로 margin 주기 */
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

/* '답변하기(#reply_write_btn)' 버튼 클릭시 보였다 안보였다 하는 답변 요소 */
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
</style>
</head>

<body>

    <!-- header start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- header end -->

    <!-- sideBar start -->
    <%@ include file="/views/common/adminSideBar.jsp" %>
    <!-- sideBar end-->




    <!-- section 나머지 여기부터 start -->

    <!--
    <div id="content" > 

     
        <br><br>

        <div id="admin_name">
            관리자 강보람님
        </div>

        <br><br><br>
    !-->    


    <script>

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
				<th width="130px">카테고리</th>
				<td>
					getCategory
				</td>
			<!-- write jsp페이지에서 셀렉
				<td><select name="selectCategory">
				    <option value="compliment" selected>칭찬합니다.</option>
				    <option value="suggestion">건의합니다.</option>
				    <option value="qna">QnA</option>
				    </select>
				</td>
			-->
			</tr>
        <tr>
            <th>보내는사람</th>
            <td>getUserId</td>
        </tr>
        <tr>
            <th>연락처</th>
            <td>getPhone</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>getMail@naver.com</td>
        </tr>       

        <tr>
            <th>환자 정보</th>
            <td style="min-height: 20px;">
            <p style="font-size: 10px;">*환자 정보는 정확한 업무처리를 위해 필요한 부분이므로, 재차 확인해 주시길 바랍니다.</p>
            환자이름 <input type="text" name="patientName" value="userName" readonly>&nbsp;&nbsp;
            환자 본인<br> 
            등록번호 <input type="text" name="patientId" value="userId" readonly>&nbsp;&nbsp;   
            생년월일 <input type="date" name="patientBirth" value="userDate" readonly>
            </td>
        </tr>
    </table>


    <!-- 고객의소리 칭찬합니다일 경우 이 테이블을 뿌림 -->
    <!-- 
        <table id="compliment_table" class="table" >
            <tr>
            <th width="130px">칭찬직원</th>
            <td>XXX</td>
            <td width="130px" style="background-color:#eaf3fa;">장소(부서)</td>
            <td>1층로비</td>           
            </tr>
            <tr>
            <th>제목</th>
            <td colspan="3">기존 일반게시글 제목</td>
            </tr>
            <tr>
            <th>내용</th>
            <td colspan="3"><p style="min-height:250px;">기존 일반게시글 내용</p></td>
            </tr>
        </table>
    -->

    <!-- 나머지 게시판일 경우 이 테이블을 뿌림 -->
    <table id="other_table" class="table">
        <tr>
            <th width="130px">제목</th>
            <td>getTitle 기존 일반게시글 제목</td>
        </tr>
        <tr>
            <th>내용</th>
            <td><p style="min-height:300px;">기존 일반게시글 내용</p></td>
        </tr>
    </table>  



    <!-- 로그인한 회원에 따라 달라지는 버튼 요소들 - 상우 -->
	<div id="if_btn">

	    case1. 그냥 조회의 경우 보여지는 요소
        <br>
        <div>
	        <button type="button" class="btn btn-warning btn-sm">목록가기</button>
        </div>
        <br><br>

	    case2. 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소
        <br>
        <div>
            <button type="button" class="btn btn-secondary btn-sm">수정하기 페이지로</button> &nbsp;
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
            <button type="button" class="btn btn-warning btn-sm">목록가기</button>
        </div>
        <br><br>

        case3. 현재 로그인되어있는 회원이 관리자이고, 답변이 달려있지 않을 때 보여지는 요소
        <br>
        <div>
            <button type="button" class="btn btn-secondary btn-sm"  id="reply_write_btn">답변하기</button> &nbsp;
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
            <button type="button" class="btn btn-warning btn-sm">목록가기</button>
        </div>
        <br><br>

        case4. 현재 로그인되어있는 회원이 관리자이고, 답변이 달려있을 때 보여지는 요소
        <br>
        <div>
            <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#delete_modal">삭제하기</button> &nbsp;
            <button type="button" class="btn btn-warning btn-sm">목록가기</button>
        </div>
	</div>
    

    <!-- 이 게시글에 답변이 있는 경우 보여줄 '답변 조회 테이블' -->
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 이 게시글에 답변이 있는 경우 보여줄 '답변 조회 테이블'
    <table class="table reply_table">
        <tr>
            <th width="130px">제목</th>
            <td>RE: getTitle 기존 일반게시글 제목</td>
        </tr>

        <tr>
            <th>내용</th>
            <td><p style="min-height:300px;">관리자가 작성한 답변 내용</p></td>
            <!-- textarea도 name 속성을 주면 form에서 input처럼 값을 넘길 수 있다. -->
        </tr>
    </table>    




    <!-- '답변 작성 테이블' - 상우 -->
    <!-- '답변하기(#reply_write_btn)' 버튼 클릭시 toggle로 보였다 안보였다 하는 테이블이다.  -->
    <div id="reply_div">
        <form action="#">
            <table class="table reply_table">
                <tr>
                    <th width="130px">제목</th>
                    <td>RE: getTitle 기존 일반게시글 제목</td>
                </tr>

                <tr>
                    <th>내용</th>
                    <td><textarea style="min-height:300px; resize:none; background-color: #c7e0dd;" class="form-control" required name=""></textarea></td>
                    <!-- textarea도 name 속성을 주면 form에서 input처럼 값을 넘길 수 있다. -->
                </tr>
            </table>    

            <div id="reply_write_btn_div">
                <button type="submit" class="btn btn-secondary">작성</button>
            </div>
        </form>
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
                    <h4 class="modal-title">게시글 삭제</h4>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="#" method="">
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

    <!-- 삭제용 modal end -->



    <!-- footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- footer end -->


</body>
</html>