<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<script src="/intertwine/resources/js/kakao.min.js"></script>

<script type="text/javascript">
 // sdk초기화여부판단
 Kakao.init('40ec0da7a298d729eab6f57f66aad7f8');
 console.log(Kakao.isInitialized());

 function kakaoLogin() {
		Kakao.Auth.login({
			success : function(response) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(response) {
						var kakaoId = response.id;
						var email = response.kakao_account.email;
						
						$('#kakaoemail').val(email);
						$('#kakaoId').val(kakaoId);
						document.kfrm.submit();
					},
					fail : function(error) {
						console.log(error)
					},
				})
			},
			fail : function(error) {
				console.log(error);				
			},
		})
	}
</script>


<link rel="stylesheet" href="/intertwine/resources/css/common/login.css" />
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
				<a>
				<img onclick="kakaoLogin();" src="/intertwine/resources/images/kakao_login.png"></a>
			
			<c:url var="kurl" value="${requestScope.naverurl}" />
			<a href="${ kurl }">
				<img src="/intertwine/resources/images/naver_login.png"></a>
			</a>
			

	 
  	
	      </div> 
    </div>
</div>


<form action="kakao_loginP.do" method="post" name="kfrm" type="hidden">
	<input type="hidden" name="kakaomail" id="kakaoemail"/>
	<input type="hidden" name="kakaoId" id="kakaoId"/>
</form>




</body>
</html>