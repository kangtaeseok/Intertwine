<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>socialUpdate</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<link rel="stylesheet" href="/intertwine/resources/css/user/socialUpPage.css" />
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<script>
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
</script>
</head>
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
						<form method="post" action="usocialupdate.do" id="info-form">
								<table class="outer" cellspacing="12" cellpadding="0">
									<tr class="alertId">
										<td>이 름</td>
										<td><input type="text" name="userName" id="username" value="${loginUser.userName }"></td>
									</tr>
									
									<tr>
										<td>닉네임</td>	
										<td><input type="text" name="nickname" id="nickname"></td>
									</tr>
									
									<tr><td>이메일</td>
										<td><input type="email" id="mail" name="email" readonly value="${loginUser.email }">
									</tr>
									
									<tr><td>전화번호</td>
										<td><input type="tel" id="pho" name="phone" maxlength="13" oninput="ph(this)" value="${loginUser.phone }"></td>
									</tr>
									
									<tr><td rowspan="2">주소</td>
										<td><input type="text" id="postcode" placeholder="우편번호"></td>
									</tr>
									
									<tr>
									<td><input type="text" id="address" name="address" placeholder="주소">
										</td>
										<td><input type="button" onclick="daumPostcode();" value="우편번호 찾기"><br></td>
									</tr>
								</table>
								
								<div class="submit-box">
									<input type="submit" value="수정하기"> &nbsp;
									<input type="reset" value="계속하기" onclick="location.href='login.do'"> &nbsp;
								</div>
							</form>
						</div>
					</div>
				</div> <!-- feed -->
			</div> <!-- abc -->
		</div> <!-- bottom_right_contents -->
		<!-- 챗봇 -->
		<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import> 
    </main>
</body>
</html>