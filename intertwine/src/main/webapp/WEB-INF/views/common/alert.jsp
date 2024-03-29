<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script>
<script>
	var msg = "<c:out value='${msg}'/>";
	var url = "<c:out value='${url}'/>";
	alert(msg);
	location.href= url;
</script>
<meta charset="UTF-8">
<title>alert</title>
</head>
<body>

</body>
</html>