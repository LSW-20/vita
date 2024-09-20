<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my page</title>
<style>
  /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
  /* 사이드바 메뉴 길이 페이지마다 다를 수 있으니 별도로 부여 */
   #sideMenu{
     background-color: rgb(54, 99, 204);
     width: 20%;
     height: 100%;
 }
 #my_info_table th{
  background-color:#eaf3fa;
 } 
	 footer{
	    margin-top: 1000px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<%@ include file="/views/common/myPageSideBar.jsp" %>

      <div>
        <h2 class="m-4"><b>마이페이지</b></h2>

        <form action="<%=contextPath %>/update.me" method="post" class="m-4" style="position: relative; left: 30px;">
          <table id="my_info_table" class="table">
            <tr>
              <th width="250px">* 아이디</th>
              <td width="750px"><input type="text" class="form-control"placeholder="Enter Your ID" name="userId" value=<%= loginUser.getUserId() %> readonly></td>
            </tr>
            <tr>
              <th>* 병원등록번호(회원번호)</th>
              <td><input type="text" class="form-control"placeholder="Your UserId" name="userNo" value=<%= loginUser.getUserNo() %> readonly></td>
            </tr>                 
            <tr>
              <th>* 이름</th>
              <td><input type="text" class="form-control" placeholder="Enter Your Name" name="userName" value=<%= loginUser.getUserName() %> required></td>
            </tr>      
            <tr>
              <th>&nbsp;&nbsp;생년월일</th>
              <td><input type="text" class="form-control" placeholder="ex_ 900101" name="userDate" value=<%= loginUser.getUserDate() %> required></td>
            </tr>   
            <tr>
						  <th>&nbsp;&nbsp;성별</th>
						  <td>      
						      <input type="radio" id="male" name="gender" value="M">
						      <label for="male">남자 &nbsp;</label>
						      <input type="radio" id="female" name="gender" value="F">
						      <label for="female">여자</label>
						  </td>
						  <script>
						    $(document).ready(function(){
						      // 성별 값이 "M"이면 남자 라디오 버튼, "F"이면 여자 라디오 버튼을 선택
						      let gender = '<%= loginUser.getGender() %>';
						      console.log(gender);
						      if(gender === 'M') {
						        $('#male').prop('checked', true);
						      } else if(gender === 'F') {
						        $('#female').prop('checked', true);
						      }
						    });
						  </script>
            </tr>
            <tr>
              <th>&nbsp;&nbsp;전화번호</th>
              <td><input type="text" class="form-control" placeholder="Enter Your Phone(include '-')" name="phone" value=<%= loginUser.getPhone() %> required></td>
            </tr>     
            <tr>
              <th>&nbsp;&nbsp;이메일</th>
              <td><input type="text" class="form-control" placeholder="Enter Your Email(include '@')" name="email" value=<%= loginUser.getEmail() %> required></td>
            </tr>       
                                                         
          </table>
          <br>
          <div class="d-flex justify-content-end">
            <button type="submit" class="btn btn-primary btn-sm">정보변경</button>&nbsp;
            <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#changePwdModal">비밀번호변경</button>&nbsp;
            <button type="reset" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#resignModal">회원탈퇴</button>
          </div>
        </form>
      </div>	
	
	
  <!-- nav, section 별도로 닫아주기-->
  </nav>
</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
  <!-- 비번 변경용 div -->
<div class="modal" id="changePwdModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">비밀번호 변경</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <form action="">
          <table align="center">
            <tr>
              <th>* 현재 비밀번호</th>
              <td><input type="password" class="form-control" required></td>
            </tr>
            <tr>
              <th>* 바꿀 비밀번호</th>
              <td><input type="password" class="form-control"required></td>
            </tr>
            <tr>
              <th>* 비밀번호 확인</th>
              <td><input type="password" class="form-control"required></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align: center; padding-top: 10px;"><button type="submit" class="btn btn-primary btn-sm" >비밀번호변경</button></td>
            </tr>
          </table>
        </form>
      </div>
      </div>

    </div>
  </div>


</div>

<!-- 회원탈퇴 -->
<div class="modal" id="resignModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><b>비밀번호 변경</b></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <form action="">
          <table align="center">
            <tr>
              <th colspan="2">탈퇴 후 복구가 불가능 합니다. <br>
                정말 탈퇴 하시겠습니까?
              </th>
            </tr>
            <tr>
              <th>현재 비밀번호</th>
              <td><input type="password" class="form-control"required></td>
            </tr>
            <tr>
              <td colspan="2" style="text-align: center; padding-top: 10px;">
                <button type="submit" class="btn btn-danger btn-sm" >예. 탈퇴하겠습니다.</button>
              </td>
            </tr>
          </table>
        </form>
      </div>
      </div>

    </div>
  </div>
</body>
</html>