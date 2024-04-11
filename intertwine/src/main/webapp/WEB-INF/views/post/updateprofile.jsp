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
<script src="/intertwine/resources/js/kakao.min.js"></script>
<script defer src="/intertwine/resources/js/mainpage.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
<script>
Kakao.init('40ec0da7a298d729eab6f57f66aad7f8');
console.log(Kakao.isInitialized()); 
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        	location.href="login.do";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  

</script>

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
                    <a href="${ pageContext.servletContext.contextPath }/getbookmarkfeed.do"><i class="fa-solid fa-bookmark"></i> 북마크</a>
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
					</ul>
            </div>
        </div>
        <div id="bottom_right_contents" style="padding-top:30px">
<div style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 300px; margin: auto;">
    <form action="myprofileupdate.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
        <div id="profilePicPreview" style="position: relative; width: 150px; height: 150px; border-radius: 50%; background-color: #eee; text-align: center; line-height: 150px; margin: 20px auto; color: #666; font-size: 16px; overflow: hidden;">
            프리뷰
        </div>
        <label style="display: block; background-color: plum; color: white; text-align: center; padding: 8px 16px; margin: 10px auto; border: none; border-radius: 4px; cursor: pointer;">
            사진 업로드
            <input type="file" name="ofile" id="profilePicInput" accept="image/*" style="display: none;">
        </label>

        <div style="margin-bottom: 15px;">
            <label>닉네임</label>
            <input type="text" name="nickname" placeholder="닉네임을 입력해주세요" style="width: calc(100% - 20px); padding: 10px; border-radius: 4px; border: 1px solid #ccc; height: 35px; resize: none;">
        </div>
        <div style="margin-bottom: 15px;">
            <label>바이오</label>
            <textarea name="statusMessage" placeholder="바이오를 입력해주세요" style="width: calc(100% - 20px); padding: 10px; border-radius: 4px; border: 1px solid #ccc; height: 60px; resize: none;"></textarea>
        </div>
        <button type="submit" style="background-color: plum; color: white; border: none; padding: 10px 20px; margin-right: 10px; border-radius: 4px; cursor: pointer;">정보수정</button>
        <button type="button" class="back-btn" onclick="window.history.back();" style="background-color: #666; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">뒤로가기</button>
    </form>
</div>

<script>
    document.getElementById('profilePicInput').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('profilePicPreview');
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Profile Picture">';
            };
            reader.readAsDataURL(file);
        }
    });
</script>
        </div>
    </main>
</body>

</html>