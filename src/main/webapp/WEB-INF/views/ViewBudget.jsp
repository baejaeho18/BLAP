<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>View My Bucket</title>
        <style>
        .star-rating input {
            display: none;
        }
        
        .star-rating label {
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 0.5px;
            -webkit-text-stroke-color: #2b2a29;
            cursor: pointer;
        }
            
        .star-rating :checked ~ label {
            -webkit-text-fill-color: gold;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            -webkit-text-fill-color: #fff58c;
        }
        .vl {
            margin-left: 7px;
            display: inline;
            border-left: 3px solid gray;
    
        }
        
        #info-1 {
            display: inline-block;
            margin-left: 15%;
            width: 35%;
        }
        #info-2 {
          
            width : 45%;
        }
        
        .title{
            text-align: right; 
            width: 80px; 
            display: inline-block; 
            justify-content: space-between;
        }
        img {
            height: 18px;
        }
        .item, .expense {
            width :90%;
        }
        .col {
            text-align: center;
        }
        .expense {
            text-align: center;
        }
        .index {
            text-align: right;
        }
        #tablebutton {
            background-color: rgba(227, 158, 153, 1);
            color : white;
            border: none;
            padding: 1px 5px;
            text-decoration: none;
            margin: 1px 0.5px;
            cursor: pointer;
            border-radius: 10%;
            font-size:15px;
        }
        #completebutton {
            background-color: rgba(153, 174, 227, 1);
            color : white;
            border: none;
            padding: 5px 20px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10%;
        }
        th {text-align:center;vertical-align:middle;}
        td {vertical-align:middle; text-align:right;}
        td:nth-child(2){text-align:center;}
      .th-2 {width:40%;}
      .th-3 .th-4 {width:20%;}
        .th-5{width:20%;}
    </style>
</head>
<body>
    <script language="javascript"> 
    
    function changeBudget(intId,strBudget) {
		document.getElementById('difference'+intId).innerText = parseInt(strBudget) - parseInt(document.getElementById('expenditure'+intId).value);
		console.log(strBudget);
    }
    function changeExpenditure(intId,strExpenditure) {
        document.getElementById('difference'+intId).innerText = parseInt(document.getElementById('budget'+intId).value) - parseInt(strExpenditure);
        console.log(strExpenditure);
    }
    
    function calcSum(){
    	const table = document.getElementById("BudgetList");
    	let budget_sum=0;
    	let expenditure_sum = 0;
    	console.log(table.rows.length);
    	for(let i=1;i<table.rows.length-1;i++){
    		budget_sum += parseInt(document.getElementById('budget'+i).value);
    		expenditure_sum += parseInt(document.getElementById('expenditure'+i).value);
    	}
    	document.getElementById('total_budget').innerText = budget_sum;
    	document.getElementById('total_expenditure').innerText = expenditure_sum;
    	document.getElementById('total_difference').innerText =  budget_sum - expenditure_sum;
    	differColor();
    }
    
    function differColor(){
    	var table = document.getElementById('BudgetList');
  	  	var target = document.getElementsByClassName('posneg');
	  	for(let i=0;i<table.rows.length-1;i++){
	  		if(parseInt(target[i].innerText)<0){
	  			target[i].style.color = "red";
	  	  	}
	  	  	else if(parseInt(target[i].innerText)>0){
	  	  		target[i].style.color = "#0500FF";
	  	  		if(target[i].innerText.charAt(0) != "+") target[i].innerText = '+'+target[i].innerText;
	  	  	}
	  	}
    }
    /*jslint devel: true */
    /* eslint-disable no-console */
    /*eslint no-undef: "error"*/
    /*eslint-env node*/
    </script>
    
	<!-- head navbar -->
	<nav class="navbar navbar-expand-sm bg-white navbar-light border-bottom ">
	  <div class="container-fluid">
	      <a href=".">
	      	<img src="./../resources/assets/img/logo.png" alt="blap Logo" style="width:80px; height:55px">
	     </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse d-flex justify-content-center" id="collapsibleNavbar" >
		   <ul class="navbar-nav">
		      <li class="nav-item me-5">
		        <a class="nav-link" href="/about">ABOUT</a>
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

    <h3 style = 'text-align: center;'>  ${bucket.getBucket_name() } </h3><br>  
    <!-- <%-- <%= u.getUserid()%> --%> -->
    
    <!-- <div id="info-1">
        <div class="title"><span>카테고리</span>
            <div class="vl"></div></div>
                <div style="margin: 100px 0 0px 3.5%; display: inline;">
                    <span style="margin-left: 2%;">카테고리 변수명</span>
                </div>
                <br><br><br>
                
        <div class="title"><span>목표일</span>
			<div class="vl"></div></div>
            	<span style="margin-left: 2%;">목표일 변수명</span>
                <br><br><br>

		<div class="title"><span>필요도</span>
            <div class="vl"></div></div>
                <div class="star-rating ness" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-ness" name="rating-ness" value="5"/>
                    <label for="5-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="4-stars-ness" name="rating-ness" value="4"/>
                    <label for="4-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="3-stars-ness" name="rating-ness" value="3"/>
                    <label for="3-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="2-stars-ness" name="rating-ness" value="2"/>
                    <label for="2-stars-ness" class="star-ness">★</label>
                    <input type="radio" id="1-star-ness" name="rating-ness" value="1"/>
                    <label for="1-star-ness" class="star-ness">★</label>
                </div>
                <br><br><br>

                <div class="title"><span>선호도</span>
            <div class="vl"></div></div>
                <div class="star-rating pref" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-pref" name="rating-pref" value="5"/>
                    <label for="5-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="4-stars-pref" name="rating-pref" value="4"/>
                    <label for="4-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="3-stars-pref" name="rating-pref" value="3"/>
                    <label for="3-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="2-stars-pref" name="rating-pref" value="2"/>
                    <label for="2-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="1-star-pref" name="rating-pref" value="1"/>
                    <label for="1-star-pref" class="star-pref">★</label>
                </div>
                <br><br><br>
                <div class="title"><span>우선순위</span>
                <div class="vl"></div></div>
                
                <div class="star-rating prio" style="display: inline; margin-left: 3%;">
                    <input type="radio" id="5-stars-prio" name="rating-prio" value="5"/>
                    <label for="5-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="4-stars-prio" name="rating-prio" value="4"/>
                    <label for="4-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="3-stars-prio" name="rating-prio" value="3"/>
                    <label for="3-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="2-stars-prio" name="rating-prio" value="2"/>
                    <label for="2-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="1-star-prio" name="rating-prio" value="1"/>
                    <label for="1-star-prio" class="star-prio">★</label>
                </div>
                <br><br><br>
                <div class="title"><span>사진</span>
            <div class="vl"></div></div>
            <span style="margin-left: 2%;">사진</span>
        <br><br><br>
        <div class="title" style="vertical-align: top;"><span>메모</span>
            <div class="vl"></div></div>
            <span style="margin-left: 2%;">메모 변수명</span>
        <br>
</div> -->
<!-- 오른쪽 정보 적는 부분 (예상 비용) -->
<div class="row d-flex justify-content-center">
<div id="info-2">
    
    <div class="table-wrap">
               <div class="table-box table-box--vertical"><br>
                  <table class="table table--vertical" id="BudgetList">
                     <thead>
                        <tr>
                        	<th class="th-1"></th>
                        	<th class="th-2">항목</th>
							<th class="th-3">예상 지출액</th>
                        	<th class="th-4">실제 지출액</th>
                        	<th class="th-5"></th>  
						</tr>
                     </thead>
                     <tbody>
	                 	<c:forEach items="${Budgetlist}" var="g" varStatus="status">
    						<form action="../editbudgetok/${g.getBudget_id()}/${bucket.getBucket_id()}" method="post">
		             		<tr>
		                    	<th>${status.count}</th>
		                        <td><input class="form-control" name="budget_name" type="text" value="${g.getBudget_name()}"></td>
		                        <td><input id="budget${status.count}" class="form-control" name="budget"
		                        	onclick="calcSum();" onkeyup="changeBudget(${status.count},this.value);calcSum();" 
		                        	style="border:none;text-align:right;" type="text" value="${g.getBudget()}"></td>
		                        <td>
		                        	<input id="expenditure${status.count}" class="form-control" name="expenditure"
		                        		onclick="calcSum();" onkeyup="changeExpenditure(${status.count},this.value);calcSum();" 
		                        		class="border-bottom" style="border:none;text-align:right;" type="text" value="${g.getExpenditure() }">
		                        	<div class="posneg" id="difference${status.count}" style="font-size:12px;padding-right:12px;">${g.getBudget()-g.getExpenditure()}</div>
		                        </td>
		                        <td style="bordeer:none;">
									<button type="submit" id="tablebutton" style="background-color:#C1DDD3;"onclick="alert('해당 내용이 수정되었습니다.');">수정</button>
		                        	<button type="button" id="tablebutton" style="background-color:rgba(227, 158, 153, 1)" onclick="alert('해당 내역이 삭제되었습니다.');location.href='deletebudgetok/${g.getBudget_id()}'">삭제</button>
		                        </td>
							</tr>
							</form>
		                 </c:forEach>
						 <tr style="background-color:#DCDCDC;">
	                        <th class="th-1"></th>
	                        <th class="th-2">총액</th>
	                        <td class="th-3"><div id="total_budget" style="border:none; font-size:17px;"></div></td>
	                        <td class="th-4"><div id="total_expenditure" style="border:none;"></div><br>
	                        	<div class="posneg" id="total_difference" style="border:none;font-size:12px;"></div>
	                        </td>
	                        <td class="th-5"></td>
	             		</tr>
                     </tbody>  
                  </table>
                 
				<button id="completebutton" onclick="location.href='../readbudget'" style="margin-left: 45%;">취소</button>
				<input type="button" id = "completebutton" value="완료" onclick="alert('해당 버킷이 완료로 처리되었습니다.'); location.href='../readaccount';">
              
               </div>
            </div>
   
</div>
</div>


<!-- <input type="button" value="돌아가기" style="margin-left: 50%;"> -->
<br><br><br>


<div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
	<p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
	<p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
</div>


</body>
</html>
</html>
