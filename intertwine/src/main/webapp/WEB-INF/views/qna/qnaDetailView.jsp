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
	<c:param name = "page" value="${ currentPage }"/>
</c:url>

<c:url var="qdel" value="qdelete.do">
	<c:param name = "qnaNum" value="${ qna.qnaNum }" />
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
		
		<h1 align="center">${ qna.qnaNum } 번 게시글 상세보기</h1>
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
		<%-- 		<% if(qna.getBoardOriginalFileName() != null){ %>
					<a href="/first/bfdown?ofile=<%= qna.getBoardOriginalFileName() %>&rfile=<%= qna.getBoardRenameFileName() %>">
					<%= qna.getBoardOriginalFileName() %></a>
				<% }else{ %>
					&nbsp;
				<% } %> --%>
				<c:if test="${ !empty qna.qnaOriginalFileName }">
					<c:url var="qdown" value="qdown.do">
						<c:param name="ofile" value="${ qna.qnaOriginalFileName }" />
						<c:param name="rfile" value="${ qna.qnaRenameFileName }"/>			
					</c:url>
					<a href="${ bdown }" > ${ qna.qnaOriginalFileName }</a>
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
					<c:if test="${ !empty loginUser }">	
						<c:if test="${ loginUser.userId eq qna.qnaWriter }">
							<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button>&nbsp;
							<button onclick="requestDelete(); return false;">글삭제</button>&nbsp;
						</c:if>
					
						<%-- 로그인한 경우 : 관리자인 경우 글삭제 버튼과 댓글달기 버튼 표시함 --%>
						<c:if test="${ loginUser.userId ne qna.qnaWriter  }">
							<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
							<c:if test="${ qna.qnaLev < 3 }">
								<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
							</c:if>
						</c:if>
						
						<%-- 로그인한 경우 : 본인 글이 아니고, 레벨이 3보다 작은 경우에만 댓글달기 버튼 표시함 --%>
						<c:if test="${ loginUser.userId ne qna.qnaWriter }">
							<c:if test="${ qna.qnaLev < 3 }">
								<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
							</c:if>
						</c:if>
					</c:if>
					
					<%-- <% if(loginUser != null){ //로그인한 상태이면
							if(loginUser.getUserId().equals(qna.getBoardWriter())){
								//로그인한 회원 아이디와 글작성자가 같다면 (본인이 올린 글이면)
					%>
						<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button> &nbsp;
						<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
					<%      }else if(loginUser.getAdminYN().equals("Y")){  //관리자이면 %>
						<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
					<%               if(qna.getBoardLev() < 3){ %>
						<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
					<%               } %>
					<% 		 }else{ //로그인했는데 본인 글이 아닐 때 %>
						<%               if(qna.getBoardLev() < 3){ %>
						<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
					<%               } %>
					<%       }
					     } %>  --%>
					     
					     
					     
					 <c:url var="ql" value="qlist.do">
					 	<c:param name="page" value="${ currentPage }" /> 
					 </c:url>   
					 <button onclick="javascript:location.href='${ ql }';">목록</button> 
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









