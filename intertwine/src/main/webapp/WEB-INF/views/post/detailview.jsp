<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Viewer</title>
<!--슬라이드 쇼-->
<style>

li{
     list-style-type: none;
}
.container-detail{
     display: flex;
     padding-top: 5vw;
     padding-left: 10vw;
}
.left{
     max-width: 800px;
     height: 800px;
     width: 35vw;
     border: 1px grey solid;
     position: relative;
     background-color: black;
    display: flex; /* Use flexbox */
    align-items: center; /* Center children vertically */
    justify-content: center; /* Center children horizontally */
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
</style>

<!--스크롤바 디자인 -->

<style>

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



</head>
<body>
     <!-- 이 페이지에서 필요한 정보 정리 
          게시물 만든 유저 ID 포스트 ID 닉네임 주소 최근 공감 3개 
          게시물 보는 사람 ID 닉네임 공감여부 북마크 여부 
          댓글 쓴 사람 ID들 
     즉 이 페이지를 열땐 model에 담아서 여기로 토스하는 정보들임

SELECT IMAGE_LON, IMAGE_LAT, IMAGE_URL
FROM TB_IMAGE
WHERE POST_ID = ?

SELECT VIDEO_URL
FROM TB_VIDEO
WHERE POST_ID = ?

-->
<div class="container-detail">
     <div class="left">
            <!-- this part will be repeated  -->
			<c:if test="${!empty images}">
			    <c:forEach var="image" items="${images}">
			        <c:if test="${!empty image.imageURL}">
			            <img src="${image.imageURL}">
			        </c:if>
			    </c:forEach>
			</c:if>

			<c:if test="${!empty video.videoURL and empty images}">
			    <video controls>
			        <source src="${video.videoURL}" type="video/mp4">
			    </video>
			</c:if>

          <c:if test="${empty images && empty video.videoURL }">
         	 <img src="resources/postimage/noimage.png" alt="Gallery Image">
          </c:if>
          
          <!-- Next and previous buttons -->
          <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
          <a class="next" onclick="plusSlides(1)">&#10095;</a>
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
     <div class="right">
          <div class="scroll">
               <div class="owner"> 
                    <div class="pic">
                         <img src="https://www.w3schools.com/html/img_girl.jpg" onclick="">
                    </div>
                    <div class="owner-info">
                         <div class="dummy">
                              <div><b onclick="" style="cursor:pointer;">${postUser.userId}</b></div> &nbsp;
								${ postUser.postId }
                              <c:if test="${ postUser.userId ne viewingUser.userId }">
                              <a href="#">팔로우</a> &nbsp;
                              <!-- c태그로 확인 -->
                              <a href="#">언팔로우</a> &nbsp;
                              </c:if>

                              <!-- 항상 보임 -->
                              <a href="#">차단</a> &nbsp;
                              <i class="fa-solid fa-ellipsis settings-button" ></i>
                              <!-- c:if 태그로 확인 남의 글 -->
                                   <ul class="settings-menu">
                                        <li><button>신고하기</button></li>
                                   </ul>
                              <!--
                                   <ul class="settings-menu">
                                        <li><button>핀하기</button></li>
                                        <li><button>삭제하기</button></li>
                              -->
                         </div>
                         
                         <!-- 주소가 없으면 안나타남 -->
                         <a href="" class="owner-address">주소</a>
                         <!-- 주소가 있으면 안나타남 -->
                         <a href="" class="owner-id"><b><%-- ${postUser.userId} --%></b></a>
                    </div>
                    &nbsp;
               </div>

               <div class="content">      
                    <div class="box">
                         <div class="reaction" id="reaction">
                              <!-- 반응을 남긴적 없을 경우-->
                              <i class="fa-regular fa-face-smile"></i>
                              <!-- 반응을 남긴 적 있을 경우-->
                              <i class="fa-solid fa-face-smile"></i>
                              <div class="reaction-box" id="reaction-box">
                                   <i class="fa-regular fa-thumbs-up reaction-icon" name="likeType" id="like" data-value="0" onclick=""></i>
                                   <i class="fa-regular fa-heart reaction-icon" name="likeType" id="love" data-value="1" onclick=""></i>
                                   <i class="fa-regular fa-face-sad-tear reaction-icon" name="likeType" id="sad" data-value="2" onclick=""></i>
                                   <i class="fa-regular fa-face-angry reaction-icon" name="likeType" id="angry" data-value="3" onclick=""></i>
                                   <i class="fa-regular fa-face-smile reaction-icon" name="likeType" id="haha" data-value="4" onclick=""></i>
                              </div>
                         </div> 
                         <style>
                              .reaction {
                              position: relative; /* Enables absolute positioning for child elements like reaction-box */
                              cursor: pointer;
                              }

                              .reaction-box {
                              display: none; /* Initially hide the reaction-box */
                              position: absolute; /* Make the reaction-box absolutely positioned */
                              top: 150%;
                              left: 25%; /* Center the box relative to the reaction icon */
                              transform: translateX(-50%); /* Adjust horizontal positioning */
                              background-color: #fff; /* Background color of the box */
                              border-radius: 5px; /* Rounded corners for the box */
                              box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for depth */
                              padding: 10px; /* Padding inside the box */
                              z-index: 5; /* Ensure the box appears above other elements */
                              flex-direction: row;
                              align-items: center; /* Center the reaction icons */
                              justify-content: center; /* Center the icons horizontally */
                              width: auto; /* Auto width based on content */
                              flex-wrap: wrap; /* Allow the icons to wrap if space is limited */
                              }
                         </style>
                         <script>
                         document.addEventListener('DOMContentLoaded', function() {
                         document.getElementById('reaction').addEventListener('click', function(event) {
                              //폼전송 방지
                              event.stopPropagation();
                              
                              var reactionBox = document.getElementById('reaction-box');
                              // 디스플레이 토글
                              reactionBox.style.display = (reactionBox.style.display === 'flex') ? 'none' : 'flex';
                         });
                         
                         // 리액션 박스 닫기 =
                         window.addEventListener('click', function(event) {
                              var reactionBox = document.getElementById('reaction-box');
                              if (!event.target.closest('.reaction')) {
                                   reactionBox.style.display = 'none';
                              }
                         });
                         });
                         </script>

                         <div class="share">
                              <i class="fa-solid fa-share-nodes"></i>
                         </div>
                         <div class="bookmark">
                              <!-- 북마크를 안했을 경우 c:if-->
                              <i class="fa-regular fa-bookmark" onclick="#"></i>
                              <!-- 북마크를 했을 경우 c:if -->
                              <i class="fa-solid fa-bookmark" onclick="#"></i>
                              <!-- 넘길 때 필요한 정보
                              접속한 사람 userId 와 postId -->
                         </div>
                    </div>

                    <a href="#" class="reactioncount">공감 ${ likeCount }개</a><br>
                    <a href="#"><b><%-- ${ postUser.userName } --%></b></a> &nbsp; 
                    <!-- 여기에 쓴 글이 들어감-->
                   <%--  ${ post.postContent } --%>
               </div>
               <div class="tags">
				<c:if test="${!empty tags}">
				    <c:forEach var="tag" items="${tags}">
				        <span>${tag.tagName}</span>
				    </c:forEach>
				</c:if>
               </div>
               <div class="time">
                    ${ post.postTime }
               </div>
              
               <div class="commentbox">
                    <!-- 반복 -->



               </div>
          </div>
          <div>
               <form action="addComment1.do" method="POST" class="add-comment" return>
                    <input type="hidden" name="userId" data-value="${ viewingUser.userId }">
                    <input type="hidden" name="postId" data-value="${ post.postId }">
                    <input type="text" class="text" name="commentContent" placeholder="댓글을 추가해주세요">
                    <input type="submit" class="submit" value="등록">
                </form>
          </div>
     </div>
     
     

</div>
<!-- 댓글 숨기기용 -->
<script>
     document.addEventListener('DOMContentLoaded', function() {
    const commentAgainLink = document.querySelector('.commentagain');
    const commentForm = document.querySelector('.add-comment2');
    
    commentAgainLink.addEventListener('click', function(event) {
        //폼 전송 방지 =
    	event.preventDefault(); 
        // 폼 토글 
        if (commentForm.style.display === 'none' || commentForm.style.display === '') {
            commentForm.style.display = 'block';
        } else {
            commentForm.style.display = 'none';
        }
    });
});
</script>

<!-- 숫자 파싱-->
<script>
     // 숫자 파싱
     function timeSince(date) {
    const seconds = Math.floor((new Date() - new Date(date)) / 1000);

    let interval = seconds / 31536000;

    if (interval > 1) {
        return Math.floor(interval) + "년 전";
    }
    interval = seconds / 2592000;
    if (interval > 1) {
        return Math.floor(interval) + "개월 전";
    }
    interval = seconds / 604800;
    if (interval > 1) {
        return Math.floor(interval) + "주 전";
    }
    interval = seconds / 86400; 
    if (interval > 1) {
        return Math.floor(interval) + "일 전";
    }
    interval = seconds / 3600; 
    if (interval > 1) {
        return Math.floor(interval) + "시간 전";
    }
    interval = seconds / 60; 
    if (interval > 1) {
        return Math.floor(interval) + "분 전";
    }
    return "방금";

}



</script>
</body>
</html>