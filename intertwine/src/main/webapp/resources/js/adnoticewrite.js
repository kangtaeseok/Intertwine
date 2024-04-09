// Ajax를 사용하여 공지사항 등록 처리
$('#writeForm').submit(function(e) {
    e.preventDefault(); // 폼 기본 동작 방지
    var form = $(this);
    var url = form.attr('action');
    var method = form.attr('method');
    var data = form.serialize(); // 폼 데이터 직렬화

    $.ajax({
        type: method,
        url: url,
        data: data,
        success: function(response) {
            // 등록 성공 시에 대한 처리
            alert('공지사항이 등록되었습니다.');
            window.location.href = "adnlist.do";
        },
        error: function(xhr, status, error) {
            // 등록 실패 시에 대한 처리
            alert('공지사항 등록에 실패했습니다.');
        }
    });
});
