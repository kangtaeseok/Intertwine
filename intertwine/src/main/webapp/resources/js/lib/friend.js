// 팔로잉, 팔로워 수 불러오는 ajax 통신 코드 ---------------------------------------------------------------------------------
$(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countFollowing.do', // 컨트롤러의 경로
        type: 'GET',
        data: { userId: userId },
        success: function(response) {
        	$("#followingCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});

$(document).ready(function() {
    // 로그인한 사용자의 ID 가져오기
    var userId = '${sessionScope.loginUser.userId}'; // 세션에서 userID 가져오기

    // AJAX 요청으로 userID 컨트롤러로 보내기
    $.ajax({
        url: 'countFollowers.do', // 컨트롤러의 경로
        type: 'GET',
        data: { userId: userId },
        success: function(response) {
        	  $("#followersCount").text(response);
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
});