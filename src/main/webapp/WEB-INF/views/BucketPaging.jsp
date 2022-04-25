<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
</script>

<title>게시판 목록</title>
</head>
<style>
	h2 {
		text-align: center;
	}
	table {
		width: 100%;
	}
	#outter {
		display: block;
		width: 60%;
		margin: auto;
	}
	a {
		text-decoration: none;
	}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="selectlist?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
</script>
<body>
<h2>게시판</h2>

<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> <!-- 옵션선택 끝 -->
	<!-- <table border="1">
		<tr>
			<td>No.</td>
			<td width="50%">제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>		
		</tr> -->


		<%-- <c:forEach items="${viewAll}" var="list">
			<tr>
				<td>${list.getBucket_id()}</td>
				<td><a href='detail?seq=${list.getBucket_id()}'>${list.getBucket_name()}</a></td>
				<td>${list.memo }</td>
				<td><fmt:formatDate value="${list.getRegdate()}" pattern="yyyy.MM.dd"/> </td>
			</tr>
		</c:forEach>  --%>
		
		
	<div class="container mt-5">
		<div class="row">	
		<c:forEach items="${viewAll}" var="b" >
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
				</div>
				</div>
				
	<<!-- /table>  -->
	<input type="button" value="글쓰기" style="float: right;" onclick="location.href='/write'"><br>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/blapweb/selectlist?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/blapweb/selectlist?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/blapweb/selectlist?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</body>
</html>