<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css" />
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<title>Intertwine</title>
<meta charset="UTF-8">
</head>
<body>
    <main>
        <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>  
        <div id="bottom_right_contents">
            <div id="abc">
                <!-- <div class="feed">
                    피드창
                </div> -->
                <div class="squerediv">
                     
                </div>
            </div>
        </div>
        <div class="floating-button" id="floatingButton">
        	<img src="/intertwine/resources/images/ai/chatbot2.png" alt="Chatbot">
        </div>
			<div class="layer" id="layer">
			    <div class="chatbot-container" id="chatbotContainer">
			        <div id="header">
			            <img src="/intertwine/resources/images/ai/chatbot1.png">
			            <h1>이벤트 챗봇</h1>
			        </div>
			        <div id="chatbot">
			            <div id="conversation">
			                <div class="chatbot-message">
			                    <p class="chatbot-text">안녕하세요! 👋 무엇을 도와드릴까요?</p>
			                </div>
			            </div>
			            <form id="input-aievent" action="aieventgo.do" method="post">
			                <message-container>
			                    <input id="input-aefield" type="text" name="keyword" placeholder="메세지를 입력하세요.">
			                    <button id="submit-button" type="submit">
			                      <img class="send-icon" src="/intertwine/resources/images/ai/send-message.png" alt="">
			                    </button>
			                </message-container>
			            </form>
			        </div>
			    </div>
			</div>
    </main>
 
</body>

</html>