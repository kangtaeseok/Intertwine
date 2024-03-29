<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
<c:import url="/WEB-INF/views/faq/faqFrameView.jsp" />
<script>
$(function(){
	
	document.getElementById("faqContent").innerHTML = `
		<h1 align="center">FAQ 원글 등록 페이지</h1>	
		<hr>

		<br>

		<!-- form  에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :
		     enctype="multipart/form-data"
		 -->
		<form action="finsert.do" method="post" enctype="multipart/form-data">
		<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">

			<tr>
			    <th>제목</th>
			    <td><input type="text" name="faqTitle"></td>
			</tr>
			<tr>
			    <th>작성자</th>
			<%--     <td><input type="text" name="faqWriter" readonly value="${ sessionScope.loginMember.userId }"></td> --%>
			    <td><input type="text" name="faqWriter" readonly value="admin"></td>
			</tr>
          <!--	<tr>
			    <th>첨부파일</th>
			    <td><input type="file" name="upfile"></td>
			</tr>   -->
			<tr>
			    <th>내용</th>
			    <td><textarea rows="5", cols="50" name="faqContent"></textarea></td>
			</tr>
			<tr>
				<c:url var="fl" value="flist.do">
					<c:param name="page" value="1"/>
				</c:url>
				
				<th colspan="2">
					<input type="submit" value="등록하기">
					<input type="reset" value="작성취소">
					<input type="button" value="목록" onclick="javascrpt.location.href='${ fl }'; return false;" }>
				</th>
			</tr>
		</table>
		</form>

		<br>	
	
	
		`; 
});
</script>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>