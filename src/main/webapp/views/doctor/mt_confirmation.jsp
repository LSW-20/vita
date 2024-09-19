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
                  <div>병원등록번호 : <span></span> </div><br>
                  <div>주민번호 : <span></span> </div><br>
                  <div>전화번호 : <span></span> </div><br>
                </div>
              </div>


              <div id="table-container">
                <table class="table table-bordered">
                  <tr>
                    <th>병원등록번호</th>
                    <th>이름</th>
                    <th>주민등록번호</th>
                    <th>진료과</th>
                    <th>전화번호</th>
                    <th>진료기록</th>
                  </tr>

                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                  <tr class="tr_click">
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td>asdasdsadasd</td>
                    <td><button class="btn btn-warning">보기</button></td>
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
				



<%@ include file="/views/common/footer.jsp" %>


</body>
</html>