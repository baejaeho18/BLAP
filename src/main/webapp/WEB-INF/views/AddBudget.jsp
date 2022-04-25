<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <title>New Budget list</title>
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
            height: 500px;
        }
        .file-button {
            display: inline;
           /*  margin-left: 2.8%;
            border: 1px solid black;
            cursor: pointer;
            padding: 0.48% 31%;
            text-align: right; */
        }
        #photo {
            visibility: hidden;
        }

        #info-1 {
            display: inline-block;
            /* margin-left: 10%; */
            width: 40%;
        }
        #info-2 {
        	 display: inline-block; 
           /*  float:right; */
            /* margin-right: 10%; */
            width : 40%;
        }
        
        .title{
            /* text-align: right;  */
            width: 20%; 
            display: inline-block; 
            /*justify-content: space-between; */
        }
        .title2{
        	display : inline-block;
        
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
        input[type=submit] {
            background-color: rgba(173, 172, 172, 1);
            border: none;
            color: white;
            padding: 5px 20px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10%;
        }
        input[type=reset] {
            background-color: white;
            border: 0.2px solid black;
            padding: 4.8px 19.8px;
            text-decoration: none;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10%;
        }
        
    </style>
</head>
<body>
    <script language="javascript"> 
        function add() {
            document.getElementById('allexpense').value = 0;
            
            for(i=1; i<arrInput.length; i++) {
                var id = 'expense'+i;
                if(parseInt(document.getElementById(id).value)) document.getElementById('allexpense').value = parseInt(document.getElementById('allexpense').value) + parseInt(document.getElementById(id).value) ;
            } 
        }

        var arrInput = new Array(1);
        var arrInputName = new Array(1);
        var arrInputValue = new Array(1);
        
        function addInput() {
            
            arrInput.push(arrInput.length);
            arrInputName.push("");
            arrInputValue.push("");            
            display();
        }
        
        function display() {
            document.getElementById('expenseData').innerHTML="";
            for (intI=1; intI<arrInput.length; intI++) {
                document.getElementById('expenseData').innerHTML += createInput(arrInput[intI], arrInputName[intI], arrInputValue[intI]);
            }
        }
        
        function saveValue(intId,strValue) {
            arrInputValue[intId]=strValue;
        }  

        function saveName(intId,strName) {
            arrInputName[intId]=strName;
        }  
        
        function createInput(id,name,value) {
            return "<div class='col fw-bolder' style='padding: 10px 10px; border-right:1px solid #B7ABAB; border-bottom:1px solid #B7ABAB;'>"+id+"</div><div class='col' style='padding: 10px 10px;border-right:1px solid #B7ABAB; border-bottom:1px solid #B7ABAB;'>"+
                "<input style='background-color:white; border:1px solid #D2D2D2' class='item' type='text' onChange='saveName("+ id +",this.value)' value='"+ name +"'/></div> "+
                "<div class='col' style='padding: 10px 10px; border-bottom:1px solid #B7ABAB;'>&nbsp;&nbsp;<input type='text' class='expense' id='expense"+ id +
                "'  onkeyup='add()' style='width: 78%; background-color:white; border:1px solid #D2D2D2'; onChange='saveValue("+ id +",this.value)' value='"+ value +"'/> 원</div><br><br>";    
            
        }
        function deleteInput() {
        if (arrInput.length > 0) { 
            arrInput.pop(); 
            arrInputName.pop(); 
            arrInputValue.pop();
        }
            display(); 
        }

    </script>


    <nav class="navbar navbar-expand-sm bg-white navbar-light border-bottom">
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

    <h3 class="fw-light" style = 'text-align: center;'> NEW BUDGET LIST </h3><br>
    
  	<div class="container my-5">
  		<div class="row d-flex justify-content-center" >
  			<form action="addbudgetok" method="post" class="col-6 ps-5" >
  				<div class="title"><span class="fw-bolder" style="font-size:15px">예산 항목</span></div>
           		<input type="text" name="budget_name" class="form-control" id="validationCustom01" style="width: 65%; height:20%; border-radius:3px; display:inline" required>
<!--            		<input name="budget_name" type="text" class="form-control" id="validationCustom01" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px; display:inline" required>
 -->          		<br><br>
	
	           
		        <div class="title fw-bolder"style="vertical-align: top; font-size:15px"><span>예산지출액</span></div>
<!-- 				<input name="budget" type="text" class="form-control" id="validationCustom01" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px; display:inline" required>
 -->		        <input type="text" name="budget" class="form-control" id="validationCustom01" style="width: 65%; height:20%; border-radius:3px; display:inline" required>
		        <div class="d-flex justify-content-center mt-5">
			        <button type="button" class = "py-2 px-4 me-4" style=" background-color:white; border: 1px solid #494949; border-radius:5px " onclick="location.href='Bucketlist'">취소</button>
	    			<button type="submit" class = "py-2 px-4 ms-4" value="등록" style=" color: white; background-color: #ADACAC; border: 1px solid #ADACAC; border-radius:5px" onclick="alert('등록되었습니다.');">등록</button>
				</div>
			</form>		
			
  		</div>
  	</div>
	
	<!-- <div class="mt-5">
		<button type="button" class = "py-2 px-4" style="margin-left: 43%; margin-top: 5px; background-color:white; border: 1px solid #494949; border-radius:5px " onclick="location.href='Bucketlist'">취소</button>
    	<button type="submit" class = "py-2 px-4" value="등록" style="margin-left: 5%; color: white; background-color: #ADACAC; border: 1px solid #ADACAC; border-radius:5px" onclick="alert('등록되었습니다.');">등록</button>	
	</div> -->
   
	<footer>
	    <div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
	        <p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
	        <p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
	    </div>
	</footer>
</body>
</html>