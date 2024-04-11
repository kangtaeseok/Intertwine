<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="/intertwine/resources/css/aichat.css">
<script defer src="/intertwine/resources/js/aichat.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
</head>
<body>

    <main>
    <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>    
        
        <div id="bottom_right_contents">
            <div id="abc">
	            <div id="feed">
	            	<div class="chatbot-container">
					    <div id="header">
					    	<img src="/intertwine/resources/images/ai/chatbot1.png">
					        <h1>문의 챗봇</h1>
					    </div>
					    <div id="chatbot">
					        <div id="conversation">
					            <div class="chatbot-message">
					                <p class="chatbot-text">안녕하세요! 👋 무엇을 도와드릴까요?</p>
					            </div>
					        </div>
					        <form id="input-aichat" action="aichatgo.do" method="post">
					        	<message-container>
							    	<input id="input-acfield" type="text" name="keyword" placeholder="메세지를 입력하세요.">
							    	<button id="submit-button" type="submit">
					                  <img class="send-icon" src="/intertwine/resources/images/ai/send-message.png" alt="">
					                </button>
					            </message-container>
							</form>
					    </div>
					</div>
				</div>
            </div>
        </div>
    </main>    
</body>
</html>