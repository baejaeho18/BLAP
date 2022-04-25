<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Statistics</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="./resources/assets/css/statistics.css" rel="stylesheet">

<style>
	#budget{
		color : #A3BBAD;
		background-color : white;
		border : 1px solid #A3BBAD;
		border-radius : 5px;
	}
	#budget:hover{
		color : white;
		background-color :  #A3BBAD;
		border : 1px solid white;
		border-radius : 5px;
	}
</style>
</head>

<body class="pt-5">
	<!-- MAIN -->
	<main>
		<div class="container">
			<!-- HEADER -->
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
	
	<br/>

			<div class="p-5 mb-auto">
				<div class="container-fluid">
					<div class="row align-items-md-stretch">
							<!-- CATEGORY -->
<!-- 							<div class="col-sm-6">
								<div>
									<ul
										class="nav col-12 justify-content-center mb-md-0">
										<li><a href="#" class="nav-link px-4 link-dark"> <img
												src="./resources/assets/img/all_checked.png" class="circle"
												alt="all" style="width: 50px; height: 50px"><br>
												<p class="text-center ">ALL</p>
										</a></li>
										<li><a href="#" class="nav-link px-4 link-dark"> <img
												src="./resources/assets/img/travel.png" class="circle"
												alt="travel" style="width: 50px; height: 50px"><br>
												<p class="text-center">TRAVEL</p>
										</a></li>
										<li><a href="#" class="nav-link px-4 link-dark"> <img
												src="./resources/assets/img/food.png" class="circle"
												alt="food" style="width: 50px; height: 50px"><br>
												<p class="text-center">FOOD</p>
										</a></li>
										<li><a href="#" class="nav-link px-4 link-dark"> <img
												src="./resources/assets/img/shopping.png" class="circle"
												alt="shopping" style="width: 50px; height: 50px"><br>
												<p class="text-center">SHOPPING</p>
										</a></li>
										<li><a href="#" class="nav-link px-4 link-dark"> <img
												src="./resources/assets/img/hobby.png" class="circle"
												alt="hobby" style="width: 50px; height: 50px"><br>
												<p class="text-center">HOBBY</p>
										</a></li>
									</ul>
								</div>
							</div> -->
							<!-- RETURN TO LIST -->
							<div class="col-sm-12">
								<div>
									<div class="container-fluid pt-3 pe-5 text-end">
										<button id="budget" type="button" class="btn btn-outline-primary" onclick=" location.href='./readbudget'">목록</button>
									</div>
								</div>
							</div>
						</div>
					<!-- CHART -->
					<div class="row align-items-md-stretch">
						<div class="col-sm-6">
							<div class="p-5">
								<div>
									<canvas id="myChart1"></canvas>
								</div>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="p-5">
								<div>
									<canvas id="doughnut-chart" width=150 height=100 style="width : 50%"></canvas> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- FOOTER -->
	<footer class="footer mt-auto mb-0">
		<div class="mt-4 bg-secondary text-white text-end"
			style="margin-bottom: 0; background-color: #C1DDD3 !important; height: 100px">
			<button type="button"
				class="btn btn-outline-#C1DDD3 text-light w-auto mt-5">
				<p style="display: inline-block; font-size: 13px">이용약관</p>
			</button>
			<button type="button"
				class="btn btn-outline-#C1DDD3 text-light w-auto mt-5">
				<p style="display: inline-block; font-size: 13px">도움말</p>
			</button>
		</div>
	</footer>

 <script>
   	var chartLabels2 = [];
	var chartData2 = [];
	
	$.getJSON("http://localhost:8080/blapweb/tagexpenditure", function(data2) {
		
		$.each(data2, function(inx, obj) {
				console.log(obj.Tag_name);
				console.log(obj.Expenditure_sum);
			 	chartLabels2.push(obj.Tag_name);
				chartData2.push(obj.Expenditure_sum);
		});

		createChart2();
		console.log(data2)
		console.log(chartLabels2) 
		console.log(chartData2)
	});
	
	var DoughnutExpenditureChartData = {
			labels : chartLabels2,
			datasets : [{
					label : '당월 사용',
					fill : false,
					
					backgroundColor : ["#2F7C93", "#C56064","#CF7A34","#49A98B","#4981A9"],
					borderColor :  ["#2F7C93", "#C56064","#CF7A34","#49A98B","#4981A9"],
					borderWidth : 1,
					data : chartData2
			}]
	}
	
	var doughnutOptions = {
			tooltips: {
				enabled: false
			},
			legend: {
				display: false
			},
			plugins: {
				title: {
			         display: true,
			         text: '카테고리별 지출 내역'
			       },
				datalabels: {
					formatter: (value, ctx) => {
						let datasets = ctx.chart.data.datasets[0].data;
						if(value!=0){
							let sum = 0;
							dataArr = ctx.chartdata.datasets[0].data;
							dataArr.map(data => {
								sum += parseInt(data);
							});
							let percentage = Math.round((value*100 / sum))+"%";
							return percentage;
						}
						else {
							let percentage = "";
							return percentage;
						}
					},
					color: "#fff",
				}
			}
	};
   
  	function createChart2(){
  		var ctx2 = document.getElementById("doughnut-chart");
  		new Chart(ctx2,{
		   type: 'doughnut',
		   data: DoughnutExpenditureChartData,
		   options: doughnutOptions
		});	
  	}
 </script>
 
 <script>
  	var chartLabels = ['1월','2월','5월','7월','8월'];
	var chartData = [];
	
	var LineExpenditureChartData = {
			labels : chartLabels,
			datasets : [{
					label : '당월 사용',
					fill : false,
					backgroundColor : 'rgba(54, 162, 235, 0.5)',
					borderColor : 'rgba(54, 162, 235, 0.5)',
					borderWidth : 1,
					data : chartData
			}]
	}
	
	function createChart() {
		var ctx = document.getElementById("myChart1").getContext("2d");
		new Chart(ctx, {
		      type: 'line',
			  data: LineExpenditureChartData,
			  options : {
					responsive : true,
					plugins : {
						legend : {
							position : 'top',
						},
						title : {
							display : true,
							text : '월별 지출 내역'
						}
					}
				}
		}); 
	} 
	
	$.getJSON("http://localhost:8080/blapweb/expenditure", function(data) {
		
		$.each(data, function(inx, obj) {
				console.log(obj.account_date);
				console.log(obj.money);
			 	/* chartLabels.push(obj.account_date); */
				chartData.push(obj.money);
		});

		createChart();
		console.log(data)
		console.log(chartLabels) 
		console.log(chartData)
	});
 </script>
 
</body>
</html>
