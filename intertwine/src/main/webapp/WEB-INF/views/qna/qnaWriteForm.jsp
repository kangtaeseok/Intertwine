<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>

<c:import url="/WEB-INF/views/qna/qnaFrameView.jsp" />
<script>
$(function(){
	
	document.getElementById("faqContent").innerHTML = `

		
		
		<h1>문의하기(Q&A)</h1>
		<hr>
		<br>

		
		<h1 align="center">QnA 원글 등록 페이지</h1>
		<br>
		
		<!-- form  에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :
		     enctype="multipart/form-data"
		 -->
		<form action="qinsert.do" method="post" enctype="multipart/form-data">
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
		
			<tr>
			    <th>제목</th>
			    <td><input type="text" name="qnaTitle"></td>
			</tr>
			<tr>
			    <th>작성자</th>
			    <c:if test="${ !empty loginUser and empty loginAdmin }">	
			    <td><input type="text" name="qnaWriter" readonly value="${ sessionScope.loginUser.userId }"></td>
			    </c:if>
			    			    
			    <c:if test="${ !empty loginAdmin }">	
			    <td><input type="text" name="qnaWriter" readonly value="${ sessionScope.loginAdmin.adminId }"></td>
			    </c:if>			    
			    
			</tr>
			<tr>
			    <th>첨부파일</th>
			    <td><input type="file" name="upfile"></td>
			</tr>
			<tr>
			    <th>내용</th>
			    <td><textarea rows="5", cols="50" name="qnaContent"></textarea></td>
			</tr>
			<tr>

				
				<th colspan="2">
					<input type="submit" value="등록하기">
					<input type="reset" value="작성취소">
					<!-- <input type="button" value="목록" onclick="location.href='${ ql }'; return false;" > -->
					
					<!-- 유저 로그인이고 관리자 가 아닐 경우 -->
	                <c:if test="${ !empty loginUser and empty loginUser}">
					<c:url var="qsearchwriter" value="qsearchWriter.do">
	 					<c:param name="keyword" value="${ loginUser.userId }" />
	 					<c:param name="action" value="writer" />
				 	</c:url>
					</c:if> 
					
					<!-- 관리자 로그인 일 경우 -->
	                <c:if test="${ !empty loginAdmin }">
					<c:url var="qsearchwriter" value="qsearchWriter.do">
	 					<c:param name="keyword" value="${ loginUser.adminId }" />
	 					<c:param name="action" value="writer" />
				 	</c:url>
					</c:if> 
					<input type="button" value="목록" onclick="location.href='${ qsearchwriter }'; return false;" >
					
				

	                
					
					
					
				</th>
			</tr>
		</table>
		</form>
		
		<br>



`; 
});
</script>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>