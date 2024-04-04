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
const content = document.querySelector("#bottom_right_contents");
const sidebarItems = document.querySelectorAll('.side-bar > ul > li');
const submenu = document.querySelector(".sub_menu");
const mypage = document.querySelector("#mypage");
const chatting = document.querySelector("#chatting");
const alarm = document.querySelector("#alarm");
const settings = document.querySelector("#settings");
const mypage_sub_menu = document.querySelector("#mypage_sub_menu");
const chatting_sub_menu = document.querySelector("#chatting_sub_menu");
const alarm_sub_menu = document.querySelector("#alarm_sub_menu");
const settings_sub_menu = document.querySelector("#settings_sub_menu");


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

window.addEventListener('load', function() {
    // 최소 7초 후 로딩 이미지 숨김 처리
    setTimeout(function() {
        document.getElementById('loadingview').classList.add('hidden');
        document.getElementById('squaretip').classList.add('hidden');
    }, 7000); // 1000ms = 1초
});