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
<title>자주묻는질문(FAQ)</title>
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
		</div>
    </main>

</div>
<script>

document.getElementById("faq").addEventListener("click", function() {
   // 문의하기(Q&A) 클릭 시 오른쪽 창의 내용이 변경됩니다.
/*    	<c:url var="fl" value="flist.do">
	 	<c:param name="page" value="${ currentPage }" /> 
	 </c:url>   
	location.href='${ fl }';  */
    location.href="${pageContext.servletContext.contextPath}/flist.do?page=1";
   //document.getElementById("faqContent").innerHTML = ` `;
});
        

</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>