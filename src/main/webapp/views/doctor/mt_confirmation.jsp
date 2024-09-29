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
				List<Member> doculist = (List<Member>)request.getAttribute("doculist");
				
		%>

</head>
<body>


<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/doctorSideBar.jsp" %>



				      
				   <!-- content 부분 start -->
             <style>
             
             footer{margin-top:1500px;}
				      section{height:1347px}
				      #sideMenu{height:100%}
				      
              h2{font-size: 3rem;}

              .userSelectDiv{
                width: 400px;
                height: 300px;
                border: 1px solid black;
                margin-top: 40px;
                padding: 10px;
                border-radius: 20px;
              }
              .userSelName{margin-top: 20px;}
              #userName{
                font-size: 30px;
                margin-left: 48px;
              }
              #department{
                font-size: 20px;
                margin-left: 100px;
              }
              #userNumbers{
                border-top: 1px solid lightgray;
                width: 320px;
                margin: auto;
              }
              h3{color: gray;}

              
              #table-container{
                margin-top: 40px;
                min-height: 600px;
            }

              table{text-align: center;}
              #pageBar{margin-left: 440px;}
              
              .tr_click{
              
              	cursor:pointer;
              }
              .tr_click:hover {
              	background-color: lightgray;
              }
              th{
              	background-color: #0000008c;
              	color: white;
              	
              }
              .text_value{
              	margin-left: 10px;
              }
             
             </style>
             
             
             
            <div class="container mt-5">
              <h2>발급 신청 관리</h2><br>
              <h3>진료확인서 신청목록</h3>
              

              <div class="userSelectDiv">
                <div class="userSelName">
                  <span class="userSel-1" id="userName">환자이름</span>
                  <span class="userSel-1" id="department">진료과</span>
                </div>
                <div id="userNumbers">
                  <br>
                  <div id="user_no_div"><b>병원등록번호 :</b> <span id="user_no_value" class="text_value"></span> </div><br>
                  <div id="user_ssn_div"><b>주민번호 : </b><span id="user_ssn_value" class="text_value"></span> </div><br>
                  <div id="user_phone_div"><b>전화번호 : </b><span id="user_phone_value" class="text_value"></span> </div><br>
                </div>
              </div>


              <div id="table-container">
                <table class="table table-bordered" id="docuTable">
                
                  <tr>
                    <th>병원등록번호</th>
                    <th>이름</th>
                    <th>주민등록번호</th>
                    <th>진료과</th>
                    <th>전화번호</th>
                    <th>진료기록</th>
                  </tr>
                  
        
        <% if (doculist == null || doculist.isEmpty()) { %>
            <tr>
                <td colspan="6" style="text-align: center;">존재하는 게시글이 없습니다.</td>
            </tr>
        <% } else { %>
            <% for (Member m : doculist) { %>
                <tr class="tr_click">
                    <td id="">
                    	<%= m.getUserNo() %>
                    	<input type="hidden" value ="<%= m.getCareNo() %>" class="care_no_data1">
                    	<input type="hidden" value ="<%= m.getUserNo() %>" class="user_no_data1">
                    </td>
                    <td id=""><%= m.getUserName() %></td>
                    <td id=""><%= m.getUserSSN() %></td>
                    <td id=""><%= m.getDeptName() %></td>
                    <td id=""><%= m.getPhone() %></td>
                    <td>
                    	<!-- <button class="btn btn-primary" onclick="fnfilesearch();">보기</button> -->
                    	
  <style>



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
  #table_container_tb{
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
  .modal-content{
    
    width: 902px;
    height: 1036px;
    margin-top: 60px;
    margin-left: -185px;
  }
  .modal-footer{
  	margin-top: -16px;
    border: none;
    margin-right: 300px;
  }
  #yes_btn2{
  	margin-right: 145px;
  	
  }



  </style>
  
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
  	
<div class="container">
    <div class="btns_div">
      <button id="btn1_1" class="btn btn-secondary" 
        data-toggle="modal" 
        data-target="#myModal2" 
        data-care-no2="<%= m.getCareNo() %>" 
        data-user-no2="<%= m.getUserNo() %>" 
        onclick="fnfilesearch2(this);">보기</button>
    </div>
    

 <!-- The Modal -->
 <div class="modal fade" id="myModal2">
   <div class="modal-dialog">
     <div class="modal-content" style="margin-top: 170px;">
     

<div class="t_container">
  <div class="t_header">
    진&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;료&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;확
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서
  </div>
  <div class="table_div">
    <table border="1" id="table_container">
      <tr>
        <td class="u_name"><b>환자의 성명</b></td>
        <td id="userName_result2">qweqwe</td>
   
        <td class="u_ssn"><b>주민등록번호</b></td>
        <td id="userSSN_result2">wqeqwe</td>
      </tr>
      
      <tr>
        <td class="u_addr"><b>환자의 주소</b></td>
        <td colspan="3" id="userAddress_result2">asdasdasdsa</td>
      </tr>
      <tr>
        <td class="symptoms"><b>진단명</b></td>
        <td colspan="3" id="diagnosisName_result2">asdasd</td>
      </tr>
      <tr>
        <td class="opinion"><b>치료내용</b></td>
        <td colspan="3" id="treatmentContent_result2">asdasdasd</td>
      </tr>
      
    </table>

  <div class="doc_detail" style="text-align: left;">
      <br>
      [의료법] 제 17 조 및 같은 법 시행규칙 제9조1항에 따라 위와 같이 진단합니다.
      
      <div style="margin-top: 20px;">의료기관 명칭 : <b>VitaPrimus</b> <b class="c_date" id="treatmentDate_result2" style="margin-left: 434px;"></b></div>
      <br>
      <div class="side_detail">
        <div>주소 : 서울특별시 금천구 가산디지털2로 95 KM타워 3층 305호</div>
        <div class="doc_num">[ ■ ] 의사  면허 <b id="doc_licence2"></b> 호</div>
      </div>
      <br>
      <div class="doc_name">담당의 : <b id="docName_result2"></b></div>

      
      
    </div>
    
    <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" id="yes_btn2" onclick="fnYes2();"
        	data-care-no="<%= m.getCareNo() %>" >승인</button>
      	 
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="no_btn2" onclick="fnNo2();"
         data-care-no="<%= m.getCareNo() %>" >거절</button>
      </div>
       
  </div>



</div>

  
  </div>
       
      
     </div>
   </div>
 </div>
                    	
                    </td>
                </tr>
            <% } %>
        <% } %>
									
                  
                 
              		
               
                </table>
                
              <nav aria-label="Page navigation example" id="pageBar">
                  <ul class="pagination" style="margin-left: 88px;">
                  
                  
                    <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
                      <a class="page-link" href="<%= contextPath %>/dia_list.do?page=<%=pi.getCurrentPage()-1%>&type=진료확인서">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    
                    <% for(int p = pi.getStartPage(); p<= pi.getEndPage(); p++) {%>
                    <li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
                    	<a href='<%= contextPath %>/dia_list.do?page=<%=p%>&type=진료확인서' class="page-link"><%= p %></a>
                    </li>
                    <%} %>
                    
                    <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
                      <a class="page-link" href='<%= contextPath %>/dia_list.do?page=<%=pi.getCurrentPage()+1 %>&type=진료확인서'>
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                    
                 
                  </ul>
                </nav>
                
              </div>

            </div>

            <!-- content 부분 end -->
        </nav>

  </section>

    <!-- section end -->
    
    <script>
    
  
		$(document).ready(function() {
			  $(document).on('click', '#docuTable .tr_click', function() {
				  
			        let $userNo = $(this).find('td').eq(0).text(); // 병원등록번호
			        let $userName = $(this).find('td').eq(1).text(); // 이름
			        let $userSSN = $(this).find('td').eq(2).text(); // 주민등록번호
			        let $deptName = $(this).find('td').eq(3).text(); // 진료과
			        let $userPhone = $(this).find('td').eq(4).text(); // 전화번호
			        
			        // 해당 span에 값 설정
			        $('#user_no_value').html($userNo);
			        $('#user_ssn_value').html($userSSN);
			        $('#user_phone_value').html($userPhone);
			        $('#userName').html($userName); 
			        $('#department').html($deptName); 
			        
			       
			});
	});
		
		
		
		function fnfilesearch2(button) {
		    const careNo = $(button).data('care-no2');
		    const userNo = $(button).data('user-no2');

		    $.ajax({
		        url: '<%= contextPath %>/diagnosis.se',
		        data: {
		            careNo: careNo,
		            userNo: userNo,
		            type: '진료확인서'
		        },
		        success: function(res) {
		            console.log(res);  

		            let doc = res.Doctor;
		            let mem = res.Member; 
		            let mrc = res.Mrecords;

		            $('#userName_result2').text(mem.userName);
		            $('#userSSN_result2').text(mem.userSSN);
		            $('#userAddress_result2').text(mem.address);
		            $('#diagnosisName_result2').text(mrc.diagnosisName);
		            $('#treatmentContent_result2').text(mrc.treatmentContent);
		            $('#treatmentDate_result2').text(mrc.treatmentDate);
		            $('#doc_licence2').text(doc.licenceNo);
		            $('#docName_result2').text(doc.doctorName);
		        }
		    });
		}
		
		

		function fnYes2(){
			
			if(confirm('승인하시겠습니까?')){
				
				 const careNo = $('#myModal2').find('#yes_btn2').data('careNo');
					console.log(careNo);
				 
					$.ajax({
						url: '<%= contextPath %>/dia_mt.up',
						data:{
							yes: 'Y',
							careNo: careNo,
							type: '진료확인서'
						},
						success:function(res){
							
							console.log(res);
							
							if(res > 0){
								alert('해당 "진료확인서"를 성공적으로 승인하였습니다');
								location.reload();
							}else{
								alert('승인오류');
							}
							
							
						}
					})
					
			}
			
		}
		
		
		
		function fnNo2(){
			
			if(confirm('거절하시겠습니까?')){
				
				 const careNo = $('#myModal2').find('#no_btn2').data('careNo');
					console.log(careNo);
				 
					$.ajax({
						url: '<%= contextPath %>/dia_mt.up',
						data:{
							yes: 'N',
							careNo: careNo,
							type: '진료확인서'
						},
						success:function(res){
							
							console.log(res);
							
							if(res > 0){
								alert('해당 "진료확인서"를 거절하였습니다');
								location.reload();
							}else{
								alert('거절오류');
							}
							
							
						}
					})
					
			}
			
		}
		
	
    
    
    </script>
				



<%@ include file="/views/common/footer.jsp" %>


</body>
</html>