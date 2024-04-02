<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${ requestScope.currentPage }" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaTopView</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<style>
body, html {
    height: 100%;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    flex-direction: column;
    height: 100%;
}

header, footer {
    background-color: #666;
    color: white;
    padding: 10px;
}

main {
    flex: 1;
    display: flex;
}

.left {
    flex: 1; /* 왼쪽 요소를 오른쪽 요소의 1/4 크기로 설정 */
    padding: 20px;
    border: 1px solid #333;
}

.right {
    flex: 3; /* 오른쪽 요소를 왼쪽 요소의 4배 크기로 설정 */
    padding: 20px;
    border: 1px solid #333;
}

hr {
    border: none;
    height: 4px;
    background-color: black;
}

/* 마우스를 올릴 때 밑줄 효과 */
#faq:hover, #qna:hover {
    text-decoration: underline;
    cursor: pointer;
}
</style>

</head>
<body>
<c:import url="/WEB-INF/views/qna/qnaFrameView.jsp" />
<hr>
<br>
<div class="container">
<script type="text/javascript">
document.getElementById("qnaContent").innerHTML = `

    <!-- 초기 FAQ 내용 -->
    <h1>인기 게시판</h1>
    <hr>
    <p>문의하기 내용입니다.</p>

   <br>
    <main>
		<%-- 조회수 많은 인기게시글 3개 출력 : ajax --%>
			<div style="float:left;border:1px solid navy;padding:5px;margin:5px;margin-left:50px;">
				<h4>인기 게시글</h4>
				<table id="toplist" border="1" cellspacing="0" width="350">
					<tr><th>번호</th><th>제목</th><th>조회수</th></tr>
				</table>
			</div>
			
		</div>
    </main>
`;
</script>

</div>


<script>
$(function(){

	
	//조회수 많은 인기 게시글 상위 3개 조회 출력 처리
	$.ajax({
		url: "qtop3.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data);
			
			//object --> string
			var str = JSON.stringify(data);
			
			//string --> json
			var json = JSON.parse(str);
			
			values = "";			
			for(var i in json.list){
				values += "<tr><td>" + json.list[i].fnum 
						+ "</td><td><a href='qdetail.do?qnum=" 
						+ json.list[i].qnum + "'>"
						+ decodeURIComponent(json.list[i].qtitle).replace(/\+/gi, " ") 
						+ "</a></td><td>"
						+ json.list[i].fcount + "</td></tr>";
			}
			
			$('#toplist').html($('#toplist').html() + values);
			//$('#toplist').append(values);
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});  //ajax
	
});  //document ready


</script>





<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>