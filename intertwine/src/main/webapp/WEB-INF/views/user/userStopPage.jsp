<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userTime</title>
<link rel="stylesheet" href="/intertwine/resources/css/user/userStopPage.css" />
<script defer src="/intertwine/resources/js/mainpage.js"></script>
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
<script>
function openPopup() {
	  document.getElementById("popup").style.display = "block";
}

// 팝업 닫기 함수
function closePopup() {
  document.getElementById("popup").style.display = "none";
}
function disableButton() {
	var confirmAction = confirm("계정을 비활성화하시겠습니까?");
	 if (confirmAction) {
		 $.ajax({
			 url: 'udisable.do'
			 type: 'POST'
		 });
		 
		 alert("계정이 비활성화되었습니다."); 
	 } else {
		 alert("계정 비활성화가 취소되었습니다.");
		 
	 }
}
function stopButton() {
	var confirm = confirm("계정을 탈퇴하시겠습니까?");
	 if (confirm) {
		 $.ajax({
			 url: 'ustopdel.do'
			 type: 'POST'
		 });
		 
		 alert("계정이 비활성화되었습니다."); 
	 } else {
		 alert("계정 비활성화가 취소되었습니다.");
		 
	 }
}
</script>

</head>
<body>
    <main>
    <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
 <div id="bottom_right_contents">
	<div id="abc">
	    <div id="feed">        
			<div class="box">      
			<div class="logo-box">
				<h3>계정 비활성화</h3>
			</div>
			<div class="body-box">
			<br><br>
			<h4>${sessionScope.loginUser.userName } 님, 안녕하세요.</h4>
			<br> 
				계정을 탈퇴하지 않고 비활성화할 수 있습니다. <br> 
				비활성화 설정시 게시물은 비공개 상태로 전환됩니다.<br><br>
				<hr>
				<br><br>
				계정을 비활성화하시는 이유가 무엇인가요? <br><br>

				<select>
					<option>휴식을 위해서</option>
					<option>계정 보호를 위해서</option>
				</select>
				<br><br>
				추후 비활성화 해제시 비밀번호를 입력하여
				해제할 수 있습니다.
				<br><br>
				<button onclick="disableButton();">계정 비활성화</button>
				<br><hr><br>
				
				혹은 계정 탈퇴를 원하시면 계정탈퇴 버튼을 눌러주세요.
				<br><br>
				<button onclick="stopButton();">계정 탈퇴</button>
				<br>
				
				</div>
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/common/chatbot.jsp"></c:import>
</main>
</body>
</html>