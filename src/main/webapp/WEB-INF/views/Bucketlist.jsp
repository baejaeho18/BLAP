<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Bucket</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function delete_ok(bucket_id) {
		var a = confirm("정말로 삭제하겠습니까?");
		if (a==1)
			location.href = 'deletebucketok/' + bucket_id;
	}
	function alldelete_ok() {
		var a = confirm("정말로 삭제하겠습니까?");
		if (a==1)
			location.href = 'alldeletebucketok'
	}
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="readbucket?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
	  
	  
	  
</script>

<style>
   .star{
   		color : #FFCC16;
   }
   .card{
   		background-repeat : no-repeat;
        background-size : cover;
     }
	
	.dropdown-menu > li > a:hover {
    background-color: #C1DDD3;
	}
	
	.title{
			margin-left:10%;
            text-align: left;
            width: 60%; 
            display: inline-block; 
            /*justify-content: space-between; */
       }
</style>
<style>
	/* h2 {
		text-align: center;
	}
	table {
		width: 100%;
	} */
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body class="pt-5">
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
	<br>
	
    <!-- MAIN -->
    <div class="row">
        <!-- CATEGORY -->
        <div class="col-sm-6 pt-4 px-5">
	        <form action="searchByTag" method="post" class="p-2 mb-2">
		      	<input style="border:none" type="search" name="tag_name" id="tag_name" class="form-control  border-bottom" autocomplete="false" placeholder="Type # to filter...">
		    </form>
	    </div>
        
        <!-- ADD & ORDER BY -->
        <div class="col-sm-6 pt-3 px-5">
            <div class="container-fluid pt-3  bg-white text-dark">
                <ul class="nav flex-column">
                    <li class="nav-item text-end">
                        <a href="addbucket">
                        	<button type="button" class="btn btn-outline-white btn-sm text-dark">
                            	추가하기
                        	</button>
                        </a>
                        
                        <a href="javascript:alldelete_ok()">
							<button  onclick="location.href='#'" type="button" class="btn btn-outline-white btn-sm text-dark">
                            	전체 삭제
                        	</button>
                       	</a>
                    </li>
                    <li class="nav-item">
                        <hr width = "100%" color = "black">
                    </li>
                    <li class="nav-item text-end">
                        <div class="btn-group" >
                     <select class="mb-3" id="cntPerPage" name="sel" onchange="selChange()" style="border:none; font-size:14px ">
				<option value="6"
					<c:if test="${paging.cntPerPage == 6}">selected</c:if>>6개씩 보기</option>
				<option value="9"
					<c:if test="${paging.cntPerPage == 9}">selected</c:if>>9개씩 보기</option>
				<option value="12"
					<c:if test="${paging.cntPerPage == 12}">selected</c:if>>12개씩 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15개씩 보기</option>
			</select>  
			
			
						  <!-- <button type="button" class="btn btn-sm mb-3 btn-outline-dark dropdown-toggle border-0" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
						    정렬 기준
						  </button>
						  <ul class="dropdown-menu dropdown-menu-lg-end">
						    <li><button class="dropdown-item" type="button">필요도</button></li>
						    <li><button class="dropdown-item" type="button">선호도</button></li>
						    <li><button class="dropdown-item" type="button">우선순위</button></li>
						    <li><button class="dropdown-item" type="button">가까운 목표일</button></li>					    
						    <li><button class="dropdown-item" type="button">가능한 예상비용만</button></li>						    
						    <li><button class="dropdown-item" type="button">미시작</button></li>						    
						    <li><button class="dropdown-item" type="button">진행 중</button></li>						    
						    <li><button class="dropdown-item" type="button">완료</button></li>
						  </ul> -->
						  
						 <%--  <select class="mb-3 ms-2" name="howAsc" id="orderValue" style="border:none; font-size:14px" onchange="changeSelect()">
						  	<option value="none" disabled selected>정렬 기준</option>
						  	<option value="recently"
						  		<c:if test="${howAsc == 'recently'}">selected</c:if>>최신순</option>
				    		<option value="need"
				    			<c:if test="${howAsc == 'need'}">selected</c:if>>필요도</option>
				    		<option value="preference"
				    			<c:if test="${howAsc == 'preference'}">selected</c:if>>선호도</option>
				    		<option value="priority"
				    			<c:if test="${howAsc == 'priority'}">selected</c:if>>우선순위</option>
				    		<option value="goal"
				    			<c:if test="${howAsc == 'goal'}">selected</c:if>>가까운 목표일</option>
				    		<option value="possible"
				    			<c:if test="${howAsc == 'possible'}">selected</c:if>>가능한 예상비용만</option>
				    		<option value="incomplete"
				    			<c:if test="${howAsc == 'incomplete'}">selected</c:if>>미시작</option>
				    		<option value="ongoing"
				    			<c:if test="${howAsc == 'ongoing'}">selected</c:if>>진행중</option>
				    		<option value="complete"
				    			<c:if test="${howAsc == 'complete'}">selected</c:if>>완료</option>
				    	</select> --%>
				    	
				    	 <select class="mb-3 ms-2" name="howAsc" id="orderValue" style="border:none; font-size:14px" onchange="changeSelect()">
						  	<option value="regdate" disabled selected>정렬 기준</option>
						  	<option value="recently">최신순</option>
				    		<option value="need">필요도</option>
				    		<option value="preference">선호도</option>
				    		<option value="priority">우선순위</option>
				    		<option value="goal">가까운 목표일</option>
				    		<option value="possible">가능한 예상비용만</option>
				    		<option value="incomplete">미시작</option>
				    		<option value="ongoing">진행중</option>
				    		<option value="complete">완료</option>
				    	</select>
				    	
				    	<!-- div class="col order" style="margin-right: 10px;">
							<select id="orderValue">
								<option value="problem.regdate" disabled selected>정렬</option>
								<option value="problem.name">제목순</option>
								<option value="problem.siteID">사이트순</option>
								<option value="problem.regdate desc">최신순</option>
								<option value="COUNT(*) desc">많이 풀어본 문제순</option>
							</select>
						</div>
							   -->
						  
						</div>
						
						
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- LIST -->
	<div class="container mt-5">
		<div class="row">
		
	<!-- 	
		<div id="review">
			<p>zzzzzzz</p> -->
			
			<%-- <c:if test= "${howAsc eq 'recently'}">
				<c:forEach items="${RecentlyList}" var="b" >
			<div class="col-sm-4 pt-3">
				<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket1.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
		                   		
		                   		<br>
		                        <h5 class="fw-bolder">${b.getBucket_name()}</h5>
		                        <br><br>
		                        <div align="left">
		                        	<!-- <div align="left" class="mt-5 d-flex justify-content-around ">
									  	<p class="text-start" style="display: inline; ">예상비용</p>
									  	<p style="display: inline; " >700,000원</p>
									</div>  -->
									
									<div align="left" class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline; ">필요도<p> -->
									  	
									  	<div class="title"><span style="display: inline; ">필요도&nbsp&nbsp&nbsp</span>
									  	
									  	<c:if test= "${b.getNeed() eq '5'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '4'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '3'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '2'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '1'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
									 <div class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">선호도</p> -->
									  	<div class="title"><span style="display: inline; ">선호도&nbsp&nbsp&nbsp</span>
									   <c:if test= "${b.getPreference() eq '5'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '4'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '3'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '2'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '1'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
									 <div class=" d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">우선순위</p> -->
									  	<div class="title"><span style="display: inline; ">우선순위</span>
									  	<c:if test= "${b.getPriority() eq '5'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '4'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '3'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '2'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '1'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
			                        <ul class="nav justify-content-end mt-3">
			                            <li class="nav-item mx-1">
			                            	<a href="editbucket/${b.getBucket_id()}">
			                            		<button class="bg-white" type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                            	<a href="javascript:delete_ok('${b.getBucket_id()}')">
			                            		<button class="bg-white"  type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                                <a href="viewbucket/${b.getBucket_id()}"><button type="button" class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button></a>
			                            </li>
			                        </ul>
			                        <div class=" d-flex justify-content-end w-100" id="contentElement">
									  <p class="fst-italic mt-3 me-3"> 백두산이 #마르고 닳도록 #안녕 </p>
									</div> 
		                        </div>
	                        
	                    </div>
	                </div>
				</div>
				</c:forEach>
			</c:if>
		
			<c:if test= "${howAsc eq 'need'}">
				<c:forEach items="${NeedList}" var="n" >
			<div class="col-sm-4 pt-3">
				<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket1.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
		                   		
		                   		<br>
		                        <h5 class="fw-bolder">${n.getBucket_name()}</h5>
		                        <br><br>
		                        <div align="left">
		                        	<!-- <div align="left" class="mt-5 d-flex justify-content-around ">
									  	<p class="text-start" style="display: inline; ">예상비용</p>
									  	<p style="display: inline; " >700,000원</p>
									</div>  -->
									
									<div align="left" class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline; ">필요도<p> -->
									  	
									  	<div class="title"><span style="display: inline; ">필요도&nbsp&nbsp&nbsp</span>
									  	
									  	<c:if test= "${n.getNeed() eq '5'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getNeed() eq '4'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getNeed() eq '3'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getNeed() eq '2'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${n.getNeed() eq '1'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
									 <div class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">선호도</p> -->
									  	<div class="title"><span style="display: inline; ">선호도&nbsp&nbsp&nbsp</span>
									   <c:if test= "${n.getPreference() eq '5'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPreference() eq '4'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPreference() eq '3'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPreference() eq '2'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPreference() eq '1'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
									 <div class=" d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">우선순위</p> -->
									  	<div class="title"><span style="display: inline; ">우선순위</span>
									  	<c:if test= "${n.getPriority() eq '5'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPriority() eq '4'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPriority() eq '3'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPriority() eq '2'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${n.getPriority() eq '1'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
			                        <ul class="nav justify-content-end mt-3">
			                            <li class="nav-item mx-1">
			                            	<a href="editbucket/${n.getBucket_id()}">
			                            		<button class="bg-white" type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                            	<a href="javascript:delete_ok('${n.getBucket_id()}')">
			                            		<button class="bg-white"  type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                                <a href="viewbucket/${n.getBucket_id()}"><button type="button" class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button></a>
			                            </li>
			                        </ul>
			                        <div class=" d-flex justify-content-end w-100" id="contentElement">
									  <p class="fst-italic mt-3 me-3"> 백두산이 #마르고 닳도록 #안녕 </p>
									</div> 
		                        </div>
	                        
	                    </div>
	                </div>
				</div>
				</c:forEach>
			</c:if>
			<p>hihih</p>
		</div> --%>
		
		
		<c:forEach items="${viewAll}" var="b" >
			<div class="col-sm-4 pt-3">
				<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket1.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
		                   		<c:if test="${b.getState() eq '0'}">
    								<h6 style="text-align : center; margin-left:5%; margin-right : 75%; padding: 5px 8px; font-weight: bold; background-color: white; border: 2px solid #F1C422; border-radius:40px; color: #F1C422;">미시작</h6>
								</c:if>
								<c:if test="${b.getState() eq '1'}">
    								<h6 style="text-align : center; margin-left:5%; margin-right : 75%; padding: 5px 8px; font-weight: bold; background-color: white; border: 2px solid #04E146; border-radius:40px; color: #04E146;">진행중</h6>
								</c:if>
								<c:if test="${b.getState() eq '2'}">
    								<h6 style="text-align : center; margin-left:5%; margin-right : 78%; padding: 5px 8px; font-weight: bold; background-color: white; border: 2px solid #E11104; border-radius:40px; color: #E11104;">완료</h6>
								</c:if>
								
		                   		<br>
		                        <h5 class="fw-bolder">${b.getBucket_name()}</h5>
		                        <br><br>
		                        <div align="left">
		                        	<!-- <div align="left" class="mt-5 d-flex justify-content-around ">
									  	<p class="text-start" style="display: inline; ">예상비용</p>
									  	<p style="display: inline; " >700,000원</p>
									</div>  -->
									
									<div align="left" class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline; ">필요도<p> -->
									  	
									  	<div class="title"><span style="display: inline; ">&nbsp&nbsp&nbsp필요도&nbsp&nbsp&nbsp&nbsp&nbsp</span>
									  	
									  	<c:if test= "${b.getNeed() eq '5'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '4'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '3'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '2'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getNeed() eq '1'}">
									  	<label for="5-stars-ness" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
									 <div class="d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">선호도</p> -->
<div class="title"><span style="display: inline; ">&nbsp&nbsp&nbsp선호도&nbsp&nbsp&nbsp&nbsp&nbsp</span>									   <c:if test= "${b.getPreference() eq '5'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '4'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '3'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '2'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPreference() eq '1'}">
									  	<label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
<!-- 									<div class="title"><span style="display: inline; ">&nbsp&nbsp&nbsp필요도&nbsp&nbsp&nbsp&nbsp&nbsp</span>
 -->									
									 <div class=" d-flex justify-content-around w-100">
									  	<!-- <p style="display: inline;">우선순위</p> -->
<div class="title"><span style="display: inline; ">우선순위&nbsp&nbsp&nbsp&nbsp&nbsp</span>									  	<c:if test= "${b.getPriority() eq '5'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '4'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '3'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '2'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★★</label>
									  	</c:if>
									  	<c:if test= "${b.getPriority() eq '1'}">
									  	<label for="5-stars-prio" class="star"  style="display: inline;" >★</label>
									  	</c:if>
									  	</div>
									</div> 
									<br>
									
			                        <ul class="nav justify-content-end mt-3">
			                            <li class="nav-item mx-1">
			                            <c:if test="${b.getState() ne '2'}">
			                            	<a href="editbucket/${b.getBucket_id()}">
			                            		<button class="bg-white" type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
			                            	</a>
			                            </c:if>
			                            </li>
			                            <li class="nav-item mx-1">
			                            	<a href="javascript:delete_ok('${b.getBucket_id()}')">
			                            		<button class="bg-white"  type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                                <a href="viewbucket/${b.getBucket_id()}"><button type="button" class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button></a>
			                            </li>
			                        </ul>
			                        <div class=" d-flex justify-content-end w-100" id="contentElement">
									  <p class="fst-italic mt-3 me-3"> 백두산이 #마르고 닳도록 #안녕 </p>
									</div> 
		                        </div>
	                        
	                    </div>
	      
	                </div>
				</div>
				</c:forEach> 
				
	<%-- 			<div class="col-sm-4 pt-3">
					<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket2.png);">
					<div class="fw-bolder ms-3" style="background-color: white; border: 2px solid #04E146; border-radius:50px; color: #04E146; width:20%">진행중</div>
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
	                        <h5 class="fw-bolder">테니스배우기</h5>
		                        
		                        <br><br>
		                        <div align="left">
									<div align="left" class="d-flex justify-content-around w-100">
								  	<p style="display: inline; ">필요도<p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
								</div> 
								 <div class="d-flex justify-content-around w-100">
								  	<p style="display: inline;">선호도</p>
								    <label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
								</div> 
								 <div class=" d-flex justify-content-around w-100">
								  	<p style="display: inline;">우선순위</p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
								</div> 
			                        <ul class="nav justify-content-end mt-3">
			                            <li class="nav-item mx-1">
			                            	<a href="editbucket/${b.getBucket_id()}">
			                            		<button class="bg-white" type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                            	<a href="javascript:delete_ok('${b.getBucket_id()}')">
			                            		<button class="bg-white"  type="button" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
			                            	</a>
			                            </li>
			                            <li class="nav-item mx-1">
			                                <a href="viewbucket/${b.getBucket_id()}"><button type="button" class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button></a>
			                            </li>
			                        </ul>
			                        <div class=" d-flex justify-content-end w-100" id="contentElement">
									  <!-- <p class="fst-italic mt-3 me-3"> 백두산이 #마르고 닳도록 #안녕 </p> -->
									  <p class="fst-italic mt-3 me-3"> 해시태그 #여행 #힐링 </p>
									</div> 
		                        </div>
	                    </div>
	                </div>
				</div>
				
				<div class="col-sm-4 pt-3">
					<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket3.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
	                        <h5 class="fw-bolder">애플워치 구매</h5>
	                        <br><br>
		                        <div align="left">
	                        	
								 <div align="left" class="d-flex justify-content-around w-100">
								  	<p style="display: inline; ">필요도<p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
								</div> 
								 <div class="d-flex justify-content-around w-100">
								  	<p style="display: inline;">선호도</p>
								    <label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
								</div> 
								 <div class=" d-flex justify-content-around w-100">
								  	<p style="display: inline;">우선순위</p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
								</div> 
		                        <ul class="nav justify-content-end mt-3">
		                            <li class="nav-item mx-1">
		                               <button class="bg-white"  onclick="location.href='./EditList'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white"   onclick="alert('삭제되었습니다.'); location.href='./Bucketlist'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button>
		                            </li>
		                        </ul>
	                        </div>
	                    </div>
	                </div>
				</div>
			</div>
			<div class="row">
	            <div class="col-sm-4 pt-3">
					<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket4.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
	                        <h5 class="fw-bolder">일본 여행</h5>
	                        <br><br>
		                        <div align="left">
	                        	
								 <div align="left" class="d-flex justify-content-around w-100">
								  	<p style="display: inline; ">필요도<p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
								</div> 
								 <div class="d-flex justify-content-around w-100">
								  	<p style="display: inline;">선호도</p>
								    <label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
								</div> 
								 <div class=" d-flex justify-content-around w-100">
								  	<p style="display: inline;">우선순위</p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
								</div> 
		                        <ul class="nav justify-content-end mt-3">
		                            <li class="nav-item mx-1">
		                               <button class="bg-white"  onclick="location.href='./EditList'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white"   onclick="alert('삭제되었습니다.'); location.href='./Bucketlist'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button>
		                            </li>
		                        </ul>
	                        </div>
	                    </div>
	                </div>
				</div>
				<div class="col-sm-4 pt-3">
					<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket5.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
	                        <h5 class="fw-bolder">부모님 여행</h5>
	                        <br><br>
		                        <div align="left">
	                        	
								 <div align="left" class="d-flex justify-content-around w-100">
								  	<p style="display: inline; ">필요도<p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
								</div> 
								 <div class="d-flex justify-content-around w-100">
								  	<p style="display: inline;">선호도</p>
								    <label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
								</div> 
								 <div class=" d-flex justify-content-around w-100">
								  	<p style="display: inline;">우선순위</p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
								</div> 
		                        <ul class="nav justify-content-end mt-3">
		                            <li class="nav-item mx-1">
		                               <button class="bg-white"  onclick="location.href='./EditList'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white"   onclick="alert('삭제되었습니다.'); location.href='./Bucketlist'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button>
		                            </li>
		                        </ul>
	                        </div>
	                    </div>
	                </div>
				</div>
				<div class="col-sm-4 pt-3">
					<div class="card" style="width:370px; height:370px; text-align:center; vertical-align:middle; display:table-cell; background-image: url(./resources/assets/img/bucket6.png);">
	                   <div class="align-middle text-center mt-3 w-100" style=" text-align:center; vertical-align:middle; display: inline-block;">
	                        <h5 class="fw-bolder">첼로 배우기</h5>
	                        <br><br>
		                        <div align="left">
	                        	
								 <div align="left" class="d-flex justify-content-around w-100">
								  	<p style="display: inline; ">필요도<p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★★</label>
								</div> 
								 <div class="d-flex justify-content-around w-100">
								  	<p style="display: inline;">선호도</p>
								    <label for="5-stars-pref" class="star"  style="display: inline;" >★</label>
								</div> 
								 <div class=" d-flex justify-content-around w-100">
								  	<p style="display: inline;">우선순위</p>
								  	<label for="5-stars-pref" class="star"  style="display: inline;" >★★</label>
								</div> 
		                        <ul class="nav justify-content-end mt-3">
		                            <li class="nav-item mx-1">
		                               <button class="bg-white"  onclick="location.href='./EditList'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">수정</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white"   onclick="alert('삭제되었습니다.'); location.href='./Bucketlist'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">삭제</button>
		                            </li>
		                            <li class="nav-item mx-1">
		                                <button class="bg-white" onclick="location.href='./View'" style="border-radius:10px; border: 1px solid #DDDDDD; width:60px; height:30px; font-size:14px">자세히</button>
		                            </li>
		                        </ul>
	                        </div>
	                    </div>
	                </div>
				</div>  --%>
			</div>
			</div>
			
			<div class="mt-5"style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/blapweb/readbucket?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b class="me-3">${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/blapweb/readbucket?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/blapweb/readbucket?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		</div>
	
    <!-- FOOTER -->
	<div class="mt-4 p-3 bg-secondary text-white text-end" style="margin-bottom:0; background-color:#C1DDD3 !important; height:100px">
		<p class=" pt-5" style="display: inline-block; font-size:13px">이용약관</p>
		<p class="pt-5" style="display: inline-block; font-size:13px">도움말</p>
	</div>
	
	<!-- <script>
		var content = document.getElementById('contentElement').innerHTML;
		var splitedArray = content.split(' ');
		var linkedContent = '';
		for(var word in splitedArray)
		{
		  word = splitedArray[word];
		   if(word.indexOf('#') == 0)
		   {
		      word = '<a href=\'Bucketlist\'>'+word+'</a>';
		   }
		   linkedContent += word+' ';
		}
		document.getElementById('contentElement').innerHTML = linkedContent; 
 	</script> -->
</body>
</html>