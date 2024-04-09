<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTime</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<link rel="stylesheet" href="/intertwine/resources/css/userTimePage.css" />
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<script>
function openPopup() {
	  document.getElementById("popup").style.display = "block";
	}

	// 팝업 닫기 함수
	function closePopup() {
	  document.getElementById("popup").style.display = "none";
	}
</script>
</head>
<body>
    <main>
       <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>    
<div id="bottom_right_contents">
	<div id="abc">
	            <div id="feed">     
		<div class="time-box">
			<div class="logo-box">
				<h3>이용시간</h3>
			</div>
				<div class="usage-time">
					 ${time} 분
				</div>
				<div class="chart-box">
					<canvas ID="myChart"></canvas>
				 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				</div>
			</div>
			<div class="time-setting-box">
				<div class="logo-box">
				<h3>시간 설정</h3>
				</div>
				<div class="time-set-box">
					<div class="set-box">
					<center>
						<div class="set1">
							<div class="set2"><button onclick="openPopup();"><h4>커스텀 알림보내기 <i class="fa-solid fa-pen"></i></h4></button></div>
							<div id="popup" class="popup">
							    <form class="popup-content" action="customTime.do">
							        <label for="message">메시지 :</label>
							        <input type="text" id="message" name="message"><br><br>
							        <input type="submit" value="전송" onclick="closePopup();">
							        <input type="reset" value="취소" onclick="closePopup();">
							    </form>
							</div>
						</div>
						<div class="set1">
							<div class="set2"><a href="userSetTime.do"><h4>기본 제공 알림보내기</h4></a></div>
						</div>
						<div class="set1">
							<div class="set2"><h4>시간 알림 차단하기</h4> &nbsp; <input type="checkbox"></div>
						</div>
						</center>
					</div>
				</div>
			</div>
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

<script>
	const ctx = document.getElementById('myChart');
	new Chart(ctx, {
	  type: 'pie',
	  data: {
	    labels: ['하루(시)', '이용시간(시)'],
	    datasets: [{
	      label: '하루 이용 시간',
	      data: [1440 / 60,'${time}'/60],
	    }]
	  },
	  options: {
	  }
	});
</script>
</body>
</html>