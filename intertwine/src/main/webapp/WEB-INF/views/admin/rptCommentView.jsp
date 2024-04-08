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
<link rel="stylesheet" href="/intertwine/resources/css/rptCommentView.css" />
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://kit.fontawesome.com/40acfae8f0.js" crossorigin="anonymous"></script>

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
<header>
<div class="header">
	<div class="header-div">
		<a href="location.href='admain.do'"><img src="/intertwine/resources/images/intertwinelogo.png" width="180px;" height="30px;"></a>
	</div>
</div>
</header>
<div class="body-div">
<main>
<aside class="side-bar">
             <ul>
                <li id="square">
                    <li><a href="#"><i class="fa-solid fa-user"></i> 사용자 관리</a></li>
      
                <li id="mypage">
             		<li><a href="${ pageContext.servletContext.contextPath }/rptlist.do"><i class="fa-solid fa-clipboard"></i> 콘텐츠 관리</a></li>       
             
                <li id="friend">
                	<li><a href="#"><i class="fa-solid fa-gear"></i> 서비스 관리</a></li>    
                
                <li id="chatting">
                    <li><a href="#"><i class="fa-solid fa-q"></i> 고객센터</a></li>
                
                <li id="alarm">
                    
                
            </ul>
        </aside>
        <div id="submenubars">
            <div id="dummy_sub_menu" class="sub_menu">
                더미 서브메뉴
            </div>
            <div id="mypage_sub_menu" class="sub_menu">
                마이페이지 서브메뉴
            </div>
            <div id="chatting_sub_menu" class="sub_menu">
                채팅 서브메뉴
            </div>
            <div id="alarm_sub_menu" class="sub_menu">
                알림 서브메뉴
            </div>
            <div id="settings_sub_menu" class="sub_menu">
                설정 서브메뉴
            </div>

        </div>
        

<div id="bottom_right_contents">
 <h2> 콘텐츠 관리 </h2>
            <div id="abc">
           
                <div class="content-div">
                
<hr class ="hr1" noshade> 
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
        <th>해당게시물</th>
        <th>신고댓글번호</th>
        <th>댓글내용</th>
        <th>신고사유</th>
        <th>신고날짜</th>
        <th>분류</th>
    </tr>
    <c:set var="i" value = "0"/>
    <c:forEach items="${report}" var="re">
    <tr>
    	<c:if test="${re.reportComment eq 0}">
    	
    	</c:if>
    	<c:if test="${re.reportComment ne 0}">
    	<td class="center"><input type="checkbox" value="${re.reportId}" onchange="updateButtonState()"></td>
        <td class="center">${re.reportId}</td>
        <td class="center">${re.userId}</td>
       	<td class="center">${re.boardNum}</td>
       	<td class="center">${re.reportComment}</td>

        	<td class="center">${comment[i].commentContent}</td>
       <c:set var="i" value="${i + 1}"/>
        <td class="center">${re.reportReason}</td>
        <td class="center">${re.reportTime}</td>
        <td class="center">${re.reportStatus}</td>
        
        </c:if>
    </tr>
 	</c:forEach>

    
</table>
    

<span class="right-move-box">
<button class="greylist" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/rptlist.do?page=1';">목록</button>
</span>
                	
                	
				</div>
            </div>
        </div>
</main>

    


</body>

</html>