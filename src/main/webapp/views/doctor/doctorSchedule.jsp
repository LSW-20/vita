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
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="tue-morning" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="wed-morning" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="thu-morning" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="fri-morning" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>오후</th>
                                    <td>
                                        <select id="mon-afternoon" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="tue-afternoon" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="wed-afternoon" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="thu-afternoon" class="form-control">
                                            <option value="">선택</option>
                                            <option value="Y">근무</option>
                                            <option value="N">휴무</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select id="fri-afternoon" class="form-control">
                                            <option value="">선택</option>
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
                    function fnSchedule(){
                    	
                        alert('성공적으로 등록 되었습니다');
                        
                        
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

                       

                        // 오전일정
                        if($monM == 'Y'){
                            $('#mY_1').css('display','block');
                        }else if($monM == 'N'){
                            $('#mY_1').css('display','block').css('backgroundColor','red');
                        }

                        if($tueM == 'Y'){
                            $('#mY_2').css('display','block');
                        }else if($tueM == 'N'){
                            $('#mY_2').css('display','block').css('backgroundColor','red');
                        }
                        
                        if($wedM == 'Y'){
                            $('#mY_3').css('display','block');
                        }else if($wedM == 'N'){
                            $('#mY_3').css('display','block').css('backgroundColor','red');
                        }

                        if($thuM == 'Y'){
                            $('#mY_4').css('display','block');
                        }else if($wedM == 'N'){
                            $('#mY_4').css('display','block').css('backgroundColor','red');
                        }

                        if($friM == 'Y'){
                            $('#mY_5').css('display','block');
                        }else if($wedM == 'N'){
                            $('#mY_5').css('display','block').css('backgroundColor','red');
                        }

                        // 오후일정
                        if($monA == 'Y'){
                            $('#aY_1').css('display','block');
                        }else if($monA == 'N'){
                            $('#aY_1').css('display','block').css('backgroundColor','red');
                        }

                        if($tueA == 'Y'){
                            $('#aY_2').css('display','block');
                        }else if($tueA == 'N'){
                            $('#aY_2').css('display','block').css('backgroundColor','red');
                        }
                        
                        if($wedA == 'Y'){
                            $('#aY_3').css('display','block');
                        }else if($wedA == 'N'){
                            $('#aY_3').css('display','block').css('backgroundColor','red');
                        }

                        if($thuA == 'Y'){
                            $('#aY_4').css('display','block');
                        }else if($thuA == 'N'){
                            $('#aY_4').css('display','block').css('backgroundColor','red');
                        }

                        if($friA == 'Y'){
                            $('#aY_5').css('display','block');
                        }else if($friA == 'N'){
                            $('#aY_5').css('display','block').css('backgroundColor','red');
                        }
                        
                        
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
                                name: '<%= loginUser.getUserName() %>',
                                
                            },
                            success: function(res) {
                                console.log("서버 응답:", res);
                            },
                           
                        });
                        

                         
                    }
                    
                
					    
             
                    
                    
                </script>


        </nav>
    </section>

    <!-- section end -->

  
    

<%@ include file="/views/common/footer.jsp" %>


</body>
</html>