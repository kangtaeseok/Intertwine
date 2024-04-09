$(function() {   
    $('input[name=item]').on('change', function() {
        $('input[name=item]').each(function(index) {
            $('form.sform').eq(index).css('display', 'block');
        });
    });
    
    function toggleAccordion(element) {
        var content = element.querySelector('.notice-content');
        if (content.style.maxHeight) {
            // 내용이 이미 열려있는 경우 닫습니다.
            content.style.maxHeight = null;
            element.classList.remove("active");
        } else {
            // 내용이 닫혀있는 경우 열고, 다른 공지사항들을 아래로 밀어냅니다.
        	var accordions = document.querySelectorAll('.notice-item .notice-content');
        	for (var i = 0; i < accordions.length; i++) {
        	    accordions[i].style.maxHeight = null;
        	    accordions[i].parentNode.classList.remove("active");
        	}
        	content.style.maxHeight = content.scrollHeight + "px";
        	element.classList.add("active");
        }
    }

    // 각 공지사항 제목에 클릭 이벤트를 추가하여 toggleAccordion 함수 호출
    var noticeTitles = document.querySelectorAll('.notice-title');
    noticeTitles.forEach(function(title) {
        title.addEventListener('click', function() {
            this.classList.toggle('active'); // 제목에 active 클래스 토글
            toggleAccordion(this); // toggleAccordion 함수 호출
            
        });
    });
});

