<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTime</title>
<link rel="stylesheet" href="/intertwine/resources/css/userTimePage.css" />
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
                        	<button class="btn" onclick="location.href='ulogout.do';">logout</button>
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
		<div class="time-box">
			<div class="logo-box">
				<h3>이용시간</h3>
			</div>
				<div class="usage-time">
					 ${time} 분
				 
				</div>
				<div class="chart-box">
					<canvas ID="myChart"></canvas>
				 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				</div>
			</div>
			<div class="time-setting-box">
				<div class="logo-box">
				<h3>시간 설정</h3>
				</div>
				<div class="time-set-box">
				
					<div class="set-box">
					<center>
						<div class="set1">
							<div class="set2"><button onclick="openPopup();"><h4>커스텀 알림보내기 <i class="fa-solid fa-pen"></i></h4></button></div>
							<div id="popup" class="popup">
							    <form class="popup-content" action="customTime.do">
							        <label for="message">메시지 :</label>
							        <input type="text" id="message" name="message"><br><br>
							        <input type="submit" value="전송" onclick="closePopup();">
							        <input type="reset" value="취소" onclick="closePopup();">
							    </form>
							</div>
						</div>
						<div class="set1">
							<div class="set2"><a href="userSetTime.do"><h4>기본 제공 알림보내기</h4></a></div>
						</div>
						<div class="set1">
							<div class="set2"><h4>시간 알림 차단하기</h4> &nbsp; <input type="checkbox"></div>
						</div>
						</center>
					</div>
				
				</div>
			</div>
	</div>
</main>

<script>
	const ctx = document.getElementById('myChart');
	new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: ['하루(시)', '이용시간(시)'],
	    datasets: [{
	      label: '하루 이용 시간',
	      data: [1440 / 60,'${time}'/60],
	    }]
	  },
	  options: {
	  }
	});
</script>
</body>
</html>