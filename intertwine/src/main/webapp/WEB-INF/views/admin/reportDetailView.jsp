<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nowpage" value="1"/>
<c:if test="${!empty requestScope.currentPage}">
	<c:set var="nowpage" value="${currentPage}" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportPage</title>
<link rel="stylesheet" href="/intertwine/resources/css/admin/reportDetailView.css" />
<c:import url="/WEB-INF/views/common/adcommon.jsp"></c:import>
<script>
function updateButtonState() {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    let isAnyChecked = false; 
    
    checkboxes.forEach(checkbox => {
        if (checkbox.checked) {
            isAnyChecked = true;
        }
    });
    document.getElementById('hideButton').disabled = !isAnyChecked;
    document.getElementById('hideButton2').disabled = !isAnyChecked;
}

document.querySelectorAll('input[type="checkbox"]').forEach(checkbox => {
    checkbox.addEventListener('change', updateButtonState);
});

// 페이지 로드 시 버튼 상태 업데이트
window.onload = updateButtonState;

function toggleCheckboxes(source) {
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (let i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i] != source) {
            checkboxes[i].checked = source.checked;
        }
    }
    updateButtonState();
}


function sendCheckedIds() {
    // 체크된 체크박스를 모두 찾습니다.
    const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked:not(#selectAll)');
    if (checkboxes.length > 0) {
        const reportIds = Array.from(checkboxes).map(checkbox => checkbox.value);
        
        fetch('delContent.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'reportId': reportIds
            })
        })
        .then(response => {
            if (response.ok) {
                alert('처리 상태가 성공적으로 변경되었습니다.');
                location.reload();
            } else {
                alert('처리 상태 변경에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('처리 중 오류가 발생했습니다.');
        });
    } else {
        alert('신고를 선택해주세요.');
    }
}

function sendCheckedIds2() {
    // 체크된 체크박스를 모두 찾습니다.
    const checkboxes = document.querySelectorAll('input[type="checkbox"]:checked:not(#selectAll)');
    if (checkboxes.length > 0) {
        const reportIds = Array.from(checkboxes).map(checkbox => checkbox.value);
        
        fetch('upStatus.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'reportId': reportIds
            })
        })
        .then(response => {
            if (response.ok) {
                alert('처리 상태가 성공적으로 변경되었습니다.');
                location.reload();
            } else {
                alert('처리 상태 변경에 실패했습니다.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('처리 중 오류가 발생했습니다.');
        });
    } else {
        alert('신고를 선택해주세요.');
    }
}

</script>
</head>


<body>
<main>
<c:import url="/WEB-INF/views/common/admenubar.jsp"></c:import>
<div id="bottom_right_contents">
            <div id="abc">
                <div class="content-div">
                
			<br>
			<div class="button-box">
			<button id="hideButton" onclick="sendCheckedIds();" disabled>비공개</button>
			<button id="hideButton2" onclick="sendCheckedIds2();" disabled>처리완료</button>
			</div>
		<table>
   		<tr>
    	<th><input type="checkbox" id="selectAll" onchange="toggleCheckboxes(this)"></th>
        <th>신고번호</th>
        <th>신고자</th>
        <th>신고게시물번호</th>
        <th>게시물내용</th>
        <th>신고사유</th>
        <th>신고날짜</th>
        <th>분류</th>
    	</tr>
    
	    <c:forEach items="${report}" var="re">
	    <tr>
	    	<td class="center"><input type="checkbox" value="${re.reportId}" onchange="updateButtonState()"></td>
	        <td class="center">${re.reportId}</td>
	        <td class="center">${re.userId}</td>
	       	<td class="center">${re.boardNum}</td>
	        <td class="center">${post.postContent}</td>
	        <td class="center">${re.reportReason}</td>
	        <td class="center">${re.reportTime}</td>
	        <td class="center">${re.reportStatus}</td>
	    </tr>
	    </c:forEach>
    
</table>
	<span class="right-move-box">
	<button class="greylist" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/rptlist.do?page=1';">목록  </button>
	</span>

	<br>
	<c:import url="/WEB-INF/views/common/pagingView.jsp"></c:import>               	
                	
				</div>
            </div>
        </div>
</main>

</body>

</html>