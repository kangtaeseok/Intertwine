<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>   
    <title>
       ${ otheruser.userId } 마이 페이지
    </title>

</head>
<body>
<div class="container" style="margin: 0 auto; padding-left: 250px; width: 1000px;">
    <div class="top" style="margin-top: 30px; display: flex;">
        <div class="profile"  style="padding-left: 10px;">
            <div class="pic" style="width: 200px; height: 200px; border-radius: 50%; border: 0px solid black; overflow: hidden;">
                <a href="${pageContext.servletContext.contextPath}/page.do?friendId=${otheruser.userId}"><img src="resources/profile/images.jpg"style="width: 100%; height: 100%; object-fit: cover;"></a>
            </div>
        </div>
        <div class="profile-info" style="display: flex;">
            
            <div class="left" style="display: flex;">
                <div class="personal">
                    <ul>
                        <br>
                        <li style="list-style-type: none;"><h3>${ otheruser.userId } </h3></li>
                        <li style="list-style-type: none;"><%-- 여기 유저 바이오 --%></li>
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
                    </div>
                    <c:if test="${ isFollowing eq 0 }">
                    <a href=""style="text-decoration:none;color:black;">팔로우</a>
                    </c:if>
                    <c:if test="${ isFollowing ne 0 }">
                    <a href="" style="text-decoration:none;color:black;">팔로우 해제</a>
                    </c:if>
                </div>
                
            </div>
        </div>

    </div>
    <div class="middle" style="padding-top: 30px; display: flex;">
        <div class="search" style="display: flex; background-color: #FFF; border: 0px solid #FFF; border-radius: 5px; padding: 5px 10px;">
            <select class="search-condition" style="border: none; background: transparent; padding: 5px; margin-right: 5px; cursor: pointer;">
                <option value="all" selected>전체</option>
                <option value="tag">태그</option>
                <option value="content">콘텐츠</option>
            <input type="text" placeholder="검색할 키워드를 입력하세요" style="border: none; outline: none; background-color: #FFF; font-size: 13px;"> 
            <i class="fa fa-search" style="color: #000; font-size: 33px; margin-left: 5px; cursor: pointer; transition: transform 1s ease;"></i>
  
        </div>
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
        <div class="options" style="width: 320px; height:320px; margin-bottom: 30px;margin-right: 13px;position: relative"
        data-id="${ gallery.post.postId }">
            <div class="gallery" style="padding: 0px;height: 300px;padding: 0px;margin: 0px;justify-content: center;background-color: grey;">
                <div class="image-wrap" style="position: relative;width: 100%;height: 100%;">
				<c:if test="${not empty gallery.image.imageURL}">
				    <img src="${gallery.image.imageURL}" style="width: 100%;height: 100%;object-fit: contain;">
				</c:if>
<%-- 				<c:if test="${not empty gallery.video.videoURL and empty gallery.image.imageURL}">
				    <video muted autoplay>
				        <source src="${gallery.video.videoURL}" type="video/mp4"style="width: 100%;height: 100%;object-fit: contain;">
				    </video>
				</c:if> --%>
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
                    </div> 
                </div>
            </div>
        </div>
        </a>
       </c:forEach>      
    </div>
</div>

<!-- 정렬 -->
<script>
$(document).ready(function() {
	 var otherUserId = "${otheruser.userId}";
    $('#dropdown').change(function() {
        var value = $(this).val(); //값을 가져옴
        $.ajax({
            url: 'sorting1.do',
            type: 'POST',
            data: { dropdown: value},
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