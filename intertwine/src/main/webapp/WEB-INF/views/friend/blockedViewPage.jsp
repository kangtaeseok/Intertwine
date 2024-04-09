<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page import="org.edu.intertwine.user.model.vo.User"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intertwine Friends Management</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<link rel="stylesheet" href="/intertwine/resources/css/block.css">
<script src="https://kit.fontawesome.com/4b2098cb2a.js"
	crossorigin="anonymous"></script>
	<script type="text/javascript"
	src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<!-- 폰트어썸 가져오기 -->
<!-- 이 jsp파일의 css파일 연결 -->

</head>
<body>
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
		<div class="content">
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
					<li id="c"><a href="#"
						onclick="showFriendPopup(); return false;"><i
							class="fa-solid fa-user-group"></i> 친구</a></li>
					<div id="friendPopup"
						style="display: none; position: absolute; z-index: 1000; left: 100px; top: 70px; width: 150px; height: auto; background-color: #fefefe; padding: 20px; border-radius: 10px; border: 1px solid #888;">
						<div style="margin: auto;">
							<a href="${pageContext.servletContext.contextPath}/friendPage.do"
								class="popup-link">팔로우 목록</a><br> <a
								href="${pageContext.servletContext.contextPath}/blockedPage.do"
								class="popup-link">차단 목록</a>
						</div>
					</div>
					<script>
						function showFriendPopup() {
							document.getElementById('friendPopup').style.display = 'block';
						}

						// Clicking anywhere outside of the popup closes it
						window.onclick = function(event) {
							var popup = document.getElementById('friendPopup');
							if (event.target == popup) {
								popup.style.display = "none";
							}
						}
					</script>


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

<!-- 차단 계정을 담는 영역 -->
<div class="content">

			<!-- 차단한 계정을 보낼 공간 -->
			<div class="blockAllList">
			
			<!-- 리스트 상단 공간(검색창 및 차단한 수 출력) -->
				<div class="list-header">
					<h2>Your Blocked User <br>차단 수 : <span id="blockedCount"></span></h2>
					<form action="searchBlocked.do" method="get">
						<div id="blockedSearch">
							<input type="text" name="keyword" id="keywordInput"
								placeholder="차단 계정 검색" class="searchBlocked">
							<button type="submit">Search</button>
						</div>
					</form>
				</div>

				<!-- 차단 리스트 내용 -->
				<table class="blockList-table">
					<thead>
						<tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${blockedAllList}" var="block">
							<tr>
								<td><img src="${response.profileImageUrl}"
									alt="Profile Image" class="profile-img"></td>
								<td>${block.friendId}</td>
								<!-- Assuming friendId is what you want to display -->
								<td>
									<form action="unfollowing.do" method="post">
										<input type="hidden" name="userId"
											value="${sessionScope.loginUser.userId}"> <input
											type="hidden" name="friendId" value="${block.friendId}">
										<button class="unblock-btn"
											data-friend-id="${block.friendId}">차단해제</button>
									</form>
									<%-- <button class="block-btn"
										onclick="location.href='blockFollowing.do?userId=${sessionScope.loginUser.userId}&friendId=${friend.friendId}'">Block</button>
									<button class="chat-btn" data-friend-id="${friend.friendId}">Chat</button> --%>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 팔로잉, 팔로워 수 불러오는 ajax 코드 -->

		</div>
		<script>
$(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countBlock.do', // 컨트롤러의 경로
        type: 'GET',
        data: {
            userId: userId
        },
        success: function(response) {
            $("#blockedCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});
</script>
	</main>


</body>
</html>