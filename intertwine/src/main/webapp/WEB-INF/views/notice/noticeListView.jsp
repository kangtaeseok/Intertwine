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
    <main>
       <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
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
				<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
    </main>
</body>
</html>