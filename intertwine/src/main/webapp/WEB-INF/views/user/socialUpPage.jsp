<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>socialUpdate</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/intertwine/resources/css/socialUpPage.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<script src="/intertwine/resources/js/kakao.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
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
                        <a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
                        <ul>
                            <li><a href="#">text1</a></li>
                            <li><a href="#">text2</a></li>
                            <li><a href="#">text3</a></li>
                            <li><a href="#">text4</a></li>
                        </ul>
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
   
                        <c:if test="${empty type}">
                        	<button class="btn" onclick="javascript:location.href='ulogout.do';">logout</button>
						</c:if>
						<c:if test="${type eq 'kakao'}">
							<button class="btn" id="kbtn" onclick="kakaoLogout();">logout</button>
						</c:if>
						<c:if test="${type eq 'naver'}">
							<button class="btn" id="nbtn" onclick="location.href='ulogout.do'">logout</button>
						</c:if>
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
		<form method="post" action="usocialupdate.do" id="info-form">
				<table class="outer" cellspacing="12" cellpadding="0">
			
					
					<tr class="alertId">
						<td>이 름</td>
						<td>
						
						<input type="text" name="userName" id="username" value="${loginUser.userName }">
						</td>
					</tr>
					
					<tr>
						<td>닉네임</td>	
						<td><input type="text" name="nickname" id="nickname">
						</td>
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

    </main>

</body>
</html>