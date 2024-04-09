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


	<nav>
		<ul id="menubar">
		<%--
			스프링에서의 절대경로 표기 : 
			context-root 명으로 표기하지 않고
			${ pageContext.servletContext.contextPath } 표기함
		 --%>
			<li><a href="${ pageContext.servletContext.contextPath }/kakaoMessage.do">Q&A api</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveAPI.do">카카오맵</a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveShareData.do">카카오푸시알람</a></li>
		</ul>
	</nav>





</body>
</html>