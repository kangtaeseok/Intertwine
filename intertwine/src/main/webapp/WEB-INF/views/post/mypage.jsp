<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script>
    <title>
        마이 페이지
    </title>

    
    <style>
        .container{
            margin: 0 auto; /* Center the container horizontally */
            padding-left: 250px; /* Adjust padding to match sidebar width */
            width: 1000px;
        }
        .top{
            margin-top: 30px;
            display: flex;
        }
        .middle{
            padding-top: 30px;
            display:flex;
        }
        .profile{
            padding-left: 10px;
        }
        .profile-info{
          display: flex;   
        }
        .left{
            display: flex;
        }
        .right{
            display: flex;
        }
        .bottom{
            display: flex;
        }
        .pic{
            width: 200px; /* Adjust width as needed */
            height: 200px; /* Adjust height as needed */
            border-radius: 50%;
            border: 0px solid black;
            overflow: hidden;
        }
        .pic img {
             width: 100%;
             height: 100%;
             object-fit: cover; /* Ensures image fills container */
        }
        .dummy2 {
            height: 50px;
        }
        .dummy3{
            width: calc(60%);
        }
        .sorting{
            justify-content: right;
        }
        li{
            list-style-type: none;
        }
        .search {
        display: flex;
        background-color: #FFF; /* Light gray background */
        border: 0px solid #FFF; /* Light gray border */
        border-radius: 5px; /* Rounded corners */
        padding: 5px 10px;
        }
        .search select {
            border: none; /* Remove default border */
            background: transparent; /* Transparent background */
            padding: 5px; /* Add some padding for consistency */
            margin-right: 5px; /* Space between dropdown and input field */
            cursor: pointer; /* Change cursor to pointer */
        }

        .search input[type="text"] {
        border: none;
        outline: none;
        background-color: #FFF; /* Inherit background color */
        font-size: 13px; /* Adjust font size as needed */
        }

        .search .fa-search {
        color: #000; /* Black color for the icon */
        font-size: 33px; /* Adjust icon size as needed */
        margin-left: 5px; /* Add spacing between input and icon */
        cursor: pointer; /* Indicate clickable behavior */
        transition: transform 1.0s ease;
        }
        .search .fa-search:hover {
         transform: scale(1.1) rotate(360deg); /* Make it 10% bigger and rotate */
        }
        .sorting{
            display: flex; /* Arrange dropdowns horizontally */
            justify-content: space-between;
        }
        .sorting select {
            padding: 8px 12px; /* Add padding inside the dropdown */
            margin-right: 10px; /* Space between multiple elements */
            border: 0px solid #ccc; /* Border color */
            border-radius: 4px; /* Rounded corners */
            background-color: #FFF; /* Background color */
            cursor: pointer; /* Cursor to indicate it's selectable */
            font-size: 16px; /* Text size */
        }

        .sorting select:hover {
            background-color: #f1f1f1; /* Lighter background on hover */
        }

        .sorting select:focus {
            border-color: #009688; /* Change border color to highlight focus */
            outline: none; /* Remove the default focus outline */
        }

        button {
        padding: 5px 10px; /* Adjust padding as needed */
        border: none;
        border-radius: 5px; /* Rounded corners */
        cursor: pointer; /* Indicate clickable behavior */
        font-size: 15px; /* Adjust font size as needed */
        }

        .bottom {
        display: flex; /* Make the gallery container a flexbox */
        flex-wrap: wrap; /* Allow items to wrap onto multiple lines */
        width: 100%; /* Ensure the gallery fills the available width */
        }

        .follow{
            text-decoration: none;
            color: black;
            margin-right: 5px;
        }

        .bottom .options {
            width: calc(33% - 10px);
            margin-bottom: 5px;
            margin-right: 13px;
            position: relative;
            /* The existing styles remain unchanged */
        }

        .bottom .options .gallery{
            padding: 0px;
            height: 300px;
            padding: 0px;
            margin: 0px;
            justify-content: center;
            background-color: grey;
        }

        .bottom .options .gallery img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            /* Ensures the image fits within the .gallery item */
        }

        /* New styles for the hover effect */
         .bottom .options .gallery .image-wrap {
            position: relative;
            width: 100%; /* Full width of the gallery item */
            height: 100%; /* Full height of the gallery item */
        }

        .bottom .options .gallery .image-wrap .overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5); /* Semi-transparent overlay */
            color: white;
            visibility: hidden;
            opacity: 0;
            transition: opacity 0.5s, visibility 0.5s;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bottom .options .gallery .image-wrap:hover .overlay {
            visibility: visible;
            opacity: 1;
            cursor: pointer;
        }
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

</head>
<body>
<div class="container">
    <div class="top">
        <div class="profile">
            <div class="pic">
                <a href=""><img src="resources/profile/default.png"></a>
            </div>
        </div>
        <div class="profile-info">
            
            <div class="left">
                <div class="personal">
                    <ul>
                        <br>
                        <li><h3>${ user.userId } &nbsp;&nbsp;<a href="#"><i class="fa-solid fa-gear" style="color:black;"></i></a></h3></li>
                        <li><%-- 여기 유저 바이오 --%></li>
                        <br>
                        <li><a><b>팔로잉 </b>${ followingCount }</a>&nbsp;&nbsp;<a><b>팔로워 </b>${ followerCount }</a> &nbsp;<a></a></li>
                    </ul>
                </div>
                <div class="followrelated">
                    <div class="dummy2">
                    </div>
                    
                    <!-- 본인계정엔 보이지 않음 -->
                    <!-- <a class="follow" href="#">팔로우</a>
                    <a class="follow" href="#">팔로우 해제</a>
                    <a class="follow" href="#">디엠</a>
                    <a class="follow" href="#">차단</a> -->
                </div>
            </div>
            <div class="right">
                <div class="dummy">
                    <div class="dummy2">

                    </div>
                    <!-- 남의 계정엔 보이지 않음 -->
                    <!-- once you click 선택 then the other three buttons appear and hide itself and also hide -->
                    <button class="select-button">선택</button>
                    <!-- once you click 선택 then the other three buttons appear and hide itself-->
                    <button class="select-all-button">전체선택</button>
                    <button class="delete-button">삭제</button>
                    <button class="cancel-button">취소</button>
                </div>
                

            </div>
        </div>

    </div>
    <div class="middle">
        <div class="search">
            <select class="search-condition">
                <option value="all" selected>전체</option>
                <option value="tag">태그</option>
                <option value="content">콘텐츠</option>
            <input type="text" placeholder="검색할 키워드를 입력하세요"> 
            <i class="fa fa-search"></i>
  
        </div>
        <div class="dummy3">
        </div>
        <div class="sorting">
        
            <select name="dropdown1" id="dropdown1">
            	<option value="">선택</option>
                <option value="0">최신순</option>
                <option value="1">오래된순</option>
                <option value="2">좋아요 많은순</option>
            </select>
        </div>
        
    </div>
    <div class="bottom" >
        <!-- 이것들이 반복 됨 -->
       <c:forEach var="gallery" items="${galleries}">
        <a href="detail.do?postId=${gallery.post.postId}">
        <div class="options gallery-item" data-id="${ gallery.post.postId }">
            <input type="checkbox">
            <div class="gallery">
                <div class="image-wrap">
				<c:if test="${not empty gallery.image.imageURL}">
				    <img src="${gallery.image.imageURL}" alt="Gallery Image">
				</c:if>
				<c:if test="${not empty gallery.video.videoURL and empty gallery.image.imageURL}">
				    <video muted autoplay>
				        <source src="${gallery.video.videoURL}" type="video/mp4">
				    </video>
				</c:if>
				<c:if test="${not empty gallery.video.videoURL and not empty gallery.image.imageURL}">
				    <img src="resources/postimage/noimage.png" alt="Gallery Image">
				</c:if>
                    <div class="overlay">
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
<script>
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
</body>
</html>