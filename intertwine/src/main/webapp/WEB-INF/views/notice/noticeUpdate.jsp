<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="views/common/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>second : project</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://kit.fontawesome.com/40acfae8f0.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/intertwine/resources/css/adnoticeupdate.css" />
</head>
<body>
    <header> <!-- 페이지 상단 -->
        <div class="header">
			<div class="header-div">
			<a href="location.href='admain.do'"><img src="/intertwine/resources/images/intertwinelogo.png" width="180px;" height="30px;"></a>
			</div>
		</div>
    </header>
<div class="body-div">
<main>
<aside class="side-bar">
            <ul>
                <li id="square">
                    <li><a href="#"><i class="fa-solid fa-user"></i> 사용자 관리</a></li>
      
                <li id="mypage">
                    <li><a href="${ pageContext.servletContext.contextPath }/userRptPage.do"><i class="fa-solid fa-flag"></i> 신고현황</a></li>
             
                <li id="friend">
                    <li><a href="${ pageContext.servletContext.contextPath }/rptlist.do"><i class="fa-solid fa-clipboard"></i> 콘텐츠 관리</a></li>
                
                <li id="chatting">
                    <li><a href="${ pageContext.servletContext.contextPath }/adnlist.do"><i class="fa-solid fa-gear"></i> 서비스 관리</a></li>
                
                <li id="alarm">
                    <li><a href="#"><i class="fa-solid fa-q"></i> 고객센터</a></li>
                
            </ul>
        </aside>
        <div id="submenubars">
            <div id="dummy_sub_menu" class="sub_menu">
                더미 서브메뉴
            </div>
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

        </div>
        

        <div id="bottom_right_contents">
            <div id="abc">
                <div class="feed">
				    <div>
				        <center>
				            <a id="notice" href="${pageContext.servletContext.contextPath}/adnlist.do">공  지  사  항</a>
				        </center>
				    </div>
				    <br>
				    <div id="board-search">
					    <div class="container">
					        <div class="search-window">
					             <h1>공지사항 수정 페이지</h1>
								    <form id="updateForm" action="${pageContext.request.contextPath}/noticeupdate.do" method="POST">
								        <input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId}">
								        <label for="noticeTitle">제목:</label><br>
								        <input type="text" id="noticeTitle" name="noticeTitle" value="${notice.noticeTitle}"><br>
								        <label for="noticeContent">내용:</label><br>
								        <textarea id="noticeContent" name="noticeContent">${notice.noticeContent}</textarea><br>
								        <label for="noticeLevel">중요도:</label><br>
								        <input type="radio" id="noticeLevel1" name="noticeLevel" value="1" ${notice.noticeLevel == 1 ? 'checked' : ''}>
								        <label for="noticeLevel1">중요</label>
								        <input type="radio" id="noticeLevel0" name="noticeLevel" value="0" ${notice.noticeLevel == 0 ? 'checked' : ''}>
								        <label for="noticeLevel0">보통</label>
								        <input type="submit" value="수정">
								    </form>
					        </table>
					    </div>
					</div>
					</div>
				</div>
			</div>
			<script src="/intertwine/resources/js/adnoticeupdate.js"></script>
    </main>
</body>
</html>