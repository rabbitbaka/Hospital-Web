<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	
<jsp:useBean id="user" class="member.User" scope="session"/>
<jsp:setProperty name="user" property="*" />

<link rel="stylesheet" href="../css/custom.css">
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<title>병원 일기</title>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #e3f2fd;">

		<div class="container-fluid ">
			<a class="navbar-brand" href="Start.jsp">
				 <img src="../image/icon.png" width="43" height="43" style="margin-left: 30px; margin-bottom: 15px;">&nbsp<h1 style="display: inline;">병원 일기 </h1>
			</a>
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="Start.jsp"> 메인 </a>
						</li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="map.jsp">지도</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="treatment.jsp">진료안내</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="reservation.jsp">진료예약</a></li>
			<% if (session.getAttribute("UserId") != null) { %>
      		<li class="nav-item"><a class="nav-link" href="./message/message.jsp">게시판</a></li>
    	<% } %>
				</ul>
            <div id="top_menu">
            		<% if (session.getAttribute("UserId") != null) { %>
      					<a> <%=(String) session.getAttribute("UserName")%>님 환영합니다!</a> |
                <a href="./Login/Logout.jsp">LOGOUT</a><br>
                <div align="right">
                <a href="./MyPage/MyPage.jsp">MyPage<img src="../image/usericon.png" width="32" height="30"></a>
               	</div>
    						<% } else { %>
                <a href="./Login/Login.jsp">LOGIN</a> |
                <a href="./Join/Join.jsp">JOIN</a>
                <% } %>
            </div>
			</div>
		</div>
	</nav><br>

<div class="container">
		<div class="jumbotron">
			<h1> <img src="../image/map.png" width="45" height="60"> 찾아 오시는 길<br> </h1>
			<p> 주차 걱정 없이 오시면 됩니다! <br><br> </p>
		</div>
	</div>

<center>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA0qljOK9mPmmdrG6_tdiCNHA528iZKjO8&callback=initMap"></script>
<div id="map" style="height: 700px; width: 900px;"></div>
<br> <hr>
<h1> 주소 <br> </h1>
서울특별시 송파구 오금로 290 서울병원 <br><br>
<h1> 전화번호 <br> </h1>
010-1234-5678 (점심시간 01:00~03:00)<br>
<hr>
</center>
<script>
function initMap() {
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({'address': '서울특별시 송파구 오금로 290'}, function(results, status) {
    if (status === 'OK') {
      var map = new google.maps.Map(document.getElementById('map'), {
        center: results[0].geometry.location,
        zoom: 16
      });
      
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location,
        title: '서울병원'
      });
      
      // 마커를 클릭했을 때 정보 창 표시
      var infowindow = new google.maps.InfoWindow({
        content: '서울병원'
      });
      
      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
</script>

	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2023 2020E7335 JinA Hospital</p>
  </footer>
  
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	
</body>
</html>