<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	if(request.getAttribute("flag") != null && !request.getAttribute("flag").equals("")){
		int flag = (Integer)request.getAttribute("flag");
		
		out.println("<script type='text/javascript'>");
		if(flag==0){ //로그인 성공
			out.println("alert('로그인에 성공하였습니다.');");
			out.println("location.href='.'");
		}
		else if(flag==1){ //비번 틀림
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("location.href='./Signin.jsp'");
		}
		else if(flag==2){ //회원정보 없음
			out.println("alert('회원정보가 없습니다.');");
			out.println("location.href='./Signin.jsp'");
		}
		else { //기타 에러 & 맨 처음 시작
			out.println("location.href='./Signin.jsp'");
		}
		out.println("</script>");
	}
%>

<!DOCTYPE html>
<html>
<head>
<title>Sign In</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">
<link href="./resources/assets/css/signin.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 	window.onload = function(){
		document.getElementById('login_submit').onclick = function(){
			if(document.wfrm.id.value.trim()==''){
				alert('ID를 입력해주세요');
				return false;
			}
			if(document.wfrm.password.value.trim()==''){
				alert('Password를 입력해주세요');
				return false;
			}
			document.login_frm.submit();
		}
	} */
	
	window.Kakao.init("f22003a7696f595002b599109c13e8f5");
	
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile_nickname,account_email',
			success: function(authObj){
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: res => {
						const email = res.kakao_account.email;
						const name = res.properties.nickname;
						
						console.log(email);
						console.log(name);
						
						$('#kakaoemail').val(email);
						$('#kakaoname').val(name);
						document.login_frm.submit();
					}
				});
			}
		});
	}
</script>

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>

<body class="text-center">
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
		        <a class="nav-link" href="/about">ABOUT</a>
		      </li>
		      <li class="nav-item me-5">
		        <a class="nav-link" href="Bucketlist">BUCKET</a>
		      </li>
		      <li class="nav-item me-5">
		        <a class="nav-link" href="Budget">BUDGET</a>
		      </li>
		      <li class="nav-item me-5">
		        <a class="nav-link" href="Mypage">PROFILE</a>
		      </li>
		    </ul>
		  </div>
	  </div>
	</nav>
	
	<br>
	<!-- 로그인 폼 -->
	<main class="form-signin">
		<form method="post" name="login_frm">
			<input type="hidden" name="login_ok" value="1"/> <!-- form 넘어갈떄 같이 넘어가서 회원정보 비교 -->
			<img class="mb-4" src="./resources/assets/img/logo.png"
				alt="" width="300" height="200">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>

			<!-- <div class="form-floating">
				<input type="email" class="form-control" id="floatingInput"
					placeholder="name@example.com"> <label for="floatingInput">Email
					address</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword"
					placeholder="Password"> <label for="floatingPassword">Password</label>
			</div>

			<div class="checkbox mb-3 text-end">
				<label> <input type="checkbox" value="remember-me">
					Remember me
				</label>
			</div>
			
			<button class="w-100 btn btn-lg" style="background-color:#A3BBAD; color:white" type="submit" id="login_submit">로그인</button>
			<button class="w-100 btn btn-lg mt-3" style="background-color:white; color:#A3BBAD; border:1px solid #A3BBAD" type="submit">회원가입</button> -->
			
			<div class="mt-3" id="kakaologin">
				<div class="kakaobtn">
					<input type="hidden" name="kakaoemail" id="kakaoemail" />
					<input type="hidden" name="kakaoname" id="kakaoname" />
					<a href="javascript:kakaoLogin();">
						<img src="resources/assets/img/kakao_login_medium_wide.png" />
					</a>
				</div>
			</div>
			
			<p class="mt-5 mb-3 text-muted">&copy; 본 웹사이트는 실습을 위해 만들어졌습니다!</p>
		</form>
	</main>
	<!-- FOOTER -->
</body>
</html>
