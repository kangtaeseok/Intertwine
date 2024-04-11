<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
	<script defer src="/intertwine/resources/js/mainpage.js"></script>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>   
    <title>
       마이 페이지
    </title>

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
					</ul>
            </div>
        </div>







<div class="container" style="margin: 0 auto; padding-left: 250px; width: 1200px;">
    <div class="top" style="margin-top: 30px; display: flex;">
        <div class="profile"  style="padding-left: 10px;padding-right:30px;">
            <div class="pic" style="width: 200px; height: 200px; border-radius: 50%; border: 0px solid black; overflow: hidden;">
                <c:if test="${ empty myPage.profileDraft }">
                <img src="resources/profile/images.jpg"style="width: 100%; height: 100%; object-fit: cover;">
                </c:if>
                <c:if test="${ not empty myPage.profileDraft }">
                <img src="${ myPage.profileDraft }"style="width: 100%; height: 100%; object-fit: cover;">
                </c:if>
            </div>
        </div>
        <div class="profile-info" style="display: flex;">
            
            <div class="left" style="display: flex;">
                <div class="personal"style="padding-right:30px;">
                    <ul>
                        <br>
                        <li style="list-style-type: none;"><h3>${ user.userId } </h3></li>
                        <li style="list-style-type: none;"><h3>${ user.nickname } </h3></li>
                        <li style="list-style-type: none;"><div style="width: 300px;">${ myPage.statusMessage }</div></li>
                        <br>
                        <li style="list-style-type: none;"><a><b>팔로잉 </b>${ followingCount }</a>&nbsp;&nbsp;<a><b>팔로워 </b>${ followerCount }</a> &nbsp;<a></a></li>
                    </ul>
                </div>
                <div class="followrelated" style="height: 50px;">
                    <div class="dummy2" style="height: 50px;">
                    </div>
                </div>
            </div>
            <div class="right" style="display: flex;">
                <div class="dummy" style="height: 50px;">
                    <div class="dummy2" style="height: 50px;">
                    <a href="profileupdate.do" style="text-decoration:none;color:black;">프로필 수정</a>
                    </div>
 					<button class="delete-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;">선택삭제</button>
                    <button class="public-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;">선택 전체공개</button>
                    <button class="friend-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;">선택 팔로워공개</button><br>
                    <button class="private-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;margin-top: 5px;">선택 비공개</button>
                    <button class="pinon-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;margin-top: 5px;">선택 핀</button>
                    <button class="pinoff-button" style="padding: 5px 10px;border: none;border-radius: 5px;cursor: pointer;font-size: 15px;margin-top: 5px;">선택 핀제거</button>
                </div>
                
            </div>
        </div>

    </div>
    <div class="middle" style="padding-top: 30px; display: flex;">
        <div class="search" style="display: flex; background-color: #FFF; border: 0px solid #FFF; border-radius: 5px; padding: 5px 10px;">
            <select id="search-condition" class="search-condition" style="border: none; background: transparent; padding: 5px; margin-right: 5px; cursor: pointer;">
                <option value="0" selected>전체</option>
                <option value="1">태그</option>
                <option value="2">콘텐츠</option>
              </select>
            <input id="search-input" type="text" placeholder="키워드 입력" style="width: 150px; border: none; outline: none; background-color: #FFF; font-size: 13px;"> 
            <i onclick= "performSearch(); return false;"class="fa fa-search" style="color: #000; font-size: 33px; margin-left: 5px; cursor: pointer; transition: transform 1s ease;"></i>
        </div>
        <script>
		    function performSearch() {
		    	var keyword = document.getElementById("search-input").value;
		        var selectedOption = document.querySelector(".search-condition").value;
		        var userId = "${user.userId}";
		        if (keyword.trim() === "") {
		            alert("키워드를 입력하세요.");
		            return false;
		        }
		        var url = "searchmypage.do?userId=" + userId + "&keyword=" + encodeURIComponent(keyword) + "&condition=" + encodeURIComponent(selectedOption);
		        window.location.href = url;
		    }
		</script>
        <div class="dummy3" style="width: calc(60%);">
        </div>
        <div class="sorting" style="display: flex; justify-content: space-between;">
        
            <select name="dropdown" id="dropdown" style="padding: 8px 12px; margin-right: 10px; border: 0px solid #ccc; border-radius: 4px; background-color: #FFF; cursor: pointer; font-size: 16px;">
                <option value="0">최신순</option>
                <option value="1">오래된순</option>
                <option value="2">조회수 많은순</option>
            </select>
        </div>
        
    </div>
    <div class="bottom" style="display: flex;flex-wrap: wrap;width: 100%;">
        <!-- 이것들이 반복 됨 -->
       <c:forEach var="gallery" items="${galleries}">
        <a href="detail.do?postId=${gallery.post.postId}">
        <div class="options" style="width: 300px; height:300px; margin-bottom: 30px;margin-right: 13px;position: relative" data-id="${ gallery.post.postId }">
            <input type="checkbox" id="${ gallery.post.postId }" name="checks" value="${ gallery.post.postId }" class="checkbox">
            <div class="gallery" style="padding: 0px;height: 300px;padding: 0px;margin: 0px;justify-content: center;background-color: grey;">
                <div class="image-wrap" style="position: relative;width: 100%;height: 100%;">
				<c:if test="${not empty gallery.image.imageURL}">
				    <img src="${gallery.image.imageURL}" style="width: 100%;height: 100%;object-fit: contain;">
				</c:if>
				<c:if test="${empty gallery.image.imageURL}">
				    <img src="resources/postimage/noimage.jpg" style="width: 100%;height: 100%;object-fit: contain;">
				</c:if>
                    <div class="overlay" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;background: rgba(0, 0, 0, 0.5);color: white; visibility: hidden;opacity: 0.5;transition: opacity 0.5s, visibility 0.5s;display: flex;justify-content: center;align-items: center;">
						<script>
						document.addEventListener('DOMContentLoaded', function() {
						    // 태그 찾기
						    var imageWraps = document.querySelectorAll('.bottom .options .gallery .image-wrap');
						
						    // 마우스 올릴때 할 작업
						    function showOverlay(event) {
						        var overlay = event.currentTarget.querySelector('.overlay');
						        overlay.style.visibility = 'visible';
						        overlay.style.opacity = '1';
						        overlay.style.cursor = 'pointer';
						    }
						
						    // 마우스 내릴때 작업
						    function hideOverlay(event) {
						        var overlay = event.currentTarget.querySelector('.overlay');
						        overlay.style.visibility = 'hidden';
						        overlay.style.opacity = '0';
						    }
						
						    // 각 카드마다 이벤트 작업 적용
						    imageWraps.forEach(function(wrap) {
						        wrap.addEventListener('mouseover', showOverlay);
						        wrap.addEventListener('mouseout', hideOverlay);
						    });
						});
						</script>
						<style>

					        .bottom .options .gallery .image-wrap .overlay .icon-bottom-right,
					        .bottom .options .gallery .image-wrap .overlay .icon-top-left {
					            position: absolute; 
					        }
					
					        .bottom .options .gallery .image-wrap .overlay .icon-bottom-right {
					            bottom: 15px; /* Adjust as needed */
					            right: 15px; /* Adjust as needed */
					        }
					
					        .bottom .options .gallery .image-wrap .overlay .icon-top-left {
					            top: 15px; /* Adjust as needed */
					            left: 15px; /* Adjust as needed */
					        }
                        </style>
                        <i fill=white; class="fa-solid fa-heart">&nbsp;<c:out value="${gallery.likeCount}" /></i> &nbsp;&nbsp;&nbsp;
                        <i fill=white; class="fa-solid fa-comment">&nbsp;<c:out value="${gallery.commentCount}"/></i>
                        <c:if test="${gallery.post.postPin == '1'}">
                        <i class="fa-solid fa-thumbtack icon-bottom-right"></i>
                    	</c:if>
                   		<c:choose>
                        <c:when test="${gallery.post.postVisible == '0'}">
                            <i class="fa-solid fa-globe icon-top-left"></i> <!-- Public -->
                        </c:when>
                        <c:when test="${gallery.post.postVisible == '1'}">
                            <i class="fa-solid fa-user-friends icon-top-left"></i> <!-- Friends Only -->
                        </c:when>
                        <c:otherwise>
                            <i class="fa-solid fa-lock icon-top-left"></i> <!-- Private -->
                        </c:otherwise>
                    	</c:choose>
                    	</div> 
                </div>
            </div>
        </div>
        </a>
       </c:forEach>      
    </div>
</div>
</main>
<script>
//개개 체크박스에 포스트 아이디 담음
document.addEventListener('DOMContentLoaded', function() {
    const galleryItems = document.querySelectorAll('.gallery-item');
    galleryItems.forEach(function(item) {
        item.addEventListener('click', function() {
            const postId = this.getAttribute('data-id');
            window.location.href = `detail.do?postId=${postId}`;
        });
    });
});
</script>
<script>
$(document).ready(function() {
    function submitForm(actionType, message) {
        // 커스텀 메시지를 컨펌으로 담음
        var confirmAction = confirm(message);
        if (!confirmAction) {
            return; // 만일 취소를 클릭 시 이벤트 취소
        }

        var postIds = $('.checkbox:checked').map(function() {
            return $(this).val();
        }).get();

        console.log("Action:", actionType);
        console.log("Selected Post IDs:", postIds.join(", "));

        var formData = new FormData();
        formData.append('action', actionType);
        $.each(postIds, function(index, value) {
            formData.append('checks', value);
        });

        // ajax로 데이터 전송
        $.ajax({
            url: 'batchAction.do',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(data) {
                console.log(data);
                window.location.reload(true);
            },
            error: function(xhr, status, error) {
                console.error('요청하신 명령 수행에 오류가 생겼습니다. :', error);
            }
        });
    }

    // 버튼 마다 커스텀 메시지 전송
    $('.delete-button').on('click', function() { submitForm('delete', '선택하신 항목들을 삭제하시겠습니까?'); });
    $('.public-button').on('click', function() { submitForm('public', '선택하신 항목들을 전체공개로 변경하시겠습니까?'); });
    $('.friend-button').on('click', function() { submitForm('friend', '선택하신 항목들을 팔로워 한정공개로 변경하시겠습니까?'); });
    $('.private-button').on('click', function() { submitForm('private', '선택하신 항목들을 비공개로 변경하시겠습니까?'); });
    $('.pinon-button').on('click', function() { submitForm('pinon', '선택하신 항목들을 핀하시겠습니까?'); });
    $('.pinoff-button').on('click', function() { submitForm('pinoff', '선택하신 항목들에서 핀을 제거하시겠습니까?'); });
});

</script>
<script>
$(document).ready(function() {
    $('#dropdown').change(function() {
        var value = $(this).val(); //값을 가져옴
        $.ajax({
            url: 'sorting1.do',
            type: 'POST',
            data: { dropdown: value },
            success: function(data) {
                console.log(data);
                window.location.reload(true); 
            },
            error: function(xhr, status, error) {
                console.error('요청하신 명령 수행에 오류가 생겼습니다. : ', error);
            }
        });
    });
    var sortPreference = ${sortPreference};
    $('#dropdown').val(sortPreference);
});
</script>

</body>
</html>