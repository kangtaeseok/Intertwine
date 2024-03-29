<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script>
    <title>
        마이페이지
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
        justify-content: space-between; /* Distribute items evenly with spacing */
        width: 100%; /* Ensure the gallery fills the available width */
        }

        .bottom .gallery {
            width: calc(33% - 10px);
            height: 300px;
            margin: 5px;
            padding: 0px;
            background-color: grey;
            justify-content: center;
            /* The existing styles remain unchanged */
        }

        .bottom .gallery img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            /* Ensures the image fits within the .gallery item */
        }

        /* New styles for the hover effect */
        .bottom .gallery .image-wrap {
            position: relative;
            width: 100%; /* Full width of the gallery item */
            height: 100%; /* Full height of the gallery item */
        }

        .bottom .gallery .image-wrap .overlay {
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

        .bottom .gallery .image-wrap:hover .overlay {
            visibility: visible;
            opacity: 1;
            cursor: pointer;
        }
        .bottom .gallery .image-wrap .overlay .icon-bottom-right,
        .bottom .gallery .image-wrap .overlay .icon-top-left {
            position: absolute; 
        }

        .bottom .gallery .image-wrap .overlay .icon-bottom-right {
            bottom: 15px; /* Adjust as needed */
            right: 15px; /* Adjust as needed */
        }

        .bottom .gallery .image-wrap .overlay .icon-top-left {
            top: 15px; /* Adjust as needed */
            left: 15px; /* Adjust as needed */
        }

        .follow{
            text-decoration: none;
            color: black;
            margin-right: 5px;
        }

    </style>
</head>
<body>
<div class="container">

    <div class="top">
        <div class="profile">
            
            <div class="pic">
                <img src="https://www.w3schools.com/html/img_girl.jpg">
            </div>
        </div>
        <div class="profile-info">
            
            <div class="left">
                <div class="personal">
                    <ul>
                        <br>
                        <li><h3>닉네임</h3></li>
                        <li>바이오</li>
                        <br>
                        <li><a><b>팔로잉 </b>숫자여기</a>&nbsp;<a><b>팔로워 </b> 숫자여기</a> &nbsp;<a></a></li>
                    </ul>
                </div>
                <div class="followrelated">
                    <div class="dummy2">
                    </div>
                    <!-- 본인계정엔 보이지 않음 -->
                    <a class="follow" href="#">팔로우</a>
                    <a class="follow" href="#">팔로우 해제</a>
                    <a class="follow" href="#">디엠</a>
                    <a class="follow" href="#">차단</a>
                </div>
            </div>
            <div class="right">
                <div class="dummy">
                    <div class="dummy2">

                    </div>
                    <!-- 남의 계정엔 보이지 않음 -->
                    <!-- 선택을 누르면 나머지 3개 버튼이 생김 -->
                    <button class="select-button">선택</button>
                    <!-- 취소를 누르면 선택버튼이 생김-->
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
                <option value="tag" selected>전체</option>
                <option value="tag">태그</option>
                <option value="content">콘텐츠</option>
            <input type="text" placeholder="검색할 키워드를 입력하세요">
            <i class="fa fa-search"></i>
        </div>
        <div class="dummy3">
        </div>
        <div class="sorting">
            <select name="dropdown1" id="dropdown1">
                <option value="option1">Option 1</option>
                <option value="option2">Option 2</option>
                <option value="option3">Option 3</option>
                <!-- Add more options as needed -->
            </select>
        
            <select name="dropdown2" id="dropdown2">
                <option value="optionA">Option A</option>
                <option value="optionB">Option B</option>
                <option value="optionC">Option C</option>
                <!-- Add more options as needed -->
            </select>
        </div>
        
    </div>
    <div class="bottom">
        <!-- 이것들이 반복 됨 -->
        <div class="gallery">
            <div class="image-wrap">
                <img src="${imageUrl}">
                <div class="overlay">
                    <i fill=white; class="fa-solid fa-heart">&nbsp;${SELECT COUNT(*) FROM REACTION}</i> &nbsp;&nbsp;&nbsp;
                    <i fill=white; class="fa-solid fa-comment">&nbsp;${SELECT COUNT(*) COMMENT}</i>
                    <!-- 핀 여부 확인 조건 추가-->
                    <i class="fa-solid fa-thumbtack icon-bottom-right"></i>
                    <!-- 공개여부 확인 이건 본인에게만 보여야함 -->
                    <i class="fa-solid fa-eye icon-top-left"></i><!-- 전체 공개 /친구공개 / 비공개-->
                    <!--
                    <i class="fa-solid fa-user-group icon-top-left"></i> 
                    <i class="fa-solid fa-eye-slash icon-top-left"></i> 
                    -->
                </div>
            </div>
        </div>
        <div class="gallery">
            <div class="image-wrap">
                <img src="https://www.w3schools.com/html/img_girl.jpg" alt="Girl">
                <div class="overlay">
                    
                </div>
            </div>
        </div>
        <div class="gallery">
            <div class="image-wrap">
                <img src="https://www.w3schools.com/html/img_girl.jpg" alt="Girl">
                <div class="overlay">
                    
                </div>
            </div>
        </div>
        <div class="gallery">
            <div class="image-wrap">
                <img src="https://www.w3schools.com/html/img_girl.jpg" alt="Girl">
                <div class="overlay">
                    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>