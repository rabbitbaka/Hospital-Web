<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="Start.jsp"> 메인 </a>
						</li>
					<li class="nav-item"><a class="nav-link" href="map.jsp">지도</a>
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
	</nav>
	<br>
	<br>
	<div class="container"  style="background-color: #E8EAF8;" >
		<div class="jumbotron"">
		<br>
			<h1>사이트 소개</h1>
			<p>
				병원의 이야기를 전해드립니다. <br> 병원의 정보와 환자들의 이야기를 담는 사이트입니다. <br>
				병원의 소식을 볼 수 있을 뿐만 아니라 환자도 자유롭게 게시글을 작성할 수 있습니다. <br> 모두 건강하고
				행복한 날이 되기를 바랍니다.
			</p>
			<p>
				<a class="btn btn-primary btn-pull" href="treatment.jsp"
					role="button">진료 안내</a>
			</p>
		<br>
		</div>
	</div>
	<br>
	<center>
		<div id="myCarousel" style="width: 70%;" class="carousel slide"
			data-bs-ride="carousel">
			<!-- Carousel 인디케이터 -->
			<ol class="carousel-indicators">
				<li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
				<li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
				<li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
			</ol>
			<!-- Carousel 이미지 -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../image/1.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../image/2.jpg" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../image/3.jpeg" class="d-block w-100" alt="...">
				</div>
			</div>
			<!-- Carousel 이전/다음 버튼 -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#myCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#myCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</center>

		<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2023 2020E7335 JinA Hospital</p>
  </footer>
</body>
</html>