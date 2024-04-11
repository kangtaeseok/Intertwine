<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
</head>
<link rel="stylesheet" href="/intertwine/resources/css/common/menubar.css" />
<meta charset="UTF-8">
<title></title>
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
                		<li><a href="${pageContext.servletContext.contextPath}/userTime.do"><i class="fa-solid fa-clock"></i> 이용시간 </a></li>
						<c:if test="${empty type}">
                        <li id="userInfo">
                        	<a href="${pageContext.servletContext.contextPath}/userInfo.do"><i class="fa-solid fa-feather"></i> 회원정보수정</a>
                       	</li>
                        </c:if>
                        <c:if test="${type eq 'kakao'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정 </a>
						</li>
						</c:if>
						<c:if test="${type eq 'naver'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"><i class="fa-solid fa-feather"></i> 회원정보수정 </a>
						</li>
						</c:if>
						<li><a href="${ pageContext.servletContext.contextPath }/aichatgo.do"><i class="fa-regular fa-circle-question"></i> 문의</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/userStopPage.do"><i class="fa-solid fa-circle-stop"></i> 계정 비활성화</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/flist.do"><i class="fa-solid fa-headset"></i> 고객센터</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/noticelist.do"><i class="fa-solid fa-circle-exclamation"></i> 공지</a></li>
						
						
						<c:if test="${empty type}">
                        	<button class="btn" onclick="javascript:location.href='ulogout.do';">logout</button>
						</c:if>
						<c:if test="${type eq 'kakao'}">
							<button class="btn" id="kbtn" onclick="kakaoLogout();">logout</button>
						</c:if>
						<c:if test="${type eq 'naver'}">
							<button class="btn" id="nbtn" onclick="location.href='ulogout.do'">logout</button>
						</c:if>
						
					</ul>
            </div>
        </div>
</body>
</html>