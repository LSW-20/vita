<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header start -->

<!-- header end -->



<!-- section start -->
<style>

section{
    position:absolute;
    width: 100%;
    height: 1350px;
    margin-top: 153px;
}


.all{
    width: 100%;
    height: 100%;
    display: flex;
}

        
#side_menu{
    background-color: #2237b3;
    width: 20%;
}

#content{
    width: 80%;
    height: 100%;
}




#adminPage{
    background-color: #26358a;
    color: white;
    font-size: 28px;
    font-weight: 900;
    line-height: 120px;
    text-align: center;
}

#side_menu div:not(.no_style) {
    width: 100%;
    height: 120px;
}
.no_style2, .no_style4 {
    height: 50%;
    display: flex;
    align-items: center;
}
.no_style8 {
    display: flex;
    align-items: center;
}
.no_style6 {
    height: 33%;
    display: flex;
    align-items: center;
}


.show_and_hide {
    display: block !important;
    
    display: flex !important;
    flex-direction : column !important;       
}

#side2, #side4, #side6, #side8 {
    display: none;
    border-top: 1px solid rgba(223, 214, 214, 0.74);

    color: white;
    padding-left: 40px;
}





#side1, #side2, #side5, #side6 {
    background-color: #2237b3;
}
#side3, #side4, #side7, #side8 {
    background-color: #2f4bcc;
}

#side1_event, #side3_event, #side5_event, #side7_event {
    color: white;
    font-size: 20px;
    line-height: 120px;
    padding-left: 30px;
}




#admin_name {
    border: 1px solid rgb(67, 23, 187);
    border-width: 10px;
    border-radius: 30px;

    width: 300px;
    height: 80px;
    font-size: 32px;
    font-weight: 550;
    margin-left: 100px;

    display: flex; /* '관리자 xxx님'을 수직, 수평 정렬시키기 위한 3줄 */
    justify-content: center;
    align-items: center;

}


</style>



<script>

$(document).ready(function() {

    $('#side1_event').on("click", function(evt){
        $('#side2').toggleClass('show_and_hide');
    })
    $('#side3_event').on("click", function(evt){
        $('#side4').toggleClass('show_and_hide');
    })
    $('#side5_event').on("click", function(evt){
        $('#side6').toggleClass('show_and_hide');
    })
    $('#side7_event').on("click", function(evt){
        $('#side8').toggleClass('show_and_hide');
    })

})

</script>





<section>

<div class="all"> 

    <div id="side_menu">
        <div id="adminPage">
            <a href="<%= contextPath %>/home.admin">관리자 전용 페이지</a>
        </div>


        <div id="side_elements">
            <div id="side1"><span id="side1_event">• &nbsp계정 관리</span></div> <!-- div가 아닌 span으로 영역을 줄이니 이벤트 전파 발생x-->
            <div id="side2">
                <div class="no_style2"><a href="<%= contextPath %>/manageD.admin">-  &nbsp 의료진 계정 관리</a></div>  
                <div class="no_style2"><a href="<%= contextPath %>/manageM.admin">-  &nbsp 회원 계정 관리</a></div>
            </div>
            <div id="side3"><span id="side3_event">• &nbsp사이트 관리</span></div>
            <div id="side4">
                <div class="no_style4"><a href="<%= contextPath %>/noticeList.admin">-  &nbsp 공지사항 관리</a></div>
                <div class="no_style4"><a href="<%= contextPath %>/newsList.admin">-  &nbsp 뉴스 게시판 관리</a></div>
            </div>      
            <div id="side5"><span id="side5_event">• &nbsp예약 관리</span></div>
            <div id="side6">
                <div class="no_style6"><a href="<%= contextPath %>/manageCA.admin">-  &nbsp 진료 예약 관리</a></div>
                <div class="no_style6"><a href="<%= contextPath %>/manageCH.admin">-  &nbsp 건강검진 예약 관리</a></div>
                <div class="no_style6"><a href="<%= contextPath %>/manageCOM.admin">-  &nbsp 건강검진 연계기업 관리</a></div>
            </div>
            <div id="side7"><span id="side7_event">• &nbsp고객의 소리</span></div>
            <div id="side8">
                <div class="no_style8"><a href="<%= contextPath %>/list.cs">- &nbsp Q&A 답변 및 관리</a></div>
            </div>
        </div>
    </div>
    
    <div id="content" > <!-- 여기가 페이지 내용 -->


                <br><br>
        
                <div id="admin_name">
                    관리자 <%= loginUser.getUserName() %>님
                </div>
        
                <br><br><br>
