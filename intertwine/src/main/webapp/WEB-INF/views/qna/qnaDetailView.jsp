<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaDetailView</title>


<%-- 아래의 자바스크립트 함수에서 사용하는 url 요청 처리를 별도로 변수화 시킴 --%>

<c:url var="replyf" value="qreplyform.do">
	<c:param name = "qnum" value="${ qna.qnaNum }" />
	<c:param name = "qwriter" value="${ qna.qnaWriter }" />
	<c:param name = "page" value="${ currentPage }"/>
</c:url>

<c:url var="qdel" value="qdelete.do">
	<c:param name = "qnaNum" value="${ qna.qnaNum }" />
	<c:param name = "qnaWriter" value="${ qna.qnaWriter }" />
	<c:param name = "qnaLev" value="${ qna.qnaLev }"/>
	<c:param name = "qnaRenameFileName" value="${ qna.qnaRenameFileName }"/>
</c:url>

<c:url var="qup" value="qupview.do">
	<c:param name = "qnum" value="${ qna.qnaNum }" />
	<c:param name = "page" value="${ currentPage }"/>
</c:url>

<script type="text/javascript">
function requestReply(){
	//댓글달기 요청 함수
	location.href="${ replyf }";
}

function requestDelete(){
	//게시글(원글, 댓글, 대댓글) 삭제 요청 함수
	location.href = "${ qdel }";

}

function moveUpdatePage(){
	//게시글 (원글, 댓글, 대댓글) 수정 페이지로 이동 처리 함수
	location.href = "${ qup }";
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/qna/qnaFrameView.jsp" />
<script>
$(function(){
	document.getElementById("faqContent").innerHTML = `
		<h1>문의하기(Q&A)</h1>
		<hr>
		<br>
		<h2 align="left">${ qna.qnaNum } 번 게시글 상세보기</h2>
		<br>
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th width="120">제 목</th>
				<td>${ qna.qnaTitle}></td>
			</tr>
			<tr>
				<th width="120">작성자</th>
				<td>${ qna.qnaWriter }</td>
			</tr>
			<tr>
				<th width="120">등록날짜</th>
				<td><fmt:formatDate value="${ qna.qnaDate }" pattern="yyyy-MM-hh"/></td>
			</tr>
			<tr>
				<th width="120">첨부파일</th>
				<td>
				<c:if test="${ !empty qna.qnaOriginalFileName }">
					<c:url var="qdown" value="qdown.do">
						<c:param name="ofile" value="${ qna.qnaOriginalFileName }" />
						<c:param name="rfile" value="${ qna.qnaRenameFileName }"/>			
					</c:url>
					<a href="${ qdown }" > ${ qna.qnaOriginalFileName }</a>
				</c:if>
				<c:if test="${ empty qna.qnaOriginalFileName }">
				&nbsp;
				</c:if>
				</td>
			</tr>
			<tr>
				<th width="120">내 용</th>
				<td>${ qna.qnaContent }</td>
			</tr>
			<tr>
				<th colspan="2">
					<%-- 로그인한 경우 : 본인 글 상세보기 일때는 수정페이지로 이동과 삭제 버튼 표시함 --%>
					<c:if test="${ !empty loginUser or !empty loginAdmin}">	
						<c:if test="${ loginUser.userId eq qna.qnaWriter }">
							<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button>&nbsp;
							<button onclick="requestDelete(); return false;">글삭제</button>&nbsp;
						</c:if>
						<%-- 로그인한 경우 : 관리자인 경우 글삭제 버튼과 댓글달기 버튼 표시함 --%>
						<c:if test="${ loginUser.userId ne qna.qnaWriter or empty loginAdmin }">
							<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
							<c:if test="${ qna.qnaLev < 3 }">
								<button onclick="requestReply(); return false;">답변하기</button> &nbsp;
							</c:if>
						</c:if>
					</c:if>
			                <c:if test="${ !empty loginUser or !empty loginAdmin }">
							<c:url var="qsearchwriter" value="qsearchWriter.do">
			 					<c:param name="keyword" value="${ loginUser.userId }" />
			 					<c:param name="action" value="writer" />
						 	</c:url>
							<input type="button" value="목록" onclick="location.href='${ qsearchwriter }'; return false;" >
							</c:if> 
				</th>		
			</tr>
		</table>
		<br>
`; 
});
</script>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>









