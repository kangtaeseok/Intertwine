<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css"> <!-- 이 jsp파일의 css파일 연결 -->
<script defer src="/intertwine/resources/js/mainpage.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
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
                    </li>
                </ul>
            </aside>
            <div id="bottom_right_contents">
            
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
                    설정 서브메뉴
                </div>
                
               
                
                <div class="feed">
                    피드창
                </div>
            </div>
        </div>
    </main>
</body>
</html>