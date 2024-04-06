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
<link rel="stylesheet" href="/intertwine/resources/css/reportPage.css" />
</head>
<script type="text/javascript">
$(function(){
    $('#selectSearch').change(function(){
        var selectedIndex = $(this).prop('selectedIndex');
        $('form.sform').css('display', 'none');
        $('form.sform').eq(selectedIndex).css('display', 'block');
    });
    $('#selectSearch').trigger('change');
});
</script>
<body>


    <h2> 콘텐츠 관리 </h2>
<hr class ="hr1" noshade> 
<span> ▷ 총 ${listCount} 개의 신고건이 있습니다. </span>
<span class="right">       
    <select id= "selectSearch">
    <option value="신고자" name="type" id="userId" selected>신고자</option>
    <option value="게시물번호" name="type"  id="boradNum">게시물번호</option>
    <option value="분류" name="type"  id="reportStatus">분류</option>
    </select>
</span>
<span class="right">
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
</span>

<br>
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
        <td class="center">${re.reportId}</td>
        <td class="center">${re.userId}</td>
        <c:url var="bd" value="ddetail.do">
					<c:param name="bnum" value="${re.boardNum}"/>
					<c:param name="page" value="${nowpage}"/>
				</c:url>
       	<td class="center"><a href="${bd}">${re.boardNum}</a></td>
        <td class="center">${re.reportComment}</td>
        <td class="center">${re.reportReason}</td>
        <td class="center">${re.reportTime}</td>
        <td class="center">${re.reportStatus}</td>   
    </tr>

    </c:forEach>
    
</table>

<span class="right">
<button class="greylist" onclick="javascript:location.href='${ pageContext.servletContext.contextPath }/rptlist.do?page=1';">목록</button>
</span>


<c:import url="/WEB-INF/views/common/pagingView.jsp"></c:import>


</body>

</html>