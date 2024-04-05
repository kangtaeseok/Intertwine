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
    background-color: #00f;
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
    border: 0px solid #333;
}

.right {
    flex: 3; /* 오른쪽 요소를 왼쪽 요소의 4배 크기로 설정 */
    padding: 20px;
    border: 0px solid #333;
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

.rounded-button {
      background-color: #4CAF50; /* 버튼 배경색 */
      border: none; /* 테두리 없앰 */
      border-radius: 50px; /* 버튼을 둥글게 만듦 */
      color: white; /* 버튼 텍스트 색상 */
      padding: 2px 2px; /* 버튼 내부 여백 설정 */
      text-align: center; /* 텍스트 가운데 정렬 */
      text-decoration: none; /* 텍스트에 밑줄 없앰 */
      display: inline-block; /* 인라인 요소로 설정하여 여백을 설정할 수 있게 함 */
      font-size: 15px; /* 버튼 텍스트 크기 */
      margin: 2px 2px; /* 버튼 간격 설정 */
      cursor: pointer; /* 마우스 커서를 포인터로 변경하여 클릭 가능함을 나타냄 */
      float : right;
}
</style>
<script type="text/javascript">
function moveMainPage(){
	//자바스크립트로 페이지 이동 또는 서블릿 컨트롤러 연결 요청시
	//location 내장객체의 href 속성을 사용함
	location.href = "main.do";
}

function moveLoginPage(){
	//자바스크립트로 페이지 이동 또는 서블릿 컨트롤러 연결 요청시
	//location 내장객체의 href 속성을 사용함
	location.href = "login.do";
}
</script>
</head>
<body>

<hr>
<br>
<div class="container">
	<header>
	<div id="header_logo">
		<img src="/intertwine/resources/images/faq/intertwinelogo.png" width="100px" height="40px" onclick="moveMainPage()">
		<!-- <a href="${ pageContext.servletContext.contextPath }/main.do">Home</a> -->
		
		<button class="rounded-button" width="100px" align="right" onclick="moveLoginPage()"  ><h3>${ loginUser.userId }</h3></button>
	</div>

	</header>
	<hr>
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
        <div class="right" id="faqContent" alin>
		</div>
    </main>

</div>
<script>

document.getElementById("faq").addEventListener("click", function() {
    location.href="${pageContext.servletContext.contextPath}/flist.do?page=1";
});

document.getElementById("qna").addEventListener("click", function() {
    location.href="${pageContext.servletContext.contextPath}/qlist.do?page=1";
});
        

</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>