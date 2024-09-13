<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/myPageSideBar.jsp" %>
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
 #csthead{
   background-color:#eaf3fa;
 }
    footer{margin-top: 1053px;}
    
    
    .dm_container{
    	margin-top: 40px;
    	margin-left: 60px;
    }
    
    
 
 </style>
 
 
 
 	<div class="dm_container"><h2>진단서 및 진료 확인서</h2><div>
 	
 	<div>발급절차</div>
 
 
 
 
 

  
	 <!-- nav, section 별도로 닫아주기-->
	 </nav>
	</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>