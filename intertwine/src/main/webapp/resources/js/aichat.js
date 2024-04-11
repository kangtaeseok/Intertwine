
$(document).ready(function () {
    // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
    $(window).resize(function () {
        if ($(window).width() > 1262) {
            // mypage_sub_menu의 left 값을 75px로 변경
            $('#mypage_sub_menu').css('left', '240px');
            $('#chatting_sub_menu').css('left', '240px');
            $('#alarm_sub_menu').css('left', '240px');
            $('#settings_sub_menu').css('left', '240px');
        } 
    });
    
     // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
     $(window).resize(function () {
        if ($(window).width() <= 1262) {
            // mypage_sub_menu의 left 값을 75px로 변경
            $('#mypage_sub_menu').css('left', '75px');
            $('#chatting_sub_menu').css('left', '75px');
            $('#alarm_sub_menu').css('left', '75px');
            $('#settings_sub_menu').css('left', '75px');
        } 
    });
    
    // 화면 크기가 1279px 이하일 때 서브메뉴의 위치 변경
    if ($(window).width() > 1262) {
        // mypage_sub_menu의 left 값을 75px로 변경
        $('#mypage_sub_menu').css('left', '240px');
        $('#chatting_sub_menu').css('left', '240px');
        $('#alarm_sub_menu').css('left', '240px');
        $('#settings_sub_menu').css('left', '240px');
    }
    
    
    // 화면 크기가 1279px 이하일 때 서브메뉴의 위치 변경
    if ($(window).width() <= 1262) {
        // mypage_sub_menu의 left 값을 75px로 변경
        $('#mypage_sub_menu').css('left', '75px');
        $('#chatting_sub_menu').css('left', '75px');
        $('#alarm_sub_menu').css('left', '75px');
        $('#settings_sub_menu').css('left', '75px');
    }
    

});

$(function(){
    var screenWidth = $(window).width();

    if (screenWidth > 1262) {
        // 화면 너비가 768px보다 작을 때 실행할 코드
        $('#mypage_sub_menu').css('left', '240px');
        $('#chatting_sub_menu').css('left', '240px');
        $('#alarm_sub_menu').css('left', '240px');
        $('#settings_sub_menu').css('left', '240px');
    } else if (screenWidth >= 768 && screenWidth <= 1262) {
        // 화면 너비가 768px 이상이고 1024px보다 작을 때 실행할 코드
        $('#mypage_sub_menu').css('left', '75px');
        $('#chatting_sub_menu').css('left', '75px');
        $('#alarm_sub_menu').css('left', '75px');
        $('#settings_sub_menu').css('left', '75px');
    } else {
        // 화면 너비가 1024px 이상일 때 실행할 코드
        console.log("큰 화면");
    }

});


$(document).ready(function () {
    // 창 크기가 변경될 때마다 호출하여 화면 크기에 따라 서브메뉴의 위치를 조정
    $(window).resize(function () {
        if ($(window).width() > 1262) {
            // mypage_sub_menu의 left 값을 75px로 변경
            $('#mypage_sub_menu').css('left', '240px');
            $('#chatting_sub_menu').css('left', '240px');
            $('#alarm_sub_menu').css('left', '240px');
            $('#settings_sub_menu').css('left', '240px');
        } else {
            // mypage_sub_menu의 left 값을 240px로 변경
            $('#mypage_sub_menu').css('left', '75px');
            $('#chatting_sub_menu').css('left', '75px');
            $('#alarm_sub_menu').css('left', '75px');
            $('#settings_sub_menu').css('left', '75px');
        }
    });
    
    // 초기 로딩 시에도 한 번 실행하여 화면 크기에 따라 서브메뉴의 위치 조정
    if ($(window).width() > 1262) {
        // mypage_sub_menu의 left 값을 75px로 변경
        $('#mypage_sub_menu').css('left', '240px');
        $('#chatting_sub_menu').css('left', '240px');
        $('#alarm_sub_menu').css('left', '240px');
        $('#settings_sub_menu').css('left', '240px');
    } else {
        // mypage_sub_menu의 left 값을 240px로 변경
        $('#mypage_sub_menu').css('left', '75px');
        $('#chatting_sub_menu').css('left', '75px');
        $('#alarm_sub_menu').css('left', '75px');
        $('#settings_sub_menu').css('left', '75px');
    }
});

// 현재 시간 가져오기
function getCurrentTime() {
    const now = new Date();
    const hours = now.getHours().toString().padStart(2, '0');
    const minutes = now.getMinutes().toString().padStart(2, '0');
    return `${hours}:${minutes}`;
}

// 각 메시지의 시간 업데이트
function updateTimeForMessages() {
    $('.chatbot-text').each(function() {
        const sentTime = $(this).attr('sentTime');
        if (sentTime) {
            $(this).text(`${$(this).text()} - ${sentTime}`);
        }
    });
}

// 입력 양식에 이벤트 수신기 추가
$(document).ready(function() {
    $('#input-aichat').submit(function(event) {
        event.preventDefault(); // Prevent form submission

        const keyword = $('#input-acfield').val(); // Get input keyword

        // 대화에 사용자 메시지 추가 시간
        const currentTime = getCurrentTime();
        const userMessage = $('<div class="user-message"><p class="chatbot-text" sentTime="' + currentTime + '">' + keyword + '</p></div>');
        $('#conversation').append(userMessage);

        // 채팅시 아래로 스크롤
        scrollToBottom();

        // AJAX 요청 전송
        $.ajax({
            type: 'POST',
            url: 'sendaichat.do',
            data: { keyword: keyword },
            success: function(response) {
                // Display chatbot response
                displayResponse(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', error);
            }
        });
    });

    // 챗봇 응답 표시
    function displayResponse(response) {
        // 대화에 챗봇 메시지 추가
        const currentTime = getCurrentTime();
        const message = $('<div class="chatbot-message"><p class="chatbot-text" sentTime="' + currentTime + '">' + response + '</p></div>');
        $('#conversation').append(message);

        // 입력 필드 지우기
        $('#input-acfield').val('');

        // 채팅시 아래로 스크롤
        scrollToBottom();
    }

    // 대화를 아래로 스크롤
    function scrollToBottom() {
        const chatWindow = $('#conversation');
        chatWindow.scrollTop(chatWindow[0].scrollHeight);
    }

    // 메시지 시간 업데이트
    updateTimeForMessages();
});
