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
			<%-- <h2>Welcome, ${sessionScope.loginUser.userId}!</h2> --%>
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
                    $(document).ready(function () {
                        var originalContents = {  // 원래 속성을 변수에 저장
                            a: '<a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>',
                            b: '<a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>',
                            c: '<a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>',
                            d: '<a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>',
                            e: '<a href="#"><i class="fa-solid fa-bell"></i> 알림</a>',
                            f: '<a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>',
                            g: '<a href="#"><i class="fa-solid fa-gear"></i> 설정</a>'
                        };

                        // 페이지 크기가 1279px 이하일 때 '스퀘어' 텍스트를 지우고 아이콘만 남깁니다.
                        /*  JavaScript 코드와 CSS의 미디어 쿼리 사이에 일치하지 않는 부분이 있을 수 있습니다. 이는 화면 너비를 검사하는 방식의 차이 때문에 발생할 수 있습니다. 조정이 필요할 수 있습니다.*/
                        if ($(window).width() <= 1262) {
                            // 사이드 바 메뉴 아이콘 변경
                            $('.side-bar > ul > li > a').each(function () {
                                // 해당 메뉴의 아이콘 클래스를 가져와서 변경
                                var iconClass = $(this).children('i').attr('class');
                                $(this).html('<i class="' + iconClass + '"></i>');
                            });
                        } else {
                            // 페이지 크기가 축소되지 않으면 아이콘을 원래 텍스트로 변경
                            $('.side-bar > ul > li > a').each(function () {
                                var originalText = $(this).parent().attr('original-text');
                                $(this).html(originalText);
                            });
                        }

                        $(window).resize(function () {
                            if ($(window).width() <= 1262) {
                                $('.side-bar > ul > li#a > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-gamepad"></i>');
                                });
                                $('.side-bar > ul > li#b > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-circle-user"></i>');
                                });
                                $('.side-bar > ul > li#c > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-user-group"></i>');
                                });
                                $('.side-bar > ul > li#d > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-comment"></i>');
                                });
                                $('.side-bar > ul > li#e > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-bell">');
                                });
                                $('.side-bar > ul > li#f > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-bookmark"></i>');
                                });
                                $('.side-bar > ul > li#g > a').each(function () {
                                    $(this).html('<i class="fa-solid fa-gear"></i>');
                                });

                            } else {

                                $('.side-bar > ul > li').each(function () {
                                    var id = $(this).attr('id');
                                    $(this).html(originalContents[id]);
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
		<div class="content">


			<div class="followingList">
				<div class="list-header">
					<h2>
						Your Following <br>팔로잉 수 : <span id="followingCount"></span>
					</h2>
					<!-- <div id="followingSearch">
            <input type="text" placeholder="팔로잉 계정 검색" class="searchFollowing">
            <button onclick="searchFollowing()">Search</button>
        </div> -->
					<div id="followingSearch">
						<input type="text" id="keywordInput" placeholder="팔로잉 계정 검색"
							class="searchFollowing">
						<button onclick="searchFollowing()">Search</button>
					</div>

					<script>

function searchFollowing() {
    var userId = '${sessionScope.loginUser.userId}';
    var friendId = document.getElementById('keywordInput').value;

    if (!friendId) {
        alert("Please enter a friend ID to search.");
        return;
    }

    $.ajax({
        url: "searchFollowing.do",
        type: "gets",
        contentType: "application/json",
        data: JSON.stringify({
            userId: userId,
            friendId: friendId
        }),
        dataType: 'json',
        success: function(searchResults) {
            displaySearchResults(searchResults);
        },
        error: function(xhr, status, error) {
            console.error("Error occurred: " + error);
        }
    });
}

function displaySearchResults(searchResults) {
    var resultsDiv = document.getElementById('searchResults');
    resultsDiv.innerHTML = ''; // Clear previous results
    if (searchResults.length > 0) {
        searchResults.forEach(function(friend) {
            var div = document.createElement('div');
            div.textContent = friend.friendId; // Assuming your JSON objects have a friendId property
            resultsDiv.appendChild(div);
        });
    } else {
        resultsDiv.textContent = "No search results found.";
    }
}
</script>
					<div id="searchResults"></div>
					<!-- 검색 결과를 표시할 영역 -->
				</div>
				<!-- 팔로잉 리스트 내용 -->
				<!--  <div class="list-content">
        반복되는 리스트 아이템 예시
        <div class="list-item">
            <img src="profile_picture_url" alt="Profile Image" class="profile-img">
            <div class="user-id">username</div>
            <div class="action-buttons">
                <button class="unfollow-btn">Unfollow</button>
                <button class="block-btn">Block</button>
                <button class="chat-btn">Chat</button>
            </div>
        </div>
    </div> -->
				<table class="followingList-table">
					<thead>
						<tr>
							<th>Profile</th>
							<th>Username</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<!-- Repeat this TR for each following entry -->
						<tr>
							<td><img
								src="https://static.cdn.soomgo.com/upload/portfolio/ddace5e6-3c38-4cf0-af4e-2c18ef269eda.jpg?webp=1"
								alt="Profile Image" class="profile-img"></td>
							<td>username</td>
							<td>
								<button class="follow-btn">follow</button>
								<button class="block-btn">Block</button>
								<button class="chat-btn">Chat</button>
							</td>
						</tr>
						<tr>
							<td><img
								src="https://www.icreta.com/files/attach/images/319/275/055/8e2c1590a474a9afb78c4cb23a9af5b2.jpg"
								alt="Profile Image" class="profile-img"></td>
							<td>username</td>
							<td>
								<button class="follow-btn">follow</button>
								<button class="block-btn">Block</button>
								<button class="chat-btn">Chat</button>
							</td>
						</tr>
						<tr>
							<td><img
								src="https://dnvefa72aowie.cloudfront.net/business-profile/bizPlatform/profile/40388181/1674021254765/MWJlMWNjOGNiMDMzMzE0ZTUwM2ZiZTllZjJkOTZiMGViYTgzNDQxNTE0YWY4ZDU0ZWI3MWQ1N2MzMWU5ZTdmYS5qcGc=.jpeg?q=95&s=1440x1440&t=inside"
								alt="Profile Image" class="profile-img"></td>
							<td>username</td>
							<td>
								<button class="follow-btn">follow</button>
								<button class="block-btn">Block</button>
								<button class="chat-btn">Chat</button>
							</td>
						</tr>
						<tr>
							<td><img src="profile_picture_url" alt="Profile Image"
								class="profile-img"></td>
							<td>username</td>
							<td>
								<button class="follow-btn">follow</button>
								<button class="block-btn">Block</button>
								<button class="chat-btn">Chat</button>
							</td>
						</tr>
						<tr>
							<td><img src="profile_picture_url" alt="Profile Image"
								class="profile-img"></td>
							<td>username</td>
							<td>
								<button class="follow-btn">follow</button>
								<button class="block-btn">Block</button>
								<button class="chat-btn">Chat</button>
							</td>
						</tr>
						<!-- End of repeated TR -->
					</tbody>
				</table>
			</div>
		</div>
		<!-- 팔로잉, 팔로워 수 불러오는 ajax 코드 -->
		<script>
// 팔로잉, 팔로워 수 불러오는 ajax 통신 코드 ---------------------------------------------------------------------------------
 $(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countFollowing.do', // 컨트롤러의 경로
        type: 'GET',
        data: { userId: userId },
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
        data: { userId: userId },
        success: function(response) {
        	  $("#followersCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});

//팔로우 버튼 클릭 시 코드
$(document).on('click', '.follow-btn', function() {
    var userId = '${sessionScope.loginUser.userId}'; // 로그인한 사용자의 ID
    var friendId = 'doha123'; // 팔로우할 사용자의 ID, 실제 구현에서는 동적으로 구현

    // AJAX 요청으로 서버에 팔로우 정보 전송
    $.ajax({
        url: 'insertF.do', // 서버의 URL
        type: 'POST',
        data: {
            userId: userId,
            friendId: friendId
        },
        success: function(response) {
            // 팔로잉 성공 시 처리
            alert('팔로잉하였습니다.'); // 팝업창 표시
            // 팔로잉 리스트에 새로운 행 추가
            var newRow = `<tr>
                            <td><img src="https://flexible.img.hani.co.kr/flexible/normal/400/500/imgdb/original/2023/0503/20230503501277.jpg" alt="Profile Image" class="profile-img"></td>
                            <td>${response.username}</td> <!-- 서버로부터 받은 유저네임 사용 -->
                            <td>
                                <button class="unfollow-btn">Unfollow</button>
                                <button class="block-btn">Block</button>
                                <button class="chat-btn">Chat</button>
                            </td>
                          </tr>`;
            $('.followingList-table tbody').append(newRow); // 테이블에 행 추가
        },
        error: function(xhr, status, error) {
            console.error('팔로잉 실패: ' + error);
            alert('팔로잉 실패하였습니다.');
        }
    });
});
//팔로우 취소 
$(document).on('click', '.unfollow-btn', function() {
    var userId = '${sessionScope.loginUser.userId}';
    var friendId = 'doha123'; // 팔로우 취소 사용자의 ID, 실제 구현에서는 동적으로 구현

    $.ajax({
        url: 'unfollowing.do',
        type: 'POST',
        data: {
            userId: userId,
            friendId: friendId
        },
        success: function(cansle) {
            alert("팔로우 취소하였습니다"); // "팔로잉 취소" 알림
            loadFollowingList(userId); // 팔로잉 목록 다시 로드
        },
        error: function(xhr, status, error) {
            console.error('팔로잉 취소 실패: ' + error);
        }
    });
});



// 팔로잉 목록 불러오기 
/* $(document).ready(function() {
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기
    loadFollowingList(userId);
});

function loadFollowingList(userId) {
    $.ajax({
        url: 'FollowingList.do',
        type: 'POST',
        data: { userId: userId },
        success: function(followingList) {
            var tableBody = $('.followingList-table tbody');
            tableBody.empty(); // 테이블 내용을 비웁니다.
            followingList.forEach(function(following) {
                var row = `<tr>
                            <td><img src="${following.profile}" alt="Profile Image" class="profile-img"></td>
                            <td>${following.friendId}</td>
                            <td>
                                <button class="unfollow-btn">Unfollow</button>
                                <button class="block-btn">Block</button>
                                <button class="chat-btn">Chat</button>
                            </td>
                          </tr>`;
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.error('팔로잉 목록 로드 실패: ' + error);
        }
    });
} */
</script>
<script src="https://kit.fontawesome.com/4b2098cb2a.js"></script>
		<div class="followList">
			<div class="list-header">
				<h2>
					Your Follower<br> 팔로워 수 : <span id="followersCount"></span>
				</h2>
				<div id="followerSearch">
					<input type="text" id="followerSearchQuery" placeholder="팔로워 계정 검색">
					<button onclick="searchFollower()">Search</button>
				</div>
			</div>

	
			<table class="followerList-table">
				<thead>
					<tr>
						<th>Profile</th>
						<th>Username</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<!-- Repeat this TR for each following entry -->
					<tr>
						<td><img
							src="https://flexible.img.hani.co.kr/flexible/normal/400/500/imgdb/original/2023/0503/20230503501277.jpg"
							alt="Profile Image" class="profile-img"></td>
						<td>username</td>
						<td>
							<button class="unfollow-btn">Unfollow</button>
							<button class="block-btn">Block</button>
							<button class="chat-btn">Chat</button>
						</td>
					</tr>
					<tr>
						<td><img src="profile_picture_url" alt="Profile Image"
							class="profile-img"></td>
						<td>username</td>
						<td>
							<button class="unfollow-btn">Unfollow</button>
							<button class="block-btn">Block</button>
							<button class="chat-btn">Chat</button>
						</td>
					</tr>
					<tr>
						<td><img src="profile_picture_url" alt="Profile Image"
							class="profile-img"></td>
						<td>username</td>
						<td>
							<button class="unfollow-btn">Unfollow</button>
							<button class="block-btn">Block</button>
							<button class="chat-btn">Chat</button>
						</td>
					</tr>
					<tr>
						<td><img src="profile_picture_url" alt="Profile Image"
							class="profile-img"></td>
						<td>username</td>
						<td>
							<button class="unfollow-btn">Unfollow</button>
							<button class="block-btn">Block</button>
							<button class="chat-btn">Chat</button>
						</td>
					</tr>
					<tr>
						<td><img src="profile_picture_url" alt="Profile Image"
							class="profile-img"></td>
						<td>username</td>
						<td>
							<button class="unfollow-btn">Unfollow</button>
							<button class="block-btn">Block</button>
							<button class="chat-btn">Chat</button>
						</td>
					</tr>
					<!-- End of repeated TR -->
				</tbody>
			</table>
		</div>
	</main>


</body>
</html>
