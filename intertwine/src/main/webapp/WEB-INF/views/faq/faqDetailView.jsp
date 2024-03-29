<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>intertwine</title>


<%-- 아래의 자바스크립트 함수에서 사용하는 url 요청 처리를 별도로 변수화 시킴 --%>

<c:url var="replyf" value="breplyform.do">
	<c:param name = "bnum" value="${ faq.faqNum }" />
	<c:param name = "page" value="${ currentPage }"/>
</c:url>

<%-- <c:url var="bdel" value="bdelete.do">
	<c:param name = "faqNum" value="${ faq.faqNum }" />
	<c:param name = "faqLev" value="${ faq.faqLev }"/>
	<c:param name = "faqRenameFileName" value="${ faq.faqRenameFileName }"/>
</c:url> --%>

<c:url var="bup" value="bupview.do">
	<c:param name = "bnum" value="${ faq.faqNum }" />
	<c:param name = "page" value="${ currentPage }"/>
</c:url>

<script type="text/javascript">
function requestReply(){
	//댓글달기 요청 함수
	location.href="${ replyf }";
}

function requestDelete(){
	//게시글(원글, 댓글, 대댓글) 삭제 요청 함수
	location.href = "${ bdel }";

}

function moveUpdatePage(){
	//게시글 (원글, 댓글, 대댓글) 수정 페이지로 이동 처리 함수
	location.href = "${ bup }";

}



</script>
</head>
<body>
<c:import url="/WEB-INF/views/faq/faqFrameView.jsp" />
<script>
$(function(){
	
	document.getElementById("faqContent").innerHTML = `
	
        <!-- 초기 FAQ 내용 -->
        <h1>자주묻는질문(FAQ)</h1>
        <hr>
        <p>자주 묻는 질문 내용입니다.</p>
   
	   <br>
	
		<h1 align="center">${ faq.faqNum } 번 게시글 상세보기</h1>
		<br>

		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th width="120">제 목</th>
				<td>${ faq.faqTitle}></td>
			</tr>
			<tr>
				<th width="120">작성자</th>
				<td>${ faq.faqWriter }</td>
			</tr>
			<tr>
				<th width="120">등록날짜</th>
				<td><fmt:formatDate value="${ faq.faqDate }" pattern="yyyy-MM-hh"/></td>
			</tr>
			<tr>
				<th width="120">내 용</th>
				<td>${ faq.faqContent }</td>
			</tr>
			<tr>
				<th colspan="2">
					<%-- 로그인한 경우 : 본인 글 상세보기 일때는 수정페이지로 이동과 삭제 버튼 표시함 --%>
					<c:if test="${ !empty loginMember }">	
						<c:if test="${ loginMember.userId eq faq.faqWriter }">
							<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button>&nbsp;
							<button onclick="requestDelete(); return false;">글삭제</button>&nbsp;
						</c:if>
					
						<%-- 로그인한 경우 : 관리자인 경우 글삭제 버튼과 댓글달기 버튼 표시함 --%>
						<c:if test="${ loginMember.adminYN eq 'Y' and loginMember.userId ne faq.faqWriter  }">
							<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
							<c:if test="${ faq.faqLev < 3 }">
								<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
							</c:if>
						</c:if>
						
						<%-- 로그인한 경우 : 본인 글이 아니고, 레벨이 3보다 작은 경우에만 댓글달기 버튼 표시함 --%>
						<c:if test="${ loginMember.adminYN eq 'N' and loginMember.userId ne faq.faqWriter }">
							<c:if test="${ faq.faqLev < 3 }">
								<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
							</c:if>
						</c:if>
					</c:if>
					
					<%-- <% if(loginMember != null){ //로그인한 상태이면
							if(loginMember.getUserId().equals(faq.getBoardWriter())){
								//로그인한 회원 아이디와 글작성자가 같다면 (본인이 올린 글이면)
					%>
						<button onclick="moveUpdatePage(); return false;">수정페이지로 이동</button> &nbsp;
						<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
					<%      }else if(loginMember.getAdminYN().equals("Y")){  //관리자이면 %>
						<button onclick="requestDelete(); return false;">글삭제</button> &nbsp;
					<%               if(faq.getBoardLev() < 3){ %>
						<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
					<%               } %>
					<% 		 }else{ //로그인했는데 본인 글이 아닐 때 %>
						<%               if(faq.getBoardLev() < 3){ %>
						<button onclick="requestReply(); return false;">댓글달기</button> &nbsp;
					<%               } %>
					<%       }
					     } %>  --%>
					     
					     
					     
					 <c:url var="fl" value="flist.do">
					 	<c:param name="page" value="${ currentPage }" /> 
					 </c:url>   
					 <button onclick="javascript:location.href='${ fl }';">목록</button> 
				</th>		
			</tr>
		</table>
		<br>	
	
	
	
	
	
	`; 
});
</script>
<hr>

      



<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>









