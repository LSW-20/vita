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
       height: 1100px;
       position: absolute;
       top: 80px;
     }
     .title1 {
       margin-top: 180px;
       margin-bottom: 60px;
       font-size: 24px;
       text-align: center;
     }
     .name, #e-mail, #email-domain, #phone_number, #phone12 {
       border: 1px solid rgb(207, 207, 207);
       border-radius: 5px;
       width: 250px;
     }
     th {
       background-color: aliceblue;
       text-align: center !important;
    }
     #year, #month, #day {
       width: 80px; 
       height:35px;
       border: 1px solid rgb(207, 207, 207);
       border-radius: 5px;
     }
     #cc{
       width: 200px; 
       height: 60px; 
       background-color:#E3E3E3 ;
       border:none;
       color: black;
     }
     #ok{
       width: 200px; 
       height: 60px; 
       background-color:#1F2B6C ;
       border:none;
     }
     .btn_okcc{
       display: flex;
       justify-items: center;
       margin-left: 350px;
       margin-top: 70px;
     }
     .title2 {
       font-size: 14px;
       color: red;
       margin-left: 1400px;
       font-weight: 600;
     }
     footer{
	     background-color: #1F2B6C;
	     position:absolute;
	     width: 100%;
	     height: 300px;
	     margin-top: 900px;
		 }
	</style>
<body>
	<%@ include file="/views/common/header.jsp" %>
		<section>
       <nav>
         <div>
           <p class="title1">
               비타 의료원 사이트에 등록된 회원정보를 입력해주세요.</p>
           <p class="title2"> * 필수입력항목</p>
           <div class="container">
               <form action="<%= contextPath %>/pwfind.me" method="post" id="findPw">
                   <table class="table table-bordered">
                   	 <thead>
                       <colgroup>
                           <col width="200">
                           <col width="*">
                       </colgroup>
                       <tr>
                       <th>이름&nbsp;<span style="color:red;">*</span></th>
                       <td colspan="2"><input type="text" class="name"></td>
                       </tr>
                   	 </thead>
                   	 <tbody>
                     	<tr>
                       <th>아이디&nbsp;<span style="color:red;">*</span></th>
                       	<td colspan="2"><input type="text" class="name"></td>
                      </tr>
                      <tr>
                       <th>성별&nbsp;<span style="color:red;">*</span></th>
                       	<td colspan="2"><input type="radio" id="mf" name="mf" value="m"> 남&nbsp;&nbsp;&nbsp;
                                        <input type="radio" id="mf" name="mf" vlaue="f"> 여
                       </td>
                      </tr>
                      <tr>
                       <th>생년월일&nbsp;<span style="color:red;">*</span></th>
                       	<td colspan="2">
                           <select id="year">
                             <option value="">년도</option>
                               <script>
                                   // 현재 연도부터 100년 전까지 표시
                                   const currentYear = new Date().getFullYear();
                                   for (let i = currentYear; i >= currentYear - 100; i--) {
                                       document.write('<option value="' + i + '">' + i + '</option>');
                                   }
                               </script>
                           </select>
                       
                           <!-- 월 선택 -->
                           <select id="month">
                             <option value="">월</option>
                               <script>
                                   // 1월부터 12월까지 표시
                                   for (let i = 1; i <= 12; i++) {
                                       document.write('<option value="' + i + '">' + i + '월</option>');
                                   }
                               </script>
                           </select>
                       
                           <!-- 일 선택 -->
                           <select id="day">
                             <option value="">일</option>
                               <script>
                                   // 1일부터 31일까지 표시
                                   for (let i = 1; i <= 31; i++) {
                                       document.write('<option value="' + i + '">' + i + '일</option>');
                                   }
                               </script>
                           </select>
                        </td>
                       </tr>
                     </tbody>
                   </table>
                       <div class="btn_okcc">
                         <a href="<%= contextPath %>"><button type="button" class="btn btn-primary mx-2" id="cc">취소</button></a>
                         <button type="submit" class="btn btn-primary mx-2" id="ok">확인</button>
                       </div>
               </form>
           </div>
         </div>
       </nav>
		</section>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>