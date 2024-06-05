<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faqListView</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<style>
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    flex-direction: column;
    height: 100%;
}

header, footer {
    background-color: #666;
    color: white;
    padding: 10px;
}

main {
    flex: 1;
    display: flex;
}

.left {
    flex: 1; /* 왼쪽 요소를 오른쪽 요소의 1/4 크기로 설정 */
    padding: 20px;
    border: 1px solid #333;
}

.right {
    flex: 3; /* 오른쪽 요소를 왼쪽 요소의 4배 크기로 설정 */
    padding: 20px;
    border: 1px solid #333;
}

hr {
    border: none;
    height: 4px;
    background-color: black;
}

/* 마우스를 올릴 때 밑줄 효과 */
#faq:hover, #qna:hover {
    text-decoration: underline;
    cursor: pointer;
}
</style>

</head>
<body>

<c:import url="/WEB-INF/views/qna/qnaFrameView.jsp" />
<script>
$(function(){
	document.getElementById("faqContent").innerHTML = `
            <!-- 초기 FAQ 내용 -->
            <h1>자주묻는질문(FAQ)</h1>
            <hr>
            <p>자주 묻는 질문 내용입니다.
            <%-- 게시글 쓰기는 로그인한 회원만 가능함 --%>
            <c:if test="${ !empty sessionScope.loginAdmin }">
        	<div style="align:center;text-align:center;">
        		<button onclick="showWriteForm();">글쓰기</button>
        	</div>
        	</c:if>
			<br>
            </p><br>
	    	<table align="center" border="1" cellspacing="0" width="700">
	    		<tr>
	    			<th>번호</th>
	    			<th>제목</th>
	    			<th>작성자</th>
	    			<th>날짜</th>
	    			<th>조회수</th>
	    		</tr>
	    		<c:forEach items="${ requestScope.list }" var="f">
	    			<tr>
	    				<td align="center">${ f.faqNum }</td>
	    				<td>
	    				<c:url var="fd" value="fdetail.do">
	    					<c:param name="fnum" value="${ f.faqNum }"/>
	    					<c:param name="page" value="${ nowpage }"/>
	    				</c:url>
	    				<a href="${ fd }">${ f.faqTitle }</a>
	    				</td>
	    				<td align="center">${ f.faqWriter }</td>
	    				<td align="center">${ f.faqDate }</td>
	    				<td align="center">${ f.faqReadCount }</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    	<br>
        
    		<%-- 페이징 처리 뷰 포함 처리 --%>
			<c:import url="/WEB-INF/views/qna/pagingView.jsp" />
 `; 
});


function showWriteForm(){
	//게시글 원글 쓰기 페이지로 이동 요청
	location.href = "${ pageContext.servletContext.contextPath}/fwform.do";
}
</script>


<br>




<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>