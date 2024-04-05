<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reportPage</title>
<link rel="stylesheet" href="/intertwine/resources/css/reportPage.css" />
</head>
<body>
    <h2> 콘텐츠 관리 </h2>

<hr class ="hr1" noshade> 

<form>
<span> ▷ 총 개의 신고건이 있습니다. </span>
<span class="right"> 
            
    <select>
    <option value="제목" name="제목" >이름순</option>
    <option value="제목순"name="제목순">제목순</option>
    <option value="날짜순"name="날짜순">날짜순</option>
    <option value="분류"name="분류">분류</option>
    </select>
<input type="text"> <input type="button" name="검색" class="gradient" value="검색" >
</span>
</form>

<br>
<table>
    <tr>
        <th>신고번호</th>
        <th>신고자</th>
        <th>신고제목</th>
        <th>작성날짜</th>
        <th>기타</th>
    </tr>
    <c:forEach items="${list}" var="re">
    
    <tr>
        <td class="center">1</td>
        <td class="left">게시글 1 입니다.</td>
        <td class="center">김준석</td>
        <td class="center">2022-05-18</td>
        <td class="center">15</td>   
    </tr>
    <tr>
        <td class="center">2</td>
        <td class="left">게시글 2 입니다.</td>
        <td class="center">김준석</td>
        <td class="center">2022-05-18</td>
        <td class="center">15</td>   
    </tr>
    <tr>
        <td class="center">3</td>
        <td class="left">게시글 3 입니다.</td>
        <td class="center">김준석</td>
        <td class="center">2022-05-18</td>
        <td class="center">15</td>   
    </tr>
    </c:forEach>
    
</table>


<div class="center" >
    <a href=https://www.naver.com/">◀ 이전</a> 
    <a href="https://www.naver.com/">1</a>  
    <a href="https://www.naver.com/">다음 ▶</a>
    
</div>

<span class="right">
<input type="button" value="목록" class="greylist">
<input type="button" value="글쓰기"  class="gradient">
</span>

</body>

</html>