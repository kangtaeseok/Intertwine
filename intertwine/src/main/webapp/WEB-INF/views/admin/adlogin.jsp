<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=Pacifico&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/intertwine/resources/css/admin/adLogin.css" />
</head>
<body>
<div class="container">
	<div class="login-wrapper" >
		<div class="logo-box">
	     <img src="/intertwine/resources/images/intertwinelogo.png">
	     <br>   
	    </div>
	    		<h2>Admin Login</h2>
	        <form method="post" action="alogin.do" id="login-form">
	            <input type="text" name="adminId" placeholder="AdminId">
	            <input type="password" name="adminPwd" placeholder="Password">
	                 <input type="submit" value="로그인">
	        </form>
		</div> 
    </div>
</body>
</html>