<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<script src="/intertwine/resources/js/kakao.min.js"></script>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">
 // sdk초기화여부판단
 Kakao.init('40ec0da7a298d729eab6f57f66aad7f8');
 console.log(Kakao.isInitialized());
 
 Kakao.Auth.setAccessToken('${accessToken.getAccess_token()}');

	


</script>


<link rel="stylesheet" href="/intertwine/resources/css/login.css" />
<title>intertwine</title>
</head>
<body>
<div class="container">
	<div class="login-wrapper" >
		<div class="logo-box">
	     <img src="/intertwine/resources/images/intertwinelogo.png">
	    </div>
	        <form method="post" action="ulogin.do" id="login-form">
	            <input type="text" name="userId" placeholder="UserId">
	            <input type="password" name="userPwd" placeholder="Password">
	            <div class="enroll-box">
	            	<button type="button" onclick="location.href='enrollPage.do'">회원가입 | </button>
	            	<button type="button" onclick="location.href='findInfo.do'">아이디 비밀번호 찾기</button>
	            </div>
	            <input type="submit" value="로그인">
	            <div class="line-box">
	            	또는
	            </div>  
	        </form>
	       
	        <div class="social-box">
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=40ec0da7a298d729eab6f57f66aad7f8&redirect_uri=http://localhost:8080/intertwine/kakao_login.do&response_type=code">
				<img src="/intertwine/resources/images/kakao_login.png"></a>
	        	
	        	<a href="https://kauth.kakao.com/oauth/authorize?client_id=40ec0da7a298d729eab6f57f66aad7f8&redirect_uri=http://localhost:8080/intertwine/kakao_login.do&response_type=code">
				<img src="/intertwine/resources/images/naver_login.png"></a>
	      </div>   
    </div>
</div>

</body>
</html>