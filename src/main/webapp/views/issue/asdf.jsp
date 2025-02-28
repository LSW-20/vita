<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>


 <script>

 

 </script>

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

<div class="t_container">
  <div class="t_header">진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;단&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서</div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>qweqwe</div></td>
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td><div>wqeqwe</div></td>
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div>asdasdasdsa</div></td>
      </tr>
      <tr>
        <td class="symptoms"><b>증상</b></td>
        <td colspan="3"><div>asdasdasdasd</div></td>
      </tr>
      <tr>
        <td class="opinion"><b>진단 및 소견</b></td>
        <td colspan="3"><div>asdasdasdas</div></td>
      </tr>
    </table>

    <div class="doc_detail">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.
      <div class="c_date">2024 년 08월 30일</div>
      <div>의료기관 명칭 : <b>VitaPrimus</b></div>
      <br>
      <div class="side_detail">
        <div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
        <div class="doc_num">[ ■ ] 의사  면허  12345  호</div>
      </div>
      <br>
      <div class="doc_name">담당의 : <b>박시우</b></div>

      
      
    </div>
  </div>



</div>

<br><br>

<div class="t_container">
  <div class="t_header">
    진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
  </div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>qweqwe</div></td>
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td><div>wqeqwe</div></td>
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div>asdasdasdsa</div></td>
      </tr>
      <tr>
        <td class="symptoms"><b>진단명</b></td>
        <td colspan="3"><div>asdasd</div></td>
      </tr>
      <tr>
        <td class="opinion"><b>치료내용</b></td>
        <td colspan="3"><div>asdasdasd</div></td>
      </tr>
      <tr>
        <td class="opinion_date"><b>치료기간</b></td>
        <td colspan="3"><div>asdasdasd</div></td>
      </tr>
    </table>

    <div class="doc_detail">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.
      <div class="c_date">2024 년 08월 30일</div>
      <div>의료기관 명칭 : <b>VitaPrimus</b></div>
      <br>
      <div class="side_detail">
        <div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
        <div class="doc_num">[ ■ ] 의사  면허  12345  호</div>
      </div>
      <br>
      <div class="doc_name">담당의 : <b>박시우</b></div>

      
      
    </div>
  </div>



</div>
<br><hr><br><br>

<!-- 입퇴원 확인서_보겸 -->  
<div class="t_container">
  <div class="t_header">입&nbsp;&nbsp;&nbsp;&nbsp;퇴&nbsp;&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;&nbsp;
  확&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;서</div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="docNo"><b>발급번호</b></td>
        <td colspan="3"><div>document.getDocNo()</div></td>            
      </tr>
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>loginUser.getUserName()</div></td>
        <td class="u_no"><b>병원등록번호</b></td>
        <td><div>loginUser.getUserNo()</div></td>      
      </tr>
      <tr>
        <td class="uSSN"><b>주민등록번호</b></td>
        <td colspan="3"><div>loginUser.getUserSSN()</div></td>        
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div>loginUser.getUserAddress</div></td>
      </tr>
      <tr>
        <td class="deptName"><b>진료과</b></td>
        <td><div>doctor.getDeptName()</div></td>
        <td class="docPurpose"><b>발급용도</b></td>
        <td>docDetail.jsp docPurpose</td>
     </tr>
     <tr>
     		<td><b>입원확인</b></td>
        <td class="opinion" colspan="3"><b>loginUser.getUserName()님의 입원 사실을 확인합니다.</b></td>           
     </tr>
    </table>

    <div class="doc_detail">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 입원 사실을 위와 같이 확인 합니다.
      <div class="c_date">document.getApplyDate</div>
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

<br><br>  
<!-- 진료비납입확인서_보겸 -->
<div class="t_container">
  <div class="t_header">진&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;비&nbsp;&nbsp;&nbsp;&nbsp;
  납&nbsp;&nbsp;&nbsp;&nbsp;입&nbsp;&nbsp;&nbsp;&nbsp;확&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;서</div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="docNo"><b>발급번호</b></td>
        <td colspan="3"><div>document.getDocNo()</div></td>            
      </tr>
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>loginUser.getUserName()</div></td>
        <td class="u_no"><b>병원등록번호</b></td>
        <td><div>loginUser.getUserNo()</div></td>      
      </tr>
      <tr>
        <td class="uSSN"><b>주민등록번호</b></td>
        <td colspan="3"><div>loginUser.getUserSSN()</div></td>        
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div>loginUser.getUserAddress</div></td>
      </tr>
      <tr>
        <td class="deptName"><b>진료과</b></td>
        <td><div>doctor.getDeptName()</div></td>
        <td class="docPurpose"><b>발급용도</b></td>
        <td>docDetail.jsp docPurpose</td>
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
      <div class="c_date">document.getApplyDate</div>
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

<br><br> 
<!-- 처방전_보겸 -->  
<div class="t_container">
  <div class="t_header">처&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;방&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전
  </div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="docNo"><b>발급번호</b></td>
        <td colspan="3"><div>document.getDocNo()</div></td>            
      </tr>
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td><div>loginUser.getUserName()</div></td>
        <td class="u_no"><b>병원등록번호</b></td>
        <td><div>loginUser.getUserNo()</div></td>      
      </tr>
      <tr>
        <td class="uSSN"><b>주민등록번호</b></td>
        <td colspan="3"><div>loginUser.getUserSSN()</div></td>        
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div>loginUser.getUserAddress</div></td>
      </tr>
      <tr>
        <td class="deptName"><b>진료과</b></td>
        <td><div>doctor.getDeptName()</div></td>
        <td class="docPurpose"><b>발급용도</b></td>
        <td>document.getDocPurpose</td>
     </tr>
     <tr>
     		<td><b>처방 의약품</b></td>
        <td class="medicine" colspan="3" style="text-align: left; vertical-align: top;">
        643503860 한미파모티딘정(1정)<br>
        649900060 무코스타정(1정)<br>
        <br>
        -이하 여백-
        
        </td>           
     </tr>
    </table>

    <div class="doc_detail">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 입원 사실을 위와 같이 확인 합니다.
      <div class="c_date">document.getApplyDate</div>
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

<br><br>  
  
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  
</body>
</html>