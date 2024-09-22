<%@ page import="com.br.vita.cs.model.vo.Cs" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/* 	Member m = (Member)request.getAttribute("m");
 */	String category = (String)request.getAttribute("category");
	if (category == null) {
		category = "C"; // 기본값 "칭찬합니다"
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객의소리글쓰기</title>
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
     height: 120%;
 }
 footer{
     margin-top: 1200px;
 } 
 
</style>
</head>
<body>

	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageSideBar.jsp" %>


  <div class="container" id="navContent"style="margin-left: -10px;">
		<br><h2><b>&nbsp; 고객의 소리</h2>  
		
	<form action="<%= contextPath %>/insert.cs" method="post">

    <table id="csUserInfo" class="table m-4">
			<tr>
				<th width="130px">카테고리</th>
				<td><select name="selectCategory" class="form-control" id="selectCategory">
				    <option value="C" <%= category.equals("C") ? "selected" : "" %>>칭찬합니다.</option>
				    <option value="S" <%= category.equals("S") ? "selected" : "" %>>건의합니다.</option>
				    <option value="Q" <%= category.equals("Q") ? "selected" : "" %>>QnA</option>
				    </select>
				</td>
			</tr>
        <tr>
            <th>보내는사람</th>
            <td><%= loginUser.getUserName() %></td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><%= loginUser.getPhone() %></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%= loginUser.getEmail() %></td>
        </tr>       
        <tr>
            <th>환자 정보</th>
            <td style="min-height: 20px;">
            <p style="font-size: 10px;">*환자 정보는 정확한 업무처리를 위해 필요한 부분이므로, 재차 확인해 주시길 바랍니다.</p>
            환자이름 <input type="text" name="patientName" value="<%=loginUser.getUserName() %>" readonly>&nbsp;&nbsp;
            환자 본인<br> 
            등록번호 <input type="text" name="patientId" value="<%= loginUser.getUserId() %>" readonly>&nbsp;&nbsp;   
            생년월일 <input type="text" name="patientBirth" value="<%= loginUser.getUserDate() %>" readonly>
            </td>
        </tr>
      </table>


    <!-- 고객의소리 칭찬합니다일 경우 이 테이블을 뿌림 -->
    <table id="compliment_table" class="table m-4" style="display: none;">
        <tr>
        <th width="130px">칭찬직원</th>
        <td><input type="text" class="form-control" name="cEmp"></td>
        <td width="130px" style="background-color:#eaf3fa;">장소(부서)</td>
        <td><input type="text" class="form-control" name="cDept"></td>           
        </tr>
        <tr>
        <th>제목</th>
        <td colspan="3"><input type="text" class="form-control" name="boardTitle"required></td>
        </tr>
        <tr>
        <th>내용</th>
        <td colspan="3"><textarea rows="10" class="form-control" name="boardContent" style="resize:none;" required></textarea></td>
        </tr>
    </table>

    <!-- 나머지 게시판일 경우 이 테이블을 뿌림 -->
    <table id="other_table" class="table m-4">
        <tr>
            <th width="130px">제목</th>
            <td><input type="text" class="form-control" name="boardTitle"></td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="3"><textarea rows="13" class="form-control" name="boardContent" style="resize:none;" required></textarea></td>
        </tr>
    </table>    		
		
	</form>
	</div>
	
    <script>
        document.getElementById("selectCategory").addEventListener("change", function() {
            var selectedValue = this.value;
            var complimentTable = document.getElementById("compliment_table");
            var otherTable = document.getElementById("other_table");

            if (selectedValue === "C") {
                complimentTable.style.display = "table";
                otherTable.style.display = "none";
            } else {
                complimentTable.style.display = "none";
                otherTable.style.display = "table";
            }
        });

        // 초기 카테고리 값에 따라 테이블 표시 설정
        window.onload = function() {
            var selectedValue = document.getElementById("selectCategory").value;
            var complimentTable = document.getElementById("compliment_table");
            var otherTable = document.getElementById("other_table");

            if (selectedValue === "C") {
                complimentTable.style.display = "table";
                otherTable.style.display = "none";
            } else {
                complimentTable.style.display = "none";
                otherTable.style.display = "table";
            }
        };
    </script>
	
	 	<!-- nav, section 별도로 닫아주기-->
	</nav>
	<div class="container d-flex justify-content-end">
	  <button type="submit" class="btn btn-outline-secondary btn-sm">등록하기</button>&nbsp;
	  <button type="reset" class="btn btn-outline-danger btn-sm">초기화</button>&nbsp;
	  <button type="button" class="btn btn-outline-warning btn-sm" onclick="history.back();">뒤로가기</button>
	</div>

</section>
<!-- section end -->
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>