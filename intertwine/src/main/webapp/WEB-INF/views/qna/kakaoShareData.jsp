<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Kakao JavaScript SDK</title>
 <!--  <script src="https://t1.kakaocdn.net/kakao_js_sdk/${VERSION}/kakao.min.js"
    integrity="${INTEGRITY_VALUE}" crossorigin="anonymous"></script> -->
    
  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
     integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
</head>
<body>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.1/kakao.min.js"
  integrity="sha384-kDljxUXHaJ9xAb2AzRd59KxjrFjzHa5TAoFQ6GbYTCAG0bjM55XohjjDT7tDDC01" crossorigin="anonymous"></script>
<script>
  Kakao.init('22a79ab4edf01049e6e5ede31d8ab61b'); // 사용하려는 앱의 JavaScript 키 입력
</script>

<a id="kakaotalk-sharing-btn" href="javascript:;">
  <img src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
    alt="카카오톡 공유 보내기 버튼" />
</a>

<script>
  Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '딸기 치즈 케익',
      description: '#케익 #딸기 #삼평동 #카페 #분위기 #소개팅',
      imageUrl:
        'http://k.kakaocdn.net/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'https://developers.kakao.com',
        webUrl: 'https://developers.kakao.com',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
    ],
  });
</script>
</body>
</html>

