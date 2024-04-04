<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentPage" value="${ requestScope.page }"/>

   
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

<h1 align="center">${ qna.qnaNum }번 게시글 수정 페이지</h1>
<br>

<%-- 원글 수정 폼 : 첨부파일 수정 기능 포함 --%>
<%-- <% if(qna.getBoardLev()  == 1){ %> --%>
<c:if test="${ qna.qnaLev eq 1 }">
<!-- form 에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :  
	enctype="multipart/form-data"
-->
<form action="qoriginupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="qnaNum" value="${ qna.qnaNum }">
	<input type="hidden" name="page" value="${ currentPage }">
	<input type="hidden" name="qnaOriginalFileName" value="${ qna.qnaOriginalFileName }">
	<input type="hidden" name="qnaRenameFileName" value="${ qna.qnaRenameFileName }">

<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="qnaTitle" size="50" value="${ qna.qnaTitle }"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="qnaWriter" readonly value="${ qna.qnaWriter }"></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td>
		<c:if test="${!empty qna.qnaOriginalFileName }">
			${ qna.qnaOriginalFileName} &nbsp; 
			<input type="checkbox" name="deleteFlag" value="yes"> 파일삭제 <br>
			변경 : <input type="file" name="upfile">
		</c:if>
		<c:if test="${empty qna.qnaOriginalFileName }">
			첨부된 파일 없음 <br>
			추가 : <input type="file" name="upfile">
		</c:if>
		</td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="qnaContent">${ qna.qnaContent }</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"> &nbsp; 
			<input type="reset" value="수정취소"> &nbsp;
			<input type="button" value="이전페이지로 이동" 
			onclick="javascript:history.go(-1); return false;"> &nbsp;
			<input type="button" value="목록" 
			onclick="javascript:location.href='qlist.do?page=${ currentPage }'; return false;">
		</th>		
	</tr>
</table>
</form>
<br>
</c:if>
<%-- <% } %> --%>

<%-- 댓글, 대댓글 수정 폼 --%>
<%-- <% if(qna.getBoardLev()  > 1){ %> --%>
<c:if test="${ qna.qnaLev gt 1 }">
<form action="qreplyupdate.do" method="post">
	<input type="hidden" name="qnaNum" value="${ qna.qnaNum }">
	<input type="hidden" name="page" value="${ currentPage }">
	
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="qnaTitle" size="50" value="${ qna.qnaTitle }"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="qnaWriter" readonly value="${ qna.qnaWriter }"></td>
	</tr>	
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="qnaContent">${ qna.qnaContent }></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"> &nbsp; 
			<input type="reset" value="수정취소"> &nbsp;
			<input type="button" value="이전페이지로 이동" 
			onclick="javascript:history.go(-1); return false;"> &nbsp;
			<input type="button" value="목록" 
			onclick="javascript:location.href='qlist.do?page=${ currentPage }'; return false;">
		</th>		
	</tr>
</table>
</form>
<br>
</c:if>
<%-- <% } %> --%>

	`; 
	});
	</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>





