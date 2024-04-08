<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Intertwine</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 디자인을 지원하기 위한 뷰포트 설정 -->
<!-- <link rel="icon" href="favicon.ico" type="image/X-icon"> --> <!-- 파비콘 설정 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" /> <!-- swiper css 가져오기 -->
<link rel="stylesheet" href="/intertwine/resources/css/squareMain.css"> <!-- 이 jsp파일의 css파일 연결 -->
<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/css/bootstrap.min.css" rel="stylesheet"> -->
<script defer src="/intertwine/resources/js/squareMain.js"></script> <!-- 이 jsp파일의 js파일 연결 -->
<script src="https://kit.fontawesome.com/4b2098cb2a.js" crossorigin="anonymous"></script> <!-- 폰트어썸 가져오기 -->
<script type="text/javascript" src="/intertwine/resources/js/jquery-3.7.0.min.js"></script> <%-- jquery 파일 로드 --%>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.0/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<!-- 닉네임 수정 모달 -->
<div class="nicknamemodal" id="nicknameChangeModal" tabindex="-1" aria-labelledby="nicknameChangeModalLabel" aria-hidden="true">
  <div class="nicknamemodal-dialog">
    <div class="nicknamemodal-content">
      <div class="nicknamemodal-header">
        <h5 class="nicknamemodal-title" id="nicknameChangeModalLabel">닉네임 수정</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
      </div>
      <div class="nicknamemodal-body">
        <form>
          <div class="mb-3">
           <!--  <label for="nickname-input" class="col-form-label"></label> -->
            <input type="text" class="form-control" id="renamenicknameinput" autocomplete="off" placeholder="새로운 닉네임 입력" style="width: 160px;">
          </div>
        </form>
      </div>
      <div class="nicknamemodal-footer">
        <button type="button" class="btn btn-secondary" id="cancleNicknamebtn" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="changeNicknamebtn">변경</button>
      </div>
    </div>
  </div>
</div>
<!-- 닉네임 수정 모달 -->

<!-- 캐릭터 수정 모달 -->
<div class="charactermodal" id="characterChangeModal" tabindex="-1" aria-labelledby="characterChangeModalLabel" aria-hidden="true">
  <div class="charactermodal-dialog">
    <div class="charactermodal-content">
      <div class="charactermodal-header">
        <h5 class="charactermodal-title" id="characterChangeModalLabel">캐릭터 수정</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
         <div class="charactermodal-preview">
         	<div id="previewcharacter" style="width: 70px; height: 120px; position: absolute; top:65px; left: 42px; /* background: blue; */ padding:10px;">
						    <div id="previewcharacterhair" class="previewcharacterresource" style="position: absolute; width: 30px; height: 20px; top:8px; left:18px;"></div>
						    <div id="previewcharacterhat" class="previewcharacterresource" style="position: absolute; width: 50px; height: 20px; top:0px; left: 7px;"></div>
						    <div id="previewcharactertop" class="previewcharacterresource" style="position: absolute; width: 50px; height: 30px; top: 30px; left: 10px; /* background-color: pink; */"></div>
						    <div id="previewcharacterbottom" class="previewcharacterresource" style="position: absolute; width: 50px; height: 40px; top: 60px; left: 10px; /* background-color: orange; */"></div>
						    
			</div>
         </div>
      </div>
				<div class="charactermodal-body">
					<div class="charactermodal-hair-container">
						<div id="characterhair0" class="charactermodal-hair"></div>
						<div id="characterhair1" class="charactermodal-hair"></div>
						<div id="characterhair2" class="charactermodal-hair"></div>
						<div id="characterhair3" class="charactermodal-hair"></div>
						<div id="characterhair4" class="charactermodal-hair"></div>
						<div id="characterhair5" class="charactermodal-hair"></div>
						<div id="characterhair6" class="charactermodal-hair"></div>
						<div id="characterhair7" class="charactermodal-hair"></div>
						<div id="characterhair8" class="charactermodal-hair"></div>
						<div id="characterhair9" class="charactermodal-hair"></div>
					</div>

					<div class="charactermodal-hat-container">
						<div id="characterhat0" class="charactermodal-hat"></div>
						<div id="characterhat1" class="charactermodal-hat"></div>
						<div id="characterhat2" class="charactermodal-hat"></div>
						<div id="characterhat3" class="charactermodal-hat"></div>
						<div id="characterhat4" class="charactermodal-hat"></div>
						<div id="characterhat5" class="charactermodal-hat"></div>
						<div id="characterhat6" class="charactermodal-hat"></div>
						<div id="characterhat7" class="charactermodal-hat"></div>
						<div id="characterhat8" class="charactermodal-hat"></div>
						<div id="characterhat9" class="charactermodal-hat"></div>
					</div>

					<div class="charactermodal-top-container">
						<div id="charactertop0" class="charactermodal-top"></div>
						<div id="charactertop1" class="charactermodal-top"></div>
						<div id="charactertop2" class="charactermodal-top"></div>
						<div id="charactertop3" class="charactermodal-top"></div>
						<div id="charactertop4" class="charactermodal-top"></div>
						<div id="charactertop5" class="charactermodal-top"></div>
						<div id="charactertop6" class="charactermodal-top"></div>
						<div id="charactertop7" class="charactermodal-top"></div>
						<div id="charactertop8" class="charactermodal-top"></div>
						<div id="charactertop9" class="charactermodal-top"></div>
					</div>

					<div class="charactermodal-bottom-container">
						<div id="characterbottom0" class="charactermodal-bottom"></div>
						<div id="characterbottom1" class="charactermodal-bottom"></div>
						<div id="characterbottom2" class="charactermodal-bottom"></div>
						<div id="characterbottom3" class="charactermodal-bottom"></div>
						<div id="characterbottom4" class="charactermodal-bottom"></div>
						<div id="characterbottom5" class="charactermodal-bottom"></div>
						<div id="characterbottom6" class="charactermodal-bottom"></div>
						<div id="characterbottom7" class="charactermodal-bottom"></div>
						<div id="characterbottom8" class="charactermodal-bottom"></div>
						<div id="characterbottom9" class="charactermodal-bottom"></div>
					</div>
				</div>
				<div class="charactermodal-footer">
        <button type="button" class="btn btn-secondary" id="cancleCharacterbtn" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="changeCharacterbtn">변경</button>
      </div>
    </div>
  </div>
</div>
<!-- 캐릭터 수정 모달 -->

<!-- 방 수정 모달 -->
<div class="roommodal" id="roomChangeModal" tabindex="-1" aria-labelledby="roomChangeModalLabel" aria-hidden="true">
  <div class="roommodal-dialog">
    <div class="roommodal-content">
      <div class="roommodal-header">
        <h5 class="roommodal-title" id="roomChangeModalLabel">방 꾸미기</h5>
        <!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
        <ul class= "roomcolor">
         		<li class="green"></li>
         		<li class="blue"></li>
         		<li class="red"></li>
         		<li class="purple"></li>
         		<li class="cyan"></li>
         		<li class="yellow"></li>
         		<li class="orange"></li>
         		<li class="lime"></li>
         		<li class="pink"></li>
         		<li class="yeonpink"></li>
         		<li class="olive"></li>
         		<li class="gray"></li>
         	</ul>
         <div class="roommodal-preview">
         	<!-- <div id="previewroom" style="width: 70px; height: 120px; position: absolute; top:65px; left: 42px; /* background: blue; */ padding:10px;"></div> -->
						 
         </div>
      </div>
				<div class="roommodal-body">
					<div class="roommodal-first-container">
						<div id="roomresource0" class="roommodal-resource"></div>
						<div id="roomresource1" class="roommodal-resource"></div>
						<div id="roomresource2" class="roommodal-resource"></div>
						<div id="roomresource3" class="roommodal-resource"></div>
						<div id="roomresource4" class="roommodal-resource"></div>
						<div id="roomresource5" class="roommodal-resource"></div>
						<div id="roomresource6" class="roommodal-resource"></div>
						<div id="roomresource7" class="roommodal-resource"></div>
						<div id="roomresource8" class="roommodal-resource"></div>
						<div id="roomresource9" class="roommodal-resource"></div>
					</div>

					<div class="roommodal-second-container">
						<div id="roomresource10" class="roommodal-resource"></div>
						<div id="roomresource11" class="roommodal-resource"></div>
						<div id="roomresource12" class="roommodal-resource"></div>
						<div id="roomresource13" class="roommodal-resource"></div>
						<div id="roomresource14" class="roommodal-resource"></div>
						<div id="roomresource15" class="roommodal-resource"></div>
						<div id="roomresource16" class="roommodal-resource"></div>
						<div id="roomresource17" class="roommodal-resource"></div>
						<div id="roomresource18" class="roommodal-resource"></div>
						<div id="roomresource19" class="roommodal-resource"></div>
					</div>

					<div class="roommodal-third-container">
						<div id="roomresource20" class="roommodal-resource"></div>
						<div id="roomresource21" class="roommodal-resource"></div>
						<div id="roomresource22" class="roommodal-resource"></div>
						<div id="roomresource23" class="roommodal-resource"></div>
						<div id="roomresource24" class="roommodal-resource"></div>
						<div id="roomresource25" class="roommodal-resource"></div>
						<div id="roomresource26" class="roommodal-resource"></div>
						<div id="roomresource27" class="roommodal-resource"></div>
						<div id="roomresource28" class="roommodal-resource"></div>
						<div id="roomresource29" class="roommodal-resource"></div>
					</div>
				</div>
				<div class="roommodal-footer">
        <button type="button" class="btn btn-secondary" id="cancleroombtn" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="changeroombtn">변경</button>
      </div>
    </div>
  </div>
</div>
<!-- 방 수정 모달 -->


	<header> <!-- 페이지 상단 -->
		<div>
			<nav class="homebutton_nav"> <!-- 홈 버튼 -->
				<ul>
					<li class="homebutton"></li>
				</ul>
				<ol>
					<a href="#"><i class="fa-solid fa-house"></i></a> <!-- 웹페이지 축소했을때 나오는 집 모양 아이콘 -->
				</ol>
			</nav>
		</div>

		<div class="search"> <!-- 검색창 -->
			<input type="text" placeholder="검색어 입력"> <img src="/intertwine/resources/images/search.png">
		</div>

		<div></div>
		<!-- 검색창 중앙배치를 위한 dummy div 영역을 잡아주는 것, justify-content: space-around; 배치이기 때문에 얘가 없으면 검색창이 중앙에 안 옴 -->
	</header>

	<main>
		<aside class="side-bar">
			<ul>
				<li id="square">
					<%-- <a href="${ pageContext.servletContext.contextPath }/startSquare.do"><i class="fa-solid fa-gamepad"></i> 스퀘어</a> --%>
					<!-- 스퀘어에서 스퀘어 버튼 막아놓기 --> <a href="#"><i class="fa-solid fa-gamepad"></i> 스퀘어</a>
				</li>
				<li id="mypage"><a href="#"><i class="fa-solid fa-circle-user"></i> 마이페이지</a> 
				<!-- <a href="#"><i class="fa-solid fa-user"></i> 마이페이지</a> --><!-- 색칠된 아이콘 -->
				</li>
				<li id="friend"><a href="#"><i class="fa-solid fa-user-group"></i> 친구</a></li>
				<li id="chatting"><a href="#"><i class="fa-solid fa-comment"></i> 채팅</a></li>
				<li id="alarm"><a href="#"><i class="fa-solid fa-bell"></i> 알림</a></li>
				<li id="bookmark"><a href="#"><i class="fa-solid fa-bookmark"></i> 북마크</a></li>
				<li id="settings"><a href="#"><i class="fa-solid fa-gear"></i> 설정</a></li>
			</ul>
		</aside>
		<div id="submenubars">
			<div id="dummy_sub_menu" class="sub_menu">더미 서브메뉴</div>
			<div id="mypage_sub_menu" class="sub_menu">마이페이지 서브메뉴</div>
			<div id="chatting_sub_menu" class="sub_menu">채팅 서브메뉴</div>
			<div id="alarm_sub_menu" class="sub_menu">알림 서브메뉴</div>
			<div id="settings_sub_menu" class="sub_menu">설정 서브메뉴</div>
		</div>
		<div id="bottom_right_contents">
			<div id="abc">
				<div id="squarearea">
					<div id="loadingview">
						<img src="/intertwine/resources/images/loading/loading3.gif" alt="로딩 중...">
						<div id="squaretip">알고 계셨나요? 팀 세미콜론은 8명의 멤버로 이루어져 있답니다.</div>
						<!-- <div id="squaretip">알고 계셨나요? Intertwine은 두 가지 이상의 것이 서로 얽히거나 엮이는 것을 의미합니다. </div> -->
						<!-- <div id="squaretip">알고 계셨나요? 알고 계셨군요.</div> -->
					</div>
					<div id="userroom" style="background-color:${userRoom.roomColor}">
					<button id="btnselectguestbook" class="bubbly-button">방명록 보기</button>
					<button id="btnselectalbum" class="bubbly-button">앨범 보기</button>
					<c:if test="${userRoom.userId == sessionScope.loginUser.userId}">
					<button id="btnupdateroom" class="bubbly-button">방꾸미기</button>
					</c:if>
						<c:forEach var="roomResource" items="${userRoom.rList}">
							<img src="${roomResource.resourceURL}" 
									 alt="Room Resource Image"
									 class="userroomresource"
									 style="position: absolute; 
									            left: ${roomResource.resourcePositionX}px; 
									            top: ${roomResource.resourcePositionY}px; 
									            transform: rotate(${roomResource.resourceRotation}deg) scale(${roomResource.resourceScale});" />
						</c:forEach>
						<div id="mycharacter" style="width: 70px; height: 100px; position: absolute; top: 200px; left: 670px;">
							<div id="mycharacternickname" style="position: absolute; bottom: 100%; width: 100%; text-align: center; margin-bottom:4px;">닉네임</div>
						    <div id="mycharacterhair" class="mycharacterresource" style="position: absolute; width: 30px; height: 20px; top:8px"></div>
						    <div id="mycharacterhat" style="position: absolute; width: 50px; height: 20px; background-size: calc(100% - 10px) calc(100% - 10px);" ></div>
						    <div id="mycharactertop" class="mycharacterresource" style="position: absolute; width: 50px; height: 30px; top: 30px; left: 10px; /* background-color: pink; */"></div>
						    <div id="mycharacterbottom" class="mycharacterresource" style="position: absolute; width: 50px; height: 40px; top: 60px; left: 10px; /* background-color: orange; */"></div>
						</div>
					</div>
					<%-- userroom --%>
					<div>
						<%--
							${userRoom.guestBookOpen}
							Resource ID: ${roomResource.resourceId}
							Resource Name: ${roomResource.resourceName}
							Position X: ${roomResource.resourcePositionX}
							Position Y: ${roomResource.resourcePositionY} 
						--%>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
$(function(){ // document.ready
	
		var userId = "${userRoom.userId}";
	    var userIdFromJSP = "${userRoom.userId}"; // JSP 변수를 JavaScript 변수로 변환
	    window.globaluserId = userIdFromJSP; // 이 변수를 window 객체의 프로퍼티로 설정하여 전역으로 사용 가능하게 함
	    var currentHairId;
	    var currentHatId;
	    var currentTopId;
	    var currentBottomId;
	    
		// ajax 사용
		$.ajax({
			
			url: "getmycharacter.do",
			type: "post",	
			data: { "userId": userId }, 
			dataType: "json",  
			success: function(data){
				 // json 객체 한 개를 받을때는 바로 출력할 수 있음
				console.log("json data : " + data);
				
				const hair = document.querySelector("#mycharacterhair");
			    hair.style.backgroundImage = "url('" + data.hairStyleImageURL + "')";
			    hair.style.backgroundSize = "cover";
			    hair.style.backgroundPosition = "center";
			    const hat = document.querySelector("#mycharacterhat");
			    hat.style.backgroundImage = "url('" + data.hatImageURL + "')";
			    hat.style.backgroundSize = "cover";
			    hat.style.backgroundPosition = "center";
			    const top = document.querySelector("#mycharactertop");
			    top.style.backgroundImage = "url('" + data.topImageURL + "')";
			    top.style.backgroundSize = "cover";
			    top.style.backgroundPosition = "center";
			    const bottom = document.querySelector("#mycharacterbottom");
			    bottom.style.backgroundImage = "url('" + data.bottomImageURL + "')";
			    bottom.style.backgroundSize = "cover";
			    bottom.style.backgroundPosition = "center";
			    
			}, 
			error: function(request, status, errorData){
				 console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData); 
			}
		});  // ajax
		
		$.ajax({
			url: "getnickname.do",
			type: "post",	
			data: { "userId": userId }, 
			dataType: "json",  
			success: function(data){
				
				const nicknameDiv = document.querySelector("#mycharacternickname");
				nicknameDiv.textContent = data.nickname;
			}, 
			error: function(request, status, errorData){
				 console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData); 
			}
		});  // ajax
		
		document.getElementById("renamenicknameinput").addEventListener("keypress", function(event) {
		    // 엔터 키가 눌렸는지 확인
		    if (event.key === "Enter") {
		        // 엔터 키의 기본 동작을 막습니다 (폼 제출 등)
		        event.preventDefault();
		        // 버튼 클릭 이벤트를 발생시킵니다
		        document.getElementById("changeNicknamebtn").click();
		    }
		});
		
		$("#changeNicknamebtn").click(function() {
	       	
	        var renameNickname = $("#renamenicknameinput").val(); // 새 닉네임 입력 필드의 값
	        
	        if(renameNickname != null&&renameNickname != ''){
	    	    console.log("닉네임수정버튼 클릭!");
	        
	        $.ajax({
	        	
	            url: "changenickname.do", // 요청을 보낼 서버의 URL
	            type: "POST", // HTTP 요청 방식
	            data: {
	                "userId": userId, 
	                "renameNickname": renameNickname 
	            },
	            success: function(response) {
	                // 서버로부터의 응답 처리
	                console.log("닉네임 변경 성공");
	                
	                // 모달창 닫기
	                const modal = document.querySelector(".nicknamemodal");
					modal.style.display="none";
					$("#renamenicknameinput").val(''); // 입력 값 초기화
					
	                const nicknameDiv = document.querySelector("#mycharacternickname");
					nicknameDiv.textContent = renameNickname;
	            },
	            error: function(request, status, error) {
	                // 오류 처리
	                
	                console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + error); 
	            }
	        });
	        }
	    });
		
		$("#changeCharacterbtn").click(function() {
			
	        var previewcharacterhairImgURL = $('#previewcharacterhair').css('background-image');
	        var previewcharacterhatImgURL = $("#previewcharacterhat").css('background-image');
	        var previewcharactertopImgURL = $("#previewcharactertop").css('background-image');
	        var previewcharacterbottomImgURL = $("#previewcharacterbottom").css('background-image');

	        $.ajax({
	        	
	            url: "changemycharacter.do", // 요청을 보낼 서버의 URL
	            type: "POST", // HTTP 요청 방식
	            data: {	            	
	            	"userId": userId, 
	            	"hairId": currentHairId, 
	            	"hatId": currentHatId, 
	            	"topId": currentTopId, 
	            	"bottomId": currentBottomId
	            },
	            success: function(response) {
	               
	                $('#mycharacterhair').css('background-image', previewcharacterhairImgURL);
	                $('#mycharacterhat').css('background-image', previewcharacterhatImgURL);
	                $('#mycharactertop').css('background-image', previewcharactertopImgURL);
	                $('#mycharacterbottom').css('background-image', previewcharacterbottomImgURL);
	                
	                // 모달창 닫기
	                const modal = document.querySelector(".charactermodal");
					modal.style.display="none";

					console.log("캐릭터 변경 성공");
	                
	            },
	            error: function(request, status, error) {
	                // 오류 처리
	                
	                console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + error); 
	            }
	        });
	    });
		
		
		
		
	
		$("#cancleNicknamebtn").click(function() {
			const modal = document.querySelector(".nicknamemodal");
			modal.style.display="none";
			$("#renamenicknameinput").val(''); // 입력 값 초기화
		});
		
		$("#cancleCharacterbtn").click(function() {
			const modal = document.querySelector(".charactermodal");
			modal.style.display="none";
		});
		
		$("#cancleroombtn").click(function() {
			const modal = document.querySelector(".roommodal");
			modal.style.display="none";
		});
		
		$('.charactermodal-hair-container > div').each(function() {
	        // 각 hairdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var hairId = $(this).data('hairId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(hairId);
	            currentHairId = hairId;
	            
	            // previewcharacterhair의 background-image로 설정
	            $('#previewcharacterhair').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-hat-container > div').each(function() {
	        // 각 hatdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var hatId = $(this).data('hatId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(hatId);
	            currentHatId = hatId;
	            
	            // previewcharacterhat의 background-image로 설정
	            $('#previewcharacterhat').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-top-container > div').each(function() {
	        // 각 topdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var topId = $(this).data('topId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(topId);
	            currentTopId = topId;
	            
	            // previewcharactertop의 background-image로 설정
	            $('#previewcharactertop').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$('.charactermodal-bottom-container > div').each(function() {
	        // 각 bottomdiv에 클릭 이벤트 리스너 추가
	        $(this).click(function() {
	            // 클릭된 div의 background-image URL 추출
	            var clickedDivBackgroundImage = $(this).css('background-image');
	            var bottomId = $(this).data('bottomId'); // 데이터 뽑아내기
	            console.log(clickedDivBackgroundImage);
	            console.log(bottomId);
	            currentBottomId = bottomId;
	            
	            // previewcharacterbottom의 background-image로 설정
	            $('#previewcharacterbottom').css('background-image', clickedDivBackgroundImage);
	        });
	    });
		
		$("#btnupdateroom").click(function () {
	        console.log("방꾸미기 버튼 클릭!");
	        const modal = document.querySelector("#roomChangeModal");
	        modal.style.display = "flex";
	        
	        $.ajax({
	            url: "getallroomreosource.do",
	            type: "post",
	            dataType: "json",
	            success: function (data) {
	            	var resourceList = data.jarr; // 컨트롤러에서 보낸 jarr 사용

	                var firstDivs = document.querySelectorAll('.roommodal-first-container > div');
	                var secondDivs = document.querySelectorAll('.roommodal-second-container > div');
	                var thirdDivs = document.querySelectorAll('.roommodal-third-container > div');
	             
	                // firstDivs에 첫 번째 10개의 리소스 적용
	                resourceList.slice(0, 10).forEach(function(userRoomResource, index) {
	                    var $div = $(firstDivs[index]); // jQuery 객체로 변환
	                    $div.css('background-image', 'url(' + userRoomResource.resourceURL  + ')');
	                });
	                
	                // secondDivs에 다음 10개의 리소스 적용
	                resourceList.slice(10, 20).forEach(function(userRoomResource, index) {
	                    var $div = $(secondDivs[index]); // jQuery 객체로 변환
	                    $div.css('background-image', 'url(' + userRoomResource.resourceURL + ')');
	                });
	                
	                // thirdDivs에 마지막 10개의 리소스 적용
	                resourceList.slice(20, 30).forEach(function(userRoomResource, index) {
	                    var $div = $(thirdDivs[index]); // jQuery 객체로 변환
	                    $div.css('background-image', 'url(' + userRoomResource.resourceURL + ')');
	                });

	            },
	            error: function (request, status, errorData) {
	                console.log("error code : " + request.status
	                    + "\nMessage : " + request.responseText
	                    + "\nError : " + errorData);
	            }
	        });  // ajax
	        
	    });
		
		
		
		    var colorItems = document.querySelectorAll('.roomcolor li');

		    // 각 li 태그에 대해 클릭 이벤트 리스너를 추가
		    colorItems.forEach(function(item) {
		        item.addEventListener('click', function() {
		            // 클릭된 li의 배경색을 가져옴
		            var bgColor = getComputedStyle(item).backgroundColor;

		            // .roommodal-preview 클래스를 가진 div의 배경색을 클릭된 li의 배경색으로 변경
		            document.querySelector('.roommodal-preview').style.backgroundColor = bgColor;
		        });
		    });
		
		
		
});  // document.ready

</script>


</body>
</html>