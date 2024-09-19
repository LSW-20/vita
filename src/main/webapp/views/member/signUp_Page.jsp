<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
      section{
          /* background-color: aqua; */
          width: 100%;
          height: 1300px;
          position: absolute;
          top: 80px;
      }
      .signup_text {
          font-size: 30px;
          color: black;
          height: 350px;
          text-align: center;
          padding-top: 150px;
          width:1880px;
      }
      .box {
          border: 1px solid gray;
          display: flex;
          min-height: 500px;
          width: 800px; 
          margin: auto; 
          margin-top: -80px;
      }
      .signup_adult, .signup_child {
	        display: flex; 
	        flex-direction: column; /* 텍스트를 세로로 정렬 */
	        justify-content: flex-end; /* 세로 방향으로 내용 하단 정렬 */
	        align-items: center; 
	        width: 400px; 
	        text-align: center;
	        font-size: 20px;
	        padding-bottom: 100px;
      }
      .signup_adult {
          border-right: 1px solid gray; 
          background: url(/vita/assets/image/어른.png) 125px 110px / auto 200px no-repeat;
      }
      .signup_child {
          border-right: none;
          background: url(/vita/assets/image/어린이.png) 125px 110px / auto 200px no-repeat;
      }
      .signup_adult:hover, .signup_child:hover {
          text-decoration: none; 
      }
      footer{
		      background-color: #1F2B6C;
		      position:absolute;
		      width: 100%;
		      height: 300px;
		      margin-top: 1100px;
		  }

	</style>
<body>
	<%@ include file="/views/common/header.jsp" %>
		<section>
       <nav>
         <div>
            <p class="signup_text">
            <strong>회원가입 유형을 선택해주세요.</strong>                                            
            </p>
         </div>
         <form>
         	<div class="box">
          	<a href="#" class="signup_adult">
            	<p style="margin-bottom: 5px; font-weight: 600; font-size: 25px;">만 14세 이상 내국인</p>
              <p>국내거주 내ㆍ외국인</p>
            </a>
            <a href="#" class="signup_child">
             	<p style="margin-bottom: 5px; font-weight: 600; font-size: 25px;">만 14세 미만 내국인</p>
             	<p>어린이/청소년</p>
            </a>
          </div>
         </form>  
       </nav>
		</section>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>