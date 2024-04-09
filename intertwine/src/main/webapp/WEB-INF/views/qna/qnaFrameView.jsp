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
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/mainpage.css"> <!-- 이 jsp파일의 css파일 연결 -->
<script defer src="/intertwine/resources/js/mainpage.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>

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
    background-color: #87CEEB;
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

.rounded-home-button {
      background-color: #B52A00; /* 버튼 배경색 */
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
      float : left;
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



















<div class="container">
	<header>
	<div id="header_logo">
		<!-- <img src="/intertwine/resources/images/faq/intertwinelogo.png" width="100px" height="40px" onclick="moveMainPage()"> -->
		<!-- <a href="${ pageContext.servletContext.contextPath }/main.do">Home</a> -->
		<button class="rounded-home-button" width="100px"  onclick="moveMainPage()" ><h3>INTERTWINME</h3></button>
		<button class="rounded-button" width="100px"  onclick="moveLoginPage()"  ><h3>${ loginUser.userId }</h3></button>
		<button class="rounded-button" width="100px"  onclick="moveLoginPage()"  ><h3>${ loginAdmin.adminId }</h3></button>
				 
		 
		
	</div>

	</header>

    <%-- <c:import url="/WEB-INF/views/common/menubar.jsp" /> --%>
    <br>
    <main>
        <div class="left">
            <h1>고객센터</h1>
            <hr>
            <ul>
                <!-- 문의하기(Q&A)와 자주묻는질문(FAQ)에 ID 추가 -->
                <%-- 관리자 로그인한 경우 :  --%>

                <li><h2 id="faq">자주묻는질문(FAQ)</h2></li>
                <li><h2 id="qna">문의하기(Q&A)</h2></li>

                	
                 <c:if test="${ !empty loginUser }">
					<c:url var="qsearchwriter" value="qsearchWriter.do">
	 					<c:param name="keyword" value="${ loginUser.userId }" />
	 					<c:param name="action" value="writer" />
				 	</c:url>
				</c:if>  
				

				
				
	            <%-- 관리자 로그인한 경우 :  
				<c:if test="${ !empty loginAdmin }">	
	                <li><h2 id="faq">자주묻는질문(FAQ)관리</h2></li>
	                <li><h2 id="qna">문의하기(Q&A)관리</h2></li>
				</c:if> 				
				  
				<c:if test="${ !empty loginAdmin }">
					<c:url var="qsearchwriter" value="qlist.do">
				 	</c:url>
				</c:if>
				--%>
				
				
				
				
				
				
            </ul>           
        </div>
        <div class="right" id="faqContent" >
             <%-- 관리자나 유저로 로그인 하지 않은 경우 :  --%>
        	 <c:if test="${ empty loginAdmin and empty loginUser}">	
	                <li><h2 id="nologin">로그인 한 후 사용하세요.</h2></li>
				</c:if> 
        
		</div>
    </main>

</div>
<script>

document.getElementById("faq").addEventListener("click", function() {
    location.href="${pageContext.servletContext.contextPath}/flist.do?page=1";
});

document.getElementById("qna").addEventListener("click", function() {
    // 클라이언트 측 리다이렉션
    if (${!empty loginAdmin}) {
        location.href = "${pageContext.servletContext.contextPath}/qlist.do?page=1";
    } else if (${!empty loginUser}) {
        location.href = "${qsearchwriter}";
    } else {
        location.href = "${login}";
    }
   
});
        

</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>