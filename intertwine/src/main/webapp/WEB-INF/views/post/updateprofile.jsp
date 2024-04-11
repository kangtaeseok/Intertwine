<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css"> <!-- 이 jsp파일의 css파일 연결 -->
<script src="/intertwine/resources/js/kakao.min.js"></script>
<script defer src="/intertwine/resources/js/mainpage.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
<script>
Kakao.init('40ec0da7a298d729eab6f57f66aad7f8');
console.log(Kakao.isInitialized()); 
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        	location.href="login.do";
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  

</script>
<c:import url="/WEB-INF/views/common/common.jsp"></c:import>
</head>
<body>
    
    <main>
       <c:import url="/WEB-INF/views/common/menubar.jsp"></c:import>
        <div id="bottom_right_contents" style="padding-top:30px">
<div style="background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); width: 300px; margin: auto;">
    <form action="myprofileupdate.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="userId" value="${ sessionScope.loginUser.userId }">
        <div id="profilePicPreview" style="position: relative; width: 150px; height: 150px; border-radius: 50%; background-color: #eee; text-align: center; line-height: 150px; margin: 20px auto; color: #666; font-size: 16px; overflow: hidden;">
            프리뷰
        </div>
        <label style="display: block; background-color: plum; color: white; text-align: center; padding: 8px 16px; margin: 10px auto; border: none; border-radius: 4px; cursor: pointer;">
            사진 업로드
            <input type="file" name="ofile" id="profilePicInput" accept="image/*" style="display: none;">
        </label>

        <div style="margin-bottom: 15px;">
            <label>닉네임</label>
            <input type="text" name="nickname" placeholder="닉네임을 입력해주세요" style="width: calc(100% - 20px); padding: 10px; border-radius: 4px; border: 1px solid #ccc; height: 35px; resize: none;">
        </div>
        <div style="margin-bottom: 15px;">
            <label>바이오</label>
            <textarea name="statusMessage" placeholder="바이오를 입력해주세요" style="width: calc(100% - 20px); padding: 10px; border-radius: 4px; border: 1px solid #ccc; height: 60px; resize: none;"></textarea>
        </div>
        <button type="submit" style="background-color: plum; color: white; border: none; padding: 10px 20px; margin-right: 10px; border-radius: 4px; cursor: pointer;">정보수정</button>
        <button type="button" class="back-btn" onclick="window.history.back();" style="background-color: #666; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">뒤로가기</button>
    </form>
</div>

<script>
    document.getElementById('profilePicInput').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('profilePicPreview');
                preview.innerHTML = '<img src="' + e.target.result + '" alt="Profile Picture">';
            };
            reader.readAsDataURL(file);
        }
    });
</script>
        </div>
    </main>
</body>

</html>