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
<link rel="stylesheet" href="/intertwine/resources/css/adnoticepage.css" />


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
					            <a id="noticewrite" href="${pageContext.servletContext.contextPath}/noticewrite.do">등록</a>
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
					                    <th scope="col" class="th-adm">관리</th>
					                </tr>
					            </thead>
					            <tbody>
					                <c:forEach items="${requestScope.list}" var="n">
					                    <tr class="notice-item">
					                        <td align="right">${n.noticeId}</td>
					                        <td class="notice-title" data-notice-id="${n.noticeId}">
					                            <c:if test="${n.noticeLevel eq 1}">
					                                <strong>${n.noticeTitle}</strong>
					                            </c:if>
					                            <c:if test="${n.noticeLevel ne 1}">
					                                ${n.noticeTitle}
					                            </c:if>
					                            <div class="notice-content">${n.noticeContent}</div>
					                        </td>
					                        <td align="left">${n.noticeTime}</td>
					                        <td align="center">${n.noticeView}</td>
					                        <td id="cho" align="left">
					                            <a href="${pageContext.servletContext.contextPath}/noticeupdate.do">수정</a>
					                            <a onclick="requestDelete(${n.noticeId});">삭제</a>
					                        </td>
					                    </tr>
					                </c:forEach>
					            </tbody>
					        </table>
					    </div>
					</div>
					<script type="text/javascript">
					function requestDelete(noticeId) {
						var result = confirm("선택한 " + noticeId + " 번의 공지사항을 삭제하시겠습니까?");
							if (result) {
								// 확인을 누른 경우, 서버로 삭제 요청을 보냄
								location.href = "${pageContext.request.contextPath}/noticedelete.do?noticeid=" + noticeId;
							} else {
					        alert(noticeId + "번 공지사항 삭제에 실패했습니다.");
					    }
					}
					</script>
					</div>
				</div>
			</div>
			<script src="/intertwine/resources/js/adnoticepage.js"></script>
    </main>
</body>
</html>