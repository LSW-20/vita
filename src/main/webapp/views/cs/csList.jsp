<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  /* #topimgDiv2,#topimgDiv2,#topimgDiv2{} */
  #mainMenu{
      display: flex;
      flex-direction: column;
      background-color: #1F2B6C;           
  }
 #csthead{
   background-color:#eaf3fa;
 }
    footer{
     margin-top: 1053px;
 }
</style>
<body>
	 <%@ include file="/views/common/header.jsp" %>
	 <%@ include file="/views/common/sideBar.jsp" %>
	 <div class="side" id="navContent">
		
	   <br><h2><b>&nbsp; 고객의 소리</h2>  
	   <hr>
	   <!-- 고객의소리 설명 텍스트 + 이미지 -보겸 -->
	   <div id="csText" class="d-flex align-items-start" style="border: 1px solid black; padding: 20px;width: 80%; max-width: 1500px; margin: 0 auto;">
	     <img id="msgBox" src="/vita/assets/image/MsgBox.png" style="width: 100px; height: 100px; margin-right: 10px;">
	     <div>
	       <p>- 병원을 이용하시면서 경험한 친절 사례를 올려주세요. 고객님의 따뜻한 격려가 저희에게는 큰 힘이 됩니다.</p>
	       <p>- 관련 내용은 비공개로 진행되며, 글쓴이와 병원 관계자만 볼 수 있습니다.</p>
	       <p>- 본 게시판의 취지와 맞지 않는 글을 남기신 경우 예고 없이 삭제될 수 있음을 양해해 주시기 바랍니다.</p>
	     </div>
	   </div>
	   <hr>
	 <!-- 현재 로그인되어있는 회원일 경우 보여지는 요소 -->
	 <div class="d-flex justify-content-end">
	   <button type="button" class="btn btn-primary btn-sm">등록하기</button>
	 </div>        
	 <table class="table">
	   <thead id="csthead">
	     <tr>
	       <th width="50px">번호</th>
	       <th width="450px">글제목</th>
	       <th width="80px">작성자</th>
	       <th width="80px">조회수</th>
	       <th width="80px">작성일</th>
	     </tr>
	   </thead>
	   <tbody>
	     <!-- case1. 조회된 게시글이 없을 경우 -->
	     <!--
	     <tr>
	       <td colspan="5" style="text-align: center;">존재하는 게시글이 없습니다.</td>
	     </tr>
	     -->
	
	     <!-- case2. 조회된 게시글이 있을 경우 -->
	     <tr>
	       <td>3</td>
	       <td>글제목입니다</td>
	       <td>user01</td>
	       <td>200</td>
	       <td>2024-01-12</td>
	     </tr>
	     <tr>
	         <td>3</td>
	         <td>글제목입니다</td>
	         <td>user02</td>
	         <td>200</td>
	         <td>2024-01-12</td>
	     </tr>
	     <tr>
	         <td>3</td>
	         <td>글제목입니다</td>
	         <td>user02</td>
	         <td>200</td>
	         <td>2024-01-12</td>
	     </tr>
	     <tr>
	         <td>3</td>
	         
	         <td>글제목입니다</td>
	         <td>user01</td>
	         <td>200</td>
	         <td>2024-01-12</td>
	     </tr>
	     <tr>
	         <td>3</td>
	         
	         <td>글제목입니다</td>
	         <td>user03</td>
	         <td>200</td>
	         <td>2024-01-12</td>
	     </tr>
	   </tbody>
	 </table>
	 
	 <ul class="pagination d-flex justify-content-center text-dark">
	   <li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
	   <li class="page-item active"><a class="page-link" href="">1</a></li>
	   <li class="page-item"><a class="page-link" href="">2</a></li>
	   <li class="page-item"><a class="page-link" href="">3</a></li>
	   <li class="page-item"><a class="page-link" href="">4</a></li>
	   <li class="page-item"><a class="page-link" href="">5</a></li>
	   <li class="page-item"><a class="page-link" href="">Next</a></li>
	 </ul>

	 </div>
	 <!-- nav, section 별도로 닫아주기-->
	 </nav>
	</section>
<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 
</body>
</html>