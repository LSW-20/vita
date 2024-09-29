<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<%@ page import="java.util.*" %>

<%@ page import="com.br.vita.common.model.vo.PageInfo" %>

<%@ page import="com.br.vita.member.model.vo.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>


<% 

PageInfo pi = (PageInfo)request.getAttribute("pi");

List<Map<String,Object>> mrcList = (List<Map<String,Object>>)request.getAttribute("mrcList");

List<Member> doculist = (List<Member>)request.getAttribute("doculist");

%>


</head>
<body>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/doctorSideBar.jsp" %>

   <style>
   
   						 footer{margin-top:1053px;}
				      section{height:900px}
				      #sideMenu{height:100%}
           
            <style>
           
           .c_select_box{
            width: 100px;
            height: 100px;
            background-color: aqua;
           }
           .care_select_container{
            display: flex;
            flex-direction: column;
           }
           .input-group-prepend {
              margin-right: 7px;
          }
          input{
              padding: .375rem .75rem;
              font-size: 1rem;
              font-weight: 400;
              line-height: 1.5;
              color: #495057;
              background-color: #fff;
              background-clip: padding-box;
              border: 1px solid rgb(127, 179, 228);
              border-radius: .25rem;
              transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
              box-shadow: 1px 1px 1px rgb(79, 122, 161);
          }
          

          select {
            /* box-sizing: border-box; */
            width: 210px;
            padding: 4px;
            font-size: 20px;
            border-radius: 6px;
            text-align: center;
            border: 1px solid rgb(127, 179, 228);
            box-shadow: 1px 1px 1px rgb(79, 122, 161);
          }

          option {
            padding: 4px;
            font-size: 14px;
            color: #fff;
            background: #272822;
          }
          #dateInput{
            margin-left: 20px;
          }
          #minus{
            font-size: 30px;
            margin-left: 20px;
          }
          .boxline{
            border-top: 1px solid gray;
            margin-top: 30px;
            
          }
          #sel_btn{
            margin-left: 40px;
            width: 100px;
            height: 40px;
            box-shadow: 1px 1px 1px black;
          }
          .input-group-text{
            box-shadow: 1px 1px 2px black
          }

          #pageBar{
            margin-left: 440px;
          }
          #tavle_list_box{
           min-height: 400px;
          }

                      
           </style>

          <div class="container mt-5">
            <h2><b>진료기록</b></h2>

              <div class="boxline">
                <form action="<%= contextPath %>/selectMrecords.se" >
                  <div class="care_select_container mt-5">

                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">환자명</span>
                        </div>
                        <input type="text" class="" placeholder="Name" id="user_name_val" name="userName">
                      </div>

                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">진료과</span>
                        </div>

                        <select name="deptName" id="dept_name_val">
                          <option value="none" selected>선택</option>
                          <option value="내과">내과</option>
                          <option value="외과">외과</option>
                          <option value="안과">안과</option>
                          <option value="치과">치과</option>
                        </select>
                      </div>


                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">진료날짜</span>
                        </div>
                        <input type='date' placeholder='날짜를 선택해주세요.' id="dateInput1" name="date1"> <div id="minus">-</div> 
                        <input type='date' placeholder='날짜를 선택해주세요.' id="dateInput2" name="date2"> <button type="submit" class="btn btn-secondary" id="sel_btn">검색</button>
                      </div>
                    </div>
                </form>
              </div>


              <div class="boxline">

                <div id="tavle_list_box">
                  <table class="table table-striped" style="text-align: center;">
                    <thead class="thead-dark">
                    
                      <tr>
                        <th>병원등록번호</th>
                        <th>이름</th>
                        <th>주민번호</th>
                        <th>진료과</th>
                        <th>진료날짜</th>
                        <th>기록</th>
                      </tr>   
                    </thead>
                    <tbody>

			 <% if (mrcList != null && !mrcList.isEmpty()) { 
                            for (Map<String, Object> mrcMap : mrcList) { %>
                                <tr class="click_mr">
                                    <td><%= mrcMap.get("userNo") %></td>
                                    <td><%= mrcMap.get("userName") %></td>
                                    <td><%= mrcMap.get("userSSN") %></td>
                                    <td><%= mrcMap.get("deptName") %></td>
                                    <td><%= mrcMap.get("treatment") %></td>
                                    
                                    <td>
                                    
                                    <div class="container">
                                    	<button class="btn btn-secondary"
                                    			data-toggle="modal" data-target="#myModal"
                                                 data-user-no="<%= mrcMap.get("userNo") %>"
                                                 data-care-no="<%= mrcMap.get("careNo") %>" onclick="fnClickAll(this)">진료기록
                                        </button>
                                        
   
  
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog" style="margin-right: 700px;">
      <div class="modal-content" style="width: 189%;">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          
          
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
    height: 50px;
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
        <td><div id="name_result1"></div></td>
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td><div id="ssn_result1"></div></td>
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div id="address_result1"></div></td>
      </tr>
      <tr>
        <td class="symptoms"><b>증상</b></td>
        <td colspan="3"><div id="symptoms_result"></div></td>
      </tr>
      <tr>
        <td class="opinion"><b>진단 및 소견</b></td>
        <td colspan="3"><div id="opinion_result"></div></td>
      </tr>
    </table>

  	<div class="doc_detail" style="text-align: left;">
  	
		<br> [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.

		<div style="margin-top: 20px;">
			의료기관 명칭 : <b>VitaPrimus</b> <b class="c_date"
				id="t_Date_result1" style="margin-left: 434px;"></b>
		</div>
		<br>
		<div class="side_detail">
			<div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
			<div class="doc_num">
				[ ■ ] 의사 면허 <b id="li_result1"></b> 호
			</div>
		</div>
		<br>
		<div class="doc_name">
			담당의 : <b id="d_name_result1"></b>
		</div>



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
        <td><div id="name_result2"></div></td>
        
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td><div id="ssn_result2"></div></td>
      </tr>
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3"><div id="address_result2"></div></td>
      </tr>
      <tr>
        <td class="symptoms"><b>진단명</b></td>
        <td colspan="3"><div id="dianosis_result"></div></td>
      </tr>
      <tr>
        <td class="opinion"><b>치료내용</b></td>
        <td colspan="3"><div id="t_content_result"></div></td>
      </tr>
     
    </table>

  	<div class="doc_detail" style="text-align: left;">
  	
		<br> [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.

		<div style="margin-top: 20px;">
			의료기관 명칭 : <b>VitaPrimus</b> <b class="c_date"
				id="t_Date_result2" style="margin-left: 434px;"></b>
		</div>
		<br>
		<div class="side_detail">
			<div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
			<div class="doc_num">
				[ ■ ] 의사 면허 <b id="li_result2"></b> 호
			</div>
		</div>
		<br>
		<div class="doc_name">
			담당의 : <b id="d_name_result2"></b>
		</div>



	</div>
  </div>



</div>
          
          
          
          
          
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
                                        
                                        
                                        
                                        
                                        
                                   </td>
                                </tr>
                        <% } 
                          } else { %>
                            <tr>
                                <td colspan="6">검색된 결과가 없습니다.</td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
<nav aria-label="Page navigation example" id="pageBar">
    <ul class="pagination">
        <% if (pi != null) { %>
            <li class='page-item <%= (pi.getCurrentPage() == 1) ? "disabled" : "" %>'>
                <a class="page-link" 
                   href="<%= contextPath %>/selectMrecords.se?page=<%=  pi.getCurrentPage() - 1  %>&userName=<%= request.getParameter("userName") %>&deptName=<%= request.getParameter("deptName") %>&date1=<%= request.getParameter("date1") %>&date2=<%= request.getParameter("date2") %>" 
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>

            <% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
                <li class='page-item <%= (p == pi.getCurrentPage()) ? "active" : "" %>'>
                    <a class="page-link" 
                       href="<%= contextPath %>/selectMrecords.se?page=<%= p %>&userName=<%= request.getParameter("userName") %>&deptName=<%= request.getParameter("deptName") %>&date1=<%= request.getParameter("date1") %>&date2=<%= request.getParameter("date2") %>">
                       <%= p %></a>
                </li>
            <% } %>

            <li class='page-item <%= (pi.getCurrentPage() == pi.getMaxPage()) ? "disabled" : "" %>'>
                <a class="page-link" 
                   href="<%= contextPath %>/selectMrecords.se?page=<%=  pi.getCurrentPage() + 1  %>&userName=<%= request.getParameter("userName") %>&deptName=<%= request.getParameter("deptName") %>&date1=<%= request.getParameter("date1") %>&date2=<%= request.getParameter("date2") %>"
                   aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            
            
        <% } else { %>
            <li class='page-item disabled' style="display: none;">
                <a class="page-link" href="#"></a>
            </li>
        <% } %>
    </ul>
</nav>
                
            </div>
        </div>
    </div>
          
        
      </nav>
  </section>

  <!-- section end -->
  
  <script>
  
  
  function fnClickAll(button){
	  
	 	const careNo = $(button).data('care-no');
	    const userNo = $(button).data('user-no');
	  
	  $.ajax({
		  url:'<%= contextPath%>/allmrlist.se',
		  data:{
			  careNo: careNo,
			  userNo: userNo
			  
		  },
		  success:function(res){
			  
			  console.log(res);
			  
			  $('#name_result1').text(res.userName);
			  $('#name_result2').text(res.userName);
			  
			  $('#ssn_result1').text(res.userSSN);
			  $('#ssn_result2').text(res.userSSN);
			  
			  $('#address_result1').text(res.address);
			  $('#address_result2').text(res.address);
			  
			  $('#t_Date_result1').text(res.treatDate);
			  $('#t_Date_result2').text(res.treatDate);
			  
			  $('#li_result1').text(res.licence);
			  $('#li_result2').text(res.licence);
			  
			  $('#d_name_result1').text(res.docName)
			  $('#d_name_result2').text(res.docName)
			  
			  $('#symptoms_result').text(res.symptoms);
			  $('#opinion_result').text(res.opinion);
			  $('#dianosis_result').text(res.diagnosis);
			  $('#t_content_result').text(res.treatment);
			  
			  
			  
			  
			  
			  
		  }
	  })
	  
	  
	  
	  
	  
  }
  
  
  
  
  </script>
         




<%@ include file="/views/common/footer.jsp" %>

</body>
</html>