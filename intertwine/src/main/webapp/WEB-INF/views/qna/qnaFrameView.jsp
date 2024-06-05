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
     min-width: 1200px;
    
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
    position : relative;
    left : 250px;
    
}

.right {
    flex: 3; /* 오른쪽 요소를 왼쪽 요소의 4배 크기로 설정 */
    padding: 20px;
    border: 0px solid #333;
    position : relative;
    left : 250px;
}

@media screen and (max-width: 1280px) {
    .left {
        left: 100px;
    }
    .right {
        left: 100px;
    }
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
	
	        <!-- 페이지 상단 -->
        <div> <!-- 홈 버튼 -->
            <nav class="homebutton_nav">
                <ul>
                    <li class="homebutton"></li>
                </ul>
                <ol>
                    <a href="#"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
                </ol>
            </nav>
        </div>

        <div class="search"> <!-- 검색창 -->
            <input type="text" placeholder="검색어 입력">
            <img src="/intertwine/resources/images/search.png">
        </div>

        <div></div>
        <!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
	<div id="header_logo">
		<!-- <img src="/intertwine/resources/images/faq/intertwinelogo.png" width="100px" height="40px" onclick="moveMainPage()"> -->
		<!-- <a href="${ pageContext.servletContext.contextPath }/main.do">Home</a> -->
		<button class="rounded-home-button" width="100px"  onclick="moveMainPage()" ><h3>INTERTWINME</h3></button>
		<button class="rounded-button" width="100px"  onclick="moveLoginPage()"  ><h3>${ loginUser.userId }</h3></button>
		<button class="rounded-button" width="100px"  onclick="moveLoginPage()"  ><h3>${ loginAdmin.adminId }</h3></button>
				 
		 
		
	</div>

	</header>

    <%-- <c:import url="/WEB-INF/views/qna/menubar.jsp" /> --%>

    <main>
           <div>
           <c:if test="${ !empty loginUser and empty loginAdmin}">
            <aside class="side-bar">
                <ul>
                    <li id="a">
                        <a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
                        <ul>
                            <li><a href="#">text1</a></li>
                            <li><a href="#">text2</a></li>
                            <li><a href="#">text3</a></li>
                            <li><a href="#">text4</a></li>
                        </ul>
                    </li>
                    <li id="mypage">
                        <a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a>
                        <!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
                    </li>
                    <li id="c">
                        <a href="#"><i class="fa-solid fa-user-group"></i> 친구</a>
                    </li>
                    <li id="chatting">
                        <a href="#"><i class="fa-solid fa-comment"></i> 채팅</a>
                    </li>
                    <li id="alarm">
                        <a href="#"><i class="fa-solid fa-bell"></i> 알림</a>
                    </li>
                    <li id="f">
                        <a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a>
                    </li>

                </ul>
            </aside>
            </c:if>
 
              <c:if test="${ !empty loginAdmin }"> 
              	<aside class="side-bar">
            <ul>
                <li id="square">
                    <li><a href="${ pageContext.servletContext.contextPath }/rptlist.do"><i class="fa-solid fa-clipboard"></i> 콘텐츠 관리</a></li>
      
                <li id="mypage">
                    
             
                <li id="friend">
                    
                
                <li id="chatting">
                    <li><a href="${ pageContext.servletContext.contextPath }/adnlist.do"><i class="fa-solid fa-gear"></i> 서비스 관리</a></li>
                
                <li id="alarm">
                    <li><a href="${ pageContext.servletContext.contextPath }/flist.do"><i class="fa-solid fa-q"></i> 고객센터</a></li>
                
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
 
              
              
              
              </c:if>
            
            
        </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <div class="left">
            <h1>고객센터</h1>
            <hr>
            <ul>
                <!-- 문의하기(Q&A)와 자주묻는질문(FAQ)에 ID 추가 -->
                <%-- 관리자 로그인한 경우 :  --%>
                <br>

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

</div>		
<hr>
<footer>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</footer> 		
    </main>

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



  
</body>
</html>