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
 
<script>
  Kakao.init('22a79ab4edf01049e6e5ede31d8ab61b');
  
  ACCESS_TOKEN = "PYdsNX0_FaS11BFARs-1aCrtInvU_1b36g8KKclgAAABjsbLGc2SBpCp5rpDbg"

  function fetchFriends() {
    Kakao.API.request({
      url: '/v1/api/talk/friends',
      Authorization: Bearer ${ACCESS_TOKEN},      
    })
    .then(function(response) {
      console.log(response);
      // Handle the response here
    })
    .catch(function(error) {
      console.log(error);
      // Handle errors here
    });
  }
</script>
</head>
<body>


<button onclick="fetchFriends()">Fetch Friends</button>
</body>
</html>

