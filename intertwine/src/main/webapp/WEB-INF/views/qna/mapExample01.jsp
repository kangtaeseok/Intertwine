<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=796eb8b0937083754bcfbde8cbec5dfa"></script>
	<script type="text/javascript">
		var container = document.getElementById('map'); // 지도를 표시할 div 
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(37.335887, 126.584063), // 지도의 중심좌표 (서울시청)
			level : 15 //지도의 레벨(확대, 축소 정도)
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(container, options);
		
		console.log("초기화 : ", Kakao.isInitialized());	
	</script>
</body>
</html>