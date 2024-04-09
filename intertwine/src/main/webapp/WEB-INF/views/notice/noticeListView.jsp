<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>IntertwineLKM</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/noticepage.css"> <!-- 이 jsp파일의 css파일 연결 -->
<script defer src="/intertwine/resources/js/noticepage.js"></script>
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
                    <a href="${ pageContext.servletContext.contextPath }/main.do"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
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
        <aside class="side-bar">
            <ul>
                <li id="square">
                    <a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
                </li>
                <li id="mypage">
                    <a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>
                    <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
                </li>
                <li id="friend">
                    <a href="${ pageContext.servletContext.contextPath }/friendPage.do"><i class="fa-solid fa-user-group"></i> 친구</a>
                </li>
                <li id="chatting">
                    <a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>
                </li>
                <li id="alarm">
                    <a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
                </li>
                <li id="bookmark">
                    <a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>
                </li>
                <li id="settings">
                    <a href="#"><i class="fa-solid fa-gear"></i> 설정</a>
                </li>
            </ul>
        </aside>
        <div id="submenubars">
            <div id="dummy_sub_menu" class="sub_menu">
                더미 서브메뉴
            </div>
            <div id="mypage_sub_menu" class="sub_menu">
                <ul>
					<li><a href="create.do">글쓰기<i class="fa-solid fa-pencil"></i></a></li>
					<li><a href="mypage.do">마이 페이지 확인</a></li>
					<li><a href="getfeed.do">피드확인</a>
				</ul>
            </div>
            <div id="chatting_sub_menu" class="sub_menu">
                채팅 서브메뉴
            </div>
            <div id="alarm_sub_menu" class="sub_menu">
                알림 서브메뉴
            </div>
            <div id="settings_sub_menu" class="sub_menu">
            	<ul>
	             	<li><a href="${pageContext.servletContext.contextPath}/userTime.do">이용시간<i class="fa-solid fa-clock"></i></a></li>
	                <c:if test="${empty type}">
                        <li id="userInfo">
                        	<a href="${pageContext.servletContext.contextPath}/userInfo.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
                       	</li>
                        </c:if>
                        <c:if test="${type eq 'kakao'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
						</li>
						</c:if>
						<c:if test="${type eq 'naver'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
						</li>
					</c:if>
                		<li><a href="${ pageContext.servletContext.contextPath }/flist.do">고객센터</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/noticelist.do">공지사항</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/aichatlist.do">문의</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/aieventlist.do">이벤트</a></li>
            	</ul>
            </div>
        </div>
        <div id="bottom_right_contents">
            <div id="abc">
                <div class="feed">
				    <div>
				        <center>
				            <a id="notice" href="${pageContext.servletContext.contextPath}/noticelist.do">공  지  사  항</a>
				        </center>
				    </div>
				    <br>
				    <div id="board-search">
					    <div class="container">
					        <div class="search-window">
					            <!-- form 요소의 action 속성에 검색을 처리할 URL을 지정합니다. -->
					           	<form action="noticesearchtitle.do" method="get">
					                <div class="search-wrap">
					                    <label for="search" class="blind">공지사항 내용 검색</label>
					                    <!-- 검색어 입력 필드 -->
					                    <input type="hidden" name="action" value="notice" >
					                    <input id="search" type="search" name="keyword" placeholder="제목을 입력해주세요." value="">
					                    <!-- 검색 버튼 -->
					                    <button type="submit" class="btn btn-dark">검색</button>
					                </div>
					            </form>
					        </div>
					    </div>
					</div>
				    <!-- 조회된 공지사항 목록 출력 -->
				    <div id="board-list">
					    <div class="container">
					        <table class="board-table">
					            <thead>
					                <tr>
					                    <th scope="col" class="th-num">번호</th>
					                    <th scope="col" class="th-title">제목</th>
					                    <th scope="col" class="th-date">등록일</th>
					                    <th scope="col" class="th-view">조회수</th>
					                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${requestScope.list}" var="n" varStatus="loop">
									    <tr class="notice-item">
									        <td align="right">${n.noticeId}</td>
									        <td class="notice-title" data-notice-id="${n.noticeId}" onclick="updateAddReadCount.do">
									            <c:if test="${n.noticeLevel eq 1}">
									                <strong>${n.noticeTitle}</strong>
									            </c:if>
									            <c:if test="${n.noticeLevel ne 1}">
									                ${n.noticeTitle}
									            </c:if>
									            <div class="notice-content">
									                ${n.noticeContent}
									            </div>
									        </td>
									        <td align="left">${n.noticeTime}</td>
									        <td align="center">${n.noticeView}</td>
									    </tr>
									</c:forEach>
					            </tbody>
					        </table>
					    </div>
					</div>
				</div>
				
    </main>
</body>
</html>