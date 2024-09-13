<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container p-3">

    <!-- Header, Nav start -->
    <%@ include file="/views/common/header.jsp" %>
    <!-- Header, Nav end -->

    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px">

      <div class="container border p-5 m-4 rounded">
        <h2 class="m-4" style="color: orangered;"><%= request.getAttribute("msg") %></h2>
      </div>

    </section>
    <!-- Section end -->

    <!-- Footer start -->
    <%@ include file="/views/common/footer.jsp" %>
    <!-- Footer end -->

  </div>
  

</body>
</html>