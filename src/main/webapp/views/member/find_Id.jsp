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
      margin-left: 20px;
    }
    #mf, #year, #ep {
    	margin-left: 20px;
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
      margin-left: 730px;
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
		.container23 .table-bordered{
			width: 1200px;
			height: 300px;
			margin-left: 300px;
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
	         		<div class="container23">
	             	<form action="">
	                 <table class="table-bordered">
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
	                     	<th>성별&nbsp;<span style="color:red;">*</span></th>
	                     		<td colspan="2"><input type="radio" id="mf" name="mf" value="m"> 남
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
	                     <tr>
	                     	<th>추가정보입력선택&nbsp;<span style="color:red;">*</span></th>
	                     		<td colspan="2"><input type="radio" id="ep" name="ep" value="e-mail"> 이메일
	                                     		<input type="radio" id="ep" name="ep" vlaue="phone1"> 휴대전화
	                     		</td>
	                     </tr>
	                     <tr>
	                         <th>이메일 주소&nbsp;<span style="color:red;">*</span></th>
	                         	<td colspan="2">
	                             <div>
	                                 <input type="text" id="e-mail" style="width: 200px; ">
	                                 	<span>@</span>
	                                 		<select id="email-domain" style="width: 250px; height: 30px; margin-left: 5px;">
	                                     <option value="선택" id="choice">선택</option>
	                                     <option value="naver.com">naver.com</option>
	                                     <option value="gmail.com">gmail.com</option>
	                                     <option value="hanmail.net">hanmail.net</option>
	                                     <option value="nate.com">nate.com</option>
	                                 		</select>
	                             </div>
	                          </td>
	                     </tr>
	
	                     <!-- 휴대폰 클릭 시 화면 -->
	                     <!-- <tr>
	                         <th>휴대전화&nbsp;<span style="color:red;">*</span></th>
	                         <td colspan="2">
	                             <div>
	                                 <select id="phone_number" style="width: 90px; height: 35px;">
	                                     <option value="010">010</option>
	                                     <option value="011">011</option>
	                                     <option value="016">016</option>
	                                     <option value="017">017</option>
	                                     <option value="018">018</option>
	                                     <option value="019">019</option>
	                                 </select>
	                                 <span style="font-size: 20px;">-</span>
	                                 <input type="text" id="phone12" style="width: 150px;">
	                                 <span style="font-size: 20px;">-</span>
	                                 <input type="text" id="phone12" style="width: 150px;">
	                             </div>
	                         </td>
	                     </tr> -->
	                 </tbody>
	                 </table>
	                     <div class="btn_okcc">
	                         <a href=""><button type="button" class="btn btn-primary mx-2" id="cc">취소</button></a>
	                         <a href=""><button type="button" class="btn btn-primary mx-2" id="ok">확인</button></a>
	                     </div>
	             </form>
	           </div>
	       </div>
	     </nav>
 		</section>
	
	
	
	
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>