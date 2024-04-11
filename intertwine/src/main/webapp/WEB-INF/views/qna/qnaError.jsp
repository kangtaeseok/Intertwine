<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna : error</title>
</head>
<body>
<c:import url="/WEB-INF/views/qna/qnaFrameView.jsp" />
<script>
$(function(){
	
	document.getElementById("faqContent").innerHTML = `
	
		<h1>문의하기(Q&A)</h1>
		<hr>
		
		<br>
		<br>
		
		<%-- 게시글 쓰기는 로그인한 회원만 가능함 --%>
		<%-- <% if(loginMember != null){ %> --%>
		<c:if test="${ !empty sessionScope.loginUser or !empty loginAdmin }">
			<div style="align:center;text-align:center;">
				<button onclick="showWriteForm();">글쓰기</button>
			</div>
		</c:if>
		<%-- <% } %> --%>
		<br>
		
		<center>
				<!-- <button onclick="javascript:location.href='${pageContext.servletContext.contextPath}/qlist.do?page=1';">목록</button> -->
                <c:if test="${ !empty loginUser and empty loginAdmin }">
				<c:url var="qsearchwriter" value="qsearchWriter.do">
 					<c:param name="keyword" value="${ loginUser.userId }" />
 					<c:param name="action" value="writer" />
			 	</c:url>
				<button onclick="javascript:location.href='${qsearchwriter}';">목록</button>

			</c:if> 
		</center>
		<br>
		<br>
		
		<%-- 조회된 게시글 목록 출력 --%>
		<table align="center" border="1" cellspacing="0" width="700">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			<tr>
				<th colspan="6" >${ requestScope.message }</th>				
			</tr>
			<%-- <% } %> --%>
		</table>

		
		
		
		
		
		
		
		
		
		
		
		


	
		
		





 
 `; 
 });
</script>


  
</body>
</html>







