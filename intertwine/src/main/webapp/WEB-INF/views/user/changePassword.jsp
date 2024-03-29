<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>changePassword</title>
<link rel="stylesheet" href="/intertwine/resources/css/changePassword.css" />
<script type="text/javascript">
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

function validate() {
	var pwdValue = $('#userpwd').val();
	var pwdValue2 = $('#userpwd2').val();
	
	if(pwdValue !== pwdValue2){
		$(".pwd2-check-box").text("암호확인이 일치하지 않습니다. 다시 입력하세요.").css("color", "red");
		document.getElementById("userpwd2").value = "";
		document.getElementById("userpwd").select();
		return false;  //전송 취소함
	}
}
</script>
</head>
<body>
<a href="${ pageContext.servletContext.contextPath }/login.do"><img style="width:180px; height:30px; "src="/intertwine/resources/images/intertwinelogo.png"></a>
	<div class="change-box">
	<h2>비밀번호 변경</h2>
	<div class="pwd-box">
		<div class="pwd-check-box"></div>
		
	</div>
	</div>

</body>
</html>