<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find_Pw_Choice</title>
</head>

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
        width: 380px;
        height: 425px;
        border: none;
        background-color: rgba(191, 210, 248, 0.29); /* 투명도 있는 배경색 */
        margin: auto;
        margin-top: 50px;
        background-image: url(/vita/assets/image/e-mail.png);
        background-position: 155px 40px;
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
        margin-top: 100px;
        margin-bottom: 30px;
        font-weight: 500;
        font-size: 22px;
      }
      .e-mail2 {
        font-size: 15px;
        margin-bottom: 30px;
      }
      .e-mail3 {
        font-size: 20px;
        font-weight: 600;
      }
      #select {
        width: 130px;
        height: 40px;
        margin-top: 20px;
        background-color: #757A85;
        border: none;
      }
	    footer{
	      background-color: #1F2B6C;
	      position:absolute;
	      width: 100%;
	      height: 300px;
	      margin-top: 1000px;
		  }
	</style>
<body>
	<%@ include file="/views/common/header.jsp" %>
		<section>
       <nav>
         <div>
             <p class="title1"><strong>비밀번호 찾기</strong></p>
             <p class="title2"><strong>발급방법 선택</strong></p>
             <p class="title3">회원가입 시 등록한 휴대전화 번호 또는 e-mail로 임시 비밀번호를 발급해드립니다.</p>
         </div>
         <div class="box1">
           <p class="e-mail1"><strong>등록된 e-mail</strong></p>
           <p class="e-mail2">회원가입 시 등록한 e-mail로 
             <br>임시비밀번호를 발급 받으실 수 있습니다.</p>
           <p class="e-mail3">aaa******@naver.com</p>
           <a href="<%= contextPath %>/pwfind.sd"><button type="button" id="select" class="btn btn-primary">선택</button></a>
         </div>
       </nav>
		</section>
	
	<%@ include file="/views/common/footer.jsp" %>


</body>
</html>