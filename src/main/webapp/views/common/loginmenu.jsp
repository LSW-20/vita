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
                 <a href="<%= contextPath %>/consultationBL.rv" class="btn btn-primary">진료예약</a><br>
            </div>
        </div>
       
        
        
        
        <%}else{ %>
        
        <!--  case2. 로그인후 --> 
        <div class="sub" id="loginMenu">
            <b><%= loginUser.getUserName() %></b>님,<br> 방문을 환영합니다. <br><br><br>

            <div class="btn-group-vertical" style="width: 150px;">
                <a href="#" class="btn btn-success" id="logout_btn" onclick="fnLogout();">로그아웃</a><p></p>
                <a href="<%= contextPath %>/ad_doc.me?userId=<%= loginUser.getUserId() %>" class="btn btn-warning" >마이페이지</a><p></p>
								<% if(loginUser != null) { %>
		            <a href="<%= contextPath %>/consultationAL.rv" class="btn btn-primary">진료예약</a><br>
		            <%} %>
            </div>
        </div>
          
         <%} %>
         
         <script>
         	function fnLogout(){
         		
         		if(confirm('로그아웃 하시겠습니까?') == true){
	         		location.href = "<%=contextPath%>/logout.me";
         		}
         		
         	}
         	
         </script>

        
