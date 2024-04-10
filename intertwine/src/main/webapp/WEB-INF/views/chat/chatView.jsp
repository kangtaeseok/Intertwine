<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="org.edu.intertwine.user.model.vo.User"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script type="text/javascript"
	src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<!-- <script src="/path/to/sockjs.min.js"></script>
<script src="/path/to/stomp.min.js"></script> -->
<style>

	#chatbox {
		display: block;
		background-color: #ffffff;
		border: 1px solid black;
		border-radius: 10px;
		max-width: 600px;
		height:460px;
		padding: 10px;
		margin: 10px;
		box-shadow: 0 20px 20px rgba(0, 0, 0, 0.1);
	}

	#messageWindow {
		background-color: #fff;
		height: 300px;
		overflow-y: auto;
		padding: 10px;
		margin-bottom: 10px;
	}

	#inputMessage {
		width : 60%;
		 flex-grow: 1;
    padding: 8px 12px;
    border: 2px solid #dcdcdc; /* 경계선 스타일 */
    border-radius: 25px; /* 둥근 모서리 */
    margin-right: 10px; /* 오른쪽 여백 */
    outline: none; /* 선택 시 테두리 제거 */
    box-shadow: inset 0 1px 3px rgba(0,0,0,0.1); /* 내부 그림자 */
	}

	.chat_content {
		margin: 5px 0;
		padding: 5px;
		border-radius: 17px;
		box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
	}

	.my-side {
		background-color: #f9f9f9;
		text-align: right;
		float: right; /* 메시지를 오른쪽에 배치 */
	clear: both;
	margin-left: 50%; /* 화면의 절반을 기준으로 오른쪽에 배치 */
	}

	.other-side {
		background-color: #eee;
		text-align: left;
		float: left; /* 메시지를 왼쪽에 배치 */
	clear: both;
	margin-right: 50%; /* 화면의 절반을 기준으로 왼쪽에 배치 */
	}
	#sendButton, #endBtn{
	   padding: 8px 16px;
    background-color: #cc2e72; /* 배경 색상 */
    color: white; /* 텍스트 색상 */
    border: none; /* 경계선 제거 */
    border-radius: 25px; /* 둥근 모서리 */
    cursor: pointer; /* 마우스 오버 시 커서 변경 */
    transition: background-color 0.2s; /* 배경 색상 변화 효과 */
    
	}

	/* #endBtn {
		background-color: #f9f9f9;
		color: white;
		padding: 5px 10px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	} */

.content {
	display: flex;
	flex-direction: row;
	/* Aligns children (chat list and chat box) horizontally */
	justify-content: space-between;
	/* Distributes space between and around content items */
	padding: 20px;
	align-items: flex-start;
}

#chattingList {
	width: 30%; /* Adjust the width as necessary */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Adds shadow for depth */
	overflow-y: auto; /* Enables scrolling for overflow content */
	margin-bottom: 20px;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 10px; /* Rounds the corners */
}



.item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #eee;
	padding: 10px;
}

.profile-img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 10px;
}

.chat-btn {
	padding: 5px 10px; /* 버튼 내부의 패딩 줄임 */
	margin-right: 3px; /* 버튼 사이의 마진 줄임 */
	border: none;
	border-radius: 4px;
	background-color: #cc2e72; /* 기본 회색 */
	color: #fff; /* 버튼 내 텍스트 색상 */
	font-size: 0.75rem; /* 텍스트 크기를 줄임 */
	text-transform: uppercase; /* 텍스트를 대문자로 */
	font-weight: bold; /* 글씨 두껍게 */
	cursor: pointer;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); /* 박스 그림자 추가 */
	transition: background-color 0.3s, box-shadow 0.3s;
	/* 부드러운 색상 및 그림자 변화 */
}

.chat-btn:hover {
	background-color: #be315b; /* 호버 시 진한 회색 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 변화 */
}

#chattingList th, #chattingList td {
	text-align: left; /* Align text to the left */
	/* padding: 8px; */
	border-bottom: 1px solid #ccc; /* Add a bottom border to each cell */
	border: none; /* 셀의 테두리 제거 */
	padding: 12px 15px; /* 셀 내부의 패딩 조정 */
}

#chattingList th {
	background-color: #f9f9f9; /* Add a background color to header cells */
	color: #333; /* Header cell text color */
	text-align: left;
}

table {
	border-collapse: collapse;
	width: 100%;
}
</style>
</head>
<body>
	
	<div class="content">
		<table id="chattingList" class="followerList-table">
			<thead>
				<tr>
					<th>${loginUser}님의채팅목록</th>
				</tr>
				<tr>
					<th>Profile</th>
					<th>Username</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty ChatList}">
					<tr>
						<td>채팅한 목록이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty ChatList}">
					<c:forEach items="${ChatList}" var="chat">
						<tr class="item">
							<c:choose>
								<c:when test="${chat.userId1 == loginUser}">
									<td><a
										href="${pageContext.request.contextPath}/page.do?friendId=${chat.userId2}">
											<img
											src="${pageContext.request.contextPath}/resources/profile/images.jpg"
											alt="Profile Image" class="profile-img">
									</a></td>
									<td>${chat.userId2}</td>
									<%-- <td>${chat.chatId}</td> --%>
								</c:when>
								<c:otherwise>
									<td><a
										href="${pageContext.request.contextPath}/page.do?friendId=${chat.userId1}">
											<img
											src="${pageContext.request.contextPath}/resources/profile/images.jpg"
											alt="Profile Image" class="profile-img">
									</a></td>
									<td>${chat.userId1}</td>
								</c:otherwise>
							</c:choose>

							<td><button class="chat-btn" data-chat-id="${ chat.chatId }"
									data-friend-id="${chat.userId2 == loginUser ? chat.userId1 : chat.userId2}">채팅하기</button>
								<a
								href="${pageContext.servletContext.contextPath}/deleteChat.do?otherUserId=${chat.userId2 == loginUser ? chat.userId1 : chat.userId2}">나가기</a>
							<td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		</div>

		<!-- <div id="chatbox" class="followingList">
			<fieldset>
				<div id="messageWindow"></div>
				<input type="text" id="inputMessage" onkeyup="enterKey()" /> <input
					type="submit" value="보내기" onclick="send()" />
				<button type="button" id="endBtn">나가기</button>
			</fieldset>
		</div>
	</div> -->

	<!-- 채팅 창 구현 부분 -->

	<div style="display: none;" id="chatbox">
		 <div id="chatHeader" style="text-align: center; border-bottom: 1px solid black; padding: 10px;">
        <!-- 상대방 유저 아이디 표시 -->
        <span id="chatFriendId" style="font-size: 16px;">${chat.userId2 == loginUser ? chat.userId1 : chat.userId2}</span>
        </div>
			<div id="messageWindow"></div>
			
			<br> <input type="text" id="inputMessage" onkeyup="enterKey()" placeholder="메세지를 입력하세요" />
			<input id="sendButton" type="submit" value="send" >
			<button type="button" id="endBtn">나가기</button>
	</div>


	<script>
	var loginUser = '${loginUser}';
	var friendId = '${chat.userId2 == loginUser ? chat.userId1 : chat.userId2}'
	/* var friendId = '${chat.userId2 == loginUser ? chat.userId1 : chat.userId2}' */
	
	
	
	// 로컬 스토리지에서 채팅 내역을 불러오는 함수
function loadMessages() {
    var savedMessages = localStorage.getItem('chatMessages');
    if (savedMessages) {
        $('#messageWindow').html(savedMessages);
    }
}
	
//엔터키를 누를 경우 메세지 보내기
function enterKey(event){
	if(window.event.keyCode == 13)
		send();
}
$(document).ready(function() {
    loadMessages(); // 페이지 로딩 시 저장된 메시지를 불러옵니다.
    $('#sendButton').on('click', send); // 'send' 버튼에 클릭 이벤트 핸들러를 추가합니다.
	
	$(document).on('click', '.chat-btn', function() {
	    var friendId = $(this).data('friend-id');
	    var chatId = $(this).data('chat-id');// 상대방 사용자 ID를 가져옵니다.
	    
	    $('#chatbox').show(); // 채팅창을 보이게 합니다.
	    $('#chatFriendId').text(friendId); // 채팅방 최상단에 상대방의 아이디를 표시합니다.

	    connection(chatId, loginUser, friendId); // 웹소켓 연결을 초기화합니다.
	});
    
	
	
	/* /*  $('.chat-btn').on('click',function(){
		$('#chatbox').css('display', 'block');
		$(this).css('display', 'none');
		connection();
	}); */
	
	$('#endBtn').on('click',function(){
		$('#chatbox').css('display', 'none');
		$('#startBtn').css('display', 'inline');
		webSocket.send("상대방이 채팅방을 나갔습니다.");
		webSocket.close();
	});  
	
	
	// 채팅창 내용 부분
	var $textarea = $('#messageWindow');
	
	// 채팅 서버
	var webSocket = null;
	
	// 내가 보낼 문자열을 담은 input 태그
	var $inputMessage = $('#inputMessage');
	
	function connection(chatId, loginUser, friendId){
		var contextPath = "<%=request.getContextPath()%>";
		webSocket = new WebSocket('ws://' + window.location.hostname + ':' + window.location.port + contextPath + '/UnicastChat/' + loginUser + "/" + chatId);
		console.log(webSocket);
		 webSocket.onopen = function(event){
		        console.log("Connection established");		      
		    };
		
		// 웹 소켓을 통해 연결이 이루어 질 때 동작할 메소드
		webSocket.onopen = function(event){
			 
			/* $textarea.html("<p class='chat_content'>"
					+loginUser +"님이 입장하셨습니다.</p><br>"); */
			
			// 웹 소켓을 통해 만든 채팅 서버에 참여한 내용을
			// 메시지로 전달
			// 내가 보낼 때에는 send / 서버로부터 받을 때에는 message
			
			/* webSocket.send( loginUser +"|님이 입장하셨습니다."); */
		};
		
		// 서버로부터 메시지를 전달 받을 때 동작하는 메소드
		webSocket.onmessage = function(event){
			onMessage(event);
		}
		
		// 서버에서 에러가 발생할 경우 동작할 메소드
		webSocket.onerror = function(event){
			onError(event);
		}
		
		// 서버와의 연결이 종료될 경우 동작하는 메소드
		webSocket.onclose = function(event){
			//onClose(event);
		}
	}
	
	
	
	// 서버로 메시지를 전달하는 메소드
	function send(){
			// 메시지가 입력 되었을 경우
			 if (webSocket.readyState === WebSocket.OPEN) {
				  var now = new Date(); // 현재 시간
		            var timestamp = now.toLocaleTimeString(); // 현재 시간을 문자열로 변환
				 var messageToSend = loginUser  + "|" + $inputMessage.val() + "|" + timestamp; // `friendId`는 메시지 수신자 ID
			        webSocket.send(messageToSend);
           /*  $textarea.append("<p class='chat_content'>" + loginUser + " : " + $inputMessage.val() + "</p>"); */
           saveMessage(loginUser, $inputMessage.val(), timestamp); // 메시지와 시간 저장
            $inputMessage.val('');
		} else{
			 console.error("WebSocket is not open.");	
		}
			 
		$textarea.scrollTop($textarea.height());
	}
	
	function saveMessage(sender, message) {
        var currentContent = $('#messageWindow').html();
        var messageEntry = "<p class='chat_content " + (sender === loginUser ? "my-side" : "other-side") + "'><strong>" + sender + "</strong><br> " + message + "</p>";
        localStorage.setItem('chatMessages', currentContent + messageEntry);
    }
	
	// 서버로부터 메시지를 받을 때 수행할 메소드
	function onMessage(event) {
		var messageParts  = event.data.split("|");
		
		// 보낸 사람의 ID
		var sender = messageParts [0];
		
		// 전달한 내용
		var content = messageParts [1];
		
		 var timestamp = messageParts[2] || new Date().toLocaleTimeString(); 
		
		
		/* if (sender === loginUser) {
			// 메시지가 사용자에 의해 보내진 경우
			$textarea.append("<p class='chat_content my-side'><strong>" + sender + "</strong><span> " + timestamp + "</span><br> " + content + "</p>");
		} else {
			// 메시지가 상대방에 의해 보내진 경우
			$textarea.append("<p class='chat_content other-side'><strong>" + sender + "</strong><span> " + timestamp + "</span><br> " + content + "</p>");
		} */
		var messageClass = sender === loginUser ? 'my-side' : 'other-side';
	    var messageDisplay = "<p class='chat_content " + messageClass + "'><strong>" + sender + "</strong><span> " + timestamp + "</span><br>" + content + "</p>";
	    $textarea.append(messageDisplay);
		saveMessage(sender, content, timestamp, messageClass); // 메시지 받을 때 로컬 스토리지에 저장
		$textarea.scrollTop($textarea.prop("scrollHeight"));
	}
	
	 function saveMessage(sender, message, timestamp, messageClass) {
	        var currentContent = $('#messageWindow').html();
	        var messageEntry = "<p class='chat_content " + (sender === loginUser ? "my-side" : "other-side") + "'><strong>" + sender + "</strong> <span> " + timestamp + "</span><br> " + message + "</p>";
	        localStorage.setItem('chatMessages', currentContent + messageEntry);
	    }
	
	function onError(event) {
		alert(event.data);
	}
	
	function onClose(event) {
		alert(event);
	}
});
	
	</script>

</body>
</html>

