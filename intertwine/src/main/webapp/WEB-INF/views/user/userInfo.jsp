<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/intertwine/resources/css/user/userInfo.css" />
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
</head>
<script type="text/javascript">
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

function daumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            
            if(data.userSelectedType === 'R'){
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
            
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

                $("#extraAddress").text(extraAddr);
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            self.close();
            
        }
    }).open();
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
</script>
<body>
    <main>
      	<c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
 <div id="bottom_right_contents">
	<div id="abc">
	    <div id="feed"> 
 
	   	 	<div class="box">
				<div class="logo-box">
				 	<h3>회원정보수정</h3>
				</div>	
			<div class="info-box">
				<form method="post" action="uupdate.do" id="info-form" onsubmit="return validate();">
						<table class="outer" cellspacing="12" cellpadding="0">
							<tr><td width=120;>아이디</td>
								<td>
									<input type="text" name="userId" id="userid" value="${ sessionScope.loginUser.userId }" readonly>
								</td>
							</tr>
							<tr class="alertId">
								<tr><td>이 름</td>	
								<td><input type="text" name="userName" id="username" value="${loginUser.userName }" required></td>
							</tr>
							
							
							<tr>
								<tr><td>닉네임</td>	
								<td><input type="text" name="nickname" id="nickname" value="${loginUser.nickname }">
								</td>
							</tr>
							
							<tr><td>비밀번호</td>
								<td><input type="password" name="userPwd" id="userpwd" maxlength="14" oninput="regExpPwd();" required>
									<div class="pwd-check-box"></div></td>
								<td></td>
							</tr>
							
							<tr><td>비밀번호 확인</td>
								<td><input type="password" name="userpwd2" id="userpwd2" required maxlength="14">
								<div class="pwd2-check-box"></div>
								</td>
							</tr>
							
							<tr><td>이메일</td>
								<td><input type="email" id="mail" name="email" value="${loginUser.email }" readonly>
							</tr>
							
							<tr><td>전화번호</td>
								<td><input type="tel" id="pho" name="phone" maxlength="13" value="${loginUser.phone }" oninput="ph(this)"></td>
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
								<input type="text" id="address" name="address" placeholder="주소" value="${loginUser.address }"> <br>
								
								</td>
							</tr>
		
						</table>
							<div class="submit-box">
								<input type="submit" value="수정하기"> &nbsp;
								<input type="reset" value="돌아가기" onclick="history.back(-1);"> &nbsp;
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
    </main>
</body>
</html>