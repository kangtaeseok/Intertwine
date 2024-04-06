<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="frame">
		<c:forEach items="${feedItems}" var="item">
			<div class="card">
				<!-- 카드 상부 구성 -->
				<div class="top">
					<div class="userDetails">
						<div class="profile_img">
							<div class="image">
								<img src="${ defaultImage }">
							</div>
						</div>
						<h3>
							<!-- 여기를 누르면 친구 상태페이지 연결-->
							<a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }">${ item.user.userId }</a> &nbsp;
							<!-- 친구여부 여기서 확인 c:if 넘겨야 할 정보 내아이디 정보 상대 아이디 정보-->
							<!-- 친구가 아닐 시-->
							<c:if test="${ isFollowing eq 0 }">
							<a class="friend" href="#" style="text-decoration:none;color:black;">팔로우</a>
							</c:if>
							<c:if test="${ isFollowing eq 1 }">
                            <a class="unfriend" href="#" style="text-decoration:none;color:black;">언팔로우</a>
							</c:if>
							<br>
							<c:if test="${ not empty item.image.imageLon }">
							<span><a href="#" style="text-decoration:none;color:black;">여기는 위치</a></span>
							</c:if>
						</h3>
					</div>
				</div>
				<!-- 누르면 포스트 상세보기 페이지 연결 -->
				<div class="imgBox" onclick="">
					<img src="${ item.image.imageURL }">
				</div>
				<div class="bottom">
					<div class="actionBtns">
						<div class="left">
							<span class="reaction" onclick="" ; returnfalse;> <!--여기 if태그로 아이콘 설정이 되면 아이콘 바뀜 -->
									<c:if test="${ item.isLiked == 1 }">
                                    <svg aria-label="Liked" color="#262626" fill="#262626" height="24" role="img" width="24" viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM164.1 325.5C182 346.2 212.6 368 256 368s74-21.8 91.9-42.5c5.8-6.7 15.9-7.4 22.6-1.6s7.4 15.9 1.6 22.6C349.8 372.1 311.1 400 256 400s-93.8-27.9-116.1-53.5c-5.8-6.7-5.1-16.8 1.6-22.6s16.8-5.1 22.6 1.6zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
                                      </c:if>
                                      <c:if test="${ item.isLiked == 0 }">
                                      <svg aria-label="Like"
									color="#262626" fill="#262626" height="24" role="img"
									width="24" viewBox="0 0 512 512">
									<path
										d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm177.6 62.1C192.8 334.5 218.8 352 256 352s63.2-17.5 78.4-33.9c9-9.7 24.2-10.4 33.9-1.4s10.4 24.2 1.4 33.9c-22 23.8-60 49.4-113.6 49.4s-91.7-25.5-113.6-49.4c-9-9.7-8.4-24.9 1.4-33.9s24.9-8.4 33.9 1.4zM144.4 208a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm192-32a32 32 0 1 1 0 64 32 32 0 1 1 0-64z" /></svg>
									</c:if>
								<div class="reaction-box">
									<div class="reaction-icon" name="like" id="like">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path
												d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.2s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z" /></svg>
									</div>
									<div class="reaction-icon" name="love" id="love">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path
												d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z" /></svg>
									</div>
									<div class="reaction-icon" name="haha" id="haha">
										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path
												d="M464 256A208 208 0 1 0 48 256a208 208 0 1 0 416 0zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zm130.7 57.9c-4.2-13.6 7.1-25.9 21.3-25.9H364.5c14.2 0 25.5 12.4 21.3 25.9C369 368.4 318.2 408 258.2 408s-110.8-39.6-127.5-94.1zm2.8-183.3l89.9 47.9c10.7 5.7 10.7 21.1 0 26.8l-89.9 47.9c-7.9 4.2-17.5-1.5-17.5-10.5c0-2.8 1-5.5 2.8-7.6l36-43.2-36-43.2c-1.8-2.1-2.8-4.8-2.8-7.6c0-9 9.6-14.7 17.5-10.5zM396 141.1c0 2.8-1 5.5-2.8 7.6l-36 43.2 36 43.2c1.8 2.1 2.8 4.8 2.8 7.6c0 9-9.6 14.7-17.5 10.5l-89.9-47.9c-10.7-5.7-10.7-21.1 0-26.8l89.9-47.9c7.9-4.2 17.5 1.5 17.5 10.5z" /></svg>
									</div>
									<div class="reaction-icon" name="sad" id="sad">

										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path
												d="M175.9 448c-35-.1-65.5-22.6-76-54.6C67.6 356.8 48 308.7 48 256C48 141.1 141.1 48 256 48s208 93.1 208 208s-93.1 208-208 208c-28.4 0-55.5-5.7-80.1-16zM0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM128 369c0 26 21.5 47 48 47s48-21 48-47c0-20-28.4-60.4-41.6-77.7c-3.2-4.4-9.6-4.4-12.8 0C156.6 308.6 128 349 128 369zm128-65c-13.3 0-24 10.7-24 24s10.7 24 24 24c30.7 0 58.7 11.5 80 30.6c9.9 8.8 25 8 33.9-1.9s8-25-1.9-33.9C338.3 320.2 299 304 256 304zm47.6-96a32 32 0 1 0 64 0 32 32 0 1 0 -64 0zm-128 32a32 32 0 1 0 0-64 32 32 0 1 0 0 64z" /></svg>
									</div>
									<div class="reaction-icon" name="angry" id="angry">

										<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path
												d="M256 48a208 208 0 1 1 0 416 208 208 0 1 1 0-416zm0 464A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm72.4-118.5c9.7-9 10.2-24.2 1.2-33.9C315.3 344.3 290.6 328 256 328s-59.3 16.3-73.5 31.6c-9 9.7-8.5 24.9 1.2 33.9s24.9 8.5 33.9-1.2c7.4-7.9 20-16.4 38.5-16.4s31.1 8.5 38.5 16.4c9 9.7 24.2 10.2 33.9 1.2zM176.4 272c17.7 0 32-14.3 32-32c0-1.5-.1-3-.3-4.4l10.9 3.6c8.4 2.8 17.4-1.7 20.2-10.1s-1.7-17.4-10.1-20.2l-96-32c-8.4-2.8-17.4 1.7-20.2 10.1s1.7 17.4 10.1 20.2l30.7 10.2c-5.8 5.8-9.3 13.8-9.3 22.6c0 17.7 14.3 32 32 32zm192-32c0-8.9-3.6-17-9.5-22.8l30.2-10.1c8.4-2.8 12.9-11.9 10.1-20.2s-11.9-12.9-20.2-10.1l-96 32c-8.4 2.8-12.9 11.9-10.1 20.2s11.9 12.9 20.2 10.1l11.7-3.9c-.2 1.5-.3 3.1-.3 4.7c0 17.7 14.3 32 32 32s32-14.3 32-32z" /></svg>
									</div>
								</div>
							</span> 
							
							
							<span class="comment" onclick="pagedetail()" ; returnfalse;>
								<svg class="_8-yf5" color="#262626" fill=transparent;
									height="24" role="img" viewBox="0 0 512 512" width="24">
									<path
										d="M123.6 391.3c12.9-9.4 29.6-11.8 44.6-6.4c26.5 9.6 56.2 15.1 87.8 15.1c124.7 0 208-80.5 208-160s-83.3-160-208-160S48 160.5 48 240c0 32 12.4 62.8 35.7 89.2c8.6 9.7 12.8 22.5 11.8 35.5c-1.4 18.1-5.7 34.7-11.3 49.4c17-7.9 31.1-16.7 39.4-22.7zM21.2 431.9c1.8-2.7 3.5-5.4 5.1-8.1c10-16.6 19.5-38.4 21.4-62.9C17.7 326.8 0 285.1 0 240C0 125.1 114.6 32 256 32s256 93.1 256 208s-114.6 208-256 208c-37.1 0-72.3-6.4-104.1-17.9c-11.9 8.7-31.3 20.6-54.3 30.6c-15.1 6.6-32.3 12.6-50.1 16.1c-.8 .2-1.6 .3-2.4 .5c-4.4 .8-8.7 1.5-13.2 1.9c-.2 0-.5 .1-.7 .1c-5.1 .5-10.2 .8-15.3 .8c-6.5 0-12.3-3.9-14.8-9.9c-2.5-6-1.1-12.8 3.4-17.4c4.1-4.2 7.8-8.7 11.3-13.5c1.7-2.3 3.3-4.6 4.8-6.9c.1-.2 .2-.3 .3-.5z" /></svg>
							</span> 
							
							
							<span class="share" onclick="share(); return false;"> <svg
									class="_8-yf5" color="#262626" fill=transparent; height="24"
									role="img" width="24" viewBox="0 0 448 512">
									<path
										d="M352 224c53 0 96-43 96-96s-43-96-96-96s-96 43-96 96c0 4 .2 8 .7 11.9l-94.1 47C145.4 170.2 121.9 160 96 160c-53 0-96 43-96 96s43 96 96 96c25.9 0 49.4-10.2 66.6-26.9l94.1 47c-.5 3.9-.7 7.8-.7 11.9c0 53 43 96 96 96s96-43 96-96s-43-96-96-96c-25.9 0-49.4 10.2-66.6 26.9l-94.1-47c.5-3.9 .7-7.8 .7-11.9s-.2-8-.7-11.9l94.1-47C302.6 213.8 326.1 224 352 224z" /></svg>
							</span>
							
							
						</div>
						<div class="right">
						
							
							<span class="share" onclick="bookmark(); return false;"> <!-- if 문으로 북마크 저장여부 확인 메소드 만들기-->
								<c:if test="${item.isBookmarked == 0}">
								<svg aria-label="Save" class="_8-yf5 " color="#262626"
									fill="#262626" height="24" role="img" width="24"
									viewBox="0 0 384 512">
									<path
										d="M0 48C0 21.5 21.5 0 48 0l0 48V441.4l130.1-92.9c8.3-6 19.6-6 27.9 0L336 441.4V48H48V0H336c26.5 0 48 21.5 48 48V488c0 9-5 17.2-13 21.3s-17.6 3.4-24.9-1.8L192 397.5 37.9 507.5c-7.3 5.2-16.9 5.9-24.9 1.8S0 497 0 488V48z" /></svg>
								</c:if>
								
									<c:if test="${item.isBookmarked == 1}">
                                        <svg  aria-label="Saved" class="_8-yf5" color="#262626" fill="#262626" height="24" role="img" width="24" viewBox="0 0 384 512"><path d="M0 48V487.7C0 501.1 10.9 512 24.3 512c5 0 9.9-1.5 14-4.4L192 400 345.7 507.6c4.1 2.9 9 4.4 14 4.4c13.4 0 24.3-10.9 24.3-24.3V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48z"/></svg>
                                   </c:if>
							</span>
						</div>
					</div>
				
					<p class="likes">공감 ${ item.isLiked }개</p>
					<!-- 누를 시 그 사람의 상세 페이지로 들어감 카드 상단 닉네임부분과 역할이 같음 -->
					<a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }"><b>${ item.user.userId }</b></a> &nbsp;
					<!-- 여기에 쓴 글이 들어감-->
					<!-- 누를 시 포스트 상세보기 페이지로 들어감-->
					<h5 class="comments">
						<a href="${pageContext.servletContext.contextPath}/detail.do?postId=${ item.post.postId }">전체 댓글 보기</a>
					</h5>
					<h5 class="postTime">${ item.post.postTime }</h5>
					<form action="addComment1.do" method="POST" class="addComments" >
						<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
						<input type="hidden" name="postId" value="${ item.post.postId }">
						<input type="text" class="text" name="commentContent" placeholder="댓글을 추가해주세요"> 
						<input type="submit" class="submit" value="등록">
					</form>
				</div>
			</div>
			<!-- card 끝-->

		</c:forEach>
	</div>
	<!-- Frame 끝-->
	
<style>
.container-feed {
    width: auto; /* Let it take the width of its content */
    max-width: 1000px; /* Maximum width of the feed container */
    justify-content: center;
    margin: 20px auto; /* Top and bottom margins with automatic horizontal centering */
    display: flex;
    flex-direction: column;
    align-items: center;  /* This centers the children of .container-feed */
}


.action .profile {
	position: relative;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

.action .profile img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.frame {
	width: 470px;
}

.frame .card {
	margin-bottom: 20px;
	position: relative;
	width: 100%;

	display: inline-block;
	border: 1px solid rgba(7, 7, 7, 0.24);
}

.frame .card .top {
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.frame .card .bottom {
	padding: 10px 20px;
}

.frame .card .top .userDetails {
	width: 100%;
	display: flex;
	align-items: center;
}

.profile_img .image {
	
	align-items: center;
	position: relative;
	width: 30px;
	height: 30px;
	border-radius: 50%;
	overflow: hidden;
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid white;
	margin-right: 5px;
}

.profile_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.end-of-content{
	text-align: center;
}
.cover {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.frame .card .top .userDetails h3 {
	/* width: 100%; */
	font-size: 16px;
	color: #4d4d4f;
	font-weight: 500;
	line-height: 1em;
}

.frame .card .top .userDetails h3 span {
	font-size: 0.75em;
}

.imgBox {
	position: relative;
	width: 470px;
	height: 470px;
	background-color: black; /* Black background */
	display: flex;
	justify-content: center;
	align-items: center;
}

.imgBox img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
	/* This will ensure the image's aspect ratio is maintained */
}

.actionBtns {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.actionBtns svg {
	cursor: pointer;
}

.actionBtns .left svg {
	margin-right: 8px;
}

.actionBtns svg path {
	stroke-width: 1;
}

.likes {
	font-weight: 500;
	margin-top: 5px;
	font-size: 14px;
	color: #4d4d4f;
}

.message {
	font-weight: 400;
	margin-top: 5px;
	font-size: 14px;
	color: #777;
	line-height: 1.5em;
}

.message span {
	cursor: pointer;
	color: #1d92ff;
}

.comments {
	margin-top: 10px;
	font-weight: 400;
	color: #999;
}

.addComments {
	display: flex;
	align-items: center;
	margin-top: 20px;
	border-top: 1px solid #ddd;
	padding: 10px 0;
}

.addComments a {
	color: #1d92ffcb;
	font-weight: 500;
}

 .reaction {
  position: relative;
  font-size: 1.3rem;
  margin-right: 3px;
  color: rgb(88, 88, 88);
  cursor: pointer; 
  display: inline-block; 
}


 .reaction .reaction-box {
  position: absolute;
  width: 312px;
  height: auto; 
  background: white;
  border-radius: 28px;
  left: 0; 
  bottom: 100%; 
  margin-bottom: 10px; 
  display: none; 
}


 .reaction .reaction-box .reaction-icon {
  width: 40px;
  height: 30px;
  display: inline-block;
  background: white;
  margin: 8px;
  transition: transform 1.2s ease; 
}
.reaction .reaction-box .reaction-icon > svg {
  margin-left: 2px;
}

input.text {
	width: 100%;
	border: none;
	outline: none;
	font-weight: 400;
	font-size: 14px;
	color: #262626;
	background: none;
}

input.text::placeholder {
	color: #777;
}

.postTime {
	margin-top: 8px;
	font-weight: lighter;
	color: rgb(163, 163, 163);
	font-size: 12px;
	text-transform: uppercase;
}

.bottom a {
	text-decoration: none;
	color: black;
}

.submit {
    color: black; 
    font-weight: bold; 
	background-color: none;
    cursor: pointer;
	border: none;
}
/*스크롤바 디자인*/
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

/* 피드 CSS 종료 ***************************************************/
</style>
<script>
    const sidebarItems = document.querySelectorAll('.side-bar > ul > li');
    const content = document.querySelector("#bottom_right_contents");
    const submenu = document.querySelector(".sub_menu");
    sidebarItems.forEach(function (item) {
         item.addEventListener('click', function () {
            let isOn = content.classList.contains("on");
            console.log(isOn);

            if (isOn) {
                content.classList.remove("on");
            } else {
                 content.classList.add("on");
            }

            let isOn2 = submenu.classList.contains("on");
            console.log(isOn);

            if (isOn2) {
                submenu.classList.remove("on");
            } else {
                submenu.classList.add("on");
            }

        });
    });
</script>
    
<script>
document.addEventListener('DOMContentLoaded', function() {
const frame = document.querySelector('.frame');

	function hideAllReactionBoxes() {
	  document.querySelectorAll('.reaction-box').forEach(function(box) {
		box.style.display = 'none';
	  });
	}
  
	// Event delegation for the reaction click event
	frame.addEventListener('click', function(event) {
	  const reaction = event.target.closest('.reaction');
	  if (reaction) {
		// Prevent the click from propagating to the document
		event.stopPropagation();
  
		const box = reaction.querySelector('.reaction-box');
		const isDisplayed = box.style.display === 'block';
  
		// Hide all reaction boxes first
		hideAllReactionBoxes();
  
		// Then toggle this one
		box.style.display = isDisplayed ? 'none' : 'block';
	  } else if (!event.target.closest('.reaction-box')) {
		// Clicking outside the reaction boxes hides them
		hideAllReactionBoxes();
	  }
	});
});
</script>

</body>
</html>