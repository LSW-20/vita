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
              #table-container{margin-top: 40px;}
              table{text-align: center;}
             
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
                    <td>병원등록번호</td>
                    <td>이름</td>
                    <td>주민등록번호</td>
                    <td>진료과</td></nav>
                    <td>전화번호</td>
                    <td></td>
                  </tr>

                  <tr>
                    <td><!-- for문 돌려서 추가 --></td>
                    <td><!-- for문 돌려서 추가 --></td>
                    <td><!-- for문 돌려서 추가 --></td>
                    <td><!-- for문 돌려서 추가 --></td>
                    <td><!-- for문 돌려서 추가 --></td>
                    <td><button class="btn btn-warning">보기</button></td>
                  </tr>
                </table>
              </div>




            </div>

            <!-- content 부분 end -->
        </nav>
           
    </section>

    <!-- section end -->




<%@ include file="/views/common/footer.jsp" %>

</body>
</html>