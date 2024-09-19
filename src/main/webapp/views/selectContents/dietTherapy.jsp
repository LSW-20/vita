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
        height: 3147px;
        margin-top: 153px;
    }
    #wrap {
        position: relative;
        width: 970px;
        margin: 0 auto;
    }
    #wrap img {
        width: 100%;
    }
    #wrap .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 160px;
        height: 140px;
        background: rgba(0, 255, 255, 0.5); /* 반투명 배경 */
        margin: 30px;
    }
    .text-overlay {
        position: absolute;
        color: black; /* 텍스트 색상 */
        font-size: 16px; /* 텍스트 크기 */
    }
    #dietImg{
      width: 100%;
      height: 100%;
      border: 1px solid rgb(228, 225, 225);
    }
    p{
      text-align: left;
      font-size: 14px;
    }
    footer{
        margin-top: 3300px !important;
    }
    </style>
    <section>
        <br><br>
        <div class="container" style="width: 1090px;">
          <b class="container" style="font-size: 30px;">식사요법</b>
        </div>
        <br>
        <div class="container" id="wrap">
          <img src="/vita/assets/image/추천식사요법.jpg" style="margin-left: -50px;">
          <div class="overlay" style="top: 10px; left: -4px;">
            <img id="dietImg" src="/vita/assets/image/후천성면역결핍증식.jpg">
          </div>
          <div class="text-overlay" style="top: 190px; left: 25px;">
            <a href="/vita/views/selectContents/therapy1.jsp"><b>후천성면역결핍증식</b></a><br>
            <p>비타병원 영양팀</p>
          </div>
          <div class="overlay" style="top: 10px; left: 217px;">
            <img id="dietImg" src="/vita/assets/image/후두암식.jpg">
          </div>
          <div class="text-overlay" style="top: 190px; left: 246px;">
            <a href="/vita/views/selectContents/therapy2.jsp"><b>후두암식</b></a><br>
            <p>비타병원 영양팀</p>
          </div>
          <div class="overlay" style="top: 10px; left: 437px;">
            <img id="dietImg" src="/vita/assets/image/패혈증식.jpg">
          </div>
          <div class="text-overlay" style="top: 190px; left: 466px;">
            <a href="/vita/views/selectContents/therapy11.jsp"><b>패혈증식</b></a><br>
            <p>비타병원 영양팀</p>
          </div>
          <div class="overlay" style="top: 10px; left: 659px;">
            <img id="dietImg" src="/vita/assets/image/저퓨린식.jpg">    
          </div>
          <div class="text-overlay" style="top: 190px; left: 688px;">
            <a href="/vita/views/selectContents/therapy12.jsp"><b>저퓨린식</b></a><br>
            <p>비타병원 영양팀</p>
          </div>
        </div>
        <br><br>
        <div class="container" style="width: 1100px; height: 2200px; padding: 0;">
          <div>
            <hr style="width: 933px; margin-left: 20px; background-color: black;">
          </div>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/후천성면역결핍증식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
              
              <a href="/vita/views/selectContents/therapy1.jsp"><b>후천성면역결핍증식</b></a><br>
              <p>
                필요한 영양소를 공급하고 질병ㅇ이 진행됨에 따라 영양소의 비정상적인 상태와 불내성이 나타날 때 식사를 변<br>
                형, 수정하여 영양불량상태를 예방하거나 지연시키기 위해 식사조절이 필요합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/후두암식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
              
              <a href="/vita/views/selectContents/therapy2.jsp"><b>후두암식</b></a><br>
              <p>
                후두암 진단 이후 치료를 받기위해 충분한 영양공급을 통해 암 치료를 돕고 부작용을 최소화 하기위해 식사요<br>
                법이 필요합니다.후두암의 치료는 병기나 종류에 따라 다르며 크게 수술적치료, 항암치료, 방사선치료 등이<br>
                 사용됩니다. 따라서 각 치료방법을 이해하고 치료에 따르는 부작용으로 인한 영양문제의 대처방법을 숙지하<br>
                 여 영양불량이 되지않도록 합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/화상식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
            
              <a href="/vita/views/selectContents/therapy3.jsp"><b>화상식</b></a><br>
              <p>
                화상 환자는 대사항진으로 체단백의 이화작용과 요 질소 배설이 증가되며, 단백질과 체액의 손실이 증가하여<br>
                 수분 및 전해질의 불균형을 초래할 수 있어 충분한 열량과 단백질 공급이 필요합니다
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/호모시스틴뇨증식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy4.jsp"><b>호모시스틴뇨증식</b></a><br>
              <p>
                호모시스틴 대사에 필요한 효소 결핍으로 메티오닌이 과다생성됨으로써 나타날 수 있는 여러가지 합병증을<br>
                 예방하고, 정상적인 성장과 발달을 도모하기 위해 식사요법이 필요합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/협심증식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
             
              <a href="/vita/views/selectContents/therapy5.jsp"><b>협심증식</b></a><br>
              <p>
                협심증은 심장에 산소와 영양을 공급하는 관상동맥이 좁아져 정상적인 혈액공급이 방해받는 상태로 심한 가<br>
                슴통증을 유발하게 됩니다. 주된 원인은 혈관 속의 지방 축적이므로 정상 체중을 유지하고 비만인 경우는 체<br>
                중을 감소시키는 것이 꼭 필요합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/허혈성심장질환식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy6.jsp"><b>허혈성심장질환식</b></a><br>
              <p>
                심장질환 시 식사요법은 크게 3가지로 나누어 생각할 수 있습니다.[콜레스테롤에 대한 식사요법]혈액내 콜레<br>
                스테롤의 ⅔ ~ ¾ 정도는 몸 안에서 형성된 것으로 식사를 변화시킴으로써 감소시킬 수 있습니다. 보통 콜레스<br>
                테롤의 1일 섭취량을 100㎎ 이하로 줄이는 경우에는 현저한 콜레스테롤의 감소가 생기지만 사실상 실천이 불<br>
                가능하며, 1일 섭취량을 300㎎정도로 유지하면 혈액내의 콜레스테롤...
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/항문암식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy7.jsp"><b>항문암식</b></a><br>
              <p>
                수술 직후 회복을 위한 충분한 열량과 단백질을 섭취하도록 하며, 수술 후 약 6주 정도 섬유질 섭취를 줄여 대<br>
                변 양 조절과 폐색 등의 위험을 최소화 합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/프로피온산혈증.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy8.jsp"><b>프로피온산혈증, 프로피온산증</b></a><br>
              <p>
                발린, 이소로이신, 메치오닌, 스레오닌과 같은 아미노산의 대사에 관여하는 propionyl CoA carboxylase라<br>
                는 효소의 장애로 프로피오닌산이 축적되어 뇌손상, 혈액의 산성화, 암모니아의 증가 등을 초래합니다. 상염<br>
                색체열성유전을 하며 발생빈도는 100,000명중 한 명입니다.장기적으로는 고탄수화물 식이와, 이소로이신,<br>
                 발린, 메치오닌, 스레오닌이라는 아미노산을 작은 양으로 제한한 식이를 합니다. ...
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/프라더월리증후군식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy9.jsp"><b>프라더 월리 증후군식</b></a><br>
              <p>
                비만으로 인한 합병증을 조절하기 위해 필요합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/폐렴식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy10.jsp"><b>폐렴식</b></a><br>
              <p>
                증상의 진행 중 식사량 감소로 인한 체중감소와 체조직 소모를 방지하기 위하여 충분한 에너지와 단백질의 섭<br>
                취가 매우 중요합니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/패혈증식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy11.jsp"><b>패혈증식</b></a><br>
              <p>
                패혈증 시에는 대사항진과 체단백의 이화작용으로 인하여 영양상태가 불량해지므로 적당량의 필수영양소를<br> 
                공급하는 것이 매우 중요하므로 적절한 식사조절이 필요하게 됩니다.
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
          <br>
          <div class="container border-bottom" style="width: 933px; height: 190px; display: flex; margin-left: 20px;">
            <br>
            <div class="container border" style="width: 20%; height: 170px; padding: 0;">
              <img id="dietImg" src="/vita/assets/image/저퓨린식.jpg">
            </div>
            <div class="container" style="width: 80%; height: 170px; margin-left: 10px;">
           
              <a href="/vita/views/selectContents/therapy12.jsp"><b>저퓨린식</b></a><br>
              <p>
                통풍이나 신결석 혹은 고요산혈증 환자에게 적용되며, 퓨린 섭취를 1일 150mg 정도로 제한하여 체내의 요산 축<br>
                척을 줄임으로써 통풍이나 신결석의 발생 및 재발을 예방하기 위한 식사입니다
              </p>
              <p><b>비타병원 영양팀</b></p>
            </div>        
          </div>
        </div>
        
    </section>

<!-- footer start  -->
<%@ include file="/views/common/footer.jsp" %>
<!-- footer end -->
</body>
</html>
