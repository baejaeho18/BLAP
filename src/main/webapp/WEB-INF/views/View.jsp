<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>View Bucket</title>
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
           <a href="/blapweb">
          <img src=".././resources/assets/img/logo.png" alt="blap Logo" style="width:80px; height:55px">
         </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse d-flex justify-content-center" id="collapsibleNavbar" >
           <ul class="navbar-nav">
               <li class="nav-item me-5">
                <a class="nav-link" href="../about">ABOUT</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="../readbucket">BUCKET</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="../Budget">BUDGET</a>
              </li>
              <li class="nav-item me-5">
                <a class="nav-link" href="../Mypage">PROFILE</a>
              </li>
            </ul>
          </div>
      </div>
    </nav>
      
    <br>
    
    <h3 style = 'text-align: center;'> ${v.bucket_name} </h3><br>  
   <div class="container my-5">
  		<div class="row d-flex justify-content-center" >
   				<div class="col-6 ps-5">
            	<div class="title"><span class="fw-bolder" style="font-size:15px">목표일</span></div>
            	

            	<!-- <div class="p-2 fw-light fs-6" style="display: inline; width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px "> -->
            	<div class="p-2 fw-light fs-6" style="display: inline; width: 65%; height:7%; ">
            	<fmt:formatDate value="${v.goal_date}" pattern="yyyy/MM/dd"/>
            	</div>
	            <%-- <div class="p-2 fw-light fs-6" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px">${v.goal_date}</div> --%>
	            <%-- <input type="date" name="goal_date" value="${v.goal_date}" class="p-2 fw-light fs-6" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px" /> --%>	
	            <br><br>
         
  

			<div class="title"><span class="fw-bolder" style="font-size:15px">필요도</span></div>
                <div class="star-rating ness" style="display: inline;">
                    <input type="radio" id="5-stars-ness" name="need" value="5" ${v.need eq '5' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="5-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="4-stars-ness" name="need" value="4" ${v.need eq '4' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="4-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="3-stars-ness" name="need" value="3" ${v.need eq '3' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="3-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="2-stars-ness" name="need" value="2" ${v.need eq '2' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="2-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="1-star-ness" name="need" value="1" ${v.need eq '1' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="1-star-ness" class="rating-ness">★</label>
                </div>   
                <br><br>
             <div class="title"><span class="fw-bolder" style="font-size:15px">선호도</span></div>
                <div class="star-rating pref" style="display: inline;">
                    <input type="radio" id="5-stars-pref" name="preference" value="5" ${v.preference eq '5' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="5-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="4-stars-pref" name="preference" value="4" ${v.preference eq '4' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="4-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="3-stars-pref" name="preference" value="3" ${v.preference eq '3' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="3-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="2-stars-pref" name="preference" value="2" ${v.preference eq '2' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="2-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="1-star-pref" name="preference" value="1" ${v.preference eq '1' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="1-star-pref" class="star-pref">★</label>
                </div>
                <br><br>
	            <div class="title"><span class="fw-bolder" style="font-size:15px">우선순위</span></div>    
                <div class="star-rating prio" style="display: inline;">
                    <input type="radio" id="5-stars-prio" name="priority" value="5" ${v.priority eq '5' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="5-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="4-stars-prio" name="priority" value="4" ${v.priority eq '4' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="4-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="3-stars-prio" name="priority" value="3" ${v.priority eq '3' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="3-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="2-stars-prio" name="priority" value="2" ${v.priority eq '2' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="2-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="1-star-prio" name="priority" value="1" ${v.priority eq '1' ? 'checked':''} disabled/>
                    <label class= "fs-5" for="1-star-prio" class="star-prio">★</label>
                </div>
                <br><br>
                
                <div class="title"><span class="fw-bolder" style="font-size:15px;">사진</span></div>
				<input type="file" name="image" accept="image/*" style="width:65%" class="form-control file-button fw-light fs-6" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		        <br><br>
		        <div class="title fw-bolder" style="vertical-align: top; font-size:15px"><span>메모</span></div>
		        
		        <div class="mb-5" style="margin-left:20.5%; width: 65%; height:30%;  border: 1px solid #D2D2D2; border-radius:3px">${v.memo}</div>
		        </div>

<!-- 오른쪽 정보 적는 부분 (예상 비용) -->

   
	</div>
  </div>
  
  <div>
  
  
  		<c:if test="${v.getState() eq '0'}">
			<form action="../startbucketok/${v.bucket_id}" method="get">
		    	<input type="submit" id = "startbutton" value="시작" style="display: inline-block;  margin-left: 80%; margin-top: 5px; background-color: rgb(159 167 223);" onclick="alert('해당 버킷이 시작되었습니다.');">
		    </form>
	    </c:if>
		<c:if test="${v.getState() eq '1'}">
	 		<form action="../endbucketok/${v.bucket_id}" method="get">
		    	<input type="submit" id = "completebutton" value="완료" style="background-color: rgb(223 159 159);" onclick="alert('해당 버킷이 완료로 처리되었습니다.');">
			</form>
		</c:if>
	<%-- 	<c:if test="${b.getState() eq '2'}">
			<h6 style="text-align : center; margin-left:5%; margin-right : 78%; padding: 5px 8px; font-weight: bold; background-color: white; border: 2px solid #E11104; border-radius:40px; color: #E11104;">완료</h6>
		</c:if> --%>
		
		<%-- <form action="../startbucketok/${v.bucket_id}" method="get">
	    	<input type="submit" id = "startbutton" value="시작" style="display: inline-block;  margin-left: 70%; margin-top: 5px;" onclick="alert('해당 버킷이 시작되었습니다.');">
	    </form>
	    <form action="../endbucketok/${v.bucket_id}" method="get">
	    	<input type="submit" id = "completebutton" value="완료" style="display: inline-block; margin-left: 5%;" onclick="alert('해당 버킷이 완료로 처리되었습니다.');">
		</form> --%>
	
</div>

  <!--   <input type="button" id = "startbutton" value="시작" style="margin-left: 75%; margin-top: 5px;" onclick="alert('해당 버킷이 시작되었습니다.');">
    <input type="button" id = "completebutton" value="완료" style="margin-left: 5%;" onclick="alert('해당 버킷이 완료로 처리되었습니다.');">
	 -->
<!--   <input type="button" value="돌아가기" style="margin-left: 50%;"> -->
<br><br><br>
<a href ="../readbucket" style="margin-left: 48%; ">돌아가기</a>


<footer>
	    <div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
	        <p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
	        <p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
	    </div>
	</footer>
</body>
</html>