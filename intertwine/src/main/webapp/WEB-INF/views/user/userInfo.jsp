<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userInfo</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/intertwine/resources/css/userInfo.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<script src="/intertwine/resources/js/kakao.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>

</head>

<script type="text/javascript">
Kakao.init('40ec0da7a298d729eab6f57f66aad7f8');
console.log(Kakao.isInitialized()); 
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        	location.href="login.do";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
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
<header> <!-- 페이지 상단 -->
        <div> <!-- 홈 버튼 -->
            <nav class="homebutton_nav">
                <ul>
                    <li class="homebutton"></li>
                </ul>
                <ol>
                    <a href="#"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
                </ol>
            </nav>
        </div>

        <div class="search"> <!-- 검색창 -->
            <input type="text" placeholder="검색어 입력">
            <img src="/intertwine/resources/images/search.png">
        </div>

        <div></div>
        <!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
    </header>

    <main>
        <div>
            <aside class="side-bar">
                <ul>
                    <li id="a">
                       <a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>  
                    </li>
                    <li id="mypage">
                        <a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>
                        <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
                    </li>
                    <li id="c">
                        <a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>
                    </li>
                    <li id="chatting">
                        <a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>
                    </li>
                    <li id="alarm">
                        <a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
                    </li>
                    <li id="f">
                        <a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>
                    </li>
                    <li id="settings">
                        <a href="#"><i class="fa-solid fa-gear"></i> 설정</a>
                    </li>
                </ul>
            </aside>
            <div id="bottom_right_contents">
                <div id="dummy_sub_menu" class="sub_menu">
                    더미 서브메뉴
                </div>
                <div id="mypage_sub_menu" class="sub_menu">
                    마이페이지 서브메뉴
                </div>
                <div id="chatting_sub_menu" class="sub_menu">
                    채팅 서브메뉴
                </div>
                <div id="alarm_sub_menu" class="sub_menu">
                    알림 서브메뉴
                </div>
                <div id="settings_sub_menu" class="sub_menu">
            		<ul>
            			<li><a href="${pageContext.servletContext.contextPath}/userTime.do">이용시간<i class="fa-solid fa-clock"></i></a></li>
            			<c:if test="${empty type}">
                        	<li id="userInfo">
                        		<a href="${pageContext.servletContext.contextPath}/userInfo.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
                       		</li>
                        </c:if>
                        <c:if test="${type eq 'kakao'}">
							<li id="socialUserInfo">
								<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
							</li>
						</c:if>
						<c:if test="${type eq 'naver'}">
							<li id="socialUserInfo">
								<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
							</li>
						</c:if>
							<li><a href="${ pageContext.servletContext.contextPath }/flist.do">고객센터</a></li>
                    	<c:if test="${empty type}">
                        	<button class="btn" onclick="javascript:location.href='ulogout.do';">logout</button>
						</c:if>
						<c:if test="${type eq 'kakao'}">
							<button class="btn" id="kbtn" onclick="kakaoLogout();">logout</button>
						</c:if>
						<c:if test="${type eq 'naver'}">
							<button class="btn" id="nbtn" onclick="location.href='ulogout.do'">logout</button>
						</c:if>
                    </ul>
                </div>
                
               
                
                <!--<div class="feed">
                    피드창
                </div>-->
                
            </div>
            
            
            
        </div>
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
						<td>
						<input type="text" name="userName" id="username" value="${loginUser.userName }" required>
						</td>
					</tr>
					
					
					<tr>
						<tr><td>닉네임</td>	
						<td>
						<input type="text" name="nickname" id="nickname" value="${loginUser.nickname }">
						</td>
					</tr>
					
					<tr><td>비밀번호</td>
						<td><input type="password" name="userPwd" id="userpwd" maxlength="14" oninput="regExpPwd();" required>
							<div class="pwd-check-box"></div>
						</td>
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
    </main>

</body>
</html>