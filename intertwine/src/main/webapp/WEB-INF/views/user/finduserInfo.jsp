<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeIdPwd</title>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/intertwine/resources/css/finduserInfo.css" />
<script type="text/javascript">

$(".auth-email").hide();
$(".auth-phone").hide();

function changeEmail() {
	$(".id-find-phone").hide();
	$(".id-find-email").show();
}

function changePhone() {
	$(".id-find-phone").show();
	$(".id-find-email").hide();
}

function changeEmail2() {
	$(".pwd-find-email").show();
	$(".pwd-find-phone").hide();
}

function changePhone2() {
	$(".pwd-find-phone").show();
	$(".pwd-find-email").hide();
}


function checkEmail() {
	$.ajax({
		url: "idsearch.do",
		type: "post",
		data: {email : $("#femail").val()},
		success: function(data){
			$(".id-find-email").html(data);
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
		

	});

}


</script>
</head>
<body>
<header><img src="/intertwine/resources/images/intertwinelogo.png"></header>
<div class="body-div">
	<div class="id-box">
		<button class="button" onclick="changeEmail();">이메일</button>
		<button class="button" onclick="changePhone();">전화번호</button>
		<div class="id-find-box">
			<div class="id-find-email">
				<input type="text" name="email" id="femail" placeholder="이메일 입력">
				<button onclick="checkEmail();">확인</button>
			</div>

			<div class="id-find-phone">
				<input type="text" name="phone" id="fphone" placeholder="휴대번호 입력">
				<button onclick="checkPhone();">확인</button>
			</div>
		</div>
	</div>
	
	<div class="pwd-box">
		<button class="button" onclick="changeEmail2();">이메일</button>
		<button class="button" onclick="changePhone2();">전화번호</button>
	<div class="pwd-find-box">
			<div class="pwd-find-email">
				<input type="text" name="email" id="femail" placeholder="이메일 입력">
				<button>인증</button>
			</div>
			<div class="auth-email">
				<input type="text" id="pwdemail" placeholder="인증번호 입력">
				<button>확인</button>
			</div>
			
			<div class="pwd-find-phone">
				<input type="text" name="phone" id="fphone" placeholder="휴대번호 입력">
				<button onclick="">인증</button>
			</div>
			<div class="auth-phone">
				<input type="text" id="pwdphone" placeholder="인증번호 입력">
				<button>확인</button>
			</div>
		</div>	
	</div>
</div>


</body>
</html>