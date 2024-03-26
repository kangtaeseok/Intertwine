<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터트와인 인덱스 페이지</title>
</head>
<body>
<!-- 웰컴 요청(첫페이지 접속)이 오면, main 페이지가 나가도록 요청을 전달함 (forwarding)
	첫페이지 요청 url : http://domain/  => 개발시에는 http://localhost:톰켓포트번호/context-root명/
	예) http://localhost:8080/first
 -->
 <%-- <%
 	RequestDispatcher view = request.getRequestDispatcher("main.do");
 	//스프링에서는 뷰페이지 내보내기도 모두 컨트롤러를 거쳐야 함
 	view.forward(request, response);
 %> --%>
<%-- <jsp:forward page="main.do" />  --%>
<h1>인터트와인 인덱스 페이지 입니다</h1>
<h1>이그노어파일 테스트용 수정입니다.</h1>
</body>
</html>







