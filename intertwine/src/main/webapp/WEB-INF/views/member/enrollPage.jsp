<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
table th { background-color: #9ff; }
table#outer { border: 2px solid navy; }
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
//전송 보내기 전에 입력값들 유효한 값인지 확인용 함수
function validate(){
	
	//암호와 암호확인이 일치하지 않는지 확인
	//var pwdValue = document.getElementById("userpwd").value;
	//var pwdValue2 = document.getElementById("userpwd2").value;
	//jQuery 선택자 사용으로 바꾼다면
	var pwdValue = $('#userpwd').val();
	var pwdValue2 = $('#userpwd2').val();
	
	if(pwdValue !== pwdValue2){
		alert("암호와 암호확인이 일치하지 않습니다. 다시 입력하세요.");
		document.getElementById("userpwd2").value = "";
		document.getElementById("userpwd").select();
		return false;  //전송 취소함
	}
	
	//아이디의 값 형식이 요구한 대로 작성되었는지 검사
	//암호의 값 형식이 요구한 대로 작성되었는지 검사
	//정규표현식(Regular Expression) 사용함
	
	return true;  //전송보냄
}
function dupIDCheck(){
	//사용 가능한 아이디인지 확인하는 함수 : ajax 기술 사용해야 함
	
	$.ajax({
		url: "idchk.do",
		type: "post",
		data: { userid: $('#userid').val() },
		success: function(data){
			console.log("success : " + data);
			if(data == "ok"){
				alert("사용 가능한 아이디입니다.");
				$('#userpwd').focus();
			}else{
				alert("이미 사용중인 아이디입니다.");
				$('#userid').select();
			}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	
	return false;  //버튼 클릭이벤트 취소 (submit 버튼에 클릭이벤트 전달을 막기 위함)
}

window.onload = function(){
	//선택한 사진파일 이미지 미리보기 처리
	var photofile = document.getElementById("photofile");
	photofile.addEventListener('change', function(event){		
		const files = event.currentTarget.files;
	    const file = files[0];
	    const myphoto = document.getElementById("photo");	    
	    console.log(file.name);
	    
	    const reader = new FileReader();
        reader.onload = (e) => {          
          myphoto.setAttribute('src', e.target.result);
          myphoto.setAttribute('data-file', file.name);
        };
        reader.readAsDataURL(file);    
	});
}
</script>
</head>
<body>
<h1 align="center">회원 가입 페이지</h1>
<br>
<!-- 사진파일 첨부시 enctype="multipart/form-date" 속성 추가함 -->
<form action="enroll.do" id="enrollForm" method="post" onsubmit="return validate();">
<table id="outer" align="center" width="700" cellspacing="5" cellpadding="0">
	<tr><th colspan="3">회원 정보를 입력해 주세요. (* 표시는 필수입력 항목입니다.)</th></tr>
	<tr><th width="120">*아이디</th>
		<td><input type="text" name="userId" id="userid" required> &nbsp;
			<input type="button" value="중복체크" onclick="return dupIDCheck();">
		</td>
		<td rowspan="7" width="180" align="center" valign="middle">
			<div id="myphoto" 
			style="margin:0;width:150px;height:160px;padding:0;border:1px solid navy;">
				<img src="/first/resources/member_photofiles/preview.jpg" id="photo" 				
				style="width:150px;height:160px;border:1px solid navy;display:block;"
				alt="사진을 드래그 드롭하세요." 
				style="padding:0;margin:0;"><br>				
			</div>		
		</td>
	</tr>
	<tr><th>*암호</th>
	<td><input type="password" name="userPwd" id="userpwd" required></td></tr>
	<tr><th>*암호확인</th>
	<td><input type="password" id="userpwd2" required></td></tr>
	<tr><th>*이름</th>
	<td><input type="text" name="userName" required></td></tr>
	<tr><th>*성별</th>
	<td>
		<input type="radio" name="gender" value="M"> 남자 &nbsp;
		<input type="radio" name="gender" value="F"> 여자
	</td></tr>
	<tr><th>*나이</th>
	<td><input type="number" name="age" min="19" value="20" required></td>	
	</tr>
	<tr><th>*전화번호</th>
	<td><input type="tel" name="phone" required></td>	
	<tr><th>*이메일</th>
	<td><input type="email" name="email" required></td>
	<td align="right"><input type="file" name="photofile" id="photofile" value=""></td>
	</tr>
	<tr><th>취미(연습용)</th>
	<td colspan="2">
		<table width="350">
		<tr>
			<td><input type="checkbox" name="hobby" value="game"> 게임</td>
			<td><input type="checkbox" name="hobby" value="reading"> 독서</td>
			<td><input type="checkbox" name="hobby" value="climb"> 등산</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hobby" value="sport"> 운동</td>
			<td><input type="checkbox" name="hobby" value="music"> 음악</td>
			<td><input type="checkbox" name="hobby" value="movie"> 영화</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="hobby" value="travel"> 여행</td>
			<td><input type="checkbox" name="hobby" value="gook"> 요리</td>
			<td><input type="checkbox" name="hobby" value="etc" checked> 기타</td>
		</tr>
		</table>
	</td></tr>
	<tr><th>기타 정보(연습용)</th>
	<td colspan="2"><textarea name="etc" rows="3" cols="50"></textarea></td></tr>
	<tr><th colspan="3">
		<input type="submit" value="가입하기"> &nbsp;
		<input type="reset" value="작성취소"> &nbsp;
		<a href="main.do">시작페이지로 이동</a>
	</th></tr>
</table>
</form>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>


</html>