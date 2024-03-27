<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는질문(FAQ)</title>
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

<hr>
<br>
<div class="container">
    <header>Header</header>
    <c:import url="/WEB-INF/views/common/menubar.jsp" />
    <br>
    <main>
        <div class="left">
            <h1>고객센터</h1>
            <hr>
            <ul>
                <!-- 문의하기(Q&A)와 자주묻는질문(FAQ)에 ID 추가 -->
                <li><h2 id="faq">자주묻는질문(FAQ)</h2></li>
                <li><h2 id="qna">문의하기(Q&A)</h2></li>
            </ul>           
        </div>
        <div class="right" id="faqContent">
            <!-- 초기 FAQ 내용 -->
            <h1>자주묻는질문(FAQ)</h1>
            <hr>
            <p>자주 묻는 질문 내용입니다.</p>
        </div>
    </main>

</div>

<script>
document.getElementById("faq").addEventListener("click", function() {
    // 자주묻는질문(FAQ) 클릭 시 오른쪽 창의 내용이 변경됩니다.
    <a href="${ pageContext.servletContext.contextPath }/flist.do?page=1"></a>
    document.getElementById("faqContent").innerHTML = `
        <h1>자주묻는질문(FAQ)</h1>
        <hr>
        <p>자주 묻는 질문 내용입니다.</p>
        
    	<%-- 조회된 게시글 목록 출력 --%>
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
    				<td align="center">${ f.faqNo }</td>
    				<td>
    				<c:url var="fd" value="fdetail.do">
    					<c:param name="fnum" value="${ f.faqNo }"/>
    					<c:param name="page" value="${ nowpage }"/>
    				</c:url>
    				<a href="${ fd }">${ f.faqTitle }</a>
    				</td>
    				<td align="center">${ f.faqWriter }</td>
    				<td align="center">${ f.faqDate }</td>
    				<td align="center">
    				</td>
    				<td align="center">${ f.faqReadCount }</td>
    			</tr>
    		</c:forEach>
    	</table>
    	<br>
        
        
        
        
        `;
        

        
});

document.getElementById("qna").addEventListener("click", function() {
    // 문의하기(Q&A) 클릭 시 오른쪽 창의 내용이 변경됩니다.
    document.getElementById("faqContent").innerHTML = `
        <h1>문의하기(Q&A)</h1>
        <hr>
        <p>문의하기(Q&A) 내용입니다.</p>`;
});
</script>





<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>