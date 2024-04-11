<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTime</title>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<link rel="stylesheet" href="/intertwine/resources/css/user/userTimePage.css" />
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<script>
function openPopup() {
	  document.getElementById("popup").style.display = "block";
	}

// 팝업 닫기 함수
function closePopup() {
  document.getElementById("popup").style.display = "none";
}
	
function openPopup2() {
	  document.getElementById("popup2").style.display = "block";
	}

// 팝업 닫기 함수
function closePopup2() {
  document.getElementById("popup2").style.display = "none";
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
				<img src="/intertwine/resources/images/intertwinelogo.png" width="150px;" height="30px;"> &nbsp;&nbsp;  <h3>이용시간</h3>
			</div>
				<center>
				<div class="usage-time">
					 ${loginUser.userName } 님의
					 <br> 이용시간은 ${time} 분 입니다.
				</div>
				<div class="chart-box">
					<canvas ID="myChart"></canvas>
				 	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
				</div>
				</center>
			</div>
			
			<div class="time-setting-box">
				<div class="logo-box">
				
				</div>
				<div class="time-set-box">
					<div class="set-box">
					<center>
					<h3>알림 설정</h3>
					
					
						<div class="set1">
							<div class="set2"><button onclick="openPopup();"><h3>커스텀 알림보내기 <i class="fa-solid fa-pen"></i></h3></button></div>
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
							<div class="set2"><button onclick="openPopup2();"><h3>기본 제공 알림보내기</h3></a></div>
							<div id="popup2" class="popup">
							    <form class="popup-content" action="userSetTime.do">
							    			<div>기본 제공알림으로 바꾸시겠습니까?</div>
							        <input type="submit" value="확인" onclick="closePopup2();">
							    </form>
							</div>
						</div>
						
						
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
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