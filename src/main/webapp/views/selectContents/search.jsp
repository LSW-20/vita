<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- header start  -->
<%@ include file="/views/common/header.jsp" %>
<!-- header end -->

    <style>
    section{
        position:absolute;
        width: 100%;
        height: 1147px;
        margin-top: 153px;
    }
    td{
      text-align: left;
      font-size: 14px;
    }
    footer{
        margin-top: 1300px !important;
    }
    </style>
    <section>
      <div class="container" style="text-align: center; width: 1100px; height: auto;">
        <br>
        <div class="container" style="text-align: left; font-size: 40px; height: 80px;"><b>통합 검색</b></div>
        <div class="container border" style="height: 10px; background: gray; margin-left: 10px;"></div><br><br>
        <div class="container" style="text-align: left; width: 1000px; height: auto;">
          <p>통합검색결과: <b style="color: #0E787C;">'<%= request.getParameter("search") %>'</b> 검색 결과가 총 <b style="color: #0E787C;">
          <% if(request.getParameter("search").contains("진료과") || request.getParameter("search").contains("의료진") || request.getParameter("search").contains("진료") || request.getParameter("search").contains("의료")) { %>
          4건
          <% }else { %>
          0건
          <% } %>
          </b> 입니다.</p>
          <div>
          <% if(request.getParameter("search").contains("진료과")  || request.getParameter("search").contains("진료")) {%>
            <b style="font-size: 24px;">메뉴 바로가기</b>
            <div class="container border" style="width: 930px; height: auto; margin-top: 10px; background-color: #fafafa; margin-left: 0px;">			
              <ul>
                <li style="margin-top: 10px;">의료진/진료과</li>
                <a href="http://localhost:9999/vita/department.do" style="color: #0E787C;">http://localhost:9999/vita/department.do</a>
              </ul>    
            </div>
            <br>
                    
            <!-- 진료과 -->
            
            <div class="container" style="width: 930px; border-bottom: 1px solid black; padding: 0px; margin-bottom: -12px; margin-left: 0px;">
            	<b style="font-size: 24px;">진료과</b><span>(<b>총</b> <span style="color: #0E787C;">4건</span>)</span> 
            </div> 
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px; border-top: 1px solid black;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/내과.jpg" style="width: 130px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 100px; height: 50px;">
                  내과
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                내장의 기관에 생긴 병을 외과적 수술에 의하지 않고 치료하는 부서<br>
                <a href="http://localhost:9999/vita/dept_Introduce1.do" style="color: #0E787C;">http://localhost:9999/vita/dept_Introduce1.do</a>
              </div>
            </div>
            
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/외과.jpg" style="width: 130px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 100px; height: 50px;">
                	외과
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                신체 여러 기관의 질병에 대하여 주로 수술을 하여 치료하는 부서<br>
                <a href="http://localhost:9999/vita/dept_Introduce2.do" style="color: #0E787C;">http://localhost:9999/vita/dept_Introduce2.do</a>
              </div>
            </div>

						<div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/치과.jpg" style="width: 130px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 100px; height: 50px;">
                  치과
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                치아와 잇몸, 치주조직, 턱과 얼굴의 질병을 진단 및 예방하고 치료하는 부서<br>
                <a href="http://localhost:9999/vita/dept_Introduce3.do" style="color: #0E787C;">http://localhost:9999/vita/dept_Introduce3.do</a>
              </div>
            </div>
            
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/안과.jpg" style="width: 130px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 100px; height: 50px;">
                  안과
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                눈의 해부적인 구조, 기능, 질환과 관련된 의학으로 눈의병을 치료하는 부서<br>
                <a href="http://localhost:9999/vita/dept_Introduce4.do" style="color: #0E787C;">http://localhost:9999/vita/dept_Introduce4.do</a>
              </div>
            </div>
            <% } %>
            <!-- 의료진 -->
            <% if(request.getParameter("search").contains("의료진")  || request.getParameter("search").contains("의료")){%>
            <div class="container" style="width: 930px; border-bottom: 1px solid black; padding: 0px; margin-bottom: -12px; margin-left: 0px;">
            	<b style="font-size: 24px;">의료진</b><span>(<b>총</b> <span style="color: #0E787C;">4건</span>)</span> 
            </div> 
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px; border-top: 1px solid black;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/시우.jpg" style="width: 110px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 130px; height: 50px; margin-left: -25px;">
                  <b>박시우</b><span style="color: #0E787C; font-size: 14px;">&nbsp;내과</span>
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                식도, 위, 대장, 위내시경, 대장내시경 검사 및 치료, 내시경초음파, 위장관기능검사<br>
                <a href="http://localhost:9999/vita//schedule.doc?dept=내과" style="color: #0E787C;">http://localhost:9999/vita//schedule.doc?dept=내과</a>
              </div>
            </div>
            
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/상우님.jpg" style="width: 110px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 130px; height: 50px; margin-left: -25px;">
                	<b>임상우</b><span style="color: #0E787C; font-size: 14px;">&nbsp;외과</span>
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                정형외과 마취, 중환자의학, 통증생리, 심장판막질환, 관상동맥질환, 대동맥질환, 선천성 심질환 <br>
                <a href="http://localhost:9999/vita//schedule.doc?dept=외과" style="color: #0E787C;">http://localhost:9999/vita//schedule.doc?dept=외과</a>
              </div>
            </div>

						<div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/재운님.jpg" style="width: 110px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 130px; height: 50px; margin-left: -25px;">
                  <b>황재운</b><span style="color: #0E787C; font-size: 14px;">&nbsp;치과</span>
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                치주질환, 치주성형, 치주조직재생, 임플란트, 충치치료, 심미수복치료, 치아미백, 근관치료 및 보철치료 <br>
                <a href="http://localhost:9999/vita//schedule.doc?dept=치과" style="color: #0E787C;">http://localhost:9999/vita//schedule.doc?dept=치과</a>
              </div>
            </div>
            
            <div class="container border-top" style="width: 930px; height: auto; margin-top: 10px; display: flex; margin-left: 0px;">
              <div class="container" style="width: 100px; height: 150px; padding: 0px; margin-top: 20px;">
                <div class="container" style="width: 100px; height: 100px; margin-left: -32px;">
                  <img src="/vita/assets/image/준수님.jpg" style="width: 110px; height: 100px;">
                </div>
                <div class="container" style="text-align: center; width: 130px; height: 50px; margin-left: -25px;">
                  <b>정준수</b><span style="color: #0E787C; font-size: 14px;">&nbsp;안과</span>
                </div>
              </div>
              <div class="container" style="width: 800px; height: 130px; margin-top: 20px;">
                사시, 소아안과, 성형안과, 백내장, 망막, 유리체, 포도막염, 황반변성, 유전성 망막질환,고도근시 <br>
                <a href="http://localhost:9999/vita//schedule.doc?dept=안과" style="color: #0E787C;">http://localhost:9999/vita//schedule.doc?dept=안과</a>
              </div>
            </div>
            <% } %>
          </div>
        </div>
      </div>
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
