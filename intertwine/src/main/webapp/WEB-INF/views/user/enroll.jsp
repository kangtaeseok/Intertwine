<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>second</title>
<link rel="stylesheet" href="/intertwine/resources/css/enroll.css" />
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://kit.fontawesome.com/40acfae8f0.js" crossorigin="anonymous"></script>
<script type="text/javascript">

function regExpId() {
	const str = $("#userid").val();
	const regExp = /^[0-9a-zA-Z]{6,10}$/;
		if(str == ""){
			$(".id-check-box").hide();
			$(".id-check-box").text("");
		} else {
			if(!regExp.test(str)) {
				$(".id-check-box").show();
				$(".id-check-box").text("아이디는 영문 숫자 포함 6~10자 입니다.").css("color", "red");
				return;
			} else {
				$(".id-check-box").hide();
				return;
			}
		}
}
function checkId() {
	$.ajax({
		url: "idchk.do",
		type: "post",
		data: { userid: $('#userid').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				$(".id-check-box").show();
				$('.id-check-box').text('사용가능한 아이디입니다').css('color', 'blue');
				$('#userpwd').focus();
			}else{
				$('#userid').select();
				$(".id-check-box").show();
				$('.id-check-box').text('이미 사용중인 아이디입니다').css('color', 'red');
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
			  
		}
	});
	return false;
}

function checkEmail() {
	$.ajax({
		url: "emailchk.do",
		type: "post",
		data: { email: $('#mail').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				 sendEmail(data)
			} else {
				alert("중복된 이메일 입니다. 다른 이메일을 입력하세요.")
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	return false;
}



function regExpPwd() {
	const regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
	const pwd = $('#userpwd').val();
	
	if(!regExp.test(pwd)) {	
		$(".pwd-check-box").show();
		$(".pwd-check-box").html("비밀번호는 특수기호(!@#$%^*+=-), 숫자 포함 <br> 8자리 이상 15자리 미만으로 입력해주세요").css('color', 'blue');
		return;
	} else {
		$(".pwd-check-box").hide();
	}
	
}

//암호일치여부
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

function ph(target) {
	target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
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


function sendEmail() {
	var email = $("#mail").val();
	if(email) {
		$.ajax({
			type: "post",
			url: "postEmail.do",
            data: {email: email},
            success: function(data) {
            	alert("인증번호가 전송되었습니다. 이메일을 확인해주세요.");
            	timer()
            },
            error: function(xhr, status, error) {
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            }
		});
	}
}


function validate2() {
	$(".timer").remove();
	var auth = $("#auth").val();
	if(auth) {
		$.ajax({
			type: "post",
			url: "emailAuth.do",
            data: {auth: auth},
            success: function(data) {
            	document.getElementById("pho").select();
            },
            error: function(xhr, status, error) {
            	alert("오류 발생: " + error + "다시 한번 시도해주세요.");
            	document.getElementById("mail").select();
            }
		});
	}
}



function daumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                /* document.getElementById("extraAddress").value = extraAddr; */
                $("#extraAddress").text(extraAddr);
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            self.close();
            
        }
    }).open();
}
</script>
</head>
<body>

<div class="box">
	<div class="logo-box">
		 <img width=200; height=50; src="/intertwine/resources/images/intertwinelogo.png">
	</div>	
	<div class="enroll-box">
		<form method="post" action="uinsert.do" id="enroll-form" onsubmit="return validate();">
				<table class="outer" cellspacing="12" cellpadding="0">
					<tr><td width=120;>*아이디</td>
						<td>
							<input type="text" name="userId" id="userid" oninput="return regExpId();" required>
							<div class="id-check-box"></div>
						</td>
						<td>
							<input type="button" value="중복체크" onclick="return checkId();"> &nbsp;
						</td>
					</tr>
					
					<tr class="alertId">
						<tr><td>*이 름</td>	
						<td>
						<input type="text" name="userName" id="username" required>
						</td>
					</tr>
					
					<tr><td>*비밀번호</td>
						<td><input type="password" name="userPwd" id="userpwd" maxlength="14" oninput="regExpPwd();" required>
							<div class="pwd-check-box"></div>
						</td>
						<td></td>
					</tr>
					
					<tr><td>*비밀번호 확인</td>
						<td><input type="password" name="userpwd2" id="userpwd2" required maxlength="14">
						<div class="pwd2-check-box"></div>
						</td>
					</tr>
					
					<tr><td>*이메일</td>
						<td><input type="email" id="mail" name="email" required>
						</td><td>
							<input type="button" value="인증" onclick="checkEmail();"> &nbsp;
						</td>
					</tr>
					
					<tr class="alertEmail">
						<td></td>
						<td>
							<input id="auth" placeholder="인증번호를 입력하세요." required> &nbsp;
						</td>
						<td>
							<input class="timerbtn" type="button" value="확인" onclick="validate2();">
							<div class="timer"></div>
						</td>
					</tr>
					
					
					<tr><td>전화번호</td>
						<td><input type="tel" id="pho" name="phone" maxlength="13" oninput="ph(this)"></td>
						<td></td>
					</tr>
					
					<tr><td rowspan="3">주소</td>
					
					<tr><td>
							<input type="text" id="postcode" placeholder="우편번호"> <br>
						</td>
						<td><input type="button" onclick="daumPostcode();" value="우편번호 찾기"><br></td>
					</tr>
					
					<tr>
						<td>
						<input type="text" id="address" name="address" placeholder="주소"> <br>
						</td>
					</tr>

				</table>
					<div class="submit-box">
						<input type="submit" value="가입하기"> &nbsp;
						<input type="reset" value="작성취소" onclick="javascript:location.href='enroll.do'"> &nbsp;
					</div>
		</form>
	</div>
</div>



<div class="footer-box">
<hr>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</body>
</html>