<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<title>Intertwine</title>
<meta charset="UTF-8">
</head>
<body>
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
                <li><a href="${pageContext.servletContext.contextPath}/userTime.do"> 이용시간 <i class="fa-solid fa-clock"></i></a></li>
            	<c:if test="${empty type}">
                        <li id="userInfo">
                        	<a href="${pageContext.servletContext.contextPath}/userInfo.do"> 회원정보수정<i class="fa-solid fa-feather"></i></a>
                       	</li>
                        </c:if>
                        <c:if test="${type eq 'kakao'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"> 회원정보수정 <i class="fa-solid fa-feather"></i></a>
						</li>
						</c:if>
						<c:if test="${type eq 'naver'}">
						<li id="socialUserInfo">
							<a href="${pageContext.servletContext.contextPath}/socialUpdatePage.do"> 회원정보수정 <i class="fa-solid fa-feather"></i></a>
						</li>
						</c:if>
						<li><a href="${ pageContext.servletContext.contextPath }/flist.do">고객센터</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/noticelist.do">공지</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/aichatgo.do">문의</a></li>
						<li><a href="${ pageContext.servletContext.contextPath }/aieventgo.do">이벤트</a></li>
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

        <div id="bottom_right_contents">
            <div id="abc">
                <!-- <div class="feed">
                    피드창
                </div> -->
                <div class="squerediv">
                     
                </div>
            </div>
        </div>
        <div class="floating-button" id="floatingButton">
        	<img src="/intertwine/resources/images/ai/chatbot2.png" alt="Chatbot">
        </div>
			<div class="layer" id="layer">
			    <div class="chatbot-container" id="chatbotContainer">
			        <div id="header">
			            <img src="/intertwine/resources/images/ai/chatbot1.png">
			            <h1>이벤트 챗봇</h1>
			        </div>
			        <div id="chatbot">
			            <div id="conversation">
			                <div class="chatbot-message">
			                    <p class="chatbot-text">안녕하세요! 👋 무엇을 도와드릴까요?</p>
			                </div>
			            </div>
			            <form id="input-aievent" action="aieventgo.do" method="post">
			                <message-container>
			                    <input id="input-aefield" type="text" name="keyword" placeholder="메세지를 입력하세요.">
			                    <button id="submit-button" type="submit">
			                      <img class="send-icon" src="/intertwine/resources/images/ai/send-message.png" alt="">
			                    </button>
			                </message-container>
			            </form>
			        </div>
			    </div>
			</div>
    </main>
 
</body>

</html>