<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}

.map_wrap {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 350px;
}

.radius_border {
	border: 1px solid #919191;
	border-radius: 5px;
}

.custom_typecontrol {
	position: absolute;
	top: 10px;
	right: 10px;
	overflow: hidden;
	width: 130px;
	height: 30px;
	margin: 0;
	padding: 0;
	z-index: 1;
	font-size: 12px;
	font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
}

.custom_typecontrol span {
	display: block;
	width: 65px;
	height: 30px;
	float: left;
	text-align: center;
	line-height: 30px;
	cursor: pointer;
}

.custom_typecontrol .btn {
	background: #fff;
	background: linear-gradient(#fff, #e6e6e6);
}

.custom_typecontrol .btn:hover {
	background: #f5f5f5;
	background: linear-gradient(#f5f5f5, #e3e3e3);
}

.custom_typecontrol .btn:active {
	background: #e6e6e6;
	background: linear-gradient(#e6e6e6, #fff);
}

.custom_typecontrol .selected_btn {
	color: #fff;
	background: #425470;
	background: linear-gradient(#425470, #5b6d8a);
}

.custom_typecontrol .selected_btn:hover {
	color: #fff;
}

.custom_zoomcontrol {
	position: absolute;
	top: 50px;
	right: 10px;
	width: 36px;
	height: 80px;
	overflow: hidden;
	z-index: 1;
	background-color: #f5f5f5;
}

.custom_zoomcontrol span {
	display: block;
	width: 36px;
	height: 40px;
	text-align: center;
	cursor: pointer;
}

.custom_zoomcontrol span img {
	width: 15px;
	height: 15px;
	padding: 12px 0;
	border: none;
}

.custom_zoomcontrol span:first-child {
	border-bottom: 1px solid #bfbfbf;
}

form fieldset {
	width: 600px;	
}

form.sform {
	background: lightgray;
	width: 630px;
	position: relative;
	left: 400px;
	display: none;  /* 안 보이게 함 */
}

#right{
	width: 300px;
	height: 800px;
	float: right;
	background-color: grey;
}
</style>


<script type="text/javascript">
	//함수 작성부 ----------------------------------------------------------------------------------
	

	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) {
		var roadmapControl = document.getElementById('btnRoadmap');
		var skyviewControl = document.getElementById('btnSkyview');
		if (maptype === 'roadmap') {
			map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);
			roadmapControl.className = 'selected_btn';
			skyviewControl.className = 'btn';
		} else {
			map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
			skyviewControl.className = 'selected_btn';
			roadmapControl.className = 'btn';
		}
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
		map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
		map.setLevel(map.getLevel() + 1);
	}
</script>
</head>
<body>
<script type="text/javascript">

var lat = 0;
var lng = 0;

//실행시 권한 요청을 수락하여야 함.
navigator.geolocation.getCurrentPosition(function(position) {
	lat = position.coords.latitude;
	lng = position.coords.longitude;

	console.log("위도 : " + lat);
	console.log("경도 : " + lng);
});
</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d5ca38c3bb09a3f741624681ad7f7a00&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript"
		src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
	<h1>지도 서비스</h1>
	<hr>

<form action="asearchTitle.do" method="post" enctype="multipart/form-data">
	<fieldset>
		<legend>검색할 제목을 입력하세요.</legend>
		<input type="search" name="keyword" size="50"> &nbsp;	
		<input type="submit" value="검색">
	</fieldset>
</form>
	

	<div class="map_wrap">
		<div id="map"
			style="width: 800px; height: 700px; position: relative; overflow: hidden;"></div>
		<script type="text/javascript">
			
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			console.log('map : ' + map);
			
			//컨트롤러 Model 에 저장된 이름 sendJson 으로 저장된 json 객체의 jsonString 값을 꺼내서 변수에 저장
			var str = '${ sendJson }';
			console.log(typeof (str)); //string
			var json = JSON.parse(str); //string --> json object

			var positions = [];

			for ( var i in json.list) {
				latitude = json.list[i].lat;
				longitude = json.list[i].lon;
				console.log(latitude + ", " + longitude);

				positions[i] = {
					title : decodeURIComponent(json.list[i].id)
							.replace(/\+/gi, " "),
					latlng : new kakao.maps.LatLng(latitude, longitude)
				};
			} //for in
			console.log(positions);

			// 마커 이미지의 이미지 주소입니다 (예 : "/first/resources/images/marker.png")
			var imageSrc = "${ pageContext.servletContext.contextPath }/resources/images/markerStar.png";

			for (var i = 0; i < positions.length; i++) {
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(24, 35);

				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map : map, // 마커를 표시할 지도
					position : positions[i].latlng, // 마커를 표시할 위치
					title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image : markerImage
				// 마커 이미지 
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
			}
		</script>
		<!-- 지도타입 컨트롤 div 입니다 -->
		<div class="custom_typecontrol radius_border">
			<span id="btnRoadmap" class="selected_btn"
				onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
				class="btn" onclick="setMapType('skyview')">스카이뷰</span>
		</div>
		<!-- 지도 확대, 축소 컨트롤 div 입니다 -->
		<div class="custom_zoomcontrol radius_border">
			<span onclick="zoomIn()"><img
				src="${ pageContext.servletContext.contextPath }/resources/images/ico_plus.png"
				alt="확대"></span> <span onclick="zoomOut()"><img
				src="${ pageContext.servletContext.contextPath }/resources/images//ico_minus.png"
				alt="축소"></span>
		</div>
	</div>
	
	<!-- 오른쪽 정보출력 구역입니다. -->
	<div id="right">
		<span>${ attraction }</span>
	</div>

</body>
</html>