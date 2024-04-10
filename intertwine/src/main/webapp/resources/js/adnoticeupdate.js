// Ajax를 사용하여 공지사항 수정 처리
$('#updateForm').submit(function(e) {
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
            // 수정 성공 시에 대한 처리
            alert('공지사항이 수정되었습니다.');
            window.location.href = "adnlist.do";
        },
        error: function(xhr, status, error) {
            // 수정 실패 시에 대한 처리
            alert('공지사항 수정에 실패했습니다.');
        }
    });
});
