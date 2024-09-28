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
                        <input id="dateInput2" type='date' placeholder='날짜를 선택해주세요.' name="date2"> <button type="submit" class="btn btn-secondary" id="sel_btn">검색</button>
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
                                <tr>
                                    <td><%= mrcMap.get("userNo") %></td>
                                    <td><%= mrcMap.get("userName") %></td>
                                    <td><%= mrcMap.get("userSSN") %></td>
                                    <td><%= mrcMap.get("deptName") %></td>
                                    <td><%= mrcMap.get("treatment") %></td>
                                    <td><button class="btn btn-secondary">진료기록</button></td>
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
         




<%@ include file="/views/common/footer.jsp" %>

</body>
</html>