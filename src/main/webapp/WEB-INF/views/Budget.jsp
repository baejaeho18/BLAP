<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="./resources/assets/css/custom.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   <!-- 제이쿼리 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
   <!-- chart.js -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
   <title>Budget List</title>
   <style>
      body{
         padding-top:50px;
      }
      .categoryimg{
         width: 45px;
         height: 45px;;
         object-fit:cover;
      }
      
      /* responsive */
      @media screen and (min-width: 495px) {
        
        
      }
      @media screen and (max-width: 999px) {
          #budget_state_vertical {display:none;}
      }
      @media screen and (min-width: 990px) {
          #budget_state_horizontal{display:none;}
      }
      #statistics{
      		color : #A3BBAD;
			background-color : white;
			border : 1px solid #A3BBAD;
			border-radius : 5px;
		}
		#statistics:hover{
			color : white;
			background-color :  #A3BBAD;
			border : 1px solid white;
			border-radius : 5px;
		}
      
      /* 팝업 */
      .background {
         position: fixed;
         top: 0;
         left: 0;
         width: 100%;
         height: 100vh;
         background-color: rgba(0, 0, 0, 0.6);
         /* 숨기기 */
         z-index: -1;
         opacity: 0;
      }
      .budget_popup_show {
         opacity: 1;
         z-index: 1000;
         transition: all 0.5s;
      }
      .window {
         position: relative;
         width: 100%;
         height: 100%;
      }
      .budget_popup {
         position: absolute;
         width:55%;
         height:80%;
         top: 40%;
         left: 50%;
         transform: translate(-50%, -35%);
         background: #ffffff;
         box-shadow: 0 2px 7px rgba(0, 0, 0, 0.9);
         border-radius:15px;
         margin-top:30px;
         overflow-y:auto;
         word-break:break-word;

      }
      table{
         background-color:#F5F5F5;
         border:1px solid #444444;
         border-collapse: collapse;
      }
      th {
         border:1px solid #444444;
         text-align:center;
         vertical-align:middle;
         height:14.3%;
      }
      td {
         border:1px solid #444444;
         vertical-align:middle;
         text-align:right;
      }
      td:nth-child(2) {
         text-align:center;
      }
      .th-1 {width:10%;}
      .th-2 {width:40%;}
      .th-3 .th-4 {width:25%;}
      
   </style>
   
</head>

<body>
   <nav class="navbar navbar-expand-sm bg-white navbar-light fixed-top border-bottom">
     <div class="container-fluid">
           <a href=".">
          <img src="./resources/assets/img/logo.png" alt="blap Logo" style="width:80px; height:55px">
         </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-center" id="collapsibleNavbar" >
           <ul class="navbar-nav">
              <li class="nav-item me-5">
                <a class="nav-link" href="about">ABOUT</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="readbucket">BUCKET</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="readbudget">BUDGET</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="readaccount">PROFILE</a>
              </li>
            </ul>
          </div>
      </div>
	</nav>

   <br>
   <div class="container" style="font-size:18px;">
      <form class="form-inline my-lg-0">
         <span>
            <button class="btn border my-3 p-3" type="category0">
               <img src="./resources/assets/img/all_checked.png" style="width:45px;height:45px;"><br>
               ALL
            </button>
            <button class="btn my-3 p-3" type="category1">
               <img src="./resources/assets/img/travel.png" class="categoryimg"><br>
               TRAVEL
            </button>
            <button class="btn my-3 p-3" type="category2">
               <img src="./resources/assets/img/food.png" class="categoryimg"><br>
               FOOD
            </button>
            <button class="btn my-3 p-3" type="category3">
               <img src="./resources/assets/img/shopping.png" class="categoryimg"><br>
               SHOPPING
            </button>
            <button class="btn my-3 p-3 catebtn" type="category4">
               <img src="./resources/assets/img/hobby.png" class="categoryimg"><br>
               HOBBY
            </button>
				<button class="btn my-4 p-2 float-end p-2" type="button" id ="statistics" onclick=" location.href='./ExpenditureStatistics'">통계</button>
         </span>
      </form>
   </div>

   <div class="container" style="border:1px solid; border-radius: 10px; height:85px; padding-bottom:10px;" id="budget_state_horizontal">
      <canvas id="horizontalChart"></canvas>
   </div>
   
   <div class="container" id="content">
      <div class="row">
         <div class="col-lg-7 col-md-12" style="overflow-y:auto;">
			<c:forEach items="${viewAll}" var="c">
            <div class="border col-lg-10 col-sm-12 mt-4 p-3 mb-2" style="border-radius: 5px;">
	               <div class="fw-bolder "style="display:inline-block; font-size: 20px; width:80%;">${c.getBucket_name()}</div>
	               <span class="align-middle" style="font-size: 15px; ">예상지출: ${c.getTotal_expenditure()}만</span><br>
	               <span id="dateColumn" style="font-size: 15px; color:#908F8F">${c.getGoal_date()}</span>
	               <button class="btn float-end fw-bolder" onclick="location.href='viewbudgetpage/${c.getBucket_id()}'" style="font-size: 14px;">VIEW MORE ></button>
               <br>
            	</div>
            </c:forEach>
            
            
                  	<div class="mt-5"style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/blapweb/readbudget?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b class="me-3">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/blapweb/readbudget?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/blapweb/readbudget?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>    
         </div>
         
    <div class="container-fluid col-lg-5 col-md-12" id="budget_state_vertical">
            <div class="row">
               <span class="fw-light mb-4" style="font-size: 22px;">이번달 지출 현황</span>
               <span class="fw-light" style="font-size: 15px; display:inline">[천원]</span>
               <div class="container-fluid col-sm-5 p-3 border" style="border:1px solid; border-radius: 10px; height:375px;">
                  <br>
                  <canvas id="verticalChart" style="weight:60%; height:100%; padding: 10px;"></canvas>
               </div>
               <div class="container-fluid col-sm-7 row" style="font-size:15px;text-align:right;">
                  <div class="col-sm-1 p-0">
                     <div class="col-sm-12" style="margin-top:40%; padding-bottom:100%; border-radius:50%;background-color:#F4B5B5;"></div>
                     <div class="col-sm-12" style="margin-top:40%; padding-bottom:100%; border-radius:50%;background-color:#F9D7D7;"></div>
                     <div class="col-sm-12" style="margin-top:40%; padding-bottom:100%; border-radius:50%;background-color:#FFE2E2;"></div>
                  </div>
                  <div class="col-sm-5">
                     <div class="col-sm-12" style="margin-top:8%; min-width:85px">현재 예산</div>
                     <div class="col-sm-12" style="margin-top:8%; min-width:85px">이번달 지출</div>
                     <div class="col-sm-12" style="margin-top:8%; min-width:85px">이번달 예산</div>
                     <div class="col-sm-12" style="margin-top:8%; min-width:85px">초과 예산</div>
                  </div>
                  <div class="col-sm-5">
                     <div class="col-sm-12" id="chart1" style="margin-top:8%; min-width:80px; margin-left:min(15px,1%)"></div>
                     <div class="col-sm-12" id="chart2" style="margin-top:8%; min-width:80px; margin-left:min(15px,1%)"></div>
                     <div class="col-sm-12" id="chart3" style="margin-top:8%; min-width:80px; margin-left:min(15px,1%)"><div>
                     <div class="col-sm-12" id="chart4" style="margin-top:8%; min-width:80px; margin-left:min(15px,1%); color:red"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   </div>
   </div>


   <div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom: 0; background-color: #C1DDD3 !important; height: 100px">
      <p class="pt-5" style="display: inline-block; font-size: 13px">이용약관</p>
      <p class="pt-5" style="display: inline-block; font-size: 13px">도움말</p>
   </div>
   
   <div class="background">
      <div class="window">
         <div class="budget_popup border container row">
            <div class="col-sm-12">
               <button class="btn float-end" id="budget_popup_close" style="font-size:22px;"> <b>X</b> </button>
            </div>
            <div class="container col-sm-12" style="font-size:22px; text-align:center;" > <b>[여행] 제주도 여행</b> </div>
            <div class="col-sm-12" style="text-align:right; color:#908F8F; font-size:17px;">
               <br>시작일 2022.01.09
               <br>현재일 2022.01.11
               <br>완료일 2022.01.13
            </div>
            <div class="table-wrap">
               <div class="table-box table-box--vertical"><br>
                  <table class="table table--vertical" id="BudgetList">
                     <thead>
                        <tr> <th class="th-1"></th> <th class="th-2">항목</th> <th class="th-3">예상 지출액</th> <th class="th-4">실제 지출액</th>   </tr>
                     </thead>
                     <tbody>
                        <tr> <th>1</th> <td>제주 비행기</td> <td>100,000</td> <td>74,250<br><span style="color:#0500FF; font-size:12px;">+25,750</span></td> </tr>
                        <tr> <th>2</th> <td>제주호텔 예약</td> <td>220,000</td> <td>120,930<br><span style="color:#0500FF; font-size:12px;">+99,070</span></td> </tr>
                        <tr> <th>3</th> <td>제주렌터카</td> <td>50,000</td> <td><span style="color:#989595;">50,000</span></td> </tr>
                        <tr> <th>4</th> <td>식비</td> <td>150,000</td> <td>223,210<br><span style="color:#FF0000; font-size:12px;">-73,210</span></td> </tr>
                        <tr> <th>5</th> <td>비상금</td> <td>100,000</td> <td style="color:#989595">100,000</td> </tr>
                        <tr style="background-color:#DCDCDC;"> <th></th> <th>총액</th> <td style="font-size:17px;">620,000</td> <td>568,390<br><span style="color:#0500FF; font-size:12px;">+51,610</span></td> </tr>
                     </tbody>       
                  </table>
                  <%-- 
                  <table id="list">
						<tr>
	                     	<th class="th-1"></th>
	                     	<th class="th-2">항목</th>
	                     	<th class="th-3">예상 지출액</th>
	                    	<th class="th-4">실제 지출액</th>
	                    </tr>
		   				<c:forEach items="${Budgetlist}" var="t">
	                     	<tr>
	                     		<th>hihi</th>
	                     		<th>${t.getBudget_id()}</th>
	                     		<td>${t.getBudget_name()}</td>
	                     		<td>${t.getBudget()}</td>
	                     		<td class="posneg" id="difference"><input style="border:none color:black" type="number" id="expenditure" placeholder="${t.getbudget}"/><br>${t.getDifference()}</td>
	                     	</tr>
	                     </c:forEach>
	                     <tr>
							<th></th>
							<th>총액</th>
							<td style="font-size:17px;"></td>
							<td>${totalExpenditure}<br>${totalDifference }</td>
						</tr>  
					</table> --%>
               </div>
            </div>
            <div class="row mb-3">
            	<div class="col d-flex justify-content-end" >
            		<button class="btn border justify-content-end me-4" id="budget_popup_update" onclick="location.href='update'">수정</button>
            		<button class="btn border justify-content-end" id="budget_popup_complete" onclick="location.href='complete'">마감</button>	
            	</div>
            </div>
         </div>
      </div>
   </div>
   

      <script src="./resources/assets/js/popper.js"></script>
   <script src="./resources/assets/js/bootstrap.min.js"></script>
   <script>
	var chartData1 = [];
	var chartData2 = [0];
	var chartData3 = [0];
	var xValues = ["예산","지출"];
	
	$.getJSON("http://localhost:8080/blapweb/budgetbalance", function(data1) {

		$.each(data1, function(inx, obj1) {
			console.log("11111");
			chartData1.push(obj1.balance/1000);
			chartData1.push(0);
			console.log(obj1.balance);
			console.log(chartData1[0]);
			createChart();
			viewChart();
		});
	});
 	
	$.getJSON("http://localhost:8080/blapweb/monthexpenditure", function(data2) {
		$.each(data2, function(inx2, obj2) {
			console.log("22222");
			chartData2.push(obj2.expenditure/1000);
			console.log(obj2.expenditure);
			console.log(chartData2);
			createChart();
			viewChart();
		});
	});
	
	$.getJSON("http://localhost:8080/blapweb/monthbudget", function(data3) {
		$.each(data3, function(inx3, obj3) {
			console.log("3333");
			chartData3.push(obj3.budget/1000);
			console.log(obj3.budget);
			console.log(chartData3);
			createChart();
			viewChart();
		});
	});
	var barChartData = {

			 labels: xValues,
		     datasets: [{ 
		       data: chartData1, 
		         stack:true,
		         label:"현재 예산",
		         backgroundColor: "#F4B5B5",
		         fill: false
		       }, { 
		        data: chartData2, 
		         backgroundColor: "#F9D7D7",
		         label:"이번달 지출",
		         stack:true,
		         fill: false
		       }, { 
		    	data : chartData3, 
		         backgroundColor: "#FFE2E2",
		         label:"이번달 예산",
		         stack:true,
		         fill: false
		      }],
	}
	
	function createChart() {
	 	
		var ctx = document.getElementById("verticalChart").getContext("2d");

		new Chart(ctx, {
		      type: 'bar',
			  data: barChartData,
			  options: {
		          legend: {display: false},
		          responsive:true,
		          maintainAspectRatio:false
		        }
		}); 
		
	}
	
	function viewChart(){
		document.getElementById('chart1').innerHTML = chartData1[0];
		document.getElementById('chart2').innerHTML =chartData2[1];
		document.getElementById('chart3').innerHTML =chartData3[1];
		var a = chartData3[1]-chartData2[1];
	 	document.getElementById('chart4').innerHTML = a;
	}
	
	 
   </script>
   
   
 
   <script>
      function budget_popup_show () {
        document.querySelector(".background").className = "background budget_popup_show";
      }
      function budget_popup_close () {
        document.querySelector(".background").className = "background";
      }
      function budget_popup_update () {
       if(confirm("정말로 수정하시겠습니까?")) lacation.href = "editBudget/"+bucket_name;  
         document.querySelector(".background").className = "background";
      }
      function budget_popup_complete () { 
         if(confirm("정말로 완료하시겠습니까?")) location.href = "complete/"+bucket_name;
       document.querySelector(".background").className = "background";
     }
      document.querySelector("#budget_popup_show").addEventListener('click', budget_popup_show);
      document.querySelector("#budget_popup_show").addEventListener('click', budget_popup_show);
      document.querySelector("#budget_popup_close").addEventListener('click', budget_popup_close);
      document.querySelector("#budget_popup_update").addEventListener('click', budget_popup_close);
   </script>
   <script>
      $(".categoryimg").mouseover(function() {
         $(this).attr("src", $(this).attr("src").slice(0,-4)+"_checked.png");
      });
      $(".categoryimg").mouseout(function() {
         $(this).attr("src", $(this).attr("src").slice(0,-12)+".png");
      });
      function add() {
          document.getElementById('total_difference').value = 0;
          for(i=1; i<arrInput.length; i++) {
              var id = 'difference'+i;
              if(parseInt(document.getElementById(id).value)) document.getElementById('total_difference').value = parseInt(document.getElementById('total_difference').value) + parseInt(document.getElementById(id).value) ;
          }
          document.getElementById('total_expenditure').value = 0;
          for(i=1; i<arrInput.length; i++) {
              var id = 'expenditure'+i;
              if(parseInt(document.getElementById(id).value)) document.getElementById('total_expenditure').value = parseInt(document.getElementById('total_expenditure').value) + parseInt(document.getElementById(id).value) ;
          } 
      }
      function posneg(){
         var target = document.getElementByClassName('posneg');
         if(x>0){
            targt.style.color = "blue";
            target.value = '+'+target.value();
         }
         else if(x<0){
            target.style.color = "red";
            target.value = '-'+target.value();
         }
         else{
            target.style.visibility = "hidden";
         }
      }
      
   </script>
</body>
</html>