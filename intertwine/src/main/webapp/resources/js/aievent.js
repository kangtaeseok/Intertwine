document.querySelector('.homebutton').addEventListener('click', function () {
    // 홈 버튼을 클릭했을 때 실행할 동작을 여기에 작성합니다.
    // 예를 들어, 홈 페이지로 이동하는 코드 등을 작성할 수 있습니다.
    window.location.href = '#'; // 홈 페이지로 이동하는 예시
});

// jQuery를 사용하여 미디어 쿼리를 적용
$(document).ready(function () {
    var originalContents = {  // 원래 속성을 변수에 저장
        square: '<a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>',
        mypage: '<a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>',
        friend: '<a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>',
        chatting: '<a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>',
        alarm: '<a href="#"><i class="fa-solid fa-bell"></i> 알림</a>',
        bookmark: '<a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>',
        settings: '<a href="#"><i class="fa-solid fa-gear"></i> 설정</a>'
    };

    // 페이지 크기가 1279px 이하일 때 '스퀘어' 텍스트를 지우고 아이콘만 남깁니다.
    /*  JavaScript 코드와 CSS의 미디어 쿼리 사이에 일치하지 않는 부분이 있을 수 있습니다. 이는 화면 너비를 검사하는 방식의 차이 때문에 발생할 수 있습니다. 조정이 필요할 수 있습니다.*/
    if ($(window).width() <= 1262) {
        // 사이드 바 메뉴 아이콘 변경
        $('.side-bar > ul > li > a').each(function () {
            // 해당 메뉴의 아이콘 클래스를 가져와서 변경
            var iconClass = $(this).children('i').attr('class');
            $(this).html('<i class="' + iconClass + '"></i>');
        });

        mypage.addEventListener('click', function () {
            let isOn2 = mypage_sub_menu.classList.contains("on");
        
            if (isOn2) {
                mypage_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                mypage_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                mypage_sub_menu.style.left = "75px";
                
            }
        });
        
        chatting.addEventListener('click', function () {
            let isOn2 = chatting_sub_menu.classList.contains("on");
        
            if (isOn2) {
                chatting_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                chatting_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                chatting_sub_menu.style.left = "75px";
            }
        });
        
        alarm.addEventListener('click', function () {
            let isOn2 = alarm_sub_menu.classList.contains("on");
        
            if (isOn2) {
                alarm_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                alarm_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                alarm_sub_menu.style.left = "75px";
            }
        });
        
        settings.addEventListener('click', function () {
            let isOn2 = settings_sub_menu.classList.contains("on");
        
            if (isOn2) {
                settings_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                settings_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                settings_sub_menu.style.left = "75px";
            }
        });

    } else {
        // 페이지 크기가 축소되지 않으면 아이콘을 원래 텍스트로 변경
        $('.side-bar > ul > li > a').each(function () {
            var originalText = $(this).parent().attr('original-text');
            $(this).html(originalText);
        });


        mypage.addEventListener('click', function () {
            let isOn2 = mypage_sub_menu.classList.contains("on");
        
            if (isOn2) {
                mypage_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                mypage_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                mypage_sub_menu.style.left = "240px";
                
            }
        });
        
        chatting.addEventListener('click', function () {
            let isOn2 = chatting_sub_menu.classList.contains("on");
        
            if (isOn2) {
                chatting_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                chatting_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                chatting_sub_menu.style.left = "240px";
            }
        });
        
        alarm.addEventListener('click', function () {
            let isOn2 = alarm_sub_menu.classList.contains("on");
        
            if (isOn2) {
                alarm_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                alarm_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                alarm_sub_menu.style.left = "240px";
            }
        });
        
        settings.addEventListener('click', function () {
            let isOn2 = settings_sub_menu.classList.contains("on");
        
            if (isOn2) {
                settings_sub_menu.classList.remove("on");
                dummy_sub_menu.classList.remove("on");
            } else {
                // 서브메뉴가 왼쪽에서 오른쪽으로 슬라이딩되도록 변경
                $(".sub_menu.on").removeClass("on").css("left", "-100%");
                settings_sub_menu.classList.add("on");
                dummy_sub_menu.classList.add("on");
                settings_sub_menu.style.left = "240px";
            }
        });
    }

    $(window).resize(function () {
        if ($(window).width() <= 1262) {
            $('.side-bar > ul > li#square > a').each(function () {
                $(this).html('<i class="fa-solid fa-gamepad"></i>');
            });
            $('.side-bar > ul > li#mypage > a').each(function () {
                $(this).html('<i class="fa-solid fa-circle-user"></i>');
            });
            $('.side-bar > ul > li#friend > a').each(function () {
                $(this).html('<i class="fa-solid fa-user-group"></i>');
            });
            $('.side-bar > ul > li#chatting > a').each(function () {
                $(this).html('<i class="fa-solid fa-comment"></i>');
            });
            $('.side-bar > ul > li#alarm > a').each(function () {
                $(this).html('<i class="fa-solid fa-bell">');
            });
            $('.side-bar > ul > li#bookmark > a').each(function () {
                $(this).html('<i class="fa-solid fa-bookmark"></i>');
            });
            $('.side-bar > ul > li#settings > a').each(function () {
                $(this).html('<i class="fa-solid fa-gear"></i>');
            });
        } else {
            $('.side-bar > ul > li').each(function () {
                var id = $(this).attr('id');
                $(this).html(originalContents[id]);
            });
        }
    });
});
const content1 = document.querySelector("#bottom_right_contents");
const sidebarItems1 = document.querySelectorAll('.side-bar > ul > li');
const submenu1 = document.querySelector(".sub_menu");
const mypage1 = document.querySelector("#mypage");
const chatting1 = document.querySelector("#chatting");
const alarm1 = document.querySelector("#alarm");
const settings1 = document.querySelector("#settings");
const mypage_sub_menu1 = document.querySelector("#mypage_sub_menu");
const chatting_sub_menu1 = document.querySelector("#chatting_sub_menu");
const alarm_sub_menu1 = document.querySelector("#alarm_sub_menu");
const settings_sub_menu1 = document.querySelector("#settings_sub_menu");


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


const floatingButton = document.getElementById('floatingButton');
const layer = document.getElementById('layer');


// 클릭 이벤트를 처리하는 함수
function toggleChatbot() {
    // 현재 챗봇 레이어의 상태를 가져옵니다.
    const currentDisplayStyle = window.getComputedStyle(layer).getPropertyValue('display');

    // 챗봇 레이어가 이미 보이는 경우에는 숨깁니다.
    if (currentDisplayStyle === 'block') {
        layer.style.display = 'none';
    } 
    // 그렇지 않은 경우에는 보이게 합니다.
    else {
        layer.style.display = 'block';
    }
}

// 클릭 이벤트 리스너를 추가합니다.
floatingButton.addEventListener('click', toggleChatbot);

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
    $('#input-aievent').submit(function(event) {
        event.preventDefault(); // Prevent form submission

        const keyword = $('#input-aefield').val(); // Get input keyword

        // 대화에 사용자 메시지 추가 시간
        const currentTime = getCurrentTime();
        const userMessage = $('<div class="user-message"><p class="chatbot-text" sentTime="' + currentTime + '">' + keyword + '</p></div>');
        $('#conversation').append(userMessage);

        // 채팅시 아래로 스크롤
        scrollToBottom();

        // AJAX 요청 전송
        $.ajax({
            type: 'POST',
            url: 'sendaievent.do',
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
        $('#input-aefield').val('');

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
