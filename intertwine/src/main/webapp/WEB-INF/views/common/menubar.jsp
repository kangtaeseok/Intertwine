<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@ page import="member.model.vo.Member" %>
<%
	//로그인 확인을 위해서 내장된 session 객체를 이용
	Member loginMember = (Member)session.getAttribute("loginMember");
%>  --%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
body {
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	align-items: center;
	background-color: #ebfaff;
}
nav > ul#menubar {
	list-style: none;
	position: relative;
	/* left: 100px; */
	right: 20px;
	
}

nav > ul#menubar li {
	float: left;
	width: 120px;
	height: 30px;
	margin-right: 5px;
	padding: 0;
}

nav > ul#menubar li a {
	text-decoration: none;
	width: 120px;
	height: 30px;
	display: block;
	background: #4affff;
	color: navy;
	text-align: center;
	font-weight: bold;
	margin: 0;
	text-shadow: 1px 1px 2px white;
	padding-top: 5px;
	border-radius: 10px;
}

nav > ul#menubar li a:hover {
	text-decoration: none;
	width: 120px;
	height: 30px;
	dispaly: block;
	background: #35e0f7;
	color: white;
	text-align: center;
	font-weight: bold;
	margin: 0;
	text-shadow: 1px 1px 2px white;
	padding-top: 5px;
}
table {
	border-radius: 10px;
}

hr { clear: both; }
</style>
</head>
<body>
<%-- <% if(loginMember == null){  //로그인하지 않았을 때 %> --%>
<c:if test="${ empty sessionScope.loginMember }">
	<nav>
		<ul id="menubar">
		<%--
			스프링에서의 절대경로 표기 : 
			context-root 명으로 표기하지 않고
			${ pageContext.servletContext.contextPath } 표기함
		 --%>
			<li><a href="${ pageContext.servletContext.contextPath }/main.do">Home</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시글</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveAOP.do">AOP란</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveAjax.do">ajax 처리</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/main.do">예제</a></li>
		</ul>
	</nav>
</c:if>
<%-- <% }else if(loginMember.getAdminYN().equals("Y")){  //관리자가 로그인했을 때 %> --%>
<c:if test="${ !empty sessionScope.loginMember and loginMember.adminYN eq 'Y' }">
	<nav>
		<ul id="menubar">
			<li><a href="${ pageContext.servletContext.contextPath }/main.do">Home</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항관리</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시글관리</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/mlist.do?page=1">회원관리</a></li>
			<li><a href="#">테스트API</a></li>
			<li><a href="#">예제</a></li>
		</ul>
	</nav>
</c:if>
<%-- <% }else{ //일반회원이 로그인 했을 때 %> --%>
<c:if test="${ !empty sessionScope.loginMember and loginMember.adminYN ne 'Y' }">
	<nav>
		<ul id="menubar">
			<li><a href="${ pageContext.servletContext.contextPath }/main.do">Home</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/nlist.do?page=1">공지사항</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do?page=1">게시글</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveAOP.do">AOP란</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveAjax.do">ajax 처리</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/main.do">예제</a></li>
		</ul>
	</nav>
</c:if>
<%-- <% } %> --%>


</body>
</html>