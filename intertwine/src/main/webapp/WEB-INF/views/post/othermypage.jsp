<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>다른계정페이지</h2>
<h2>현재 페이지에 접속한 다른 계정 : ${sessionScope.loginUser.userId}</h2>
<h2>이 페이지의 주인 계정 : ${otherUser.userId}</h2>
</body>
</html>