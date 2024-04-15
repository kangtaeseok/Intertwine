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
<h1>자주묻는질문(FAQ)</h1>
<hr>
<br>
<h2 align="left">${ faq.faqNum }번 게시글 수정 페이지</h2>

<%-- 원글 수정 폼 : 첨부파일 수정 기능 포함 --%>
<%-- <% if(faq.getFaqLev()  == 1){ %> --%>
<%--<c:if test="${ faq.faqLev eq 1 }"> --%>
<!-- form 에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :  
	enctype="multipart/form-data"
-->


<form action="foriginupdate.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="faqNum" value="${ faq.faqNum }">
	<input type="hidden" name="page" value="${ currentPage }">
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="faqTitle" size="50" value="${ faq.faqTitle }"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="faqWriter" readonly value="${ faq.faqWriter }"></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="faqContent">${ faq.faqContent }</textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="수정하기"> &nbsp; 
			<input type="reset" value="수정취소"> &nbsp;
			<input type="button" value="이전페이지로 이동" 
			onclick="javascript:history.go(-1); return false;"> &nbsp;
			<input type="button" value="목록" 
			onclick="javascript:location.href='flist.do?page=${ currentPage }'; return false;">
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





