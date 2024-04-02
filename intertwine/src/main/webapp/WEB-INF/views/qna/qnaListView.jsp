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
<title>qnaListView</title>
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
        <div class="right" id="qnaContent">
            <!-- 초기 FAQ 내용 -->
            <h1>문의하기(Q&A)</h1>
            <hr>
            <p>문의하기 내용입니다.
            <%-- 게시글 쓰기는 로그인한 회원만 가능함 --%>
			<%-- <c:if test="${ !empty sessionScope.loginMember }"> --%>
				<div style="align:center;text-align:right;">
	 			   <button onclick="showWriteForm();" style="background-color: skyblue; width: 100px; height: 50px; font-weight: bold; font-size: 16px;box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);">작성하기</button>
					<!-- <button onclick="showWriteForm();">글쓰기</button> -->
				</div>
			<%-- </c:if> --%>
			<br>

            
            </p>
        
		   <br>
		   
		   
		   
		   
		   

	    	<table align="center" border="1" cellspacing="0" width="700">
	    		<tr>
	    			<th>번호</th>
	    			<th>제목</th>
	    			<th>작성자</th>
	    			<th>날짜</th>
	    			<th>첨부파일</th>
	    			<th>조회수</th>
	    		</tr>
	    		<c:forEach items="${ requestScope.list }" var="q">
	    			<tr>
	    				<td align="center">${ q.qnaNum }</td>
	    				<td>
	    				<c:url var="qd" value="qdetail.do">
	    					<c:param name="qnum" value="${ q.qnaNum }"/>
	    					<c:param name="page" value="${ nowpage }"/>
	    				</c:url>
	    				<a href="${ qd }">${ q.qnaTitle }</a>
	    				</td>
	    				<td align="center">${ q.qnaWriter }</td>
	    				<td align="center">${ q.qnaDate }</td>
	    							<td align="center">
			<%-- <% if(b.getBoardOriginalFileName() != null){ %> --%>
			
			<c:if test="${ !empty q.qnaOriginalFileName }">
				◎
			</c:if>
			<%-- <% }else{ %> --%>
			<c:if test="${ empty q.qnaOriginalFileName }">
				&nbsp;
			</c:if>
			<%-- <% } %> --%>
			</td>
	    				<td align="center">${ q.qnaReadCount }</td>
	    			</tr>
	    		</c:forEach>
	    	</table>
	    	
	    	
	    	
	    	
	    	<br>
        
    		<%-- 페이징 처리 뷰 포함 처리 --%>
			<c:import url="/WEB-INF/views/common/pagingView.jsp" />

			
		</div>
		
		
    </main>

</div>

<script>

document.getElementById("faq").addEventListener("click", function() {
    // 자주묻는질문(FAQ) 클릭 시 오른쪽 창의 내용이 변경됩니다.
	<c:url var="fl" value="flist.do">
	 	<c:param name="page" value="${ currentPage }" /> 
	 </c:url>   
	location.href='${ fl }'; 

    //location.href="${pageContext.servletContext.contextPath}/flist.do?page=1";
        
});



document.getElementById("qna").addEventListener("click", function() {
    // 문의하기(Q&A) 클릭 시 오른쪽 창의 내용이 변경됩니다.
	<c:url var="ql" value="qlist.do">
 	<c:param name="page" value="${ currentPage }" /> 
 	</c:url>   
	location.href='${ ql }'; 
});


function showWriteForm(){
	//게시글 원글 쓰기 페이지로 이동 요청
	location.href = "${ pageContext.servletContext.contextPath}/qwform.do";
}
</script>


<br>




<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>