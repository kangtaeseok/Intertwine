<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTime</title>
<link rel="stylesheet" href="/intertwine/resources/css/userStopPage.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<script src="/intertwine/resources/js/kakao.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<script>
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

function openPopup() {
	  document.getElementById("popup").style.display = "block";
}

// 팝업 닫기 함수
function closePopup() {
  document.getElementById("popup").style.display = "none";
}
function disableButton() {
	var confirmAction = confirm("계정을 비활성화하시겠습니까?");
	 if (confirmAction) {
		 $.ajax({
			 url: 'udisable.do'
			 type: 'POST'
		 });
		 
		 alert("계정이 비활성화되었습니다."); 
	 } else {
		 alert("계정 비활성화가 취소되었습니다.");
		 
	 }
}
function stopButton() {
	var confirm = confirm("계정을 탈퇴하시겠습니까?");
	 if (confirm) {
		 $.ajax({
			 url: 'ustopdel.do'
			 type: 'POST'
		 });
		 
		 alert("계정이 비활성화되었습니다."); 
	 } else {
		 alert("계정 비활성화가 취소되었습니다.");
		 
	 }
	
	
	
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
                            <li id="square">
                    			<a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
               				</li>
                        </ul>
                    </li>
                    <li id="mypage">
                        <a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>
                        <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
                    </li>
                    <li id="friend">
                    <a href="${ pageContext.servletContext.contextPath }/friendPage.do"><i class="fa-solid fa-user-group"></i> 친구</a>
                </li>
                <li id="chatting">
                    <a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>
                </li>
                <li id="alarm">
                    <a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
                </li>
                <li id="bookmark">
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
                
                <li><a href="${pageContext.servletContext.contextPath}/userTime.do"> 이용시간 <i class="fa-solid fa-clock"></i></a></li>
            	<c:if test="${empty type}">
                        <li id="userInfo">
                        	<a href="${pageContext.servletContext.contextPath}/userInfo.do"> 회원정보수정<i class="fa-solid fa-feather"></i></a>
                       	</li>
                        </c:if>
                        <c:if test="${type eq 'kakao'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"> 회원정보수정 <i class="fa-solid fa-feather"></i></a>
						</li>
						</c:if>
						<c:if test="${type eq 'naver'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"> 회원정보수정 <i class="fa-solid fa-feather"></i></a>
						</li>
						</c:if>
						
						<li><a href="${ pageContext.servletContext.contextPath }/userStopPage.do">계정 비활성화 <i class="fa-solid fa-user-xmark"></i></a></li>
						
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
                
            </div>
        </div>
<div class="box">      
			<div class="logo-box">
				<h3>계정 비활성화</h3>
			</div>
			<div class="body-box">
			<br><br>
			<h4>${sessionScope.loginUser.userName } 님, 안녕하세요.</h4>
			<br> 
				계정을 탈퇴하지 않고 비활성화할 수 있습니다. <br> 
				비활성화 설정시 게시물은 비공개 상태로 전환됩니다.<br><br>
				<hr>
				<br><br>
				계정을 비활성화하시는 이유가 무엇인가요? <br><br>

				<select>
					<option>휴식을 위해서</option>
					<option>계정 보호를 위해서</option>
				</select>
				<br><br>
				추후 비활성화 해제시 비밀번호를 입력하여
				해제할 수 있습니다.
				<br><br>
				<button onclick="disableButton();">계정 비활성화</button>
				<br><hr><br>
				
				혹은 계정 탈퇴를 원하시면 계정탈퇴 버튼을 눌러주세요.
				<br><br>
				<button onclick="stopButton();">계정 탈퇴</button>
				<br>
				
				</div>
	</div>
</main>
</body>
</html>