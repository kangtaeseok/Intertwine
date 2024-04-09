<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="views/common/error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>second : project</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script src="https://kit.fontawesome.com/40acfae8f0.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/intertwine/resources/css/admain.css" />
<script>
const dpTime = function () {
	      const now = new Date()
	      let year = now.getFullYear()
	      let month = now.getMonth()
	      let day = now.getDay()
	      let hours = now.getHours()
	      let minutes = now.getMinutes()
	      let seconds = now.getSeconds()
	      let ampm = ''
	      if (hours > 12) {
	        /* hours -= 12 */
	        ampm = '오후'
	      } else {
	        ampm = '오전'
	      }
	      if (hours < 10) {
	        hours = '0' + hours
	      }
	      if(month < 10){
	    	  month = '0' + month
	      }
	      if(day < 10){
	    	  day = '0' + day
	      }
	      if (minutes < 10) {
	        minutes = '0' + minutes
	      }
	      if (seconds < 10) {
	        seconds = '0' + seconds
	      }
	      $('#time').html(year + "년 " + month + "월 " + day + "일 " +  ampm + " " + hours + ":" + minutes + ":" + seconds);
	    }
	    setInterval(dpTime, 1000);
	    
$(function(){
	$.ajax({
		url: "reportAlarm.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data);

			var str = JSON.stringify(data);
			var json = JSON.parse(str);
			
			values = "";			
			for(var i in json.rlist){
				values += "<tr><td class='alertStyle'>" + data.rlist[i].rId
	              + "</td><td class='alertStyle'><a href='rptdetail.do?pnum=" 
	              + data.rlist[i].Nnum + "'>" + data.rlist[i].Nnum + "</a></td><td class='alertStyle'>"
	              + data.rlist[i].uId
	              + "</td><td class='alertStyle'>"
	              + data.rlist[i].reason + "</td></tr>";
			}
			$('#report').html($('#report').html() + values);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});	    
}); 

</script>

</head>
<body>
<header>
<div class="header">
	<div class="header-div">
		<a href="${ pageContext.servletContext.contextPath }/admain.do"><img src="/intertwine/resources/images/intertwinelogo.png" width="180px;" height="30px;"></a>
	</div>
</div>
</header>
<div class="body-div">
<main>
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
                
            </ul>
        </aside>
        <div id="submenubars">
            <div id="dummy_sub_menu" class="sub_menu">
                더미 서브메뉴
            </div>
            <div id="mypage_sub_menu" class="sub_menu">
                마이페이지 서브메뉴
            </div>
            <div id="chatting_sub_menu" class="sub_menu">
                채팅 서브메뉴
            </div>
            <div id="alarm_sub_menu" class="sub_menu">
                알림 서브메뉴
            </div>
            <div id="settings_sub_menu" class="sub_menu">
                설정 서브메뉴
            </div>

        </div>
        

<div id="bottom_right_contents">
            <div id="abc">
                <div class="content-div">
                	<div class="content-first-div">
						<div class="time-box">
							<h3>현재 시간</h3>
							<div id="time" class="stat-div">	
							</div>
							<div class="stat-div-2">
							<h4>오늘의 방문자 수 : ${visitCount.visitCount} &nbsp; 누적 방문자 수 : ${ sumCount }</h4> 
							</div>
						</div>
						<div class="noti-box">
						<h3>신고 관련 알림 현황</h3>
						<div class="noti-div">
							<div class="report-box">
								<table id="report"cellspacing="0">
									<tr><th>신고번호</th><th>게시물번호</th><th>신고자</th><th>신고사유</th></tr>
								</table>
							</div>
						</div>
					</div>	
				</div>	
					<div class="stat-div-3">
						<div class="stat-div2">
						<h3>월별 방문자 수</h3>
				<canvas ID="myChart" width="400" height="250"></canvas>
				<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
						</div>
						<div class="noti-div2">
							<h3>회원수</h3>
					<canvas ID="myChart2" width="400" height="250"></canvas>
					<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>		
						</div>
					</div>
				</div>
            </div>
        </div>

	
	
</main>
</div>

<script>
const ctx = document.getElementById('myChart');
new Chart(ctx, {
  type: 'bar',
  data: {
    labels: ['Jan', 'Feb', 'Mar', 'Apr','Mar', 'Jun'],
    datasets: [{
      label: '# of Votes',
      data: ['${Jan}','${Feb}', '${Mar}', '${Apr}','${Mar}', '${Jun}'],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});


const ctx2 = document.getElementById('myChart2');
new Chart(ctx2, {
  type: 'bar',
  data: {
    labels: ['9', '12', '15', '18','21', '24'],
    datasets: [{
      label: '# of Votes',
      data: ['${nine}','${twe}', '${fity}', '${eight}','${twone}', '${twone}'],
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  }
});

</script>
</body>
</html>