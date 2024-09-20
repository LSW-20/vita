<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>

	<style>
		  section{
		      /* background-color: aqua; */
		      width: 100%;
		      height: 1300px;
		      position: absolute;
		      top: 80px;
		  }
		  .login_text {
		      font-size: 30px;
		      color: #1F2B6C;
		      height: 405px;
		      text-align: center;
		      background: url(/vita/assets/image/로그인폰트배경.png) center 0 no-repeat;
		      background-position: center 80px;
		      line-height: 500px;
		      width: 1900px;
		  }
		  .login_text2 {
		      font-size: 30px;
		      color: rgba(49,49,49);
		  }
		  .box{
		      box-sizing: border-box;
		      border: 1px solid gray;
		      display: flex;
		      margin: -10px 350px;
		      min-height: 600px;
		      width:1200px;
		  }
		  .login_box {
		      border-right: 1px solid gray;
		      width: 50%;
		      /* position: relative; */
		      padding: 100px 0 80px;
		      text-align: center;
		      font-size: 20px;
		      font-weight: 600;
		  }
		  .login_form {
		      padding: 30px 30px 20px;
		  }
		  .login_Id {
		      padding: 0 0 0 40px;
		      width: 300px;
		      height: 45px;
		      border: 1px solid #d6d6d6;
		      background: url(/vita/assets/image/id아이콘.png) 15px 13px / auto 20px no-repeat;
		      border-radius: 4px;
		      margin-bottom: 20px;    
		  }
		  .login_Id input {
		      height: 43px;
		      width: 100%;
		      box-sizing: border-box;
		      border: 0;
		      background-color: #ffffff;
		      font-weight: 400;
		      font-size: 16px;
		      border-radius: 3px;
		  }
		  .login_Pwd {
		      padding: 0 0 0 40px;
		      width: 300px;
		      height: 45px;
		      border: 1px solid #d6d6d6;
		      background: url(/vita/assets/image/pwd아이콘.png) 15px 11px / auto 20px no-repeat;
		      border-radius: 4px;
		      margin-bottom: 12px; 
		  }
		  .login_Pwd input {
		      height: 43px;
		      width: 100%;
		      box-sizing: border-box;
		      border: 0;
		      background-color: #ffffff;
		      font-weight: 400;
		      font-size: 16px;
		      border-radius: 3px;
		  }
		  .login_btn{
		      width: 150px;
		      height: 130px;
		      background: #1F2B6C;
		      border: none;
		      justify-content: center;
		      display: flex;
		      position: absolute;
		      margin-left: 330px;
		      top: 610px;
		      border-radius: 12px;
		      cursor:pointer;
		      padding-top: 45px;
		      color:white;
		  }
		  .button1 {
		      margin-top: 50px;
		      color: #FFFFFF;
		      font-size: 18px;
		      font-weight: 600;
		      text-decoration: none;
		  }
		  .button1:hover {
		      text-decoration: none; /* 호버 시에도 밑줄 제거 */
		  }
		  .find{
		      text-align: center;
		      color: #1F2B6C;
		      font-size: 18px;
		      padding-top: 100px;
		  }
		  .find > span {
		      margin: 0 40px;
		  }
		  .find_id, .find_pwd {
		      font-weight: 600;
		      text-decoration: none;
		  }
		  .find_id:hover, .find_pwd:hover {
		      text-decoration: none; /* 호버 시에도 밑줄 제거 */
		  }
		  .signup_text {
		      text-align: left;
		      margin-left: 80px;
		      margin-top: 30px;
		      margin-bottom: 30px;
		      color: #1F2B6C;
		      font-weight: 700;
		      line-height: 30px;
		  }
		  .signup_btn {
		      width: 150px;
		      height: 50px;
		      background: #65696D;
		      border: none;
		      justify-content: center;
		      display: flex;
		      position:absolute;
		      margin-left: 210px;
		      margin-top: 30px;
		      border-radius: 12px;
		
		  }
		  .button2 {
		      margin-top: 12px;
		      color: #FFFFFF;
		      font-size: 18px;
		      font-weight: 600;
		      text-align: center;
		      margin-left: 10px;
		      text-decoration: none;
		  }
		  .button2:hover {
		      text-decoration: none; /* 호버 시에도 밑줄 제거 */
		  }
		  
		  footer{
		      background-color: #1F2B6C;
		      position:absolute;
		      width: 100%;
		      height: 300px;
		      margin-top: 1200px;
		  }
            
	</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
		<section>
	       <nav>
	           <div>
	               <p class="login_text">
	                   <strong>VITAPRIMUS병원</strong><span class="login_text2">에 오신것을 환영합니다.</span>                                              
	               </p>
	           </div>
	           <div class="box">
	               <div class="login_box">
	                   <p>서비스를 이용하시려면 로그인이 필요합니다.</p>
	                   <div class="login_form">
	                       <div  class="login_form" >
	                           <div class="login_Id">
	                               <input type="text" name="userId" id="userId">
	                           </div>
	                           <div class="login_Pwd">
	                               <input type="password" name="userPwd" id="userPwd">
	                           </div>
	                           <!-- <div class="login_btn" onclick="fnLogin();"> -->
	                               <button class="login_btn" onclick="fnLogin();" id="l_btn">로그인</button>
	                           <!-- </div> -->
	                           <div>
	                               <p class="find">
	                                   <a href="#" class="find_id">아이디찾기</a>
	                                   <span>|</span>
	                                   <a href="#" class="find_pwd">비밀번호 찾기</a>
	                               </p>
	                           </div>
	                       </div>
	                       
	                       <script>
	                       
	                       
	                   	let userPwd = document.getElementById('userPwd');
                       	
                       	userPwd.addEventListener('keydown', function(event) {
                       	  if (event.key === 'Enter') {
                       			
                       					fnLogin();
                       	  }
                       	});
	                       
	                       	
	                       	function fnLogin(){
	                       		
		                       	$.ajax({
		                       		url:'<%= contextPath %>/login.me',
		                       		data: {
		                       				userId:$('#userId').val(),
		                       				userPwd:$('#userPwd').val()
		                       		},
		                       		success:function(res){
		                       			if(res != null){
		                       				location.href = '<%=contextPath %>';
		                       				console.log(res);
		                       			}else{
		                       				alert('아이디와 비밀번호를 다시 확인해주세요');
		                       				location.href = '<%=contextPath %>/views/member/login.jsp';
		                       				console.log(res);
		                       			}
		                       		},
		                       		type:"post"
		                       		
		                       		
		                       	});
	                       		
	                      }
	                       	
	                       
	                       	
	                       	
	                       	
	                       	
	                       </script>
	                   </div>
	               </div>
	               <div class="login_box">
	                   <div>
	                       <p>회원가입 후 다음 서비스를 이용하실 수 있습니다.</p>
	                           <p class="signup_text">
	                               인터넷 예약 및 확인
	                               <br>
	                               검사 통합 예약 조회
	                               <br>
	                               [고객의 소리], [칭찬합시다] 게시판 이용
	                           </p>
	                           <p style="font-size: 14px; text-align: left; margin-left: 80px; 
	                                       font-weight: 700;" >
	                               · &nbsp; 기존 고객이실 경우, [마이페이지]에서 환자등록번호를 입력하시면<br>
	                                   &nbsp;&nbsp;&nbsp;&nbsp;예약 조회 가능합니다.
	                               <br>
	                               <br>
	                               · &nbsp; 처음 방문하시는 경우, 첫 예약을 신청하시면 환자등록번호가 생성됩니다.
	                           </p>
	                           <div class="signup_btn">
	                               <a href="<%= contextPath %>/SignUp.me" class="button2">회원가입&nbsp;></a>
	                           </div>
	                   </div>
	           </div>
	       </div>
	       
	       
	      
	
	       </nav>
	  </section>
<%@ include file="/views/common/footer.jsp" %>


</body>
</html>