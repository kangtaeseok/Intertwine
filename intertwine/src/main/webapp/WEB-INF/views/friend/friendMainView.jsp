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
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
</head>
<body>
<main>
<c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
		<div class="content">
			<!-- 팔로잉, 팔로워 리스트를 담는 부모 div -->
 

			<div class="followingList">
				<!-- 팔로잉 리스트  -->
				<div class="list-header">
					<h2>
						Your Following <br>팔로잉  <span id="followingCount"></span>
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
						<c:forEach items="${fProfile}" var="friend">
							
							<tr>
								<c:if test="${empty friend.profileDraft}">
								<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
				
								<img src="resources/profile/images.jpg"
									alt="Profile Image" class="profile-img"></a></td>
									</c:if>
									<c:if test="${not empty friend.profileDraft}">
								<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
				
								<img src="${friend.profileDraft}"
									alt="Profile Image" class="profile-img"></a></td>
									</c:if>
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
										<a class="chat-btn" href="${pageContext.request.contextPath}/insertChat.do?otherUserId=${friend.friendId}" >chat</a>
								<%-- 	<button class="block-btn" onclick="javascript:location.href='blockFollowing.do?userId=${sessionScope.loginUser.userId}&friendId=${friend.friendId}'">Block</button>
									<button class="chat-btn" data-friend-id="${friend.friendId}">Chat</button> --%>
								</td>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>

				
				<!-- 팔로잉 계정 검색 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
				<c:if test="${ empty searchfProfile }"></c:if>
		<c:if test="${not empty searchfProfile}">
				<div id="followingList">
					<table class="followingList-table">
					<thead>
						<!-- <tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr> -->
					</thead>
					<tbody>

				<c:forEach items="${searchfProfile}" var="friend">
					
						<tr>
							<c:if test="${empty friend.profileDraft}">
								<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
				
								<img src="resources/profile/images.jpg"
									alt="Profile Image" class="profile-img"></a></td>
									</c:if>
								<c:if test="${not empty friend.profileDraft}">
								<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.friendId}">
				
								<img src="${friend.profileDraft}"
									alt="Profile Image" class="profile-img"></a></td>
									</c:if>	
							<td>${friend.friendId}</td>
							<!-- Assuming friendId is what you want to display -->
							<td>
							<form action="unfollowing.do" method="post">
						<input type="hidden" name="userId"
							value="${sessionScope.loginUser.userId}"> <input
							type="hidden" name="friendId" value="${friend.friendId}">
								<button class="unfollow-btn" data-friend-id="${friend.friendId}">Unfollow</button>
								</form>
								<a class="chat-btn" href="${pageContext.request.contextPath}/insertChat.do?otherUserId=${friend.friendId}" >chat</a>
							</td>
						</tr>
						
					
				</c:forEach>
				</tbody>
				</table>
				<!-- 검색 결과를 표시할 영역 -->
				</div>
				</c:if>
			</div>


			<script src="https://kit.fontawesome.com/4b2098cb2a.js"></script>
			<div class="followList">
				<div class="list-header">
					<h2>
						Your Follower<br> 팔로워  <span id="followersCount"></span>
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
						<c:forEach items="${fProfileFollowers}" var="friend">
								<tr><c:if test="${empty friend.profileDraft }">
									<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
									<img src="resources/profile/images.jpg"
										alt="Profile Image" class="profile-img"></a></td></c:if>
										<c:if test="${not empty friend.profileDraft }">
									<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
									<img src="${friend.profileDraft}"
										alt="Profile Image" class="profile-img"></a></td></c:if>
									<td>${friend.userId}</td>
									<td>
									<form action="insertF.do" method="post">
								<input type="hidden" name="userId"
									value="${sessionScope.loginUser.userId}"> <input
									type="hidden" name="friendId" value="${friend.userId}">
										<button type="submit" class="follow-btn">Follow</button>
										</form>
										<a class="chat-btn" href="${pageContext.request.contextPath}/insertChat.do?otherUserId=${friend.userId}" >chat</a>
									</td>
								</tr>
						</c:forEach>

					</tbody>
				</table>
			
		<!-- 팔로워 계정 검색 결과 필드 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
		<c:if test="${ empty searchfProfile2 }"></c:if>
		<c:if test="${not empty searchfProfile2}">
		<div id="followList">
		<table class="followerList-table">
					<thead>
						<!-- <tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr> -->
					</thead>
					<tbody>
		<c:forEach items="${searchfProfile2}" var="friend">
		
		<!-- 검색 결과에 대한 화면 출력 및 팔로우 버튼 기능 -->
			
				<tr>
					<c:if test="${empty friend.profileDraft }">
									<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
									<img src="resources/profile/images.jpg"
										alt="Profile Image" class="profile-img"></a></td></c:if>
										<c:if test="${not empty friend.profileDraft }">
									<td><a href="${pageContext.request.contextPath}/page.do?friendId=${friend.userId}">
									<img src="${friend.profileDraft}"
										alt="Profile Image" class="profile-img"></a></td></c:if>
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
		
					</tbody>
				</table>
				</div>
				</c:if>
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