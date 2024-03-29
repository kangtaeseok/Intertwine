<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Intertwine Friends Management</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<!-- 이 jsp파일의 css파일 연결 -->
<style>

.content {
	display: flex;
	flex-direction: row;
	flex-flow: nowrap;
	align-items: flex-start;
}

.followList {
	left: 240px;
	display: flex;
	position: relative;
	width: 600px;
	height: 600px;
	background-color: #f9f9f9;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin: 1rem;
	border-radius: 10px; /* 테두리 둥글게 처리 */
}

h2 {
	color: #cc2e72;
	margin-bottom: 20px;
}

.list-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px;
}

.followingList, .followList {
   left: 240px;
    display: flex;
    flex-direction: column;
    position: relative;
    width: 500px;
    height: 600px;
    background-color: #f9f9f9;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin: 1rem;
    border-radius: 10px;
    padding: 10px; /* 여백 추가 */
}

.searchFollowing, .searchFollow {
    flex-grow: 0; /* 수정: 입력 필드의 크기를 고정하기 위해 */
    margin-right: 10px; /* 오른쪽 마진 조정 */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 20px;
}

h2 {
    margin: 0; /* 상하 마진 제거 */
    color: #cc2e72;
}
/* 검색창과 버튼 컨테이너 스타일 */
#followingSearch, #followerSearch {
    display: flex;
    margin-top: 10px; /* 상단 여백 추가 */
    align-items: center; /* 내용을 세로 중앙 정렬 */
}

/* 검색 입력 필드 스타일 */
.searchFollowing, #followerSearchQuery {
    flex-grow: 1;
    padding: 8px 12px;
    border: 2px solid #dcdcdc; /* 경계선 스타일 */
    border-radius: 25px; /* 둥근 모서리 */
    margin-right: 10px; /* 오른쪽 여백 */
    outline: none; /* 선택 시 테두리 제거 */
    box-shadow: inset 0 1px 3px rgba(0,0,0,0.1); /* 내부 그림자 */
}

/* 검색 버튼 스타일 */
#followingSearch button, #followerSearch button {
    padding: 8px 16px;
    background-color: #cc2e72; /* 배경 색상 */
    color: white; /* 텍스트 색상 */
    border: none; /* 경계선 제거 */
    border-radius: 25px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스 오버 시 커서 변경 */
    transition: background-color 0.2s; /* 배경 색상 변화 효과 */
}

/* 검색 버튼 호버 스타일 */
#followingSearch button:hover, #followerSearch button:hover {
    background-color: #f8c6ce; /* 호버 시 배경 색상 변경 */
}


</style>
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
					<li id="c"><a
						href="${ pageContext.servletContext.contextPath }/friendPage.do"><i
							class="fa-solid fa-user-group"></i> 친구</a></li>
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
			<!-- <div id="followingSearch">
				<input type="text" placeholder="팔로잉 계정 검색"
					class="searchFollowing">
				<button onclick="searchFollowing()">Search</button>
			</div>

			<div id="followerSearch">
				<input type="text" id="followerSearchQuery"
					placeholder="팔로워 계정 검색">
				<button onclick="searchFollower()">Search</button>
			</div>
			
			<div class="followingList">
				<h2>Your Following</h2>
			</div>
			<div class="followList">
				<h2>Your Follow</h2>
			</div>

		</div> -->
		
		<!-- </div> -->
		 <div class="followingList">
    <div class="list-header">
        <h2>Your Following <span id="followingCount"></span></h2>
        <div id="followingSearch">
            <input type="text" placeholder="팔로잉 계정 검색" class="searchFollowing">
            <button onclick="searchFollowing()">Search</button>
        </div>
    </div>
    <!-- 팔로잉 리스트 내용 -->
    
</div>
<!-- 팔로잉, 팔로워 수 불러오는 ajax 코드 -->
<script>
$(document).ready(function() {
    const userId = "${userId}"; //세션에 로그인한 유저ID를 받아옴

    // Fetch and display the following count
    $.get("countFollowing.do", { userId: userId }, function(data) {
        $("#followingCount").text(data);
    });

    // Fetch and display the followers count
    $.get("countFollowers.do", { userId: userId }, function(data) {
        $("#followersCount").text(data);
    });
});
</script>
<div class="followList">
    <div class="list-header">
        <h2>Your Follower <span id="followersCount" style="color: black;">123명</span></h2>
        <div id="followerSearch">
            <input type="text" id="followerSearchQuery" placeholder="팔로워 계정 검색">
            <button onclick="searchFollower()">Search</button>
        </div>
    </div>
    <!-- 팔로워 리스트 내용 -->

</div>
	</main>


</body>
</html>