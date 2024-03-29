document.querySelector('.homebutton').addEventListener('click', function() {
    // 홈 버튼을 클릭했을 때 실행할 동작을 여기에 작성합니다.
    // 예를 들어, 홈 페이지로 이동하는 코드 등을 작성할 수 있습니다.
    window.location.href = '#'; // 홈 페이지로 이동하는 예시
});

 // jQuery를 사용하여 미디어 쿼리를 적용
 $(document).ready(function () {
 	var originalContents = {  // 원래 속성을 변수에 저장
    	a: '<a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>',
        b: '<a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>',
        c: '<a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>',
        d: '<a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>',
        e: '<a href="#"><i class="fa-solid fa-bell"></i> 알림</a>',
        f: '<a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>',
        g: '<a href="#"><i class="fa-solid fa-gear"></i> 설정</a>'
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
} else {
// 페이지 크기가 축소되지 않으면 아이콘을 원래 텍스트로 변경
	$('.side-bar > ul > li > a').each(function () {
		var originalText = $(this).parent().attr('original-text');
		$(this).html(originalText);
	});
}

	$(window).resize(function () {
		if ($(window).width() <= 1262) {
			$('.side-bar > ul > li#a > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-gamepad"></i>');
	        });
	        $('.side-bar > ul > li#b > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-circle-user"></i>');
	        });
	        $('.side-bar > ul > li#c > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-user-group"></i>');
	        });
	        $('.side-bar > ul > li#d > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-comment"></i>');
	        });
	        $('.side-bar > ul > li#e > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-bell">');
	        });
	        $('.side-bar > ul > li#f > a').each(function () {
	        	$(this).html('<i class="fa-solid fa-bookmark"></i>');
	        });
			$('.side-bar > ul > li#g > a').each(function () {
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
                    
        const sidebarItems = document.querySelectorAll('.side-bar > ul > li');
        const content = document.querySelector("#bottom_right_contents");
        const submenu = document.querySelector(".sub_menu");

        sidebarItems.forEach(function (item) {
            item.addEventListener('click', function () {
                let isOn = content.classList.contains("on");
                console.log(isOn);

                if (isOn) {
                    content.classList.remove("on");
                } else {
                    content.classList.add("on");
                }

                let isOn2 = submenu.classList.contains("on");
                console.log(isOn);

                if (isOn2) {
                    submenu.classList.remove("on");
                } else {
                    submenu.classList.add("on");
                }

            });
        });
        
        $(function(){
	//input 태그의 name 이 item 의 값이 바뀌면(change) 작동되는 이벤트 핸들러 작성
	$('input[name=item]').on('change', function(){
		//여러 개의 태그 중에서 체크표시가 된 태그를 선택
		$('input[name=item]').each(function(index){
			//선택된 radio 순번대로 하나씩 checked 인지 확인함
			if($(this).is(':checked')){
				//체크 표시된 아이템에 대한 폼이 보여지게 처리함
				$('form.sform').eq(index).css('display', 'block');
			}else{
				//체크 표시 안된 아이템의 폼은 안 보이게 처리함
				$('form.sform').eq(index).css('display', 'none');
			}
		});  //each
	});  //on
});  //document ready