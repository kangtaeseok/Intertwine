<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/squareMain.css"> <!-- 이 jsp파일의 css파일 연결 -->
<script defer src="/intertwine/resources/js/squareMain.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
</head>
<body>
	<header> <!-- 페이지 상단 -->
		<div>
			<nav class="homebutton_nav"> <!-- 홈 버튼 -->
				<ul>
					<li class="homebutton"></li>
				</ul>
				<ol>
					<a href="#"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
				</ol>
			</nav>
		</div>

		<div class="search"> <!-- 검색창 -->
			<input type="text" placeholder="검색어 입력"> <img src="/intertwine/resources/images/search.png">
		</div>

		<div></div>
		<!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
	</header>

	<main>
		<aside class="side-bar">
			<ul>
				<li id="square">
					<%-- <a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a> --%>
					<!-- 스퀘어에서 스퀘어 버튼 막아놓기 --> <a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
				</li>
				<li id="mypage"><a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a> 
				<!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
				</li>
				<li id="friend"><a href="#"><i class="fa-solid fa-user-group"></i> 친구</a></li>
				<li id="chatting"><a href="#"><i class="fa-solid fa-comment"></i> 채팅</a></li>
				<li id="alarm"><a href="#"><i class="fa-solid fa-bell"></i> 알림</a></li>
				<li id="bookmark"><a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a></li>
				<li id="settings"><a href="#"><i class="fa-solid fa-gear"></i> 설정</a></li>
			</ul>
		</aside>
		<div id="submenubars">
			<div id="dummy_sub_menu" class="sub_menu">더미 서브메뉴</div>
			<div id="mypage_sub_menu" class="sub_menu">마이페이지 서브메뉴</div>
			<div id="chatting_sub_menu" class="sub_menu">채팅 서브메뉴</div>
			<div id="alarm_sub_menu" class="sub_menu">알림 서브메뉴</div>
			<div id="settings_sub_menu" class="sub_menu">설정 서브메뉴</div>
		</div>
		<div id="bottom_right_contents">
			<div id="abc">
				<div id="squarearea">
					<div id="loadingview">
						<img src="/intertwine/resources/images/loading/loading3.gif" alt="로딩 중...">
						<div id="squaretip">알고 계셨나요? 팀 세미콜론은 8명의 멤버로 이루어져 있답니다.</div>
						<!-- <div id="squaretip">알고 계셨나요? Intertwine은 두 가지 이상의 것이 서로 얽히거나 엮이는 것을 의미합니다. </div> -->
						<!-- <div id="squaretip">알고 계셨나요? 알고 계셨군요.</div> -->
					</div>
					<div id="userroom" style="background-color:${userRoom.roomColor}">
					<button id="btnupdateroom" class="bubbly-button">방 꾸미기</button>
					<button id="btnselectalbum" class="bubbly-button">앨범 보기</button>
					<button id="btnselectguestbook" class="bubbly-button">방명록 보기</button>
						<c:forEach var="roomResource" items="${userRoom.rList}">
							<img src="${roomResource.resourceURL}" 
									 alt="Room Resource Image"
									 class="userroomresource"
									 style="position: absolute; 
									            left: ${roomResource.resourcePositionX}px; 
									            top: ${roomResource.resourcePositionY}px; 
									            transform: rotate(${roomResource.resourceRotation}deg) scale(${roomResource.resourceScale});" />
						</c:forEach>
						<div id="mycharacter" style="width: 70px; height: 100px; position: absolute; top: 200px; left: 670px;">
							<div id="mycharacternickname" style="position: absolute; bottom: 100%; width: 100%; text-align: center; margin-bottom:4px;">닉네임</div>
						    <div id="mycharacterhair" style="position: absolute; width: 70px; height: 30px; top: 0px; left: 0; background-color: silver; /* 예시 색상 */"></div>
						    <div id="mycharacterhat" style="position: absolute; width: 50px; height: 20px;  background-color: skyblue;/* 위치와 크기 지정 */"></div>
						    <div id="mycharactertop" style="position: absolute; width: 70px; height: 30px; top: 30px; left: 0; background-color: pink;/* 위치와 크기 지정 */"></div>
						    <div id="mycharacterbottom" style="position: absolute; width: 70px; height: 40px; top: 60px; left: 0; background-color: orange;/* 위치와 크기 지정 */"></div>
						</div>
					</div>
					<%-- userroom --%>
					<div>
						<%--
							${userRoom.guestBookOpen}
							Resource ID: ${roomResource.resourceId}
							Resource Name: ${roomResource.resourceName}
							Position X: ${roomResource.resourcePositionX}
							Position Y: ${roomResource.resourcePositionY} 
						--%>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>

</html>