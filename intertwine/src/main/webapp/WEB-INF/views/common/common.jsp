<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->

<link rel="stylesheet" href="/intertwine/resources/css/aievent.css">

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- js 파일 -->
<script defer src="/intertwine/resources/js/aievent.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script src="/intertwine/resources/js/kakao.min.js"></script>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
<meta charset="UTF-8">
<title></title>
<script>

function requestNotificationPermissionAndFetchTime() {
    if (!window.Notification) {
        console.log("이 브라우저는 알림을 지원하지 않습니다.");
        return;
    }

    if (Notification.permission === 'granted') {
        fetchUserUseTime();
    } else if (Notification.permission !== 'denied') {
        Notification.requestPermission().then(permission => {
            if (permission === 'granted') {
                fetchUserUseTime();
            } else {
                console.log('알림 권한이 거부되었습니다.');
            }
        });
    }
}

function fetchUserUseTime() {
    fetch('getUserTime.do', {
        method: 'POST', 
        credentials: 'include',
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('사용 시간 정보를 가져오는 데 실패했습니다.');
        }
        return response.text();
    })
    .then(time => {
        showNotification(time);
    })
    .catch(error => {
        console.error('에러:', error);
    });
}

function showNotification(time) {
    if (Notification.permission === 'granted' && time != null) {
        new Notification('사용 시간', {
            icon: 'https://ibb.co/qsGy2dn',
            body: decodeURIComponent(time).replace(/\+/gi, " ") 
        }).onclick = function () {
            window.open('http://localhost:8080/intertwine/');
        };
    }
}

requestNotificationPermissionAndFetchTime();
setInterval(fetchUserUseTime, 3600000);


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

</head>
<body>
<header> <!-- 페이지 상단 -->
        <div> <!-- 홈 버튼 -->
            <nav class="homebutton_nav">
                <ul>
                    <li class="homebutton"></li>
                </ul>
                <ol>
                    <a href="${pageContext.servletContext.contextPath}/main.do"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
                </ol>
            </nav>
        </div>
        <!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
    </header>
</body>
</html>