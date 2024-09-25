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
              <h3>진단서 신청목록</h3>
              

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
                    <td id=""><%= m.getUserNo() %></td>
                    <td id=""><%= m.getUserName() %></td>
                    <td id=""><%= m.getUserSSN() %></td>
                    <td id=""><%= m.getDeptName() %></td>
                    <td id=""><%= m.getPhone() %></td>
                    <td>
                    	<button class="btn btn-primary" onclick="fnfilesearch();">보기</button>
                    </td>
                </tr>
            <% } %>
        <% } %>
									
                  
                 
              		
               
                </table>
                
              <nav aria-label="Page navigation example" id="pageBar">
                  <ul class="pagination" style="margin-left: 88px;">
                  
                  
                    <li class='page-item <%=pi.getCurrentPage() == 1 ? "disabled" : ""%>'>
                      <a class="page-link" href="<%= contextPath %>/dia_list.do?page=<%=pi.getCurrentPage()-1%>&type=진단서">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    
                    <% for(int p = pi.getStartPage(); p<= pi.getEndPage(); p++) {%>
                    <li class='page-item <%=p == pi.getCurrentPage() ? "active" : ""%>'>
                    	<a href='<%= contextPath %>/dia_list.do?page=<%=p%>&type=진단서' class="page-link"><%= p %></a>
                    </li>
                    <%} %>
                    
                    
                    
                    <li class='page-item <%= pi.getCurrentPage() == pi.getMaxPage() ? "disabled" : "" %>'>
                      <a class="page-link" href='<%= contextPath %>/dia_list.do?page=<%=pi.getCurrentPage()+1 %>&type=진단서'>
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
		    $('#docuTable').on('click', '.tr_click', function() {
		        
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
		
		function fnfilesearch(){
			
			$.ajax({
				url:'<%= contextPath%>/m_records.me',
				data:{
					userNo: 
				},
				success:function(res){
					
				}
			})
			
		}
		
		
		
		
	/* } */
    
	
	/* fnDocumentSel(); */
    
    
    </script>
				



<%@ include file="/views/common/footer.jsp" %>


</body>
</html>