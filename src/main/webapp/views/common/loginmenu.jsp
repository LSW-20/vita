<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%if(loginUser == null ){ %>
        <!-- case1. 로그인전 -->
        <div class="sub" id="loginMenu">
            로그인 하시면<br> 
            더 다양한 혜택을<br>
            이용할 수 있습니다.<br><br>
            <div class="btn-group-vertical" style="width: 150px;">
                <a href="<%= contextPath %>/loginPage.me" class="btn btn-success">로그인</a><p></p>
                <a href="<%= contextPath %>/loginPage.me" class="btn btn-warning">마이페이지</a><p></p>
                <a href="/vita/views/reservation/consultation_beforelogin.jsp" class="btn btn-primary">진료예약</a>
            </div>
        </div>
       
        
        
        
        <%}else{ %>
        
        <!--  case2. 로그인후 --> 
        <div class="sub" id="loginMenu">
            <b><%= loginUser.getUserName() %></b>님,<br> 방문을 환영합니다. <br><br><br>

            <div class="btn-group-vertical" style="width: 150px;">
                <a href="<%=contextPath%>/logout.me" class="btn btn-success">로그아웃</a><p></p>
                <a href="/vita/views/member/myInfo.jsp" class="btn btn-warning">마이페이지</a><p></p>
                <a href="/vita/views/reservation/consultation_AfterLogin.jsp"class="btn btn-primary">진료예약</a>
            </div>
        </div>
         <%} %>

        
