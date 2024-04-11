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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Viewer</title>

<!--스크롤바 디자인 -->

<style>
li{
     list-style-type: none;
}

/*여기 확인 */
.mySlides {
  display: none;
}

.prev {
  cursor: pointer;
  position: absolute;
  top: 50%;
  left: 0; /* Align to the left side */
  transform: translateY(-50%); /* Adjust vertical alignment */
  width: auto;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  right: 0; /* Align to the right side */
  transform: translateY(-50%); /* Adjust vertical alignment */
  width: auto;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 3px 0 0 3px; /* Adjusted for right side */
  user-select: none;
}

.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}


.right{
     width: 35vw;
     max-height: 800px;
}
.scroll{
     height: 776px;
     overflow: auto;
}
.owner{
     display:flex;
     border-bottom: 1px black solid;
}
.pic{
     width: 60px; /* Adjust width as needed */
     height: 60px; /* Adjust height as needed */
     border-radius: 50%;
     border: 0px solid black;
     overflow: hidden;
}
.pic img {
     width: 100%;
     height: 100%;
     object-fit: cover; /* Ensures image fills container */
     cursor: pointer;
}

.pic video {
     width: 100%;
     height: 100%;
     object-fit: cover; /* Ensures image fills container */
}

a {
     text-decoration: none;
     color: black;
}
.scroll{
     max-height: 780px;
     overflow: auto;
}
.owner{
     padding-bottom: 5px;
}
.owner .pic{
     margin-left: 5px;
}
.owner-info{
     padding-left: 5px;
}
.owner-deatil, .owner-address{
     font-size: 12px;
}

.dummy,
.box{
     display: flex;
     margin-top: 5px;
     margin-bottom: 3px;
}

.box div i{
 font-size: 30px;
 padding-left: 7px;
}

.content{
     border-bottom: grey 1px solid;
}
.time{
     font-size: 13px;
     color: grey;
}
.commentbox{
     height: 100%;
     border-top: gray 1px solid;

}
.comment{
     display: flex;
     padding-top: 5px;
     padding-bottom: 5px;
}
.commenttime{
     font-size: 12px;
}
.commmentreport{
     padding: 5px;
}

.pic-2{
     width: 30px; /* Adjust width as needed */
     height: 30px; /* Adjust height as needed */
     border-radius: 50%;
     border: 0px solid black;
     overflow: hidden;
     margin-left: 5px;
}
.pic-2 img {
     width: 100%;
     height: 100%;
     object-fit: cover; /* Ensures image fills container */
}

.right-2{
     flex-grow: 1;
     flex-shrink: 1;
     padding-left: 5px;
}

.commentagain{
     font-size: 12px;
}
.reply{
     margin-left: 10px;
     margin-right: 10px;
     font-size: 20px;
}
.left div img{
     width: 100%
}
.text, .submit {
    margin-bottom: 10px; /* Add some space between the input and the button */
    border: none; /* A light border for some depth */
    box-sizing: border-box; /* Include padding and border in the element's total width */
}
.text {
     height: px;
     background-color: white; /* A light background for the text input */
     width: 88%
}
.submit {
    border-radius: 5px; /* Rounded corners */
    background-color: plum; /* A green background for the submit button */
    color: white; /* White text color */
    font-weight: bold; /* Make the button text bold */
    cursor: pointer; /* Change cursor to pointer to indicate it's clickable */
    transition: background-color 0.3s, border-color 0.3s; /* Smooth transition for hover effects */
}

.submit:hover {
    background-color: pink; /* Darken the button on hover for feedback */
}

.hidden{
     display: none;
}

button {
    appearance: none; /* Removes platform-native styling */
    -webkit-appearance: none; /* Safari */
    -moz-appearance: none; /* Firefox */
    background: none; /* No background */
    color: inherit; /* Inherits the text color from its parent */
    border: none; /* No border */
    padding: 0; /* No padding */
    margin: 0; /* No margin */
    font: inherit; /* Inherits the font style from its parent */
    cursor: pointer; /* Maintains the cursor indicating it's clickable */
    outline: inherit; /* Inherits the outline style (useful for accessibility) */
}

::-webkit-scrollbar-track {
    background-color: #f1f1f1; /* Light grey background */
    border-radius: 10px; /* Rounded corners for the track */
}

/* The scrollbar handle */
::-webkit-scrollbar-thumb {
    background-color: #888; /* Dark grey handle */
    border-radius: 10px; /* Rounded corners for the handle */
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background-color: #555; /* Lighten the handle color on hover */
}

/* The scrollbar itself (including the track and handle) */
::-webkit-scrollbar {
    width: 8px; /* Width of the vertical scrollbar */
    height: 8px; /* Height of the horizontal scrollbar */
    
}
</style>
<style>
   .prev:hover, .next:hover {
		background-color: rgba(0,0,0,0.8);
	}
	.fade {
	animation-name: fade;
	animation-duration: 1.5s;
	}
	@keyframes fade {
		from {opacity: .4}
		 to {opacity: 1}
	}
</style>
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
        <div id="bottom_right_contents">







<div class="container-detail" style="display: flex; padding-top: 5vw; padding-left: 10vw;">
     <div class="left" style="max-width: 800px; height: 800px; width: 35vw; border: 1px grey solid; position: relative; background-color: black; display: flex; align-items: center; justify-content: center;">
            <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${post.userId}"><i class="fa-solid fa-arrow-left" style="position: absolute;top: 0;left: 0;padding: 10px;color: white;font-size: 24px;cursor: pointer;"></i></a>
            <!-- this part will be repeated  -->
			<c:if test="${!empty images}">
			    <c:forEach var="image" items="${images}">
			        <c:if test="${!empty image.imageURL}">
			        <div class="mySlides fade" style="display: none;">
			            <img src="${image.imageURL}" style="width: 100%">
			         </div>
			        </c:if>
			    </c:forEach>
			</c:if>
          <c:if test="${empty images}">
          		<div class="mySlides fade" style="display: none;">
			            <img src="resources/postimage/noimage.jpg" style="width: 100%">
			    </div>
          </c:if>
          
          <!-- Next and previous buttons -->
          <a class="prev" onclick="plusSlides(-1)"style="cursor: pointer; position: absolute; top: 50%; left: 0; transform: translateY(-50%); width: auto; padding: 16px; color: white; font-weight: bold; font-size: 18px; transition: 0.6s ease; border-radius: 0 3px 3px 0; user-select: none;">&#10094;</a>
          <a class="next" onclick="plusSlides(1)" style="cursor: pointer; position: absolute; top: 50%; right: 0; transform: translateY(-50%); width: auto; padding: 16px; color: white; font-weight: bold; font-size: 18px; transition: 0.6s ease; border-radius: 3px 0 0 3px; user-select: none;">&#10095;</a>  	
     </div>
<script>

window.plusSlides = function(n) {
    showSlides(slideIndex += n);
}


window.currentSlide = function(n) {
    showSlides(slideIndex = n);
}


function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("mySlides");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    slides[slideIndex-1].style.display = "block";
}


let slideIndex = 1;
showSlides(slideIndex);


document.addEventListener('DOMContentLoaded', function() {
//리액션 박스 아이디로 찾음
    const reactionButton = document.getElementById('reaction');
    if (reactionButton) {
        reactionButton.addEventListener('click', function(event) {
            event.stopPropagation();
            const reactionBox = document.getElementById('reaction-box');
            if (reactionBox) {
                reactionBox.style.display = reactionBox.style.display === 'flex' ? 'none' : 'flex';
            }
        });
    }

    // 리액션 박스 밖을 누르면 닫아짐
    window.addEventListener('click', function(event) {
        var reactionBox = document.getElementById('reaction-box');
        if (!event.target.closest('.reaction') && reactionBox) {
            reactionBox.style.display = 'none';
        }
    });
});
</script>
     <div class="right" style="width: 35vw; max-height: 800px;background-color:white;border-top: 1px black solid;border-right: 1px black solid;border-bottom: 1px black solid;">
          <div class="scroll" style="height: 776px; overflow: auto;">
               <div class="owner" style="display: flex; margin-top:3 px;border-bottom: 1px black solid; padding-bottom: 5px;"> 
                    <div class="pic" style="margin-left: 5px;">
                         <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${post.userId}"><img src="https://www.w3schools.com/html/img_girl.jpg" style="width: 100%; height: 100%; object-fit: cover; cursor: pointer;"></a>
                    </div>
                    <div class="owner-info" style="padding-left: 5px;">
                         <div class="dummy" style="display: flex; margin-top: 5px; margin-bottom: 3px;">
                              <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${post.userId}"><b style="cursor:pointer;">${post.userId}</b></a> &nbsp;
                              
                             <%--  <c:if test="${ post.userId ne viewingUser.userId }">
                         	<c:if test="${ isFollowing eq 0 }">
                              <a href="${pageContext.servletContext.contextPath}/insertFdetail.do?userId=${viewingUser.userId}&friendId=${post.userId}&postId=${post.postId}" style="text-decoration: none; color: black;">팔로우</a> &nbsp;
                              </c:if>
                              <c:if test="${ isFollowing eq 1 }">
                              <a href="${pageContext.servletContext.contextPath}/unfollowingDetail.do?userId=${ viewingUser.userId }&friendId=${post.userId}&postId=${post.postId}"  style="text-decoration: none; color: black;">언팔로우</a> &nbsp;
                              </c:if> --%>
                              
                              <c:if test="${ post.userId ne viewingUser.userId }">
                                    <button class="reportPost" data-post-id="${ post.postId }">신고</button>
                                </c:if>   
                             <%-- </c:if> --%>
                             <c:if test="${ post.userId eq viewingUser.userId }">
                                   <ul class="settings-menu" style="display:flex;">
                                   		<c:if test="${ isPinned eq 0 }">
                                   		<!-- 핀이 안되어있을 경우  -->
                                        <li><a href="javascript:void(0);" onclick="confirmAction('${pageContext.servletContext.contextPath}/updatepin.do?value=0&postId=${post.postId}&userId=${post.userId}', 'pin')">핀하기</a></li>&nbsp;
                                        </c:if>
                                        <c:if test="${ isPinned eq 1 }">
                                        <li><a href="javascript:void(0);" onclick="confirmAction('${pageContext.servletContext.contextPath}/updatepin.do?value=1&postId=${post.postId}&userId=${post.userId}', 'unpin')">핀제거</a></li>&nbsp;
                                        </c:if>
                                        <li><a href="javascript:void(0);" onclick="confirmAction2('${pageContext.servletContext.contextPath}/deletepost.do?postId=${post.postId}&userId=${post.userId}')">삭제하기</a></li>
                                   </ul>
                              </c:if>
                         </div>
                  <script>
					function confirmAction(url, actionType) {
					    var message = (actionType === 'pin') ? "이 게시물을 핀하시겠습니까?" : "이 게시물의 핀을 제거하시겠습니까?";
					    if (confirm(message)) {
					        window.location.href = url;
					    }
					}
					function confirmAction2(url) {
					    if (confirm("정말로 삭제하시겠습니까?")) {
					        window.location.href = url;
					    }
					}
					</script>
                         <c:if test="${ not empty image.imageLon }">
                         <a href="" class="owner-address"  style="text-decoration: none; color: black;font-size: 12px;">주소</a>
                         </c:if>
                         <!-- 주소가 있으면 안나타남 -->
                         <a href="" class="owner-id"  style="text-decoration: none; color: black; font-size: 12px;"><b><%-- ${postUser.userId} --%></b></a>
                    </div>
                    &nbsp;
               </div>

               <div class="content" style="border-bottom: grey 1px solid;">      
                    <div class="box"style="display: flex;margin-top: 5px;margin-bottom: 3px;">
                         <div class="reaction" id="reaction" style=" position: relative;cursor: pointer;">
                              <!-- 반응을 남긴적 없을 경우-->
                              <c:if test="${ isLiked eq 0 || empty isLiked }">
                              <i class="fa-regular fa-face-smile"style="font-size: 30px;padding-left: 7px;"></i>
                              </c:if>
                              <!-- 반응을 남긴 적 있을 경우-->
                              <c:if test="${ isLiked eq 1}">
                              <i class="fa-solid fa-face-smile"style="font-size: 30px;padding-left: 7px;"></i>
                              </c:if>
                              <form action="updatereaction.do" method="post" id="reactionForm">
	                              <input type="hidden" name="userId" value="${ viewingUser.userId }">
	                              <input type="hidden" name="postId" value="${ post.postId }">
	                              <input type="hidden" name="likeType" id="likeType">
	                              <div class="reaction-box" id="reaction-box" style="display: none;position: absolute;top: 150%;left: 25%;transform: translateX(-50%);background-color: #fff;border-radius: 5px;box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);padding: 10px;z-index: 5;flex-direction: row;align-items: center; justify-content: center;width: auto;flex-wrap: wrap;">
	                                  
	                                 <c:if test="${ not empty whatIsLiked }">
	                                   <c:if test="${ whatIsLiked ne '0' }">
	                                   <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-regular fa-thumbs-up" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked eq '0' }">
	                                   <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-solid fa-thumbs-up" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked ne '1' }">
	                                   <button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-regular fa-heart" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked eq '1' }">
	                                   <button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-solid fa-heart" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked ne '2' }">
	                                   <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-regular fa-face-sad-tear" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked eq '2' }">
	                                  <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-solid fa-face-sad-tear" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked ne '3' }">
	                                    <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-regular fa-face-angry" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked eq '3' }">
	                                  <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-solid fa-face-angry" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ whatIsLiked ne '4' }">
	                                   <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-regular fa-face-laugh-squint" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
	                             	   </c:if>
		                               <c:if test="${ whatIsLiked eq '4' }">
		                                <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;">
						                    <i class="fa-solid fa-face-laugh-squint" style="font-size: 30px; padding-left: 7px;"></i>
						                </button>
		                               </c:if>
	                             	</c:if>
	                             	<c:if test="${ empty whatIsLiked }">
	                             		 <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;">
							                <i class="fa-regular fa-thumbs-up" style="font-size: 30px; padding-left: 7px;"></i>
							            </button>
	                             		<button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;">
							                <i class="fa-regular fa-heart" style="font-size: 30px; padding-left: 7px;"></i>
							            </button>
							            <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;">
							                <i class="fa-regular fa-face-sad-tear" style="font-size: 30px; padding-left: 7px;"></i>
							            </button>
							            <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;">
							                <i class="fa-regular fa-face-angry" style="font-size: 30px; padding-left: 7px;"></i>
							            </button>
							            <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;">
							                <i class="fa-regular fa-face-laugh-squint" style="font-size: 30px; padding-left: 7px;"></i>
							            </button>
	                             	</c:if>
	                              </div>
	                          </form>
                         </div> 
                         
                         
                         
						 <script>
						 document.addEventListener('DOMContentLoaded', function() {
							    var reaction = document.getElementById('reaction');
							    var reactionBox = document.getElementById('reaction-box');
							    reaction.onclick = function() {
							        reactionBox.style.display = (reactionBox.style.display === 'flex') ? 'none' : 'flex';
							    };
							});
						
						    window.addEventListener('click', function(event) {
						        if (!event.target.closest('#reaction')) {
						            reactionBox.style.display = 'none';
						        }
						    });
						
						    document.querySelectorAll('.reaction-icon').forEach(function(icon) {
						        icon.addEventListener('click', function() {
						            document.getElementById('likeType').value = this.getAttribute('value');
						            document.getElementById('reactionForm').submit(); 
						        });
						    });
						});
						
						document.addEventListener('DOMContentLoaded', function() {
						    
						    const icons = document.querySelectorAll('.reaction-icon');
						    icons.forEach(icon => {
						        icon.addEventListener('click', function() {
						            const likeType = this.getAttribute('data-value');
						            document.getElementById('likeType').value = likeType;
						            document.getElementById('reactionForm').submit();
						        });
						    });
						});
						</script>



                         <div class="share">
                              <i class="fa-solid fa-share-nodes" style="cursor:pointer;"></i>
                         </div>
                        <script>
					        document.addEventListener("DOMContentLoaded", function() {
					            var shareIcon = document.querySelector('.fa-share-nodes');
					            shareIcon.addEventListener('click', function() {
					               
					                navigator.clipboard.writeText(window.location.href).then(function() {
					                    console.log('Current URL is copied to clipboard');
					                    alert('링크가 복사되었습니다.');
					                }, function(err) {
					                    console.error('Could not copy text: ', err);
					                });
					            });
					        });
					    </script>
                         <div class="bookmark">
                              <c:if test="${ isBookmarked eq 0 || empty isBookmarked }">
                              <a href="${pageContext.servletContext.contextPath}/insertBookmark.do?postId=${post.postId}&userId=${viewingUser.userId}"><i class="fa-regular fa-bookmark"></i></a>
                              </c:if>
                
                              <c:if test="${ isBookmarked eq 1 }">
                              <a href="${pageContext.servletContext.contextPath}/deleteBookmark.do?postId=${post.postId}&userId=${viewingUser.userId}"><i class="fa-solid fa-bookmark"></i></a>
                              </c:if>
                         </div>
                    </div>

                    <a href="#" class="reactioncount"  style="text-decoration: none; color: black;">공감 ${ likeCount }개</a><br>
                    조회수 ${ post.postView }<br>
                    <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${post.userId}"  style="text-decoration: none; color: black;"><b>${post.userId}</b></a> &nbsp; 
                    	${ post.postContent }
               </div>
               <div class="tags">
				<c:if test="${!empty tags}">
				    <c:forEach var="tag" items="${tags}">
				        <span>${tag.tagName}</span>
				    </c:forEach>
				</c:if>
               </div>
               <div class="time" style="font-size: 13px; color: grey;">
                    <fmt:formatDate value="${post.postTime}" pattern="yyyy-MM-dd HH:mm" />
               </div>
              
         <div class="commentbox" style="height: 100%; border-top: gray 1px solid;">
                    <!-- 반복 -->
                  
			<c:if test="${!empty comments}">
			    <c:forEach var="comment" items="${comments}">
			    <div class="comment"style=" display: flex;padding-top: 5px;padding-bottom: 5px;">
						<c:if test="${ comment.commentLevel eq '1' }">
						<div class="reply" style="margin-left: 10px;margin-right: 10px;font-size: 20px;">
                              <i class="fa-solid fa-angle-right"></i>
                         </div>
                         </c:if>
 						<div class="left-2">
                              <div class="pic-2" style="width: 30px; height: 30px;border-radius: 50%;border: 0px solid black;overflow: hidden;margin-left: 5px;">
                                   <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${ comment.userId }"><img src="https://www.w3schools.com/html/img_girl.jpg" style="cursor: pointer;width: 100%;height: 100%;object-fit: cover;"></a>
                              </div>
                         </div>
                         <div class="right-2"style="flex-grow: 1;flex-shrink: 1;padding-left: 5px;">
                              <a href="${pageContext.servletContext.contextPath}/back2.do?userId=${ comment.userId }"  style="text-decoration: none; color: black;"><b>${ comment.userId }</b></a>&nbsp;
                              ${ comment.commentContent }
                              <div class="commenttime" style="font-size: 12px;">
                              <fmt:formatDate value="${ comment.commentTime }" pattern="yyyy-MM-dd HH:mm" />
                                  		<c:if test="${ comment.commentLevel ne '1' }">
                                        <form action="addComment2.do" method="POST" class="add-comment2">
                                             <input type="hidden" name="userId" value="${ viewingUser.userId }">
                                             <input type="hidden" name="postId" value="${ post.postId }">
                                             <input type="hidden" name="parentCommentId" value="${ comment.commentId }">
                                             <input type="text" class="text" name="commentContent" placeholder="댓글을 추가해주세요" style="margin-bottom: 10px;border: none;box-sizing: border-box;background-color: white;width: 88%">
                                             <input type="submit" class="submit" value="등록" style="margin-bottom: 10px;border: none;box-sizing: border-box;border-radius: 5px;background-color: plum; color: white;font-weight: bold; cursor: pointer;transition: background-color 0.3s, border-color 0.3s">
                                        </form>
                                        </c:if>
                              </div>
                         </div>
                         <div class="commentreport" style="padding: 5px;">
                              <c:if test="${ comment.userId ne viewingUser.userId }">
                                   <button class="reportComment" data-comment-id="${comment.commentId}">신고</button>
                              </c:if>
                           <c:if test="${ comment.userId eq viewingUser.userId }">
                              <a href="${pageContext.servletContext.contextPath}/deleteComment.do?userId=${viewingUser.userId}&postId=${ comment.postId }&commentId=${ comment.commentId }" style="text-decoration: none; color: black;">삭제</a> 
                          	</c:if>
                         </div>
                         </div>
						</c:forEach>
					</c:if>
               </div>
          </div>
          <div>
               <form action="addComment1.do" method="POST" class="add-comment">
                    <input type="hidden" name="userId" value="${ viewingUser.userId }">
                    <input type="hidden" name="postId" value="${ post.postId }">
                    <input type="text" class="text" name="commentContent" placeholder="댓글을 추가해주세요" style="margin-bottom: 10px; border: none; box-sizing: border-box; background-color: white; width: 88%;">
                    <input type="submit" class="submit" value="등록" style="margin-bottom: 10px;border: none;box-sizing: border-box;border-radius: 5px;background-color: plum; color: white;font-weight: bold; cursor: pointer;transition: background-color 0.3s, border-color 0.3s">
                </form>
          </div>
     </div>
</div>
</div>
</main>

<!-- 댓글 신고 -->
<script>
$(document).ready(function() {
    $('.reportComment').click(function() {
        // Retrieve the commentId stored in the data-comment-id attribute
        var commentId = $(this).data('comment-id');
        var userId = "${viewingUser.userId}";
        var postId = $(this).data('post-id');
        var message = prompt("신고 사유를 적어주세요: ");

        if (message) {
            $.ajax({
                url: 'inComReport.do',
                type: 'POST',
                data: {
                    commentId: commentId,
                    userId: userId,
                    message: message,
                    postId: postId
                },
                success: function(response) {
                    alert("신고가 정상적으로 접수되었습니다.");
                },
                error: function(xhr, status, error) {
                    alert("신고처리에 문제가 발생하였습니다.");
                }
            });
        }
    });
});
</script>
<!-- 게시물 신고 -->
<script>
$(document).ready(function() {
    $('.reportPost').click(function() {
       
        var postId = $(this).data('post-id');
        var userId = "${viewingUser.userId}";
        var message = prompt("신고 사유를 적어주세요: ");

        if (message) {
            $.ajax({
                url: 'inPostReport.do',
                type: 'POST',
                data: {
                    postId: postId,
                    userId: userId,
                    message: message
                },
                success: function(response) {
                    alert("신고가 정상적으로 접수되었습니다.");
                },
                error: function(xhr, status, error) {
                    alert("신고처리에 문제가 발생하였습니다.");
                }
            });
        }
    });
});
</script>
</body>
</html>