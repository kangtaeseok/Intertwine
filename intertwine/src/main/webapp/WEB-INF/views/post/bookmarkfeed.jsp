<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">   
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<meta charset="UTF-8">
<title>피드</title>
<style>
.container-feed {
    width: auto; 
    max-width: 1000px; 
    justify-content: center;
    margin: 20px auto; 
    display: flex;
    flex-direction: column;
    align-items: center;
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
	background-color: black; 
	display: flex;
	justify-content: center;
	align-items: center;
}

.imgBox img {
	max-width: 100%;
	max-height: 100%;
	object-fit: contain;
	
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
    background-color: #f1f1f1; 
    border-radius: 10px;
}

/* The scrollbar handle */
::-webkit-scrollbar-thumb {
    background-color: #888;
    border-radius: 10px; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
    background-color: #555;
}


::-webkit-scrollbar {
    width: 8px; 
    height: 8px; 
    
}

/* 피드 CSS 종료 ***************************************************/
</style>
</head>
<body>


    <main>
    <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
      
        <div id="bottom_right_contents">
	<div class="frame">
		<c:forEach items="${feedItems}" var="item">
			<div class="card" style="background-color:white;">
				<!-- 카드 상부 구성 -->
				<div class="top">
					<div class="userDetails">
						<div class="profile_img">
						<a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }">
							<div class="image">
								<c:if test="${ empty item.myPage.profileDraft }">
								<img src="resources/profile/images.jpg">
								</c:if>
								<c:if test="${ not empty item.myPage.profileDraft }">
									<img src="${ item.myPage.profileDraft }">
								</c:if>
							</div>
						</a>
						</div>
						<h3>
							<!-- 여기를 누르면 친구 상태페이지 연결-->
							<c:if test="${ item.user.userId ne sessionScope.loginUser.userId }">
							<a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }">${ item.user.userId }</a> &nbsp;
							</c:if>
							<c:if test="${ item.user.userId eq sessionScope.loginUser.userId }">
							<a href="${pageContext.servletContext.contextPath}/mypage.do">${ item.user.userId }</a> &nbsp;
							</c:if>
							<br>
							<c:if test="${ not empty item.user.nickname }">
							<c:if test="${ item.user.userId ne sessionScope.loginUser.userId }">
							<span><a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }" style="text-decoration:none;color:black;">${ item.user.nickname }</a></span>
							</c:if>
							<c:if test="${ item.user.userId eq sessionScope.loginUser.userId }">
							<span><a href="${pageContext.servletContext.contextPath}/mypage.do" style="text-decoration:none;color:black;">${ item.user.nickname }</a></span>
							</c:if>
							</c:if>
						</h3>
					</div>
				</div>
				<!-- 누르면 포스트 상세보기 페이지 연결 -->
				<div class="imgBox" >
					<c:if test="${ not empty item.image.imageURL }">
					<img src="${ item.image.imageURL }">
					</c:if>
					<c:if test="${ empty item.image.imageURL }">
					<img src="resources/postimage/noimage.jpg">
					</c:if>
				</div>
				<div class="bottom">
					<div class="actionBtns">
						<div class="left">
							<span class="reaction"> <!--여기 if태그로 아이콘 설정이 되면 아이콘 바뀜 -->
									<c:if test="${ item.isLiked == 1 }">
                                    <i class="fa-solid fa-face-smile" style="font-size: 30px; color:black;padding-right: 7px;"></i>
                             		 </c:if>
                                      <c:if test="${ item.isLiked == 0 }">
                                      <i class="fa-regular fa-face-smile"style="font-size: 30px;color:black;padding-right: 7px;"></i>
                             		 </c:if>
									<form action="updatereaction3.do" method="post" id="reactionForm">
		                              	<input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
		                              	<input type="hidden" name="postId" value="${ item.post.postId }">
		                              	<input type="hidden" name="likeType" id="likeType">
										<div class="reaction-box" id="reaction-box" style=" display: none;left: 45%;transform: translateX(-50%);background-color: #fff;border-radius: 5px;box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);padding: 10px;z-index: 5;flex-direction: row;align-items: center;justify-content: center;width: auto;flex-wrap: wrap;box-sizing: border-box;">
	                                   
	                                 <c:if test="${ not empty item.whatIsLiked }">
	                                   <c:if test="${ item.whatIsLiked ne '0' }">
	                                   <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-regular fa-thumbs-up" style="font-size: 30px;"></i>
						                    
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked eq '0' }">
	                                   <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-solid fa-thumbs-up" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked ne '1' }">
	                                   <button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-regular fa-heart" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked eq '1' }">
	                                   <button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-solid fa-heart" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked ne '2' }">
	                                   <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-regular fa-face-sad-tear" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked eq '2' }">
	                                  <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-solid fa-face-sad-tear" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked ne '3' }">
	                                    <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-regular fa-face-angry" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked eq '3' }">
	                                  <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-solid fa-face-angry" style="font-size: 30px;"></i>
						                </button>
	                                   </c:if>
	                                   <c:if test="${ item.whatIsLiked ne '4' }">
	                                   <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-regular fa-face-laugh-squint" style="font-size: 30px;"></i>
						                </button>
	                             	   </c:if>
		                               <c:if test="${ item.whatIsLiked eq '4' }">
		                                <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;cursor:pointer;">
						                    <i class="fa-solid fa-face-laugh-squint" style="font-size: 30px;"></i>
						                </button>
		                               </c:if>
	                             	</c:if>
	                             	<c:if test="${ empty item.whatIsLiked }">
	                             		 <button type="submit" name="likeType" value="0" class="reaction-button" style="border: none; background: none;cursor:pointer;">
							                <i class="fa-regular fa-thumbs-up" style="font-size: 30px; "></i>
							            </button>
	                             		<button type="submit" name="likeType" value="1" class="reaction-button" style="border: none; background: none;cursor:pointer;">
							                <i class="fa-regular fa-heart" style="font-size: 30px; "></i>
							            </button>
							            <button type="submit" name="likeType" value="2" class="reaction-button" style="border: none; background: none;cursor:pointer;">
							                <i class="fa-regular fa-face-sad-tear" style="font-size: 30px; "></i>
							            </button>
							            <button type="submit" name="likeType" value="3" class="reaction-button" style="border: none; background: none;cursor:pointer;;">
							                <i class="fa-regular fa-face-angry" style="font-size: 30px; "></i>
							            </button>
							            <button type="submit" name="likeType" value="4" class="reaction-button" style="border: none; background: none;cursor:pointer;">
							                <i class="fa-regular fa-face-laugh-squint" style="font-size: 30px; "></i>
							            </button>
	                             	</c:if>
	                             		</div>
	                              </form>
							</span> 		
							<span class="comment"  return false;>
								<a href="${pageContext.servletContext.contextPath}/detail.do?postId=${ item.post.postId }">
								<i class="fa-regular fa-comment"style="cursor:pointer;font-size: 30px;color:black;padding-right: 7px;"></i>
								</a>
							</span> 
							
							
							<span class="share" id="${ item.post.postId }"> 
							<i class="fa-solid fa-share-nodes" style="cursor:pointer;font-size: 30px;color:black;padding-right: 7px;"></i>
							</span>
							
							<!-- 복사  -->
							<script>
							document.addEventListener("DOMContentLoaded", function() {
								  
								  var shareIcon = document.getElementById(`${item.post.postId}`);

								  if (shareIcon) {  
								    shareIcon.addEventListener('click', function(event) {
							
								      const clickedIcon = event.target;

								      const postId = clickedIcon.id;

								      const urlToCopy = `http://localhost:8080/intertwine/detail.do?postId=${item.post.postId}`;

								      navigator.clipboard.writeText(urlToCopy).then(function() {
								        console.log('Post URL is copied to clipboard');
								        alert('링크가 복사되었습니다.');
								      }, function(err) {
								        console.error('Could not copy text: ', err);
								      });
								    });
								  } else {
								    console.warn("Share icon with ID", `${item.post.postId}`, "not found");
								  }
								});
							</script>
							
						</div>
						<div class="right">
						
							
							<span class="bookmark" return false;> <!-- if 문으로 북마크 저장여부 확인 메소드 만들기-->
								<c:if test="${item.isBookmarked == 0}">
									 <a href="${pageContext.servletContext.contextPath}/insertBookmark2.do?postId=${item.post.postId}&userId=${sessionScope.loginUser.userId}">
									<i class="fa-regular fa-bookmark"style="cursor:pointer;font-size: 30px"></i>
									</a>
									</c:if>
								
									<c:if test="${item.isBookmarked == 1}">
                                       <a href="${pageContext.servletContext.contextPath}/deleteBookmark3.do?postId=${item.post.postId}&userId=${sessionScope.loginUser.userId}">
                                          <i class="fa-solid fa-bookmark"style="cursor:pointer;font-size: 30px"></i>
                                          </a>
                                   </c:if>
							</span>
						</div>
					</div>
				
					<p class="likes">공감 ${ item.isLiked }개</p>
					<!-- 누를 시 그 사람의 상세 페이지로 들어감 카드 상단 닉네임부분과 역할이 같음 -->
					<a href="${pageContext.servletContext.contextPath}/page.do?friendId=${ item.user.userId }"><b>${ item.user.userId }</b></a> &nbsp;
					${ item.post.postContent }
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
</div>
<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
</main>

<script>
document.addEventListener('DOMContentLoaded', function() {
const frame = document.querySelector('.frame');

	function hideAllReactionBoxes() {
	  document.querySelectorAll('.reaction-box').forEach(function(box) {
		box.style.display = 'none';
	  });
	}
  
	frame.addEventListener('click', function(event) {
	  const reaction = event.target.closest('.reaction');
	  if (reaction) {
		event.stopPropagation();
		const box = reaction.querySelector('.reaction-box');
		const isDisplayed = box.style.display === 'flex';
 
		hideAllReactionBoxes();
		
		box.style.display = isDisplayed ? 'none' : 'flex';
	  } else if (!event.target.closest('.reaction-box')) {

		hideAllReactionBoxes();
	  }
	});
});
</script>

</body>
</html>
