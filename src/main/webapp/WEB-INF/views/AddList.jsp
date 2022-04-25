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
    <title>New Bucket list</title>
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
     /*    input[type=submit] {
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
        } */
        
    </style>
</head>
<body>

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

    <h3 class="fw-light" style = 'text-align: center;'> NEW BUCKET LIST </h3><br>
    
  	<div class="container my-5">
  		<div class="row d-flex justify-content-center" >
  			<form action="addbucketok" method="post" class="col-6 ps-5">
  				<div class="title"><span class="fw-bolder" style="font-size:15px">제목</span></div>
           		<input type="text" name="bucket_name" class="form-control" id="validationCustom01" style="width: 65%; height:7%; border-radius:3px; display:inline" required>
          		<br><br>
	            <!-- <div class="title"><span class="fw-bolder" style="font-size:15px">해시태그</span></div>
	            <input type="text" name="tag_id" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px" />	
	            <br><br>	 -->	
            	<div class="title"><span class="fw-bolder" style="font-size:15px">목표일</span></div>
	            <input type="date" class="p-2 fw-light fs-6" name="goal_date" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px" />	
	            <br><br>
	            <!-- <input type="date" class="p-2 fw-light fs-6" name="goal_date"  required pattern="\d{4}-\d{2}-\d{2}" style="width: 65%; height:7%;  border: 1px solid #D2D2D2; border-radius:3px" /> -->	
	           <div class="title"><span class="fw-bolder" style="font-size:15px">필요도</span></div>
                <div class="star-rating ness" style="display: inline;">
                    <input type="radio" id="5-stars-ness" name="need" value="5"/>
                    <label class= "fs-5" for="5-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="4-stars-ness" name="need" value="4"/>
                    <label class= "fs-5" for="4-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="3-stars-ness" name="need" value="3"/>
                    <label class= "fs-5" for="3-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="2-stars-ness" name="need" value="2"/>
                    <label class= "fs-5" for="2-stars-ness" class="rating-ness">★</label>
                    <input type="radio" id="1-star-ness" name="need" value="1"/>
                    <label class= "fs-5" for="1-star-ness" class="rating-ness">★</label>
                </div>   
                <br><br>
                 <div class="title"><span class="fw-bolder" style="font-size:15px">선호도</span></div>
                <div class="star-rating pref" style="display: inline;">
                    <input type="radio" id="5-stars-pref" name="preference" value="5"/>
                    <label class= "fs-5" for="5-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="4-stars-pref" name="preference" value="4"/>
                    <label class= "fs-5" for="4-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="3-stars-pref" name="preference" value="3"/>
                    <label class= "fs-5" for="3-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="2-stars-pref" name="preference" value="2"/>
                    <label class= "fs-5" for="2-stars-pref" class="star-pref">★</label>
                    <input type="radio" id="1-star-pref" name="preference" value="1"/>
                    <label class= "fs-5" for="1-star-pref" class="star-pref">★</label>
                </div>
                <br><br>
	            <div class="title"><span class="fw-bolder" style="font-size:15px">우선순위</span></div>    
                <div class="star-rating prio" style="display: inline;">
                    <input type="radio" id="5-stars-prio" name="priority" value="5"/>
                    <label class= "fs-5" for="5-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="4-stars-prio" name="priority" value="4"/>
                    <label class= "fs-5" for="4-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="3-stars-prio" name="priority" value="3"/>
                    <label class= "fs-5" for="3-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="2-stars-prio" name="priority" value="2"/>
                    <label class= "fs-5" for="2-stars-prio" class="star-prio">★</label>
                    <input type="radio" id="1-star-prio" name="priority" value="1"/>
                    <label class= "fs-5" for="1-star-prio" class="star-prio">★</label>
                </div>
                <br><br>
                <div class="title"><span class="fw-bolder" style="font-size:15px;">사진</span></div>
				<input type="file" name="image" accept="image/*" style="width:65%" class="form-control file-button fw-light fs-6" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		        <br><br>
		        <div class="title fw-bolder" style="vertical-align: top; font-size:15px"><span>메모</span></div>
		        <textarea class="mb-5" cols="50" rows="5" name="memo" style=" width: 65%; height:30%;  border: 1px solid #D2D2D2; border-radius:3px"></textarea>
		        <br>
		        <div class="d-flex justify-content-center">
		        	<button type="button" class = "py-2 px-4 me-4" style=" background-color:white; border: 1px solid #494949; border-radius:5px " onclick="location.href='readbucket'">취소</button>
    				<button type="submit" class = "py-2 px-4 ms-4" value="등록" style=" color: white; background-color: #ADACAC; border: 1px solid #ADACAC; border-radius:5px" onclick="alert('등록되었습니다.');">등록</button>
		        </div>
			</form>		
  		</div>
  	</div>
	

    <div class="p-3 bg-secondary text-white text-end" style="margin-bottom:0; margin-top : 5%; background-color:#C1DDD3 !important; height:100px">
        <p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
        <p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
    </div>
</body>
</html>