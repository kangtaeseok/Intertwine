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
                    <li id="b">
                        <a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>
                        <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
                    </li>
                    <li id="c">
                        <a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>
                    </li>
                    <li id="d">
                        <a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>
                    </li>
                    <li id="e">
                        <a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
                    </li>
                    <li id="f">
                        <a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>
                    </li>
                    <li id="g">
                        <a href="#"><i class="fa-solid fa-gear"></i> 설정</a>
                    </li>
                </ul>
            </aside>
            <div id="bottom_right_contents">
                <div class="sub_menu">
                    서브메뉴
                </div>
                <div class="feed">
                    피드창
                </div>
            </div>
        </div>

    </main>
    <script>
        const sidebarItems = document.querySelectorAll('.side-bar > ul > li');
        const content = document.querySelector("#bottom_right_contents");
        const submenu = document.querySelector(".sub_menu");

        sidebarItems.forEach(function (item) {
            item.addEventListener('click', function () {
                let isOn = content.classList.contains("on");
                console.log(isOn);

                if (isOn) {
                    content.classList.remove("on");
                } else {
                    content.classList.add("on");
                }

                let isOn2 = submenu.classList.contains("on");
                console.log(isOn);

                if (isOn2) {
                    submenu.classList.remove("on");
                } else {
                    submenu.classList.add("on");
                }

            });
        });
    </script>
</body>
</html>