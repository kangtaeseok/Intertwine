<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색창</title>
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<style>
fieldset#ss {
	width: 600px;
	position: relative;
	left: 450px;
}
</style>
</head>
<body>
<h1>관광지 검색 사이트입니다.</h1>

<fieldset id="ss">
	<legend>관광지 이름 검색란입니다.</legend>
	<input type="radio" name="item" id="title"> 이름 &nbsp;
</fieldset>

<%-- 제목 검색 폼 --%>
<form id="titleform" class="sform" action="asearchTitle.do" method="post">
	<input type="hidden" name="action" value="title">	
<fieldset>
	<legend>검색할 제목을 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="5" selected>5</option>
		<option value="10" >10</option>
		<option value="15" >15</option>
	</select> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form>

<%-- 조회된 게시글 목록 출력 --%>
<table align="center" border="1" cellspacing="0" width="700">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>주소</th>
		<th>주차가능수</th>
		<th>관광지소개</th>
		<th>관리기관명</th>
		<th>관리기관전화번호</th>
		<th>지정일자</th>
	</tr>
	<c:forEach items="${ requestScope.list }" var="a">
		<tr>
			<td align="center">${ a.attractionId }</td>
			<td>
			<c:url var="as" value="asearchTitle.do">
				<c:param name="bnum" value="${ a.attractionId }" /> <!-- 필수 -->
				<c:param name="page" value="${ nowpage }"/>
			</c:url>
			<a href="${ as }">${ a.attractionName }</a>
			</td>
			<td align="center">${ a.attractionAddress }</td>
			<td align="center">${ a.attractionPark }</td>
			<td align="center">${ a.attractionDescription }</td>
			<td align="center">${ a.attractionInstitutionName }</td>
			<td align="center">${ a.attractionInstitutionPhone }</td>
			<td align="center">${ a.attractiondate }</td>
			</td>
			<td align="center">${ a.selectSearchTitleCount }</td>
		</tr>
		</c:forEach>
</table>




</body>
</html>