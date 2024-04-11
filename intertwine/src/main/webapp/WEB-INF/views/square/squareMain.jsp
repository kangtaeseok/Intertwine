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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> -->
<!-- 파비콘 설정 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/squareMain.css">
<!-- 이 jsp파일의 css파일 연결 -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet"> -->
<script type="text/javascript">
	var userId = "${userRoom.userId}";
	var userIdFromJSP = "${userRoom.userId}"; // JSP 변수를 JavaScript 변수로 변환
	window.globaluserId = userIdFromJSP; // 이 변수를 window 객체의 프로퍼티로 설정하여 전역으로 사용 가능하게 함
	var currentHairId;
	var currentHatId;
	var currentTopId;
	var currentBottomId;

	
	window.roomHost = "${sessionScope.loginUser.userId}";
	console.log("현재 방의 주인: ", roomHost);
	
	
</script>

<script defer src="/intertwine/resources/js/squareMain.js"></script>
<!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js"
	crossorigin="anonymous"></script>
<!-- 폰트어썸 가져오기 -->
<script type="text/javascript"
	src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<%-- jquery 파일 로드 --%>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
<script src="/intertwine/resources/js/isotope.pkgd.min.js"></script>
</head>
<body>

	<!-- 닉네임 수정 모달 -->
	<div class="nicknamemodal" id="nicknameChangeModal" tabindex="-1"
		aria-labelledby="nicknameChangeModalLabel" aria-hidden="true">
		<div class="nicknamemodal-dialog">
			<div class="nicknamemodal-content">
				<div class="nicknamemodal-header">
					<h5 class="nicknamemodal-title" id="nicknameChangeModalLabel">닉네임
						수정</h5>
					<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
				</div>
				<div class="nicknamemodal-body">
					<form>
						<div class="mb-3">
							<!--  <label for="nickname-input" class="col-form-label"></label> -->
							<input type="text" class="form-control" id="renamenicknameinput"
								autocomplete="off" placeholder="새로운 닉네임 입력"
								style="width: 160px;">
						</div>
					</form>
				</div>
				<div class="nicknamemodal-footer">
					<button type="button" class="btn btn-secondary"
						id="cancleNicknamebtn" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="changeNicknamebtn">변경</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 닉네임 수정 모달 -->

	<!-- 캐릭터 수정 모달 -->
	<div class="charactermodal" id="characterChangeModal" tabindex="-1"
		aria-labelledby="characterChangeModalLabel" aria-hidden="true">
		<div class="charactermodal-dialog">
			<div class="charactermodal-content">
				<div class="charactermodal-header">
					<h5 class="charactermodal-title" id="characterChangeModalLabel">캐릭터
						수정</h5>
					<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					<div class="charactermodal-preview">
						<div id="previewcharacter"
							style="width: 70px; height: 120px; position: absolute; top: 65px; left: 42px; /* background: blue; */ padding: 10px;">
							<div id="previewcharacterhair" class="previewcharacterresource"
								style="position: absolute; width: 30px; height: 20px; top: 8px; left: 18px;"></div>
							<div id="previewcharacterhat" class="previewcharacterresource"
								style="position: absolute; width: 50px; height: 20px; top: 0px; left: 7px;"></div>
							<div id="previewcharactertop" class="previewcharacterresource"
								style="position: absolute; width: 50px; height: 30px; top: 30px; left: 10px;"></div>
							<div id="previewcharacterbottom" class="previewcharacterresource"
								style="position: absolute; width: 50px; height: 40px; top: 60px; left: 10px;"></div>

						</div>
					</div>
				</div>
				<div class="charactermodal-body">
					<div class="charactermodal-hair-container">
						<div id="characterhair0" class="charactermodal-hair"></div>
						<div id="characterhair1" class="charactermodal-hair"></div>
						<div id="characterhair2" class="charactermodal-hair"></div>
						<div id="characterhair3" class="charactermodal-hair"></div>
						<div id="characterhair4" class="charactermodal-hair"></div>
						<div id="characterhair5" class="charactermodal-hair"></div>
						<div id="characterhair6" class="charactermodal-hair"></div>
						<div id="characterhair7" class="charactermodal-hair"></div>
						<div id="characterhair8" class="charactermodal-hair"></div>
						<div id="characterhair9" class="charactermodal-hair"></div>
					</div>

					<div class="charactermodal-hat-container">
						<div id="characterhat0" class="charactermodal-hat"></div>
						<div id="characterhat1" class="charactermodal-hat"></div>
						<div id="characterhat2" class="charactermodal-hat"></div>
						<div id="characterhat3" class="charactermodal-hat"></div>
						<div id="characterhat4" class="charactermodal-hat"></div>
						<div id="characterhat5" class="charactermodal-hat"></div>
						<div id="characterhat6" class="charactermodal-hat"></div>
						<div id="characterhat7" class="charactermodal-hat"></div>
						<div id="characterhat8" class="charactermodal-hat"></div>
						<div id="characterhat9" class="charactermodal-hat"></div>
					</div>

					<div class="charactermodal-top-container">
						<div id="charactertop0" class="charactermodal-top"></div>
						<div id="charactertop1" class="charactermodal-top"></div>
						<div id="charactertop2" class="charactermodal-top"></div>
						<div id="charactertop3" class="charactermodal-top"></div>
						<div id="charactertop4" class="charactermodal-top"></div>
						<div id="charactertop5" class="charactermodal-top"></div>
						<div id="charactertop6" class="charactermodal-top"></div>
						<div id="charactertop7" class="charactermodal-top"></div>
						<div id="charactertop8" class="charactermodal-top"></div>
						<div id="charactertop9" class="charactermodal-top"></div>
					</div>

					<div class="charactermodal-bottom-container">
						<div id="characterbottom0" class="charactermodal-bottom"></div>
						<div id="characterbottom1" class="charactermodal-bottom"></div>
						<div id="characterbottom2" class="charactermodal-bottom"></div>
						<div id="characterbottom3" class="charactermodal-bottom"></div>
						<div id="characterbottom4" class="charactermodal-bottom"></div>
						<div id="characterbottom5" class="charactermodal-bottom"></div>
						<div id="characterbottom6" class="charactermodal-bottom"></div>
						<div id="characterbottom7" class="charactermodal-bottom"></div>
						<div id="characterbottom8" class="charactermodal-bottom"></div>
						<div id="characterbottom9" class="charactermodal-bottom"></div>
					</div>
				</div>
				<div class="charactermodal-footer">
					<button type="button" class="btn btn-secondary"
						id="cancleCharacterbtn" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary"
						id="changeCharacterbtn">변경</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 캐릭터 수정 모달 -->

	<!-- 방 수정 모달 -->
	<div class="roommodal" id="roomChangeModal" tabindex="-1"
		aria-labelledby="roomChangeModalLabel" aria-hidden="true">
		<div class="roommodal-dialog">
			<div class="roommodal-content">
				<div class="roommodal-header">
					<h5 class="roommodal-title" id="roomChangeModalLabel">방 꾸미기</h5>
					<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					<ul class="roomcolor">
						
						<li class="green"></li>
						<li class="blue"></li>
						<li class="red"></li>
						<li class="purple"></li>
						<li class="cyan"></li>
						<li class="yellow"></li>
						
						<li class="orange"></li>
						<li class="lime"></li>
						<li class="pink"></li>
						<li class="yeonpink"></li>
						<li class="olive"></li>
						<li class="gray"></li>
						
					</ul>
					<div class="roommodal-preview">
						<!-- <div id="previewroom" style="width: 70px; height: 120px; position: absolute; top:65px; left: 42px; /* background: blue; */ padding:10px;"></div> -->

					</div>
				</div>
				<div class="roommodal-body">
					<div class="roommodal-first-container">
						<div id="roomresource0" class="roommodal-resource"></div>
						<div id="roomresource1" class="roommodal-resource"></div>
						<div id="roomresource2" class="roommodal-resource"></div>
						<div id="roomresource3" class="roommodal-resource"></div>
						<div id="roomresource4" class="roommodal-resource"></div>
						<div id="roomresource5" class="roommodal-resource"></div>
						<div id="roomresource6" class="roommodal-resource"></div>
						<div id="roomresource7" class="roommodal-resource"></div>
						<div id="roomresource8" class="roommodal-resource"></div>
						<div id="roomresource9" class="roommodal-resource"></div>
					</div>

					<div class="roommodal-second-container">
						<div id="roomresource10" class="roommodal-resource"></div>
						<div id="roomresource11" class="roommodal-resource"></div>
						<div id="roomresource12" class="roommodal-resource"></div>
						<div id="roomresource13" class="roommodal-resource"></div>
						<div id="roomresource14" class="roommodal-resource"></div>
						<div id="roomresource15" class="roommodal-resource"></div>
						<div id="roomresource16" class="roommodal-resource"></div>
						<div id="roomresource17" class="roommodal-resource"></div>
						<div id="roomresource18" class="roommodal-resource"></div>
						<div id="roomresource19" class="roommodal-resource"></div>
					</div>

					<div class="roommodal-third-container">
						<div id="roomresource20" class="roommodal-resource"></div>
						<div id="roomresource21" class="roommodal-resource"></div>
						<div id="roomresource22" class="roommodal-resource"></div>
						<div id="roomresource23" class="roommodal-resource"></div>
						<div id="roomresource24" class="roommodal-resource"></div>
						<div id="roomresource25" class="roommodal-resource"></div>
						<div id="roomresource26" class="roommodal-resource"></div>
						<div id="roomresource27" class="roommodal-resource"></div>
						<div id="roomresource28" class="roommodal-resource"></div>
						<div id="roomresource29" class="roommodal-resource"></div>
					</div>
				</div>
				<div class="roommodal-footer">
					<button type="button" class="btn btn-secondary" id="cancleroombtn"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="changeroombtn">변경</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 방 수정 모달 -->

	<!-- 친구 리스트 모달 -->
	<div class="friendmodal" id="friendListModal" tabindex="-1"
		aria-labelledby="friendModalLabel" aria-hidden="true">
		<div class="friendodal-dialog">
			<div class="friendmodal-content">
				<div class="friendmodal-header">
					<h5 class="friendmodal-title" id="friendListModalLabel">친구 목록</h5>
				</div>

				<div class="friendmodal-body"
					style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
					<div class="friendmodal-list"
						style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;"></div>
				</div>
				<div class="friendmodal-footer">
					
					<button type="button" class="btn btn-secondary"
						id="canclefirendbtn" data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="gofirendroombtn">이동</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 친구 리스트 모달 -->


	<!-- 앨범 모달 -->
	<div class="albummodal" id="albumModal" tabindex="-1"
		aria-labelledby="albumModalLabel" aria-hidden="true">
		<div class="albumodal-dialog">
			<div class="albummodal-content">
				<div class="albummodal-header">
					<h5 class="albummodal-title" id="albumListModalLabel">앨범</h5>
				</div>
				<div class="albummodal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
					<section>
						<article class="odd">
							<div>
								<!-- <img src="img/p1.jpg" alt=""> -->
							</div>
						</article>
						<article class="even">
							<div>
								<!-- <img src="img/p2.jpg" alt=""> -->
							</div>
						</article>
						<article class="odd">
							<div>
								<!-- <img src="img/p3.jpg" alt=""> -->
							</div>
						</article>
						<article class="even">
							<div>
								<!-- <img src="img/p4.jpg" alt=""> -->
							</div>
						</article>
						<article class="odd">
							<div>
								<!-- <img src="img/p5.jpg" alt=""> -->
							</div>
						</article>
						
					</section>
				</div>
				<div class="albummodal-footer">
					<button type="button" class="btn btn-secondary" id="canclealbumbtn"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 앨범 모달 -->

<!-- 방명록 모달 -->
<div class="guestbookmodal" id="guestbookModal" tabindex="-1"
		aria-labelledby="guestbookModalLabel" aria-hidden="true">
		<div class="guestbookmodal-dialog">
			<div class="guestbookmodal-content">
				<div class="guestbookmodal-header">
				<button type="button" id="cancleguestbookbtn" class="btn-close" data-dismiss="modal" aria-label="Close">
 				<span aria-hidden="true" style="font-size: 3.0rem;">×</span></button>
					<h5 class="guestbookmodal-title" id="guestbookModalLabel">방명록</h5>
				</div>
				<div class="guestbookmodal-body" style="max-height: calc(100vh - 200px); overflow-x: hidden; overflow-y: auto;">
					
						<div class="guestbookcontainer">
							<div id="roomresource0" class="guestbookcontentborder">
								<div id="guestbookcontent" class="guestbookcontent">guestbookContent</div>
								<div id="guestbookfooter" class="guestbookfooter">writer</div>
							</div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource1" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource2" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource3" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource4" class="guestbookcontentborder"></div>
						</div>
				
					
					
						<div class="guestbookcontainer">
							<div id="roomresource0" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource1" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource2" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource3" class="guestbookcontentborder"></div>
						</div>
						<div class="guestbookcontainer">
							<div id="roomresource4" class="guestbookcontentborder"></div>
						</div>
					</div>
					
					
					
				</div>
				<div class="guestbookmodal-footer">
					<!-- <button type="button" class="btn btn-secondary" id="cancleguestbookbtn" data-bs-dismiss="modal">닫기</button> -->
					<div class="guestbook-write-btn">
				    <button id="writeGuestbookBtn" class="btn-floating">
				        <i class="fas fa-plus"></i> <!-- FontAwesome 아이콘 사용 -->
				    </button>
				</div>
				
				</div>
			</div>
		</div>
	
<!-- 방명록 모달 -->

<!-- 방명록 작성 모달 -->
	<div class="writeguestbookmodal" id="writeguestbookModal" tabindex="-1"
		aria-labelledby="writeguestbookModalLabel" aria-hidden="true">
		<div class="writeguestbookmodal-dialog">
			<div class="writeguestbookmodal-content">
				<div class="writeguestbookmodal-header">
					<h5 class="writeguestbookmodal-title" id="writeguestbookModalLabel">방명록 작성</h5>
					<ul class="guestbookcolor">
						<li class="green"></li>
						<li class="blue"></li>
						<li class="red"></li>
						<li class="purple"></li>
						<li class="cyan"></li>
						<li class="yellow"></li>
						</ul>
						<ul class="guestbookcolor">
						<li class="orange"></li>
						<li class="lime"></li>
						<li class="pink"></li>
						<li class="yeonpink"></li>
						<li class="olive"></li>
						<li class="gray"></li>
					</ul>
				</div>
				<div class="writeguestbookmodal-body">
					<form>
						<div class="mb-3">
							<!--  <label for="nickname-input" class="col-form-label"></label> -->
							<input type="text" class="form-control" id="writeguestbookinput"
								autocomplete="off" placeholder="방명록 작성"
								style="width: 320px; height: 320px;">
						</div>
					</form>
				</div>
				<div class="writeguestbookmodal-footer">
					<button type="button" class="btn btn-secondary"
						id="canclewriteguestbookbtn" data-bs-dismiss="modal">작성 취소</button>
					<button type="button" class="btn btn-primary"
						id="writeguestbookebtn">작성 완료</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 방명록 작성 모달 -->




	<header>
		<!-- 페이지 상단 -->
		<div>
			<nav class="homebutton_nav">
				<!-- 홈 버튼 -->
				<ul>
					<li class="homebutton"></li>
				</ul>
				<ol>
					<a href="#"><i class="fa-solid fa-house"></i></a>
					<!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
				</ol>
			</nav>
		</div>
			
		<div class="search">
			<!-- 검색창 -->
			<input type="text" placeholder="검색어 입력"> <img
				src="/intertwine/resources/images/search.png">
		</div>

		<div></div>
		<!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
	</header>

	<main>
		<aside class="side-bar">
			<ul>
				<li id="square">
					<%-- <a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a> --%>
					<!-- 스퀘어에서 스퀘어 버튼 막아놓기 --> <a href="#"><i
						class="fa-solid fa-gamepad"></i> 스퀘어</a>
				</li>
				<li id="mypage"><a href="#"><i
						class="fa-solid fa-circle-user"></i> 마이페이지</a> <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> -->
					<!-- 색칠된 아이콘 --></li>
				<li id="friend"><a href="#"><i
						class="fa-solid fa-user-group"></i> 친구</a></li>
				<li id="chatting"><a href="#"><i
						class="fa-solid fa-comment"></i> 채팅</a></li>
				<li id="alarm"><a href="#"><i class="fa-solid fa-bell"></i>
						알림</a></li>
				<li id="bookmark"><a href="#"><i
						class="fa-solid fa-bookmark"></i> 북마크</a></li>
				<li id="settings"><a href="#"><i class="fa-solid fa-gear"></i>
						설정</a></li>
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
						<img src="/intertwine/resources/images/loading/loading3.gif"
							alt="로딩 중...">
						<div id="squaretip">알고 계셨나요? 팀 세미콜론은 8명의 멤버로 이루어져 있답니다.</div>
						<!-- <div id="squaretip">알고 계셨나요? Intertwine은 두 가지 이상의 것이 서로 얽히거나 엮이는 것을 의미합니다. </div> -->
						<!-- <div id="squaretip">알고 계셨나요? 알고 계셨군요.</div> -->
					</div>
					<div id="userroom" style="background-color:${userRoom.roomColor}">
						<button id="btnselectguestbook" class="bubbly-button">방명록
							보기</button>
						<button id="btnselectalbum" class="bubbly-button">앨범 보기</button>
						<c:if test="${userRoom.userId == sessionScope.loginUser.userId}">
							<button id="btnupdateroom" class="bubbly-button">방 꾸미기</button>
						</c:if>
						

						<c:forEach var="roomResource" items="${userRoom.rList}">
						    <c:set var="scaleValue" value="${roomResource.resourceScale}" />
						    <c:if test="${fn:contains(roomResource.resourceURL, '0')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="1.5" />
						    </c:if>
						    <c:if test="${fn:contains(roomResource.resourceURL, '25')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="0.3" />
						    </c:if>
						    <c:if test="${fn:contains(roomResource.resourceURL, '26')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="0.3" />
						    </c:if>
						    <c:if test="${fn:contains(roomResource.resourceURL, '27')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="0.3" />
						    </c:if>
						    <c:if test="${fn:contains(roomResource.resourceURL, '28')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="0.3" />
						    </c:if>
						    <c:if test="${fn:contains(roomResource.resourceURL, '29')}">
						        <!-- URL에 '0'이 포함되어 있으면 scaleValue를 변경합니다. -->
						        <c:set var="scaleValue" value="0.3" />
						    </c:if>
						    <img src="${roomResource.resourceURL}" alt="Room Resource Image"
						        class="userroomresource"
						        style="position: absolute; 
						               left: ${roomResource.resourcePositionX * 2.3}px; 
						               top: ${roomResource.resourcePositionY * 2.3}px; 
						               transform: rotate(${roomResource.resourceRotation}deg) scale(${scaleValue});" />
						</c:forEach>
						<div id="mycharacter"
							style="width: 70px; height: 100px; position: absolute; top: 200px; left: 670px;">
							<div id="mycharacternickname"
								style="position: absolute; bottom: 100%; width: 100%; text-align: center; margin-bottom: 4px;">닉네임</div>
							<div id="mycharacterhair" class="mycharacterresource"
								style="position: absolute; width: 30px; height: 20px; top: 8px"></div>
							<div id="mycharacterhat"
								style="position: absolute; width: 50px; height: 20px; background-size: calc(100% - 10px) calc(100% - 10px);"></div>
							<div id="mycharactertop" class="mycharacterresource"
								style="position: absolute; width: 50px; height: 30px; top: 30px; left: 10px;"></div>
							<div id="mycharacterbottom" class="mycharacterresource"
								style="position: absolute; width: 50px; height: 40px; top: 60px; left: 10px;"></div>
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
	<script type="text/javascript">
$(function(){ // document.ready
	
	var tips = [
        "알고 계셨나요? 팀 세미콜론은 8명의 멤버로 이루어져 있답니다.",
        "알고 계셨나요? Intertwine은 두 가지 이상의 것이 서로 얽히거나 엮이는 것을 의미합니다.",
        "알고 계셨나요? 스퀘어에는 모든 요청이 Ajax요청이랍니다.",
        "알고 계셨나요? 모달창이란 현재 활성화된 페이지 또는 창 위에 떠서 나타나는 창을 말합니다.",
        "알고 계셨나요? visibility: hidden;은 보이지는 않지만 공간은 차지하고 있답니다.",
        "알고 계셨나요? 알고 계셨군요..."
    ];

    // 팁 배열에서 랜덤한 팁을 선택
    var randomTip = tips[Math.floor(Math.random() * tips.length)];

    // 선택된 팁으로 #squaretip의 텍스트 변경
    $('#squaretip').text(randomTip);
	    
	    
		// ajax 사용
		$.ajax({
			
			url: "getmycharacter.do",
			type: "post",	
			data: { "userId": userId }, 
			dataType: "json",  
			success: function(data){
				const hair = document.querySelector("#mycharacterhair");
			    hair.style.backgroundImage = "url('" + data.hairStyleImageURL + "')";
			    hair.style.backgroundSize = "cover";
			    hair.style.backgroundPosition = "center";
			    const hat = document.querySelector("#mycharacterhat");
			    hat.style.backgroundImage = "url('" + data.hatImageURL + "')";
			    hat.style.backgroundSize = "cover";
			    hat.style.backgroundPosition = "center";
			    const top = document.querySelector("#mycharactertop");
			    top.style.backgroundImage = "url('" + data.topImageURL + "')";
			    top.style.backgroundSize = "cover";
			    top.style.backgroundPosition = "center";
			    const bottom = document.querySelector("#mycharacterbottom");
			    bottom.style.backgroundImage = "url('" + data.bottomImageURL + "')";
			    bottom.style.backgroundSize = "cover";
			    bottom.style.backgroundPosition = "center";
			}, 
			error: function(request, status, errorData){
				 console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData); 
			}
		});  // ajax
		
		$.ajax({
			url: "getnickname.do",
			type: "post",	
			data: { "userId": userId }, 
			dataType: "json",  
			success: function(data){
				
				const nicknameDiv = document.querySelector("#mycharacternickname");
				nicknameDiv.textContent = data.nickname;
			}, 
			error: function(request, status, errorData){
				 console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData); 
			}
		});  // ajax
		
		document.getElementById("renamenicknameinput").addEventListener("keypress", function(event) {
		    // 엔터 키가 눌렸는지 확인
		    if (event.key === "Enter") {
		        // 엔터 키의 기본 동작을 막습니다 (폼 제출 등)
		        event.preventDefault();
		        // 버튼 클릭 이벤트를 발생시킵니다
		        document.getElementById("changeNicknamebtn").click();
		    }
		});
		
		$("#changeNicknamebtn").click(function() {
	       	
	        var renameNickname = $("#renamenicknameinput").val(); // 새 닉네임 입력 필드의 값
	        
	        if(renameNickname != null&&renameNickname != ''){
	    	    console.log("닉네임수정버튼 클릭!");
	        
	        $.ajax({
	        	
	            url: "changenickname.do", // 요청을 보낼 서버의 URL
	            type: "POST", // HTTP 요청 방식
	            data: {
	                "userId": userId, 
	                "renameNickname": renameNickname 
	            },
	            success: function(response) {
	                // 서버로부터의 응답 처리
	                console.log("닉네임 변경 성공");
	                
	                // 모달창 닫기
	                const modal = document.querySelector(".nicknamemodal");
					modal.style.display="none";
					$("#renamenicknameinput").val(''); // 입력 값 초기화
					
	                const nicknameDiv = document.querySelector("#mycharacternickname");
					nicknameDiv.textContent = renameNickname;
	            },
	            error: function(request, status, error) {
	                // 오류 처리
	                
	                console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + error); 
	            }
	        });
	        }
	    });
		
$("#changeCharacterbtn").click(function() {
			
	        var previewcharacterhairImgURL = $('#previewcharacterhair').css('background-image');
	        var previewcharacterhatImgURL = $("#previewcharacterhat").css('background-image');
	        var previewcharactertopImgURL = $("#previewcharactertop").css('background-image');
	        var previewcharacterbottomImgURL = $("#previewcharacterbottom").css('background-image');

	        $.ajax({
	        	
	            url: "changemycharacter.do", // 요청을 보낼 서버의 URL
	            type: "POST", // HTTP 요청 방식
	            data: {	            	
	            	"userId": userId, 
	            	"hairId": currentHairId, 
	            	"hatId": currentHatId, 
	            	"topId": currentTopId, 
	            	"bottomId": currentBottomId
	            },
	            success: function(response) {
	               
	                $('#mycharacterhair').css('background-image', previewcharacterhairImgURL);
	                $('#mycharacterhat').css('background-image', previewcharacterhatImgURL);
	                $('#mycharactertop').css('background-image', previewcharactertopImgURL);
	                $('#mycharacterbottom').css('background-image', previewcharacterbottomImgURL);
	                
	                // 모달창 닫기
	                const modal = document.querySelector(".charactermodal");
					modal.style.display="none";

					console.log("캐릭터 변경 성공");
	                
	            },
	            error: function(request, status, error) {
	                // 오류 처리
	                
	                console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + error); 
	            }
	        });
	    });
		
		
		
		
	
		$("#cancleNicknamebtn").click(function() {
			const modal = document.querySelector(".nicknamemodal");
			modal.style.display="none";
			$("#renamenicknameinput").val(''); // 입력 값 초기화
		});
		
		$("#cancleCharacterbtn").click(function() {
			const modal = document.querySelector(".charactermodal");
			modal.style.display="none";
		});
		
		$("#cancleroombtn").click(function() {
			const modal = document.querySelector(".roommodal");
			$('.roommodal-preview').empty();
			$('.roommodal-preview').css('background-color', '#82c8a0'); // .roommodal-preview의 배경색을 #82c8a0로 설정
			modal.style.display="none";
		});
		
		$("#canclefirendbtn").click(function() {
			const modal = document.querySelector(".friendmodal");
			modal.style.display="none";
		});
		
		$("#canclealbumbtn").click(function() {
			const modal = document.querySelector(".albummodal");
			modal.style.display="none";
		});
		
		$("#cancleguestbookbtn").click(function() {
			const modal = document.querySelector(".guestbookmodal");
			modal.style.display="none";
		});	
		
		$("#canclewriteguestbookbtn").click(function() {
			const modal = document.querySelector(".writeguestbookmodal");
			modal.style.display="none";
		});	
		
		
		
		$('.charactermodal-hair-container > div').each(function() {
	        // 각 hairdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var hairId = $(this).data('hairId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(hairId);
	            currentHairId = hairId;
	            
	            // previewcharacterhair의 background-image로 설정
	            $('#previewcharacterhair').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-hat-container > div').each(function() {
	        // 각 hatdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var hatId = $(this).data('hatId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(hatId);
	            currentHatId = hatId;
	            
	            // previewcharacterhat의 background-image로 설정
	            $('#previewcharacterhat').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-top-container > div').each(function() {
	        // 각 topdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var topId = $(this).data('topId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(topId);
	            currentTopId = topId;
	            
	            // previewcharactertop의 background-image로 설정
	            $('#previewcharactertop').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-bottom-container > div').each(function() {
	        // 각 bottomdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var bottomId = $(this).data('bottomId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(bottomId);
	            currentBottomId = bottomId;
	            
	            // previewcharacterbottom의 background-image로 설정
	            $('#previewcharacterbottom').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$("#btnupdateroom").click(function () {
			var buttonText = $(this).text();
			
			if (buttonText === "방 꾸미기") {
		        console.log("방꾸미기 버튼 클릭!");
		        const modal = document.querySelector("#roomChangeModal");
		        modal.style.display = "flex";
	        
		        $.ajax({
		            url: "getallroomreosource.do",
		            type: "post",
		            dataType: "json",
		            success: function (data) {
		            	var resourceList = data.jarr; // 컨트롤러에서 보낸 jarr 사용
	
		                var firstDivs = document.querySelectorAll('.roommodal-first-container > div');
		                var secondDivs = document.querySelectorAll('.roommodal-second-container > div');
		                var thirdDivs = document.querySelectorAll('.roommodal-third-container > div');
		             
		                // firstDivs에 첫 번째 10개의 리소스 적용
		                resourceList.slice(0, 10).forEach(function(userRoomResource, index) {
		                    var $div = $(firstDivs[index]); // jQuery 객체로 변환
		                    $div.css('background-image', 'url(' + userRoomResource.resourceURL  + ')');
		                    $div.attr('data-resource-id', userRoomResource.resourceId); // resourceId 저장
		                });
		                
		                // secondDivs에 다음 10개의 리소스 적용
		                resourceList.slice(10, 20).forEach(function(userRoomResource, index) {
		                    var $div = $(secondDivs[index]); // jQuery 객체로 변환
		                    $div.css('background-image', 'url(' + userRoomResource.resourceURL + ')');
		                    $div.attr('data-resource-id', userRoomResource.resourceId); // resourceId 저장
		                });
		                
		                // thirdDivs에 마지막 10개의 리소스 적용
		                resourceList.slice(20, 30).forEach(function(userRoomResource, index) {
		                    var $div = $(thirdDivs[index]); // jQuery 객체로 변환
		                    $div.css('background-image', 'url(' + userRoomResource.resourceURL + ')');
		                    $div.attr('data-resource-id', userRoomResource.resourceId); // resourceId 저장
		                });
	
		            },
		            error: function (request, status, errorData) {
		                console.log("error code : " + request.status
		                    + "\nMessage : " + request.responseText
		                    + "\nError : " + errorData);
		            }
		        });  // ajax
		        
		        
			} else if (buttonText === "내 방 가기") {
		        console.log("내 방 가기 버튼 클릭!");
		        
		        $.ajax({
		            url: "getmyroom.do",
		            type: "post",
		            data: {
		                "userId": userId
		            },
		            dataType: "json",
		            success: function (response) {
				        console.log("Room Move Success!", response);
				        //var roomData = JSON.parse(response);
				        roomHost = response.userId;
				        
				        console.log("방 주인: " + roomHost);
				        console.log("방 색상: " + response.roomColor);
				        console.log("방명록 공개 여부: " + response.guestBookOpen);
				
				        // 기존의 .userroomresource 엘리먼트를 모두 제거
				        $(".userroomresource").remove();
				
				        // #userroom의 배경색 변경
				        $("#userroom").css("background-color", response.roomColor);
				
				        // rList 내의 각 리소스에 대하여 반복하여 .userroomresource를 새로 만들어 #userroom에 추가
				        if (response.rList && response.rList.length > 0) {
				        response.rList.forEach(function(resource) {
				        	var scaleValue = resource.resourceURL.includes('0') ? 1.5 : resource.resourceScale; 
				        	scaleValue = resource.resourceURL.includes('25') ? 0.3 : resource.resourceScale; 
				        	scaleValue = resource.resourceURL.includes('26') ? 0.3 : resource.resourceScale; 
				        	scaleValue = resource.resourceURL.includes('27') ? 0.3 : resource.resourceScale; 
				        	scaleValue = resource.resourceURL.includes('28') ? 0.3 : resource.resourceScale; 
				        	scaleValue = resource.resourceURL.includes('29') ? 0.3 : resource.resourceScale; 
				        	console.log(resource.resourceURL +  " " + scaleValue);
				            var imgElement = $('<img>', {
				                src: resource.resourceURL,
				                alt: "Room Resource Image",
				                class: "userroomresource",
				                css: {
				                    position: "absolute",
				                    left: resource.resourcePositionX*2.3 + "px",
				                    top: resource.resourcePositionY*2.3 + "px",
				                    transform: "rotate(" + resource.resourceRotation + "deg) scale(" + scaleValue  + ")"
				                }
				            });
				            $("#userroom").append(imgElement);	
				        });
				        }
				        const modal = document.querySelector(".friendmodal");		
				        modal.style.display="none";
				        
				        var updateRoomButton = $("#btnupdateroom");
				        if (roomHost === window.globaluserId) {
					    // 방의 주인이 현재 로그인한 사용자인 경우
						    updateRoomButton.text("방 꾸미기"); // 버튼 텍스트 업데이트
						} else {
						    // 방의 주인이 현재 로그인한 사용자가 아닌 경우
						    updateRoomButton.text("내 방 가기"); // 버튼 텍스트 업데이트
						}
					        
				    },
		            error: function (request, status, errorData) {
		                console.log("error code : " + request.status
		                    + "\nMessage : " + request.responseText
		                    + "\nError : " + errorData);
		            }
		        });  // ajax
		        
		    }
	    });
		
		
		
		    var colorItems = document.querySelectorAll('.roomcolor li');

		    // 각 li 태그에 대해 클릭 이벤트 리스너를 추가
		    colorItems.forEach(function(item) {
		        item.addEventListener('click', function() {
		            // 클릭된 li의 배경색을 가져옴
		            var bgColor = getComputedStyle(item).backgroundColor;

		            // .roommodal-preview 클래스를 가진 div의 배경색을 클릭된 li의 배경색으로 변경
		            document.querySelector('.roommodal-preview').style.backgroundColor = bgColor;
		        });
		    });
		
		
		    
		    var dragSrcEl = null;

		    function handleDragStart(e) {
		        dragSrcEl = this;

		        e.dataTransfer.effectAllowed = 'move';
		        e.dataTransfer.setData('text/html', this.innerHTML);
		    }

		    function handleDragOver(e) {
		        if (e.preventDefault) {
		            e.preventDefault(); 
		        }

		        e.dataTransfer.dropEffect = 'move';  

		        return false;
		    }

		    function handleDrop(e) {
		        if (e.stopPropagation) {
		            e.stopPropagation(); // 브라우저의 리다이렉트를 멈춥니다.
		        }

		        // 드랍 위치에 새로운 div 생성
		        var dropX = e.offsetX;
		        var dropY = e.offsetY;

		        var newDiv = document.createElement('div');
		        newDiv.style.position = 'absolute';
		        newDiv.style.left = dropX + 'px';
		        newDiv.style.top = dropY + 'px';
		        newDiv.style.width = '70px'; // 원본 div와 동일하게 설정
		        newDiv.style.height = '120px';
		        newDiv.style.backgroundImage = dragSrcEl.style.backgroundImage;
		        newDiv.style.backgroundPosition = 'center';
		        newDiv.style.backgroundRepeat = 'no-repeat';
		        newDiv.style.backgroundSize = 'calc(100% - 40px) calc(100% - 40px)';
		        
		        // 드래그 소스에서 newDiv로 data-resource-id 속성 설정
		        var resourceId = dragSrcEl.getAttribute('data-resource-id');
		        newDiv.setAttribute('data-resource-id', resourceId);

		        document.querySelector('.roommodal-preview').appendChild(newDiv);

		        console.log('Dropped at position: ', dropX, dropY);

		        return false;
		    }

		    var cols = document.querySelectorAll('.roommodal-first-container .roommodal-resource, .roommodal-second-container .roommodal-resource, .roommodal-third-container .roommodal-resource');
		    [].forEach.call(cols, function(col) {
		        col.setAttribute('draggable', 'true');  // Enable elements to be draggable
		        col.addEventListener('dragstart', handleDragStart, false);
		    });

		    var roomPreview = document.querySelector('.roommodal-preview');
		    roomPreview.addEventListener('dragover', handleDragOver, false);
		    roomPreview.addEventListener('drop', handleDrop, false);
		    
		    
		    
		    $("#changeroombtn").click(async function() { // async 키워드를 추가합니다.
		        try {
		            var items = [];
		            var previewstyle = getComputedStyle(roomPreview);
		            var previewbackgroundColor = previewstyle.backgroundColor;
		            $('.roommodal-preview > div').each(function() {
		                var itemData = {
		                    resourcePositionX: parseFloat($(this).css('left')),
		                    resourcePositionY: parseFloat($(this).css('top')),
		                    resourceId: parseInt($(this).data('resource-id'), 10)
		                };
		                items.push(itemData);
		            });

		            // 첫 번째 요청: changemyroomcolor.do
		            await $.ajax({ // await 키워드를 추가하여 요청의 완료를 기다립니다.
		                url: "changemyroomcolor.do",
		                type: "POST",
		                data: {
		                    "userId": userId,
		                    "previewbackgroundColor": previewbackgroundColor
		                }
		            });

		            // 두 번째 요청: changemyroom.do
		            await $.ajax({ // await 키워드를 추가하여 요청의 완료를 기다립니다.
		                url: "changemyroom.do",
		                type: "POST",
		                contentType: "application/json; charset=utf-8",
		                data: JSON.stringify({
		                    userId: userId,
		                    items: items
		                })
		            });

		            // 세 번째 요청: getmyroom.do (위의 요청이 성공적으로 완료된 후 실행됩니다)
		            await $.ajax({ // await 키워드를 추가하여 요청의 완료를 기다립니다.
		                url: "getmyroom.do",
		                type: "POST",
		                dataType: "json",
		                data: {
		                    userId: userId,
		                },
		                success: function(data) {
		                	 $('#userroom').css('background-color', previewbackgroundColor); // #userroom의 배경색을 #82c8a0로 설정
		                	 $('.roommodal-preview').empty();  // .roommodal-preview의 모든 자식 요소를 제거
				             $('.roommodal-preview').css('background-color', '#82c8a0'); // .roommodal-preview의 배경색을 #82c8a0로 설정
				                
				                
				                const modal = document.querySelector("#roomChangeModal");
				                modal.style.display="none";
				                
				                
				                // #userroom 내의 <img> 태그만 찾아서 삭제합니다.
				                $('#userroom').find('img').remove();

				                // rList 배열을 순회합니다.
				                 if (data.rList && data.rList.length > 0) {
				                data.rList.forEach(function(resource) {
				                	var scaleValue = resource.resourceURL.includes('0') ? 1.5 : resource.resourceScale; 
						        	scaleValue = resource.resourceURL.includes('25') ? 0.3 : resource.resourceScale; 
						        	scaleValue = resource.resourceURL.includes('26') ? 0.3 : resource.resourceScale; 
						        	scaleValue = resource.resourceURL.includes('27') ? 0.3 : resource.resourceScale; 
						        	scaleValue = resource.resourceURL.includes('28') ? 0.3 : resource.resourceScale; 
						        	scaleValue = resource.resourceURL.includes('29') ? 0.3 : resource.resourceScale; 
				                    var posx = resource.resourcePositionX*2.3;
				                    var posy = resource.resourcePositionY*2.3;
				                    // 이미지 URL에 타임스탬프를 추가하여 캐싱 방지
				                    var cacheBustedURL = resource.resourceURL + "?t=" + new Date().getTime();
				                    // 각 resource 객체에 대한 새로운 <img> 태그를 생성합니다.
				                    var img = $('<img>', {
				                        src: cacheBustedURL,
				                        alt: 'Room Resource Image',
				                        class: 'userroomresource',
				                        css: {
				                            position: 'absolute',
				                            left: posx + 'px',
				                            top: posy + 'px',
				                            transform: 'rotate(' + resource.resourceRotation + 'deg) scale(' + scaleValue + ')'
				                        }
				                    });
				                    
				                    

				                    // 생성된 <img> 태그를 #userroom에 추가합니다.
				                    $('#userroom').append(img);
				                });
				                 }
		                },
		                error: function(request, status, error) {
		                    console.log("error code : " + request.status
		                        + "\nMessage : " + request.responseText
		                        + "\nError : " + error);
		                }
		            });
		        } catch (error) {
		            console.error("An error occurred:", error);
		        }
		    });
		    
		    $("#changeNicknamebtn").click(function() {
		       	
		        var renameNickname = $("#renamenicknameinput").val(); // 새 닉네임 입력 필드의 값
		        
		        if(renameNickname != null&&renameNickname != ''){
		    	    console.log("닉네임수정버튼 클릭!");
		        
		        $.ajax({
		        	
		            url: "changenickname.do", // 요청을 보낼 서버의 URL
		            type: "POST", // HTTP 요청 방식
		            data: {
		                "userId": userId, 
		                "renameNickname": renameNickname 
		            },
		            success: function(response) {
		                // 서버로부터의 응답 처리
		                console.log("닉네임 변경 성공");
		                
		                // 모달창 닫기
		                const modal = document.querySelector(".nicknamemodal");
						modal.style.display="none";
						$("#renamenicknameinput").val(''); // 입력 값 초기화
						
		                const nicknameDiv = document.querySelector("#mycharacternickname");
						nicknameDiv.textContent = renameNickname;
		            },
		            error: function(request, status, error) {
		                // 오류 처리
		                
		                console.log("error code : " + request.status
		                    + "\nMessage : " + request.responseText
		                    + "\nError : " + error); 
		            }
		        });
		        }
		    });
		    
		    
		    
		    $("#btnselectalbum").click(function() {
		    	console.log("앨범보기 버튼 클릭!");
		    	console.log(roomHost);
		    	$.ajax({
			        url: "getimagebyuserid.do",
			        type: "POST",
			        data: { "roomHost": roomHost },
			        dataType: "json",
			        success: function(response) {
			            const modal = $("#albumModal").css("display", "flex");
			            $("#albumListModalLabel").text(roomHost + "'s Album");
			            
			            // 앨범 내용을 담을 section을 비웁니다.
			            const albumSection = $(".albummodal-body > section").empty(); // 기존 내용을 비움

			            var images = response.images;
			            images.forEach(function(image, index) {
			                // article, div, img 태그 생성
			                let articleClass = (index % 2 === 0) ? "odd" : "even";
			                let article = $('<article>').addClass(articleClass);

			                let div = $('<div>');
			                let img = $('<img>').attr('src', image.imageURL).attr('alt', 'Album Image');

			                // 생성된 태그들을 조립
			                article.append(div.append(img));

			                // 최종적으로 section에 추가
			                albumSection.append(article);
			            });
			        },
			        error: function(request, status, error) {
			            console.error("Error: ", error);
			        }
			    });
		    	
		    	const grid = new Isotope("section", {
		    		itemSelector: "article",
		    		columnWidth: "article",
		    		transitionDuration: "0.5s"
		    	});
		    	
		    });
		    
		    
		    $("#btnselectguestbook").click(function() {
		        console.log("방명록 보기 버튼 클릭!");
		        const modal = document.querySelector("#guestbookModal");
		        modal.style.display = "flex";

		        // 모달 내부의 기존 방명록 리스트를 지우기
		        $(".guestbookmodal-body").empty(); // 모달 바디 내부를 비웁니다.

		        $.ajax({
		            url: "selectguestbook.do", // 요청을 보낼 서버의 URL
		            type: "POST", // HTTP 요청 방식
		            data: {
		                "roomHost": roomHost,
		            },
		            dataType: "json", 
		            success: function(response) {
		            	$("#guestbookModalLabel").text(roomHost + "'s 방명록");
		                $.each(response.jarr, function(index, guestBook) {
		                    // Create the outer container
		                    var guestbookContainer = $('<div class="guestbookcontainer"></div>').css({
		                        display: 'flex',
		                        justifyContent: 'center',
		                        alignItems: 'center',
		                        width: '213px',
		                        height: '200px',
		                        border: '1px solid #ced4da',
		                        borderRadius: '10px',
		                        margin: '7px',
		                        backgroundColor: 'rgb(255, 255, 255)',
		                    });

		                    // Create the content border container
		                    var contentBorder = $('<div class="guestbookcontentborder"></div>').css({
		                        width: '180px',
		                        height: '160px',
		                        borderRadius: '10px',
		                        padding: '5px',
		                        margin: '5px',
		                        backgroundColor: guestBook.backgroundColor, // Using the color from the response
		                        display: 'flex',
		                        flexDirection: 'column',
		                    });

		                    // Create the content div
		                    var contentDiv = $('<div class="guestbookcontent"></div>').text(guestBook.guestbookContent).css({
		                        flexGrow: 1,
		                        wordWrap: 'break-word',
		                    });

		                    // Create the footer div
		                    var footerDiv = $('<div class="guestbookfooter"></div>').text(guestBook.writer);

		                    // Append content and footer to the content border container
		                    contentBorder.append(contentDiv, footerDiv);

		                    // Append the content border container to the outer container
		                    guestbookContainer.append(contentBorder);

		                    // Append the outer container to the modal body
		                    $(".guestbookmodal-body").append(guestbookContainer);
		                });
		            },
		            error: function(request, status, error) {
		                // 오류 처리
		                console.log("error code : " + request.status
		                    + "\nMessage : " + request.responseText
		                    + "\nError : " + error);
		            }
		        });
		    });
		    
			
			$("#writeGuestbookBtn").click(function() {
		    	console.log("방명록 작성 버튼 클릭!");
		    	if(roomHost != userId) {
		    		const modal = document.querySelector("#writeguestbookModal");
			        modal.style.display = "flex";
		    	} else {
		    		alert("방명록은 본인이 작성 불가능합니다.");
		    	}
		     
		   });
		   
			
			$('.guestbookcolor > li').click(function() {
			    // 모든 li 요소의 테두리를 초기화
			    $('.guestbookcolor > li').css('border', 'none');

			    // 선택된 li에 대한 테두리 설정
			    $(this).css('border', '4px solid green');

			    // 선택된 색상의 배경색을 변수에 저장
			    var selectedColor = $(this).css('background-color');
			    
			    // 선택된 색상을 'backgroundColor' 변수에 저장하는 코드를 추가
			    $('#writeguestbookModal').data('backgroundColor', selectedColor);
			});
			
			
			$("#writeguestbookebtn").click(function() {
		    	console.log("방명록 저장 버튼 클릭!");
		    	
		    
		        var guestbookContent = $('#writeguestbookinput').val();
		        var backgroundColor = $('#writeguestbookModal').data('backgroundColor');
		    	
		       
		        $.ajax({
		        	
		            url: "insertguestbook.do", // 요청을 보낼 서버의 URL
		            type: "POST", // HTTP 요청 방식
		            data: {
		            	"roomHost": roomHost,
		                "userId": userId,
		                "guestbookContent": guestbookContent,
		                "backgroundColor": backgroundColor
		            },
		            success: function(response) {
		              
		            	$('.guestbookcolor > li').css('border', 'none');
		            	 $('#writeguestbookinput').val('');
		            	
		            	const modal = document.querySelector("#writeguestbookModal");
						modal.style.display="none";
						
						$.ajax({
				            url: "selectguestbook.do", // 요청을 보낼 서버의 URL
				            type: "POST", // HTTP 요청 방식
				            data: {
				                "roomHost": roomHost,
				            },
				            dataType: "json", 
				            success: function(response) {
				            	$(".guestbookcontainer").remove();
				            	$("#guestbookModalLabel").text(roomHost + "'s 방명록");
				                $.each(response.jarr, function(index, guestBook) {
				                    // Create the outer container
				                    var guestbookContainer = $('<div class="guestbookcontainer"></div>').css({
				                        display: 'flex',
				                        justifyContent: 'center',
				                        alignItems: 'center',
				                        width: '205px',
				                        height: '200px',
				                        border: '1px solid #ced4da',
				                        borderRadius: '10px',
				                        margin: '7px',
				                        backgroundColor: 'rgb(255, 255, 255)',
				                    });

				                    // Create the content border container
				                    var contentBorder = $('<div class="guestbookcontentborder"></div>').css({
				                        width: '180px',
				                        height: '160px',
				                        borderRadius: '10px',
				                        padding: '5px',
				                        margin: '5px',
				                        backgroundColor: guestBook.backgroundColor, // Using the color from the response
				                        display: 'flex',
				                        flexDirection: 'column',
				                    });

				                    // Create the content div
				                    var contentDiv = $('<div class="guestbookcontent"></div>').text(guestBook.guestbookContent).css({
				                        flexGrow: 1,
				                        wordWrap: 'break-word',
				                    });

				                    // Create the footer div
				                    var footerDiv = $('<div class="guestbookfooter"></div>').text(guestBook.writer);

				                    // Append content and footer to the content border container
				                    contentBorder.append(contentDiv, footerDiv);

				                    // Append the content border container to the outer container
				                    guestbookContainer.append(contentBorder);

				                    // Append the outer container to the modal body
				                    $(".guestbookmodal-body").append(guestbookContainer);
				                });
				            },
				            error: function(request, status, error) {
				                // 오류 처리
				                console.log("error code : " + request.status
				                    + "\nMessage : " + request.responseText
				                    + "\nError : " + error);
				            }
				        });
						
						
						
						console.log("방명록 저장 성공");
		            },
		            error: function(request, status, error) {
		                // 오류 처리
		                
		                console.log("error code : " + request.status
		                    + "\nMessage : " + request.responseText
		                    + "\nError : " + error); 
		            }
		        });
		   });
	
});  // document.ready

</script>

</body>
</html>