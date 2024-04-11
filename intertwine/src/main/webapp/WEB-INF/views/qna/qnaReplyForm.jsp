<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%
	//qnaDetailView.jsp 가 보낸 파라메터(parameter) 값 꺼내기
	int qnaNum = Integer.parseInt(request.getParameter("qnum"));  //원글번호
	int currentPage = Integer.parseInt(request.getParameter("page"));  //원글이 출력된 목록 페이지
%>    
 --%>
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

		<h2 align="left">${ requestScope.qnum }번글 답변 등록 페이지</h2>
		
		<br>
		
		<form action="qreply.do" method="post">
			<input type="hidden" name="qnum" value="${ requestScope.qnum }">
			<input type="hidden" name="qwriter" value="${ requestScope.qwriter }">
			<input type="hidden" name="page" value="${ requestScope.currentPage }">
		
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="qnaTitle" size="50"></td>
			</tr>
			<tr>
				<th>문의자</th>
			    <c:if test="${ !empty loginUser and empty loginAdmin }">	
			    <td><input type="text" name="qnaWriter" readonly value="${ sessionScope.loginUser.userId }"></td>
			    </c:if>
			    			    
			    <c:if test="${ !empty loginAdmin }">	
			    <td><input type="text" name="qnaWriter" readonly value="${ requestScope.qwriter }"></td>
			    </c:if>				</tr>	
			<tr>
				<th>내 용</th>
				<td><textarea rows="5" cols="50" name="qnaContent"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록하기"> &nbsp; 
					<input type="reset" value="작성취소"> &nbsp;
					<input type="button" value="목록" 
					onclick="javascript:location.href='qlist.do?page=${ requestScope.currentPage }'; return false;">
				</th>		
			</tr>
		</table>
		</form>
		<br>
`; 
});
</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>