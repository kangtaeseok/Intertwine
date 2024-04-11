<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<body>
	<aside class="side-bar">
            <ul>
                <li id="square">
                    <li><a href="${ pageContext.servletContext.contextPath }/rptlist.do"><i class="fa-solid fa-clipboard"></i> 콘텐츠 관리</a></li>
                <li id="mypage">
                <li id="friend">
                <li id="chatting">
                    <li><a href="${ pageContext.servletContext.contextPath }/adnlist.do"><i class="fa-solid fa-gear"></i> 서비스 관리</a></li>
                <li id="alarm">
                    <li><a href="${ pageContext.servletContext.contextPath }/flist.do"><i class="fa-solid fa-q"></i> 고객센터</a></li>
                <li id="alarm2">
                    <li><a href="${ pageContext.servletContext.contextPath }/alogout.do"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃</a></li>    
                
            </ul>
        </aside>
</body>
</html>