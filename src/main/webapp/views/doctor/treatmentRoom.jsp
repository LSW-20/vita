<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="com.br.vita.member.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<% 
	
		Member mem = (Member)request.getAttribute("Member");

%>


</head>
<body>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/doctorSideBar.jsp" %>



   <style>
   
  footer{margin-top: 1853px;}
 	section{height:1700px;}
 	#sideMenu{height:100%}
 	
              h2{font-size: 2rem;}
              .doctorDiv{
                margin:50px;
                margin-left: 75px;
              }
              .doctor_container{
                border: 2px solid black;
                width: 450px;
                height: 220px;
                margin-top: 40px;
                margin-right: 30px;
                background-color: rgb(170, 255, 237);
                border-radius: 15px;
              }
              .d_container{
                border-bottom: 2px solid rgba(0, 0, 0, 0.315);
                width: 400px;
                margin: auto;
                display: flex;
                padding: 15px;
                
              }
              #doctor_img{
                border: 1px solid black;
                width: 120px;
                height: 120px;
                background-image: url(../practice_image/main_img3.jpg);
              }
              #doctor_detail{
                margin-top: 10px;
                margin-left: 50px;
                font-size: 20px;
                
              }
              #userCount{
                font-size: 20px;
                font-weight: 600;
                text-align: center;
                margin-top:20px ;
              }
              .select_Div{
                margin-top: -1px;
                border: 1px solid black;
                width: 450px;
                height: 1200px;
                overflow-y: auto;
                background-color: lightgray;
                
              }

              .select_Div::-webkit-scrollbar {
                width: 10px;
            }
              .select_Div::-webkit-scrollbar-thumb {
                background-color: #d5dbe0;
                border-radius: 10px;
                box-shadow: inset 0px 0px 5px rgb(34, 32, 32);
            }
              .select_Div::-webkit-scrollbar-track {
                background-color: rgb(156, 175, 194);
                box-shadow: inset 0px 0px 5px rgb(34, 32, 32);
            }

              #select_btnDiv{
                border: 2px solid black;
                padding: 10px;
                background-color: rgb(207, 199, 199);
                width: 450px;
                margin-top: 50px;
                
              }
              #s_btn{
                margin-left: 120px;
              }
              #btn1{
                width: 180px;
                box-shadow: 1px 1px 2px black;
                border: 1px solid black;
            }

              .userList{
                background-color: rgb(157, 206, 235);
                height: 110px;
                padding-top: 5px;
                box-shadow: 0px 2px 3px rgb(36, 34, 34);
                border: 1px solid rgb(78, 78, 78);
                cursor: pointer;
              }
              .userList :hover{background-color: aquamarine;}
              .user_detail_div{
                /* border: 1px solid black; */
                height: 100px;
              }
              .u_name{
                font-size: 30px;
                margin-left: 50px;
             }
             .u_ssn{margin-left: 30px;}
             .u_no{margin-left: 30px; }
             .u_time{ margin-left: 120px;}

            .user_detail_div2{
                border: 1px solid black;
                width: 600px;
                height: 360px;
                margin-top: 40px;
                padding-left: 20px;
                border-radius: 30px;
                background-color: rgb(247, 233, 215);
                box-shadow: 1px 1px 10px rgb(133, 124, 124);
            }
            .u_name_div{
                font-size: 50px;
                margin-top: 15px;
                margin-left: 30px;
            }
            .u_ssn_div{
                margin-top: 10px;
                font-size: 30px;
            }
            .care_div{
                width: 880px;
                height: 500px;
                margin-top: 110px;
                border-radius: 20px;
                border: 2px solid #3C66D3;;
                box-shadow: 1px 1px 5px rgb(92, 92, 92);
            }
            .care_div ul{
                display: flex;
                justify-content: space-evenly;
                padding-top: 15px;
                list-style-type: none;
            }
            .care_title{
                border-bottom: 1px solid #3C66D3;
                width: 800px;
                margin: auto;
            }
            .care_type{
                color: #3C66D3;
                font-size: 20px;
            }
            .care_type2{
                color: #3C66D3;
                font-size: 15px;
            }
            input {
                width: 150px;
                font-size: 15px;
                border: 0;
                border-radius: 15px;
                outline: none;
                padding-left: 10px;
                background-color: rgb(233, 233, 233);
             }
             .care_content{
                display: flex;
                flex-direction: column;
                width: 100%;
                height: 370px;
                margin-top: 9px;
             }
             .c_text{
                width: 800px;
                margin: auto;

             }
             textarea{
                width: 100%;
                height: 130px;
                resize: none;
                border-radius: 15px;
                font-size: 20px;
             }
             .care_btn{
                text-align: right;
                
                margin-right: -230px;
    						margin-top: 20px;
             }
             #c_btn1,#c_btn2{width: 100px;box-shadow: 1px 1px 3px black;}
             h4{color: rgb(64, 99, 214);}
            
            

             
              


             </style>

            <div class="doctorDiv">
             <!-- 여기서부터 여기에다 만드세요~~~~!! -->
                <h2>진료실</h2>
                <div class="doctor_container">
                    <div class="d_container">
                    
<% 
    switch(mem.getDeptName()) {
        case "내과":
%>
            <div id="doctor_img"><img src="/vita/assets/image/시우.jpg" alt="" style="width:100%; height:100%;"></div>
<%
            break;
        case "외과":
%>
            <div id="doctor_img"><img src="/vita/assets/image/상우님.jpg" alt="" style="width:100%; height:100%;"></div>
<%
            break;
        case "치과":
%>
            <div id="doctor_img"><img src="/vita/assets/image/재운님.jpg" alt="" style="width:100%; height:100%;"></div>
<%
            break;
        case "안과":
%>
            <div id="doctor_img"><img src="/vita/assets/image/준수님.jpg" alt="" style="width:100%; height:100%;"></div>
<%
            break;
        default:
%>
            <div id="doctor_img"><img src="/vita/assets/image/default.jpg" alt="기본 이미지" style="width:100%; height:100%;"></div>
<%
            break;
    }
%>
                        
                        <div id="doctor_detail">
                            <b>진료과   : <b><%= mem.getDeptName() %></b></b> <br><br>
                            <b>담당교수 : <b><%= mem.getUserName() %></b></b>    
                        </div>
                    </div>
                    <div id="userCount">
                        총 예약인원 : <b></b>
                    </div>
                </div>

                <div id="select_btnDiv">
                    <div id="s_btn"><button class="btn btn-secondary" id="btn1" onclick="fnSelectRes();">예약조회</button></div>
                </div>
                <div class="select_Div">

                    <div id="u_list_div">
                         <!-- for문 돌려서 동적으로 생성 -->
										
										
										
                     <!--    <div class="userList">
                            <div class="user_detail_div">
                                <span class="u_name"><b>홍길동</b></span><br>
                                <span class="u_ssn">1990/05/19</span>
                                <span class="u_time"><b>예약번호 : </b></span><br>
                                <span class="u_no">병원등록번호:11111</span>
                            </div>
                        </div>
                         -->
                        

                   
                        
                     </div>

                   </div>
                </div>
            </div>

            <div class="user_detail_div2">
               
                <div class="u_name_div"><b>홍길동</b></div>
                <div class="u_ssn_div">
                    <ul>
                        <li>주민번호 : <span>900808-1*****</span></li>
                        <li>진료번호 : <span></span></li>
                        <li>예약번호 : <span></span></li>
                        <li>전화번호 : <span>010-5555-5555</span></li>
                        <li>주소 : <span>경기도</span></li>  
                    </ul>
                </div>
            
                <div class="care_div">
                    <div class="care_title">
                        <ul>
                            <li class="care_type"><b>진료(진단서용)</b></li>
                            <li>환자 등록번호 입력 : <input type="text"></li>
                            <li>환자 예약번호 입력 : <input type="text"></li>
                        </ul>
                    </div>
                    <div class="care_content">
                        <div class="c_text">
                            <h4>환자증상</h4>
                            <textarea name="" id="">일주일 전부터 어지럽고 피로감을 많이 느낌</textarea>
                        </div>
                        <div class="c_text">
                            <h4>진단 및 소견</h4>
                            <textarea name="" id="">mri 검사 후 확인한 바 3일간 안정치료가 필요함 그 후에 추가 진단이 필요함</textarea>
                        </div>
                    </div>
                    
                </div>

                <div class="care_div" id="care_div_1">
                    <div class="care_title">
                        <ul>
                            <li class="care_type2"><b>진료(진료확인 및 기록용)</b></li>
                            <!-- <li>환자 등록번호 입력 : <input type="text"></li>
                            <li>진료날짜 입력 : <input type="date"></li> -->
                        </ul>
                    </div>
                    <div class="care_content">
                        <div class="c_text">
                            <h4>치료내용</h4>
                            <textarea name="" id="">mri 촬영,Bolus 정맥주사- 50 mg주사처방,약처방</textarea>
                        </div>
                        <div class="c_text">
                            <h4>진단명</h4>
                            <textarea name="" id="">고혈압</textarea>
                        </div>
                    </div>
                </div>
                    <div class="care_btn">
                        <button class="btn btn-primary" id="c_btn2">등록</button>
                    </div>

            </div>




        </nav>
        
    </section>
    
    <script>
    
    function fnSelectRes(){
    	
    	$.ajax({
    		url: '<%= contextPath %>/listRes.se',
    		data:{dname}
    		success:function(res){
    			console.log(res);
    			let listdiv = '';
    			
    			for(let i=0; i<res.length; i++){
    				console.log(res[i].userName)
    				
                   listdiv += '<div class="userList">' 
                   					+ '<div class="user_detail_div">'
                   					+ '<span class="u_name"><b>' + res[i].userName + '</b></span><br>'
                   					+ '<span class="u_ssn">' + res[i].userDate + '</span>'
                   					+ '<span class="u_time"><b>예약번호 : '+ res[i].appointment + '</b></span><br>' 
                   					+ '<span class="u_no">병원등록번호 : ' + res[i].userNo + '</span>'
                   					+ '</div>'
                   					+ '</div>';
                   	
    				
    			}
    			
    			$('#u_list_div').append(listdiv);
    		},
    		
    		
    	})
    }
    
      


      
    </script>
        
    <!-- section end -->

<!-- Footer start -->
<%@ include file="/views/common/footer.jsp" %>
<!-- Footer end --> 


</body>
</html>