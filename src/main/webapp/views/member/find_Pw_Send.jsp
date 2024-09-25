<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_Pw_Send</title>
	<style>
	    section{
	      /* background-color: aqua; */
	      width: 100%;
	      height: 1100px;
	      position: absolute;
	      top: 80px;
	    }
	    .title1 {
	      margin-top: 120px;
	      margin-bottom: 25px;
	      font-size: 40px;
	      text-align: center;
	    }
	    .title2 {
	      color:#1F2B6C;
	      font-size: 20px;
	      text-align: center;
	    }
	    .title3 {
	      font-size: 15px;
	      text-align: center;
	    }
	    .box1 {
	      width: 980px;
	      height: 425px;
	      border: none;
	      background-color: rgba(191, 210, 248, 0.29); /* 투명도 있는 배경색 */
	      margin: auto;
	      margin-top: 40px;
	      background-image: url(/vita/assets/image/e-mail.png);
	      background-position: 455px 40px;
	      background-size: auto 70px;
	      background-repeat: no-repeat;
	      /* Flexbox로 자식 요소들을 중앙에 배치 */
	      display: flex;
	      flex-direction: column;   /* 수직 정렬 */
	      justify-content: center; /* 세로 중앙 정렬 */
	      align-items: center;     /* 가로 중앙 정렬 */
	      text-align: center;      /* 텍스트 중앙 정렬 */
	      padding: 20px;          /* 내부 여백 추가 */
	    }
	    .e-mail1 {
	      margin-top: 110px;
	      margin-bottom: 40px;
	      font-weight: 500;
	      font-size: 22px;
	    }
	    .e-mail2 {
	      font-size: 18px;
	      margin-bottom: 30px;
	      font-weight: 700;
	    }
	    .etc {
	      font-weight: 300;
	    }
	    .e-mail3 {
	      font-size: 13px;
	      margin-top: 35px;
	    }
	    .btn_etc {
	      display: flex;
	      justify-items: center;
	      margin-left: 690px;
	      margin-top: 70px;
	    }
	    #home{
	        width: 250px; 
	        height: 60px; 
	        background-color:#E3E3E3 ;
	        border:none;
	        color: black;
	    }
	    #login{
	        width: 250px; 
	        height: 60px; 
	        background-color:#1F2B6C ;
	        border:none;
	    }
	    footer{
		      background-color: #1F2B6C;
		      position:absolute;
		      width: 100%;
		      height: 300px;
		      margin-top: 1000px;
		  }
	</style>
</head>
<body>
<%@ include file="/views/common/header.jsp" %>
	<section>
    <nav>
       <div>
           <p class="title1"><strong>비밀번호 찾기</strong></p>
           <p class="title3">비밀번호를 확인하시고 로그인 해주시기 바랍니다.</p>
       </div>
       <div class="box1">
         <p class="e-mail1"><strong>회원 가입 시 등록하신 e-mail로 임시 비밀번호를 전송하였습니다.<br>
           개인번호 보호를 위해 즉시 변경해주세요.</strong></p>
         <p class="e-mail2">e-mail<span class="etc">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;aaa******@naver.com</span></p>
         <p class="e-mail3">· &nbsp; 등록하신 이메일 정보를 모르실 경우 1688-7950로 연락주시면 소정의 확인 절차 후 안내해 드리도록 하겠습니다.</p>
       </div>
       <div class="btn_etc">
         <a href="<%= contextPath %>/loginPage.me"><button type="button" class="btn btn-primary mx-2" id="login">로그인</button></a>
         <a href="<%= contextPath %>"><button type="button" class="btn btn-primary mx-2" id="home">홈으로</button></a>
     	 </div>
		</nav>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>