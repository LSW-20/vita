<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
 /* 고객의소리 table 배경색 지정 */
 #csUserInfo th{
   background-color:#eaf3fa;
 }
 #csBoard th{
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
     height: 120%;
 }
</style>
<body>

	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/sideBar.jsp" %>


  <div class="side" id="navContent">
		<br><h2><b>&nbsp; 고객의 소리</h2>  
		
    <table id="csUserInfo" class="table m-4">
			<tr>
				<th width="130px">카테고리</th>
				<td><select name="selectCategory">
				    <option value="compliment" selected>칭찬합니다.</option>
				    <option value="suggestion">건의합니다.</option>
				    <option value="qna">QnA</option>
				    </select>
				</td>
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
            <th>회신 여부</th>
            <td>      
                <input type="radio" id="yes" name="response-yn" value="Y">
                <label for="male">원함 &nbsp;</label>
            
                <input type="radio" id="no" name="response-yn" value="N">
                <label for="female">원하지 않음</label></td>
        </tr>                   
        <tr>
            <th>환자 정보</th>
            <td style="min-height: 20px;">
            <p style="font-size: 10px;">*환자 정보는 정확한 업무처리를 위해 필요한 부분이므로, 반드시 입력해 주시길 바랍니다.</p>
            환자이름 <input type="text" name="patientName">&nbsp;&nbsp;   
            환자관계 <input type="text" name="relation">
            <select name="selectRelation">
                <option value="self">본인</option>
                <option value="parent">보호자</option>
                <option value="etc">직접입력</option>
            </select><br> 
            등록번호 <input type="number" name="userId">&nbsp;&nbsp;   
            생년월일 <input type="date">
            </td>
        </tr>
        </table>


    <!-- 고객의소리 칭찬합니다일 경우 이 테이블을 뿌림 -->
<!--
    <table id="csBoard" class="table m-4">
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
    <table id="csBoard" class="table m-4">
        <tr>
            <th>제목</th>
            <td>기존 일반게시글 제목</td>
        </tr>
        <tr>
            <th>내용</th>
            <td><p style="min-height:300px;">기존 일반게시글 내용</p></td>
        </tr>
    </table>    
		</div>
	 	<!-- nav, section 별도로 닫아주기-->
	</nav>
	<div class="d-flex justify-content-end">
	    <!-- 현재 로그인되어있는 회원이 해당 게시글의 작성자 본인일 경우 보여지는 요소 -->
	    <button type="button" class="btn btn-secondary btn-sm">수정하기 페이지로</button> &nbsp;
	    <button type="button" class="btn btn-danger btn-sm">삭제하기</button> &nbsp;
	    <!-- ------------------------------------------------------------------------- -->
	    <button type="button" class="btn btn-warning btn-sm">목록가기</button>
	</div>

</section>
<!-- section end -->
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>