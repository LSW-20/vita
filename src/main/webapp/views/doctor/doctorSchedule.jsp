<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="/views/common/header.jsp" %>
<%@ include file="/views/common/doctorSideBar.jsp" %>

   
      <style>
      /* 보면서 적용! */
      footer{margin-top:1053px;}
      section{height:1200px}
      #sideMenu{}
      
              #table_div{
                margin-top: 50px; 
                text-align: center;
            }
              h2{font-size: 3rem;}
              #table_div2{
                margin-top: 50px;
                text-align: center;
                
            }

              .checkY{
                background-color: green;
                width: 15px;
                height: 15px;
                border-radius: 50px;
                margin: auto;
                margin-top: 4px;
              }
              
             </style>
            
                <div class="container mt-5">
                    <h2>의료진 일정 관리</h2><br>
                    <h4>의사명 : <%= loginUser.getUserName() %></h4><br>
                    
                    
                    <!-- <form action=""> -->
                        <table class="table table-bordered" id="table_div">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>월</th>
                                    <th>화</th>
                                    <th>수</th>
                                    <th>목</th>
                                    <th>금</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>오전</th>
                                    <td>
                                        <select id="mon-morning" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="tue-morning" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="wed-morning" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="thu-morning" class="form-control">
                                           
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="fri-morning" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>오후</th>
                                    <td>
                                        <select id="mon-afternoon" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="tue-afternoon" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="wed-afternoon" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="thu-afternoon" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="fri-afternoon" class="form-control">
                                            
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="buttonDiv">
                            <button type="button" id="submit-button" class="btn btn-primary" onclick="fnSchedule();">등록</button>
                        </div>
                  <!--   </form> -->


                    <table class="table table-bordered" id="table_div2">
                        <thead>
                            <tr>
                                <th></th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th>오전</th>
                                <td>
                                    <div class="checkY" id="mY_1" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="mY_2" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="mY_3" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="mY_4" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="mY_5" style="display: none;"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>오후</th>
                                <td>
                                    <div class="checkY" id="aY_1" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="aY_2" style="display: none;"></div>
                                </td>
                                <td>
                                    <div class="checkY" id="aY_3" style="display: none;"></div> 
                                </td>
                                <td>
                                    <div class="checkY" id="aY_4" style="display: none;"></div> 
                                </td>
                                <td>
                                    <div class="checkY" id="aY_5" style="display: none;"></div>
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>

                <script>
                fnScheduleSelect();
    			
                    function fnSchedule(){
                    	
                        
                        let $monM = $('#mon-morning').val()
                        let $tueM = $('#tue-morning').val()
                        let $wedM = $('#wed-morning').val()
                        let $thuM = $('#thu-morning').val()
                        let $friM = $('#fri-morning').val()

                        let $monA = $('#mon-afternoon').val()
                        let $tueA = $('#tue-afternoon').val()
                        let $wedA = $('#wed-afternoon').val()
                        let $thuA = $('#thu-afternoon').val()
                        let $friA = $('#fri-afternoon').val()

                       
                        
                        $.ajax({
                            url: '<%= contextPath %>/schedule.up',
                            type: 'post',
                            data: {
                                monMorning: $monM,
                                tueMorning: $tueM,
                                wedMorning: $wedM,
                                thuMorning: $thuM,
                                friMorning: $friM,
                                monAfternoon: $monA,
                                tueAfternoon: $tueA,
                                wedAfternoon: $wedA,
                                thuAfternoon: $thuA,
                                friAfternoon: $friA,
                             
                                
                            },
                            success: function(res) {
                                
                            	console.log(res);
                            	
                            	
                            	if(res > 0){
                            		alert('성공적으로 등록되었습니다');
                            		fnScheduleSelect();
                            		location.href = location.href;
                            	}else{
                            		alert('일정등록 실패');
                            	}
                            	
                            
                            },
                           
                        });
                        
                    }
                    
                    
                     function fnScheduleSelect(){
                    	
                    	$.ajax({
                    			url: '<%= contextPath %>/scheduleSelect.me',
                        	type: 'post',
                        	success:function(res){
                        		
                							console.log(res);  // [{}, {}. {}]
                							
                							for(let i=0; i<res.length; i++){
                								
                								/* 오전일정조회 */
                								if(res[i].working == 'Y' && res[i].scheduleTime == 'A' && res[i].scheduleWeek=='월'){
                									$('#mY_1').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'A' && res[i].scheduleWeek=='화'){
                									$('#mY_2').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'A' && res[i].scheduleWeek=='수'){
                									$('#mY_3').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'A' && res[i].scheduleWeek=='목'){
                									$('#mY_4').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'A' && res[i].scheduleWeek=='금'){
                									$('#mY_5').css('display','block');
                									
                									/* 오후일정조회 */
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'P' && res[i].scheduleWeek=='월'){
                									$('#aY_1').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'P' && res[i].scheduleWeek=='화'){
                									$('#aY_2').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'P' && res[i].scheduleWeek=='수'){
                									$('#aY_3').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'P' && res[i].scheduleWeek=='목'){
                									$('#aY_4').css('display','block');
                								}else if(res[i].working == 'Y' && res[i].scheduleTime == 'P' && res[i].scheduleWeek=='금'){
                									$('#aY_5').css('display','block');
                								}
                								
                								
                								
                								
                							}
                							
                							
                    		
                        		
                        	},
                    	})
                    	
                    } 
                    
                     
					    
             
                    
                    
                </script>


        </nav>
    </section>

    <!-- section end -->

  
    

<%@ include file="/views/common/footer.jsp" %>


</body>
</html>