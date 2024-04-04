<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportPage</title>
<link rel="stylesheet" href="/first/resources/css/reportPage.css" />
</head>
<body>
<h2>신고현황</h2>
	<select name="reportSelect">
		<option selected>이름순</option>
		<option>제목순</option>
		<option>날짜순</option>
		<option>분류</option>
	</select>
	
	<table>
		<thead>
			<tr><th>신고번호</th>
				<th>신고자</th>
				<th>신고제목</th>
				<th>작성날짜</th>
				<th>처리상태</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="re">
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
			
			<tr>
				<td></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>



</body>
</html>