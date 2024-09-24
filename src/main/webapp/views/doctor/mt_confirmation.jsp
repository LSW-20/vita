<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



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
									
                  
                 
              		
               
                </table>
                
                <nav aria-label="Page navigation example" id="pageBar">
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
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
    fnDocumentSel()
    
	function fnDocumentSel(){
		
		$.ajax({
			url: '<%= contextPath%>/docuSel.do',
			data : {
				 type : '진료확인서'
			},
			
			success: function(res){
				
				console.log(res);  // [{}, {}]
				let table = '';
				
				for(let i=0; i<res.length; i++){
					
					table += '<tr class="tr_click">'
								 +  '<td id="u_no_value">'+ res[i].userId + '</td>'
								 +  '<td id="u_name_value">'+ res[i].userType + '</td>'
								 +  '<td id="u_ssn_value">'+ res[i].phone + '</td>'
								 +  '<td id="u_dname_value">'+ res[i].userName + '</td>'
								 +  '<td id="u_phone_value">'+ res[i].userSSN + '</td>'
								 +  '<td><button class="btn btn-primary">보기</button></td>' 
								+ '</tr>'
					
				}
				
				$('#docuTable').append(table);// 제이쿼리 append 는 기존 내용을 유지하면서 새로 추가할때 씀
				
			}
			
		})
	
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
	}
    
	
	
    
    
    </script>
				



<%@ include file="/views/common/footer.jsp" %>


</body>
</html>