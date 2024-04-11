<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intertwine</title>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css">
<link rel="stylesheet" href="/intertwine/resources/css/user/stopPage.css" />
</head>
<script>
function checkEmail() {
	$.ajax({
		url: "emailchk.do",
		type: "post",
		data: {email : $("#femail").val()},
		success: function(data){
			location.href="login.do";
		},
		error: function(jqXHR, textStatus, errorThrown){	
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
}
</script>
<body>
<header> <!-- 페이지 상단 -->
        <div> <!-- 홈 버튼 -->
            <nav class="homebutton_nav">
                <ul>
                    <li class="homebutton"></li>
                </ul>
                <ol>
                    <a href="#"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
                </ol>
            </nav>
        </div>

        <div></div>
        <!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
    </header>
<div class="container">
		<div class="logo-box">
	    	 <h2>휴면 계정 해제</h2>
	    		
	    	 휴면 계정을 해제하고 싶다면 이메일을 입력해주세요.
	    	  <br><br>
	    	  <div class="id-find-box">
			<div class="id-find-email">
				<input type="text" name="email" id="femail" placeholder="이메일 입력">
				<button onclick="checkEmail();">확인</button>
			</div>
		</div>

			
	</div>
</div> 

</body>
</html>