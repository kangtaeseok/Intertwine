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
<title></title>
<link rel="stylesheet" href="/intertwine/resources/css/admin/reportPage.css" />
<c:import url="/WEB-INF/views/common/adcommon.jsp"></c:import>
</head>
<script type="text/javascript">
$(function(){
    // select 태그의 변경을 감지합니다.
    $('#selectType').change(function(){
        // 모든 form을 숨깁니다.
        $('form.sform').css('display', 'none');
        
        // 선택된 option에 맞는 form을 표시합니다.
        var selectedValue = $(this).val();
        switch(selectedValue) {
            case '신고자':
                $('#userIdform').css('display', 'block');
                break;
            case '게시물번호':
                $('#boardNumform').css('display', 'block');
                break;
            case '분류':
                $('#statusform').css('display', 'block');
                break;
        }
    });

    // 페이지 로드 시 초기 선택된 option에 맞는 form을 표시합니다.
    $('#selectType').trigger('change');
});
</script>
<body>

<main>
<c:import url="/WEB-INF/views/common/admenubar.jsp"></c:import>
<div id="bottom_right_contents">
            <div id="abc">
               <div class="content-div">
<br>
<span class="right">
<span> ▷ 총 ${listCount} 개의 신고건이 있습니다. </span>

<div class="search-box">
	<select id="selectType">
	    <option value="신고자" id="userId" selected>신고자</option>
	    <option value="게시물번호" id="boradNum">게시물번호</option>
	    <option value="분류"  id="reportStatus">분류</option>
	</select>
	<form id="userIdform" class="sform" action="rsearchuserId.do" method="post">
		<input type="hidden" name="action" value="userId">
		<input type="search" name="keyword">
		<input type="submit" value="검색" class="gradient">
	</form>	

	<form id="boardNumform" class="sform" action="rsearchboardNum.do" method="post">
	<input type="hidden" name="action" value="boardNum">
	<input type="search" name="keyword">
	<input type="submit" value="검색" class="gradient"> 
	</form>

	<form id="statusform" class="sform" action="rsearchStatus.do" method="post">
		<input type="hidden" name="action" value="reportStatus">
		<input type="search" name="keyword">
		<input type="submit" value="검색" class="gradient">
	</form>
</div>
</span>

<table>
    <tr>
        <th>신고번호</th>
        <th>신고자</th>
        <th>신고게시물번호</th>
        <th>신고댓글번호</th>
        <th>신고사유</th>
        <th>신고날짜</th>
        <th>분류</th>
    </tr>
    <c:forEach items="${list}" var="re">
    <tr>
    	<c:url var="bd" value="rptdetail.do">
					<c:param name="pnum" value="${re.boardNum}"/>
					<c:param name="page" value="${nowpage}"/>
		</c:url>
        <td class="center"><a href="${bd}">${re.reportId}</a></td>
        <td class="center">${re.userId}</td>	
       	<td class="center"><a href="${bd}">${re.boardNum}</a></td>
       	  
       	 <!-- 댓글이 없는 경우 링크 비활성화 -->
       	<c:if test="${re.reportComment eq 0}">
       		<td class="center">없음</td>
       	</c:if>
        <!-- 댓글이 있는 경우 댓글상세로 이동 -->
        <c:if test="${re.reportComment ne 0}">
        	<c:url var="cd" value="rptCommentdetail.do">
					<c:param name="pnum" value="${re.boardNum}"/>
					<c:param name="cnum" value="${re.reportComment}"/>
					<c:param name="page" value="${nowpage}"/>
			</c:url>
       		<td class="center"><a class="detail-box" href="${cd}">${re.reportComment}</a></td>	
        </c:if>
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