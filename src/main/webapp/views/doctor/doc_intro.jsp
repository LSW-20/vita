<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</head>
<body>

<style>


			footer{
				margin-top:1353px;
			}
			
      section{
	      height:1200px;
	     /*  background-color: aqua; */
	      position: absolute;
	    	width: 100%;
	    	margin-top: 153px;
	    	
     }
      .doc_intro_container{
     
      	width: 100%;
      	display: flex;
      	justify-content: center;
      	flex-direction: column;
      	align-items: center;
      	
      }
      
      #doc_title{
      	 width: 1100px;
   			 height: 100px;
   			 border-bottom: 2px solid #0807072b;
   			 margin-top: 70px;
   			 margin-right: 100px;
      }
      #doc_title h1{
      	 font-size: 50px;
      }
      #doc_title2{
      	 width: 1200px;
   			 height: 200px;
   			 border-bottom: 2px solid #0807072b;
   			 margin-top: 70px;
      }
      #doc_title2 h2{
      	 font-size: 40px;
      }
      #hos_content{
      	 margin-top: 60px;
      	 display: flex;
      }
      
      #table_div{
      	margin-top: 20px;
      	
      }
      
      #doc_imgBox{
      	border: 1px solid black;
      	width: 190px;
      	height:255px;
      }
      #scd_table{
      	margin-left: 20px;
      	width: 900px;
      	margin-top: 75px;
      	text-align: center;
      	
      }
      
      #table_div{
      	border-top:1px solid black;
      	border-bottom:1px solid black;
      	padding-bottom: 25px;
    		padding-top: 20px;
    		display: flex;
      }
      .mark_div{
      	width:20px;
      	height:20px;
      	background-color: blue;
      	border-radius: 50px;
      	margin-left: 450px;
      }
      #mark_info{
      	margin-left: 15px;
      }
      #doc_detailBox{
      	display: flex;
      	
      }
      #dc_name{
      	font-size:20px;
      	margin-left: 40px;
      }
      #d_name{
      	font-size:20px;
      	color: blue;
      }
      
        
        .checkY{
                background-color: blue;
                width: 15px;
                height: 15px;
                border-radius: 50px;
                margin: auto;
                margin-top: 4px;
              }
     
     
      
      
      
      
</style>

<%@ include file="/views/common/header.jsp" %>


<section>

	<nav class="doc_intro_container">
	
		<div id="doc_title">
			<div><h1>의료진</h1></div>
		</div>
		
		<div id="doc_title2">
			<div>
				<h2>내과</h2><br>
				<div id="hos_content">
					※ 진료일자 및 시간은 병원의 사정에 의해 추후 변경될 수 있음을 알려드립니다.
					<div class="mark_div"></div><div id="mark_info"><b>진료</b></div>
				</div>
				
				
			</div>
			
		</div>
		
		
		<div class="container" id="table_div">
			
			<div id="doc_imgBox">
				<img alt="" src="/vita/assets/image/시우.jpg" style="width:100%; height:100%;">
				
			</div>
				<div class="doc_detailBox">
					 <b id="dc_name">박시우<b id="d_name">  내과</b></b>
					 
  				
					
				 	<table class="table table-bordered" id="scd_table">
					
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
		
		</div>
		
		
		<script>
		
		<%
			
			List<DoctorSchedule> scList = (List<DoctorSchedule>)map.get("list");
		%>
			
		<% for(DoctorSchedule dsc : scList){ %>
		
				
				/* 오전 일정 */
				<% if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("A") && dsc.getScheduleWeek().equals("월")){%>
					$('#mY_1').css('display','block');
				
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("A")&& dsc.getScheduleWeek().equals("화")){%>
					$('#mY_2').css('display','block');
					
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("A") && dsc.getScheduleWeek().equals("수")){%>
					$('#mY_3').css('display','block');
					
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("A")&& dsc.getScheduleWeek().equals("목")){%>
					$('#mY_4').css('display','block');
					
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("A")&& dsc.getScheduleWeek().equals("금")){%>
					$('#mY_5').css('display','block');
				
				/* 오후 일정 */
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("P")&& dsc.getScheduleWeek().equals("월")){%>
					$('#aY_1').css('display','block');
				
				
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("P")&& dsc.getScheduleWeek().equals("화")){%>
					$('#aY_2').css('display','block');
				
				
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("P")&& dsc.getScheduleWeek().equals("수")){%>
					$('#aY_3').css('display','block');
				
				
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("P")&& dsc.getScheduleWeek().equals("목")){%>
					$('#aY_4').css('display','block');
				
				
				<%}else if(dsc.getWorking() != null && dsc.getWorking().equals("Y") && dsc.getScheduleTime().equals("P")&& dsc.getScheduleWeek().equals("금")){%>
					$('#aY_5').css('display','block');
				
				<%}%>
				
				
			<%}%>
			
		
		
		 
		
		
		
				
			
		
		
		</script>
		
		
		
		
		
		
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	</nav>
</section>









  

<%@ include file="/views/common/footer.jsp" %>



</body>
</html>



</body>
</html>