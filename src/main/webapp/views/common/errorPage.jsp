<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
section{
  position:absolute;
  height: 350px;
  margin-top: 170px;
}

footer {
    margin-top: 700px; /* 페이지마다 footer 조금씩 조정 */
}
</style>

</head>

<body>
    <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->
	
    <!-- Section start -->
    <section class="row" style="min-height: 500px;">

      <div class="container border p-5 rounded" style="margin-left: 400px;">
        <h2 class="m-4" style="color: orangered;"><%= request.getAttribute("msg") %></h2>
      </div>

    </section>
    <!-- Section end -->
  
      <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

</body>
</html>