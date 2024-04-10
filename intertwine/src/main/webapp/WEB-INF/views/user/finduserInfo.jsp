<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changeIdPwd</title>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/intertwine/resources/css/common/finduserInfo.css" />
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
//전화번호 정규표현식
function ph(target) {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
} 

//비번 정규표현식
function regExpPwd() {
	const regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	const pwd = $('#userpwd').val();
	
	if(!regExp.test(pwd)) {	
		$(".pwd-check-box").html("비밀번호는 특수기호(!@#$%^*+=-), 숫자 포함 <br> 8자리 이상 15자리 미만으로 입력해주세요").css('color', 'blue');
		return;
	} else {
		$(".pwd-check-box").hide();
	}
	
}




//이메일 아이디체크
function checkEmail() {
	$.ajax({
		url: "emailsearch.do",
		type: "post",
		data: {email : $("#femail").val()},
		success: function(data){
			$(".id-find-email").html("회원님의 아이디는 " + data + " 입니다." );
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}
//이메일 비번체크
function checkEmail2() {
	$.ajax({
		url: "pwdsearch.do",
		type: "post",
		data: {email : $("#femail").val()},
		success: function(data){
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}

var timeLeft = 180;

function timer() {
	var countdownTimer = setInterval(function() {
        // 분과 초로 나누어 표시
        var minutes = parseInt(timeLeft / 60, 10);
        var seconds = parseInt(timeLeft % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        // 타이머 표시 업데이트
        $(".timer").html(minutes + ":" + seconds);

        // 타이머 종료 검사
        if (--timeLeft < 0) {
            clearInterval(countdownTimer);
            $(".timer").html("시간 만료!");
        }
    }, 1000); // 매 초마다 실행
}

//비번용 이메일 보내기
function sendEmail() {
	var email = $("#pmail").val();
	if(email) {
		$.ajax({
			type: "post",
			url: "postEmail.do",
            data: {email: email},
            success: function(data) {
            	alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");  	
            	$(".pwd-find-email").hide();
    			$(".auth-email").show();
            	timer()
            },
            error: function(xhr, status, error) {
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            }
		});
	}
}
//비번 이메일 인증확인
function pwdevalidate() {
	$(".timer").remove();
	var auth = $("#pwdemail").val();
	if(auth) {
		$.ajax({
			type: "post",
			url: "emailAuth.do",
            data: {auth: auth},
            success: function(data) {
            	$(".pwd-find-email").hide();
            	$(".auth-email").hide();
            	$(".pwd-inner-box").show();
            },
            error: function(xhr, status, error) {
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            	history.back(-1);
            }
		});
	}
}

//비번 변경 처리
function changePwd() {
	var pemail = $("#pmail").val();
	var pwd = $("#userpwd").val();
	if(pemail) {
		$.ajax({
			type: "post",
			url: "changePwd.do",
            data: {pemail: pemail, pwd: pwd},
            success: function(data) {
            	if(data == "ok"){
            		location.href="login.do";
            	}
            },
            error: function(xhr, status, error) {
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            }
		});
	}
	
}

//전화번호 아이디체크
function checkPhone() {
	var phone = $("#fphone").val();
	$.ajax({
		url: "phonesearch.do",
		type: "post",
		data: {phone : phone},
		success: function(data){
			$(".id-find-phone").html("회원님의 아이디는 " + data + " 입니다." );
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert("잘못된 전화번호입니다. 다시 입력해주세요.");
			history.back();
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}

//비번 전화번호 인증
function pwdpvalidate() {
	var phone = $("#pphone").val();
	if(phone){
		$.ajax({
			type: "post",
			url: "phonesearchpwd.do",
            data: {phone: phone},
            success: function(data) {
            	$(".pwd-find-phone").hide();
            	$(".auth-phone").show();
            	code = data;
            	console.log(data);
            },
            error: function(xhr, status, error) {
            	$(".auth-phone").hide();
            	$(".pwd-find-phone").show();
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            	
            }
		});
	}
}



function changePwd2() {
	$(".pwd-inner-box2").show();
	$(".auth-phone").hide();
}
var phone = $("#pphone").val();


function updatePwd2() {
	$("#hidePhone").val($("#pphone").val());
	document.cpwdp.submit();
	
}
//인증번호 대조
function phonepwdchk() {
	if($("#pwdphone").val() == code) {
		changePwd2();
	}
	
	
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
				<input type="text" name="phone" id="fphone" placeholder="휴대번호 입력" oninput="ph(this)">
				<button onclick="checkPhone();">확인</button>
			</div>
		</div>
	</div>
	
	<div class="pwd-box">
		<button class="button" onclick="changeEmail2();">이메일</button>
		<button class="button" onclick="changePhone2();">전화번호</button>
	<div class="pwd-find-box">
			<div class="pwd-find-email">
				<input type="text" name="email" id="pmail" placeholder="이메일 입력">
				<button onclick="sendEmail();">인증</button>
				
			</div>
			<div class="auth-email">
				<input type="text" id="pwdemail" placeholder="인증번호 입력">
				<div class="timer"></div>
				<button onclick="pwdevalidate();">확인</button>
			</div>
			
			<form action="changePwd.do" method="post">
				<div class="pwd-inner-box">
				<label>수정할 비밀번호 <input type="password" name="userPwd" id="userpwd" maxlength="14" oninput="regExpPwd();" required></label>
				<div class="pwd-check-box"></div><br>
	        	<label>비밀번호 확인 &nbsp; <input type="password" id="userpwd2" maxlength="14" required></label>  &nbsp; <button onclick="changePwd(); return false;">확인</button>	
				</div>
			</form>
			
			<div class="pwd-find-phone">
				<input type="text" name="phone" id="pphone" placeholder="휴대번호 입력">
				<button onclick="pwdpvalidate();">인증</button>
			</div>
			<div class="auth-phone">
				<input type="text" id="pwdphone" placeholder="인증번호 입력">
				<button onclick="phonepwdchk();">확인</button>
			</div>
			
			<form action="updatePwd.do" method="post" id="cpwdp">
				<div class="pwd-inner-box2">
				<label>수정할 비밀번호 <input type="password" name="userPwd" id="userpwd3" maxlength="14" oninput="regExpPwd();" required></label>
				<div class="pwd-inner-box2"></div><br>
	        	<label>비밀번호 확인 &nbsp; <input type="password" id="userpwd4" maxlength="14" required></label>  &nbsp; <button onclick="updatePwd2();">확인</button>
	        	<input type="hidden" name="phone" id="hidePhone"/>
				</div>
			</form>
		</div>	
	</div>
</div>


</body>
</html>