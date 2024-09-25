<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
  * {
    box-sizing: border-box;
  }

  .t_container{
    border: 1px solid black;
    width: 900px;
    height: 1050px;
    display: flex;
    flex-direction: column;
  }

  .t_header{
    border: 1px solid black;
    width: 100%;
    height: 70px;
    text-align: center;
    font-size: 30px;
    padding-top: 10px;
    background-color: lightgray;
  }
  .table_div{
    margin-left: 70px;
    margin-top: 20px;
  }
  #table_container{
    width: 760px;
    height: 700px;
    text-align: center;
  }
  .u_name{
    height: 60px;
    width: 140px;
  }
  .u_ssn{
    width: 145px;
  }
  .u_addr{
    height: 65px;
  }
  .symptoms{
    height: 150px;
  }
  /* 보겸 추가 */
  .docNo {
  	height: 60px;
  }
  .uSSN {
  	height: 60px;
  }
  .deptName{
  	height: 60px;
  }

  .doc_detail{
    display: flex;
    flex-direction: column;
   
    width: 760px;
  }
  .c_date{
    text-align: right;
  }
  .side_detail{
    display: flex;
  }
  .doc_num{
    margin-left: 140px;
  }
  .doc_name{
    text-align-last: right;
  }
  .opinion_date{
    height: 80px;
  }
</style>
</head>
<body>
<!-- 진료비납입확인서_보겸 -->
<div class="t_container">
  <div class="t_header">진&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;비&nbsp;&nbsp;&nbsp;&nbsp;
  납&nbsp;&nbsp;&nbsp;&nbsp;입&nbsp;&nbsp;&nbsp;&nbsp;확&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;서</div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="docNo"><b>발급번호</b></td>
        <td colspan="3" align="left"><div>documents.getDocNo()</div></td>            
      </tr>
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>loginUser.getUserName()</div></td>
        <td class="u_no"><b>병원등록번호</b></td>
        <td><div>loginUser.getUserNo()</div></td>      
      </tr>
      <tr>
        <td class="uSSN"><b>주민등록번호</b></td>
        <td colspan="3" align="left"><div>loginUser.getUserSSN()</div></td>        
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3" align="left"><div>loginUser.getUserAddress</div></td>
      </tr>
      <tr>
        <td class="deptName"><b>진료과</b></td>
        <td><div>doctor.getDeptName()</div></td>
        <td class="docPurpose"><b>발급용도</b></td>
        <td>documents.getDocPurpose</td>
     </tr>
     <tr>
     		<td><b>납입확인</b></td>
        <td class="pay_check" colspan="3" align="left"><b>loginUser.getUserName()님의 진료비 납입이 확인 되었습니다.</b><br>
        	&nbsp;&nbsp;1월 : 납입 완료 <br>
        	&nbsp;&nbsp;2월 : 납입 완료 <br>
        	&nbsp;&nbsp;3월 : 납입 완료 <br>
        	&nbsp;&nbsp;4월 : 납입 완료 <br>
        	&nbsp;&nbsp;5월 : 납입 완료 <br>
        	&nbsp;&nbsp;6월 : 납입 완료 <br>
        	&nbsp;&nbsp;7월 : 납입 완료 <br>
        	&nbsp;&nbsp;8월 : 납입 완료 <br>
        	&nbsp;&nbsp;9월 : 납입 완료 <br>
        	10월 : 납입 완료 <br>
        	11월 : 납입 완료 <br>
        	12월 : 납입 완료 <br>
        	
        </td>           
     </tr>
    </table>

    <div class="doc_detail">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 납입 사실을 위와 같이 확인 합니다.
      <div class="c_date">documents.getApplyDate</div>
      <div>의료기관 명칭 : <b>VitaPrimus</b></div>
      <br>
      <div class="side_detail">
        <div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
        <div class="doc_num">[ ■ ] 의사  면허  doctor.getLicenceNo()  호</div>
      </div>
      <br>
      <div class="doc_name">담당의 : <b>doctor.getDoctorName</b></div>
    </div>
  </div>
</div>
</body>
</html>