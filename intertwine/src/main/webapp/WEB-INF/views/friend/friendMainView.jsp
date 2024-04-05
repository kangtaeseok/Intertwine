<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.edu.intertwine.user.model.vo.User"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intertwine Friends Management</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<script src="https://kit.fontawesome.com/4b2098cb2a.js"
	crossorigin="anonymous"></script>
<!-- 폰트어썸 가져오기 -->
<script type="text/javascript"
	src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<!-- 이 jsp파일의 css파일 연결 -->
<link rel="stylesheet" href="/intertwine/resources/css/friend.css">
</head>
<body>

	<%-- 사용자 세션 확인 --%>
	<c:choose>
		<c:when test="${not empty sessionScope.loginUser}">
			<%-- 로그인한 사용자의 userId 표시 --%>
			<h2>Welcome, ${sessionScope.loginUser.userId}!</h2>
		</c:when>
		<c:otherwise>
			<h2>Please login.</h2>
		</c:otherwise>
	</c:choose>
	<header>
		<!-- 페이지 상단 -->
		<div>
			<!-- 홈 버튼 -->
			<nav class="homebutton_nav">
				<ul>
					<li class="homebutton"></li>
				</ul>
				<ol>
					<a href="#"><i class="fa-solid fa-house"></i></a>
					<!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
				</ol>
				<script>
					// jQuery를 사용하여 미디어 쿼리를 적용
					$(document)
							.ready(
									function() {
										var originalContents = { // 원래 속성을 변수에 저장
											a : '<a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>',
											b : '<a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>',
											c : '<a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>',
											d : '<a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>',
											e : '<a href="#"><i class="fa-solid fa-bell"></i> 알림</a>',
											f : '<a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>',
											g : '<a href="#"><i class="fa-solid fa-gear"></i> 설정</a>'
										};

										// 페이지 크기가 1279px 이하일 때 '스퀘어' 텍스트를 지우고 아이콘만 남깁니다.
										/*  JavaScript 코드와 CSS의 미디어 쿼리 사이에 일치하지 않는 부분이 있을 수 있습니다. 이는 화면 너비를 검사하는 방식의 차이 때문에 발생할 수 있습니다. 조정이 필요할 수 있습니다.*/
										if ($(window).width() <= 1262) {
											// 사이드 바 메뉴 아이콘 변경
											$('.side-bar > ul > li > a')
													.each(
															function() {
																// 해당 메뉴의 아이콘 클래스를 가져와서 변경
																var iconClass = $(
																		this)
																		.children(
																				'i')
																		.attr(
																				'class');
																$(this)
																		.html(
																				'<i class="' + iconClass + '"></i>');
															});
										} else {
											// 페이지 크기가 축소되지 않으면 아이콘을 원래 텍스트로 변경
											$('.side-bar > ul > li > a')
													.each(
															function() {
																var originalText = $(
																		this)
																		.parent()
																		.attr(
																				'original-text');
																$(this)
																		.html(
																				originalText);
															});
										}

										$(window)
												.resize(
														function() {
															if ($(window)
																	.width() <= 1262) {
																$(
																		'.side-bar > ul > li#a > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-gamepad"></i>');
																				});
																$(
																		'.side-bar > ul > li#b > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-circle-user"></i>');
																				});
																$(
																		'.side-bar > ul > li#c > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-user-group"></i>');
																				});
																$(
																		'.side-bar > ul > li#d > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-comment"></i>');
																				});
																$(
																		'.side-bar > ul > li#e > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-bell">');
																				});
																$(
																		'.side-bar > ul > li#f > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-bookmark"></i>');
																				});
																$(
																		'.side-bar > ul > li#g > a')
																		.each(
																				function() {
																					$(
																							this)
																							.html(
																									'<i class="fa-solid fa-gear"></i>');
																				});

															} else {

																$(
																		'.side-bar > ul > li')
																		.each(
																				function() {
																					var id = $(
																							this)
																							.attr(
																									'id');
																					$(
																							this)
																							.html(
																									originalContents[id]);
																				});

															}
														});
									});
				</script>
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
				<li id="a"><a href="#"><i class="fa-solid fa-gamepad"></i>
						스퀘어</a>
					<ul>
						<li><a href="#">text1</a></li>
						<li><a href="#">text2</a></li>
						<li><a href="#">text3</a></li>
						<li><a href="#">text4</a></li>
					</ul></li>
				<li id="b"><a href="#"><i class="fa-solid fa-circle-user"></i>
						마이페이지</a> <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> -->
					<!-- 색칠된 아이콘 --></li>
				<li id="c"> <a href="${pageContext.servletContext.contextPath}/friendPage.do">
				<i class="fa-solid fa-user-group"></i> 친구</a></li>
				


				<li id="d"><a href="#"><i class="fa-solid fa-comment"></i>
						채팅</a></li>
				<li id="e"><a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
				</li>
				<li id="f"><a href="#"><i class="fa-solid fa-bookmark"></i>
						북마크</a></li>
				<li id="g"><a href="#"><i class="fa-solid fa-gear"></i> 설정</a>
				</li>
			</ul>
		</aside>


		<div class="content">
			<!-- 팔로잉, 팔로워 리스트를 담는 부모 div -->


			<div class="followingList">
				<!-- 팔로잉 리스트  -->
				<div class="list-header">
					<h2>
						Your Following <br>팔로잉 수 : <span id="followingCount"></span>
					</h2>
					<!-- 팔로잉 계정 검색 필드 -->
					<form action="searchFollowing.do" method="get">
						<div id="followingSearch">
							<input type="text" name="keyword" id="keywordInput"
								placeholder="팔로잉 계정 검색" class="searchFollowing">
							<button type="submit">Search</button>
						</div>
					</form>
				</div>
					<!-- 팔로잉 목록  -->
				<table class="followingList-table">
					<thead>
						<tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${followingList}" var="friend">
							
							<tr>
								<td> <a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
								<img src="resources/profile/images.jpg"
									alt="Profile Image" class="profile-img"></a></td>
									
								<td>${friend.friendId}</td>
								<td>
								<!-- 언팔로우 버튼 폼 태그 -->
								<form action="unfollowing.do" method="post">
								<input type="hidden" name="userId"
									value="${sessionScope.loginUser.userId}"> <input
									type="hidden" name="friendId" value="${friend.friendId}">
									<button class="unfollow-btn"
										data-friend-id="${friend.friendId}">Unfollow</button>
										</form>
										<a href="${pageContext.request.contextPath}/chatView.do?friendId=${friend.friendId}" >chat</a>
								<%-- 	<button class="block-btn" onclick="javascript:location.href='blockFollowing.do?userId=${sessionScope.loginUser.userId}&friendId=${friend.friendId}'">Block</button>
									<button class="chat-btn" data-friend-id="${friend.friendId}">Chat</button> --%>
								</td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>

				<script>
				//언팔로잉 버튼 클릭시 출력 메세지
document.addEventListener("DOMContentLoaded", function() {
    var dfollowMessage = "<c:out value='${sessionScope.dfollowMessage}'/>";
    if (dfollowMessage) {
        alert(dfollowMessage); // 팝업으로 메시지 보여주기
        <% session.removeAttribute("dfollowMessage"); %> // 메시지를 보여준 후 세션에서 메시지 삭제
    }
});
// 차단 버튼 클릭시 출력 메세지				
document.addEventListener("DOMContentLoaded", function() {
    var blockedMessage = "<c:out value='${sessionScope.blockedMessage}'/>";
    if (blockedMessage) {
        alert(blockedMessage); // 팝업으로 메시지 보여주기
        <% session.removeAttribute("blockedMessage"); %> // 메시지를 보여준 후 세션에서 메시지 삭제
    }
});
</script>
				<!-- 팔로잉 계정 검색 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<div id="searchResults">

				<c:forEach items="${searchF}" var="friend">
					
						<tr>
							<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
							<img src="resources/profile/images.jpg"
								alt="Profile Image" class="profile-img"></a></td>
							<td>${friend.friendId}</td>
							<!-- Assuming friendId is what you want to display -->
							<td>
							<form action="unfollowing.do" method="post">
						<input type="hidden" name="userId"
							value="${sessionScope.loginUser.userId}"> <input
							type="hidden" name="friendId" value="${friend.friendId}">
								<button class="unfollow-btn" data-friend-id="${friend.friendId}">Unfollow</button>
								</form>
							</td>
						</tr>
						
					
				</c:forEach>
				
				<!-- 검색 결과를 표시할 영역 -->
				</div>
			</div>


			<script src="https://kit.fontawesome.com/4b2098cb2a.js"></script>
			<div class="followList">
				<div class="list-header">
					<h2>
						Your Follower<br> 팔로워 수 : <span id="followersCount"></span>
					</h2>
				
					<!-- 팔로워 계정 검색필드 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<form action="searchFollower.do" method="get">
						<div id="followerSearch">
							<input type="text" name="keyword" id="keywordInput"
								placeholder="팔로워 계정 검색" class="searchFollower">
							<button type="submit">Search</button>
						</div>
					</form>
				</div>

				<!-- 팔로우 리스트 테이블 화면출력 -->
				<table class="followerList-table">
					<thead>
						<tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${followerList}" var="friend">
								<tr>
									<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
									<img src="resources/profile/images.jpg"
										alt="Profile Image" class="profile-img"></a></td>
									<td>${friend.userId}</td>
									<td>
									<form action="insertF.do" method="post">
								<input type="hidden" name="userId"
									value="${sessionScope.loginUser.userId}"> <input
									type="hidden" name="friendId" value="${friend.userId}">
										<button type="submit" class="follow-btn">Follow</button>
										</form>
										<%-- <button type="button" class="block-btn" onclick="javascript:location.href='blockFollower.do?userId=${sessionScope.loginUser.userId}&friendId=${friend.userId}'"> 									
						Block</button>
										<button type="button" class="chat-btn"
											data-friend-id="${friend.userId}">Chat</button> --%>
									</td>
								</tr>
						</c:forEach>

					</tbody>
				</table>
			
		
		<script>
document.addEventListener("DOMContentLoaded", function() {
    var followMessage = "<c:out value='${sessionScope.followMessage}'/>";
    if (followMessage) {
        alert(followMessage); // 팝업으로 메시지 보여주기
        <% session.removeAttribute("followMessage"); %> // 메시지를 보여준 후 세션에서 메시지 삭제
    }
});
//팔로워 차단 버튼 클릭시 출력 메세지				
document.addEventListener("DOMContentLoaded", function() {
    var blocked2Message = "<c:out value='${sessionScope.blocked2Message}'/>";
    if (blocked2Message) {
        alert(blocked2Message); // 팝업으로 메시지 보여주기
        <% session.removeAttribute("blocked2Message"); %> // 메시지를 보여준 후 세션에서 메시지 삭제
    }
});
</script>
		<!-- 팔로워 계정 검색 결과 필드 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<div id="searchResults"></div>
		<c:forEach items="${searchFwer}" var="friend">
		
		<!-- 검색 결과에 대한 화면 출력 및 팔로우 버튼 기능 -->
			
				<tr>
					<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
					<img src="resources/profile/images.jpg" alt="Profile Image"
						class="profile-img"></a></td>
					<td>${friend.userId}</td>
					<td>
					<form action="insertF.do" method="post">
				<input type="hidden" name="userId"
					value="${sessionScope.loginUser.userId}"> <input
					type="hidden" name="friendId" value="${friend.userId}">
						<button type="submit" class="follow-btn" data-friend-id="${friend.userId}">Follow</button>
						</form>
					</td>
				</tr>
			
		</c:forEach>
		</div>
		</div>
	</main>

	<script>
<!-- 팔로잉, 팔로워 수 불러오는 ajax 코드 -->
				// 팔로잉, 팔로워 수 불러오는 ajax 통신 코드 ---------------------------------------------------------------------------------
$(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countFollowing.do', // 컨트롤러의 경로
        type: 'GET',
        data: {
            userId: userId
        },
        success: function(response) {
            $("#followingCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});
				
$(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countFollowers.do', // 컨트롤러의 경로
        type: 'GET',
        data: {
            userId: userId
        },
        success: function(response) {
            $("#followersCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});

		
</script>
</body>
</html>