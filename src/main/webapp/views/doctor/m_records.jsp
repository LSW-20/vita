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
                <form action="">
                  <div class="care_select_container mt-5">

                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">환자명</span>
                        </div>
                        <input type="text" class="" placeholder="Name">
                      </div>

                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">진료과</span>
                        </div>

                        <select name="select">
                          <option value="none" selected>선택</option>
                          <option value="option 1">내과</option>
                          <option value="option 2">외과</option>
                          <option value="option 3">성형외과</option>
                          <option value="option 3">치과</option>
                        </select>
                      </div>


                      <div class="input-group mb-3">
                        <div class="input-group-prepend">
                          <span class="input-group-text">진료날짜</span>
                        </div>
                        <input  type='date' placeholder='날짜를 선택해주세요.'> <div id="minus">-</div> 
                        <input id="dateInput" type='date' placeholder='날짜를 선택해주세요.'> <button class="btn btn-secondary" id="sel_btn">검색</button>
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
                        <th>성별</th>
                        <th>진료과</th>
                        <th>진료날짜</th>
                        <th>기록</th>
                      </tr>
                    </thead>
                    <tbody>
                      <!-- for문 -->
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                      <tr>
                       <td>11234</td>
                       <td>홍길동</td>
                       <td>940404-1******</td>
                       <td>남</td>
                       <td>내과</td>
                       <td>24-09-09</td>
                       <td><button class="btn btn-secondary">진료기록</button></td>
                      </tr>
                    </tbody>
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

            
            

          </div>
          
        
      </nav>
  </section>

  <!-- section end -->
         




<%@ include file="/views/common/footer.jsp" %>

</body>
</html>