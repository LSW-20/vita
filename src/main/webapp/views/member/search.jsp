<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
    section{
       /* background-color: aqua; */
       width: 100%;
       height: 1300px;
       position: absolute;
       top: 80px;
    }
    .search-box {
       width: 1500px;
       height: 80px;
       margin: 0 auto;
       display: flex;
       justify-content: center;
       align-items: center;
       border: 1px solid #ccc;
       padding: 10px;
       margin-top: 100px; 
    }
    .search-box span{
       font-size: 15px;
       font-weight: 600;

    }
    .input-field {
       width: 450px;
       height: 40px;
       border: 1px solid rgb(207, 207, 207);
    }
    .btn-search {
       height: 40px;
       width: 100px;
       margin-left: 10px;
       background-color: #1F2B6C;
       border: none;
    }
    .btn-search:hover {
       background-color: #1F2B6C;
       border-color: #1F2B6C;
    }
    .btn-search img {
       width: 20px; /* 이미지의 크기 조절 */
       height: 20px;
       margin-right: 5px; /* 이미지와 텍스트 사이 여백 */
       margin-top: -2px;
    }
    .container12 {
       display: flex;
       justify-content: center; /* 카드들을 가운데 정렬 */
       gap: 100px; /* 카드 사이의 간격 조정 */
    }
    .card1, .card2, .card3 {
       width: 300px;
       margin-top: 50px;
      
    }
    .card-img-top {
       width: 100%; /* 이미지가 카드의 너비에 맞게 조정 */
    }
    footer{
      background-color: #1F2B6C;
      position:absolute;
      width: 100%;
      height: 300px;
      margin-top: 1100px;
	  }
            
	</style>

<body>
	<%@ include file="/views/common/header.jsp" %>

		<section>
       <nav>
         <form action="">
            <div class="container11">
                <div class="search-box">
                   <span>의료진 성명이나 질병을 입력하세요.&nbsp;&nbsp;&nbsp;&nbsp;</span>
                      <input type="text" class="input-field" placeholder="  검색어를 입력하세요. ">
                         <a href="#"><button class="btn btn-primary btn-search">
                            <img src="/vita/assets/image/검색버튼2.png" alt="돋보기 아이콘">검색</button>
                </div>
            </div>
            <div class="container12">
                <div class="card1" style=" margin-left: -100px;">
                  <img class="card-img-top" src="/vita/assets/image/시우.jpg" alt="Card image" style="width:300px;">
                    <div class="card-body" style="background-color: #c6dbf0; height: 300px;">
                     	 <h4 class="card-title"><strong>박시우</strong></h4>
                          <p class="card-text">내과</p><br>
                          <p class="card-text">식도, 위, 대장, 위내시경, <br> 대장내시경 검사 및 치료, <br>내시경초음파, 위장관기능검사</p><br>
                          <a href="#" class="btn btn-primary">선택</a>
                    </div>
                </div>
                <div class="card2">
                  <img class="card-img-top" src="/vita/assets/image/상우님.jpg" alt="Card image" style="width:300px; height: 400px;">
                  <div class="card-body" style="background-color: #c6dbf0; height: 300px;">
                    <h4 class="card-title"><strong>임상우</strong></h4>
                    <p class="card-text">외과</p><br>
                    <p class="card-text">정형외과 마취, 중환자의학,<br>통증생리, 심장판막질환, 관상동맥질환, 대동맥질환, 선천성 심질환 </p><br>
                    <a href="#" class="btn btn-primary">선택</a>
                  </div>
                </div>
                <div class="card3">
                    <img class="card-img-top" src="/vita/assets/image/재운님.jpg" alt="Card image" style="width:300px; height: 400px;">
                      <div class="card-body" style="background-color: #c6dbf0; height: 290px;">
                          <h4 class="card-title"><strong>황재운</strong></h4>
                              <p class="card-text">치과</p><br>
                              <p class="card-text">치주질환, 치주성형, 치주조직재생, 임플란트, 충치치료, 심미수복치료, 치아미백, 근관치료 및 보철치료</p><br>
                                  <a href="#" class="btn btn-primary" style="margin-top: -15px;">선택</a>
                      </div>
                  </div>
                  <div class="card2">
                    <img class="card-img-top" src="/vita/assets/image/준수님.jpg" alt="Card image" style="width:300px;">
                    <div class="card-body" style="background-color: #c6dbf0; height: 300px;">
                      <h4 class="card-title"><strong>정준수</strong></h4>
                      <p class="card-text">안과</p><br>
                      <p class="card-text">사시, 소아안과, 성형안과, 백내장, 망막, 유리체, 포도막염, 황반변성, 유전성 망막질환,고도근시 </p><br>
                      <a href="#" class="btn btn-primary" style="margin-top: -10px;">선택</a>
                    </div>
                  </div>
            </div>
         </form>
       </nav>
		</section>
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>