<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<!-- 이 jsp파일의 css파일 연결 -->
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js"
	crossorigin="anonymous"></script>
<!-- 폰트어썸 가져오기 -->
<script type="text/javascript"
	src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<style>
/* 초기화, 기본요소의 디자인을 모두 없애기 */
html {
	font-size: 16px; /* rem 단위 사용을 위해 가장 상위요소의 px값 지정 */
	height: 100%;
}

* {
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

ul, ol, li {
	list-style: none;
}

a {
	text-decoration: none;
}

/* 사이드바의 너비와 높이를 변수를 통해 통제 
   :root 가상 클래스, :root 선택자는 가장 상위요소를 선택할 때 사용함.  
   즉, html을 가리키지만, html 선택자보다 우선순위가 높다. */
:root { -
	-side-bar-width: 240px; -
	-side-bar-height: 100vh;
}

/* 페이지 전체 */
body {
	background-color: #f5f5f5;
	width: 100%;
	height: 100%;
	height: 2000px; /* 사이트의 높이를 2000px로 만들어 스크롤 생성 */
}

/* 페이지 상단 */
header {
	width: 100%;
	height: 60px;
	display: flex;
	background-color: #ffffff;
	/* margin-bottom: 2rem; */
	position: sticky;
	z-index: 1;
	top: 0;
	justify-content: space-around;
	align-items: center;
}

/* 페이지 좌측 상단 홈버튼 */
.homebutton_nav {
	position: absolute;
	/* 위치 조정 */
	top: 0.2rem;
	left: 3rem;
	width: 5rem;
	height: 4rem; /* 헤더의 높이와 맞춤 */
}

.homebutton_nav ul {
	display: flex;
	height: 100%; /* 네비게이션의 높이를 부모 요소인 헤더의 높이와 맞춤 */
}

.homebutton_nav ul li {
	display: flex;
	align-items: center; /* 세로 정렬을 위해 */
}

.homebutton {
	width: 5.5rem; /* 홈버튼 이미지의 너비에 맞게 조정 */
	scale: 2; /* 이미지 크기 */
	background-image: url("/intertwine/resources/images/homebutton.png");
	/* 이미지 파일 위치 */
	background-repeat: no-repeat; /* 이미지 반복 없애기 */
	background-size: cover; /* 이미지 꽉 채우기 */
	background-position: center; /* 이미지가 중앙에 오게 */
	cursor: pointer; /* 마우스를 올렸을 때 커서를 포인터로 변경 */

	/* 지워도 변화는 코드지만 혹시 몰라서 주석으로 남겨둠... */
	/* overflow: hidden; */
	/* position: relative; */
	/* display: inline-block; */
}

/* 웹페이지 줄였을 때 나오는 집 모양 아이콘 */
.homebutton_nav>ol {
	display: none;
}

.homebutton_nav>ol>i {
	display: none;
	font-size: 10rem;
	color: rgb(205, 79, 132);
}

/* 페이지 중앙 상단 검색창  */
.search {
	display: flex;
	position: relative;
	width: 15rem;
	/* justify-content: center; */
}
/* 검색창 입력칸 */
.search>input {
	width: 100%;
	height: 50%;
	border: 1px solid #bbb;
	border-radius: 8px; /* 테두리 둥글게 */
	padding: 10px 12px;
	font-size: 14px;
}
/* 검색창 포커스 시 테두리 */
.search>input:focus {
	outline: 2px solid rgb(205, 79, 132);
}
/* 검색창의 돋보기 모양  */
.search>img {
	position: absolute;
	width: 1rem;
	top: 10px;
	right: 12px;
	margin: 0;
}

/* 2차 이상의 메뉴를 숨기기 */
.side-bar>ul ul {
	display: none;
}

main {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap; /* 필요하다면 flex-wrap 속성 추가하여 여러 줄로 배치되도록 설정 */
	justify-content: flex-start;
	align-items: stretch;
	/* .side-bar와 .bottom_right_contents의 높이를 동일하게 맞추기 위해 */
	width: 100%;
}

/* 사이드 메뉴 바 */
.side-bar {
	padding-top: 10px;
	padding-left: 10px;
	padding-right: 10px;
	position: fixed; /* 스크롤을 따라오도록 지정, 스크롤을 내려도 위치 고정 */
	background-color: #ffffff;
	z-index: 1;
	/* border-radius: 20px; */
	/* 가져온 코드라 이해 잘 안감... */
	/* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
	/* margin-top: calc((100vh - var(--side-bar-height)) / 2); */
	/* 사이드바 위와 아래의 마진을 동일하게 지정 */
	width: var(- -side-bar-width);
	min-height: var(- -side-bar-height);
	/* 너비를 고정 */
	flex: 0;
}

/* 자식의 position이 absolute일 때 자식을 영역 안에 가두어 준다 */
.side-bar>ul>li {
	position: relative;
	border-radius: 10px;
	background-color: #fff; /* 배경 추가 */
}

/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul>li>a {
	display: block;
	color: rgb(205, 79, 132);
	font-size: 1.2rem;
	font-weight: bold;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 0.8rem;
	margin-top: 5px;
	margin-bottom: 15px;
	border-radius: 10px;
	transition: background-color 0.8s ease;
}

/* 사이드바 각 메뉴에 마우스 올렸을 때 background 회색 효과 */
.side-bar ul>li:hover>a {
	background-color: #f2f2f2;
}

.side-bar ul>li>a>i {
	font-size: 1.2rem; /* 메뉴 아이콘 초기 크기 */
	transition: font-size 0.3s ease; /* 메뉴 아이콘(글자) 크기가 서서히 변하도록 */
}
/* 사이드바 각 메뉴에 마우스 올렸을 때 메뉴 아이콘 크기 변화 */
.side-bar ul>li:hover>a>i {
	font-size: 1.5rem;
}

#bottom_right_contents {
	top: 0;
	position: relative;
	display: flex;
	flex-direction: row;
	justify-content: center;
	/* This will center the children horizontally */
	flex-flow: wrap;
	justify-content: space-around;
	width: calc(100% - var(- -side-bar-width));
	/* .side-bar의 너비를 제외한 너비로 설정 */
	margin-left: var(- -side-bar-width); /* .side-bar의 너비만큼 마진을 줌 */
	left: -240px;
	transition: left 1s ease;
}

#bottom_right_contents.on {
	position: relative;
	display: flex;
	flex-direction: row;
	flex-flow: wrap;
	justify-content: space-around;
	width: calc(100% - var(- -side-bar-width));
	/* .side-bar의 너비를 제외한 너비로 설정 */
	margin-left: var(- -side-bar-width); /* .side-bar의 너비만큼 마진을 줌 */
	left: 0px;
}

.sub_menu {
	min-height: var(- -side-bar-height);
	width: var(- -side-bar-width);
	background-color: violet;
	z-index: 0;
	position: sticky; /* 변경: position을 sticky로 설정 */
	top: 0;
	transition: opacity 1s ease;
	opacity: 0;
}

.sub_menu.on {
	min-height: var(- -side-bar-height);
	width: var(- -side-bar-width);
	background-color: violet;
	z-index: 0;
	position: sticky; /* 변경: position을 sticky로 설정 */
	top: 0;
	opacity: 0.5;
}

.feed {
	position: relative;
	width: 800px;
	height: 600px;
	background-color: blue;
	margin: 10rem;
}

/* 여기서 피드 관련 CSS ************************************************************************* */
.container-feed {
	width: auto; /* Let it take the width of its content */
	max-width: 1000px; /* Maximum width of the feed container */
	justify-content: center;
	margin: 20px auto;
	/* Top and bottom margins with automatic horizontal centering */
	display: flex;
	flex-direction: column;
	align-items: center; /* This centers the children of .container-feed */
}

.action .profile {
	position: relative;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

.action .profile img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.frame {
	width: 470px;
}

.frame .card {
	margin-bottom: 20px;
	position: relative;
	width: 100%;
	display: inline-block;
	border: 1px solid rgba(7, 7, 7, 0.24);
}

.frame .card .top {
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.frame .card .bottom {
	padding: 10px 20px;
}

.frame .card .top .userDetails {
	width: 100%;
	display: flex;
	align-items: center;
}

.profile_img {
	justify-content: center;
	border-radius: 50%;
	overflow: hidden;
	background: linear-gradient(to right, pink, purple);
	padding: 2px;
	margin-right: 8px;
	cursor: pointer;
}

.profile_img .image {
	align-items: center;
	position: relative;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid white;
}

.profile_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.end-of-content {
	text-align: center;
}

.cover {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.frame .card .top .userDetails h3 {
	/* width: 100%; */
	font-size: 16px;
	color: #4d4d4f;
	font-weight: 500;
	line-height: 1em;
}

.frame .card .top .userDetails h3 span {
	font-size: 0.75em;
}

.imgBox {
	position: relative;
	width: 470px;
	height: 470px;
	background-color: black; /* Black background */
	display: flex;
	justify-content: center;
	align-items: center;
}

.imgBox img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
	/* This will ensure the image's aspect ratio is maintained */
}

.actionBtns {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.actionBtns svg {
	cursor: pointer;
}

.actionBtns .left svg {
	margin-right: 8px;
}

.actionBtns svg path {
	stroke-width: 1;
}

.likes {
	font-weight: 500;
	margin-top: 5px;
	font-size: 14px;
	color: #4d4d4f;
}

.message {
	font-weight: 400;
	margin-top: 5px;
	font-size: 14px;
	color: #777;
	line-height: 1.5em;
}

.message span {
	cursor: pointer;
	color: #1d92ff;
}

.comments {
	margin-top: 10px;
	font-weight: 400;
	color: #999;
}

.addComments {
	display: flex;
	align-items: center;
	margin-top: 20px;
	border-top: 1px solid #ddd;
	padding: 10px 0;
}

.addComments a {
	color: #1d92ffcb;
	font-weight: 500;
}

.reaction {
	position: relative;
	font-size: 1.3rem;
	margin-right: 3px;
	color: rgb(88, 88, 88);
	cursor: pointer;
	display: inline-block;
}

.reaction .reaction-box {
	position: absolute;
	width: 312px;
	height: auto;
	background: white;
	border-radius: 28px;
	left: 0;
	bottom: 100%;
	margin-bottom: 10px;
	display: none;
}

.reaction .reaction-box .reaction-icon {
	width: 40px;
	height: 30px;
	display: inline-block;
	background: white;
	margin: 8px;
	transition: transform 1.2s ease;
}

.reaction .reaction-box .reaction-icon>svg {
	margin-left: 2px;
}

input.text {
	width: 100%;
	border: none;
	outline: none;
	font-weight: 400;
	font-size: 14px;
	color: #262626;
	background: none;
}

input.text::placeholder {
	color: #777;
}

.postTime {
	margin-top: 8px;
	font-weight: lighter;
	color: rgb(163, 163, 163);
	font-size: 12px;
	text-transform: uppercase;
}

.bottom a {
	text-decoration: none;
	color: black;
}

/* 피드 CSS 종료 ***************************************************/

/* 반응형 웹, 미디어 쿼리, 웹 페이지의 가로 크기에 맞춰 UI 변경 */
/* 노트북 & 테블릿 가로 (해상도 1024px ~ 1279px)*/
@media all and (min-width: 1024px) and (max-width: 1279px) {
	/* 스타일 입력 */
	.search {
		display: none;
	}
	.homebutton_nav>ul {
		display: none;
	}
	.homebutton_nav>ol {
		display: block;
	}
	.homebutton_nav>ol>a {
		display: block;
		color: rgb(205, 79, 132);
		font-size: 1.2rem;
		padding-top: 15px;
		padding-bottom: 15px;
		margin-left: -23px;
	}
	.side-bar {
		width: 75px;
	}
	.side-bar ul>li>a {
		display: block;
		color: rgb(205, 79, 132);
		font-size: 1.2rem;
		font-weight: bold;
		padding-top: 15px;
		padding-bottom: 15px;
		padding-left: 0.8rem;
		margin-top: 5px;
		margin-bottom: 15px;
		border-radius: 10px;
		transition: background-color 0.8s ease;
	}
}

/* 테블릿 가로 (해상도 768px ~ 1023px)*/
@media all and (min-width: 768px) and (max-width: 1023px) {
	/* 스타일 입력 */
	.search {
		display: none;
	}
	.homebutton_nav>ul {
		display: none;
	}
	.homebutton_nav>ol {
		display: block;
	}
	.homebutton_nav>ol>a {
		display: block;
		color: rgb(205, 79, 132);
		font-size: 1.2rem;
		padding-top: 15px;
		padding-bottom: 15px;
		margin-left: -23px;
	}
	.side-bar {
		width: 75px;
	}
}

/* 모바일 가로 & 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (min-width: 480px) and (max-width: 767px) {
	/* 스타일 입력 */
	.search {
		display: none;
	}
	.homebutton_nav>ul {
		display: none;
	}
	.homebutton_nav>ol {
		display: block;
	}
	.homebutton_nav>ol>a {
		display: block;
		color: rgb(205, 79, 132);
		font-size: 1.2rem;
		padding-top: 15px;
		padding-bottom: 15px;
		margin-left: -23px;
	}
	.side-bar {
		width: 75px;
	}
}

/* 모바일 세로 (해상도 ~ 479px)*/
@media all and (max-width: 479px) {
	/* 스타일 입력 */
	.search {
		display: none;
	}
	.homebutton_nav>ul {
		display: none;
	}
	.homebutton_nav>ol {
		display: block;
	}
	.homebutton_nav>ol>a {
		display: block;
		color: rgb(205, 79, 132);
		font-size: 1.2rem;
		padding-top: 15px;
		padding-bottom: 15px;
		margin-left: -23px;
	}
	.side-bar {
		width: 75px;
	}
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
					<a href="main.do"><i class="fa-solid fa-house"></i></a>
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
		<div>
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
					<li id="c"><a href="#"><i class="fa-solid fa-user-group"></i>
							친구</a></li>
					<li id="d"><a href="#"><i class="fa-solid fa-comment"></i>
							채팅</a></li>
					<li id="e"><a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
					</li>
					<li id="f"><a href="#"><i class="fa-solid fa-bookmark"></i>
							북마크</a></li>
					<li id="g"><a href="#"><i class="fa-solid fa-gear"></i> 설정</a>
					</li>
					<li id="h"><a href="create.do"><i
							class="fa-solid fa-pencil"></i> 글쓰기</a> <!-- 마이페이지에서 추가하는 법을 모르겠어서 기능시험용으로 일단 밖으로 둠-->
					</li>
				</ul>
			</aside>
		</div>
		<div id="bottom_right_contents">
			<div class="sub_menu"></div>
			<form action="board.html" method="post" id="uploadForm" enctype="multipart/form-data">
				<div class="imagecontainer">
					<!-- 사진추가시 여기가 업데이트 됨
					아마도 c: foreach 사용할듯 -->
					<div class="preview"></div>
				</div>
				<br>
				<table class="write">
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button id="saveDraft" return="false">임시저장</button>&nbsp;
							<input type="reset" value="취소">&nbsp;
							<input type="button" id="submitForm" value="등록">
						</td>
					</tr>
					<tr>
						<td>
							<a href="attach.do" id="uploadTrigger"><i class="fa-solid fa-image">사진 또는 동영상</i></a>
							<input type="file" id="fileInput" name="files" multiple style="display: none;" />
						</td>
					</tr>
					<tr>
						<td><textarea placeholder="내용을 입력하세요" name="detail" class="detail"></textarea>
						</td>
					</tr>
				</table>
			</form>
			<!-- Modal -->

		<!-- bottom right content 끝-->
	</main>

	<!-- 임시저장용 자바스크립트 -->
<script>
  const saveButton = document.getElementById("saveDraft");
  const textArea = document.querySelector(".detail");
	
  saveButton.addEventListener("click", () => {
	event.preventDefault(); // 페이지 이동 막음
    localStorage.setItem("textArea", textArea.value);
    alert("임시저장되었습니다.");
  });

  window.onload = () => {
    if (localStorage.getItem("textArea")) {
      if (confirm("최근 작성한 글을 불러오시겠습니까?")) {
        textArea.value = localStorage.getItem("textArea"); //불러오기
      } else {
        localStorage.removeItem("textArea"); //만약 유저가 취소를 누르면 임시저장 삭제
      }
    }
  };
</script>
	<!-- 임시저장용 자바스크립트 끝 -->

	<!-- 사이드바 관련 -->
	<style>
* {
	box-sizing: border-box
}

.imagecontainer {
	max-width: 500px;
	position: relative;
	margin: auto;
}
/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

.preview img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
}

form {
	margin-top: 20px;
	padding: 20px;
}

.write {
	position: flex;
}

.write i {
	height: 10;
}

table {
	margin: auto;
}

input[type="text"] {
	border: 1.5px rgb(205, 79, 132) solid;
	width: 500px;
	height: 30px;
	border-radius: 5px;
	padding-left: 10px;
}

textarea {
	border: 1.5px rgb(205, 79, 132) solid;
	width: 500px;
	height: 400px;
	border-radius: 5px;
	padding-left: 10px;
	padding-top: 10px;
	resize: none;
}

.header {
	height: 30px;
}

table input {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	outline: 1.5px rgb(205, 79, 22) solid;
	border-radius: 5px;
	padding-left: 10px;
	background-color: rgb(205, 79, 132);
}

table input:active {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 5px;
	outline: 1.5px rgb(205, 79, 132) solid;
	padding-left: 10px;
	background-color: rgb(164, 199, 255);
}

table button {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	outline: 1.5px rgb(205, 79, 22) solid;
	border-radius: 5px;
	padding-left: 10px;
	background-color: rgb(205, 79, 132);
}

table button:active {
	width: 100px;
	height: 40px;
	font-size: 15px;
	border: 0;
	border-radius: 5px;
	outline: 1.5px rgb(205, 79, 132) solid;
	padding-left: 10px;
	background-color: rgb(164, 199, 255);
}
</style>


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
	<!-- 사이드바 관련 끝 -->

	<!-- 파일 첨부용 자바스크립트 -->
<script>
document.addEventListener("DOMContentLoaded", () => {
    initApp();
    document.getElementById("submitForm").addEventListener("click", submitForm);
});

function submitForm() {
    const formData = new FormData();
    const detailText = document.querySelector('.detail').value;
    formData.append("detail", detailText);

    const files = document.querySelector('#fileInput').files;
    for (let i = 0; i < files.length; i++) {
        formData.append("files", files[i]);
    }

    fetch('path/to/your/spring/controller', { // Replace with your actual endpoint
        method: 'POST',
        body: formData,
    })
    .then(response => response.json())
    .then(data => {
        console.log('Success:', data);
        // Handle success, e.g., redirecting to another page or showing a success message
    })
    .catch((error) => {
        console.error('Error:', error);
        // Handle error
    });
}
</script>
	<!-- 파일 첨부용 자바스크립트 끝 -->

</body>
</html>