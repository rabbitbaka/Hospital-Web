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
<link rel="stylesheet" href="../../css/custom.css">
<link rel="shortcut icon" href="../../image/favicon.ico" type="image/x-icon" />
<title>병원 일기</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #e3f2fd;">

		<div class="container-fluid ">
			<a class="navbar-brand" href="../Start.jsp">
				 <img src="../../image/icon.png" width="43" height="43" style="margin-left: 30px; margin-bottom: 15px;">&nbsp<h1 style="display: inline;">병원 일기 </h1>
			</a>
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="../Start.jsp"> 메인 </a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../map.jsp">지도</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../treatment.jsp">진료안내</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="../reservation.jsp">진료예약</a>
					</li>
				</ul>
            <div id="top_menu">
                <a href="Login.jsp" style="font-weight: bold;">LOGIN</a> |
                <a href="../Join/Join.jsp">JOIN</a>
            </div>
			</div>
		</div>
	</nav>
	<br>
	<br>
  <div class="container" style="width:90%;">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">로그인 창</h5>
            <form class="form-signin" method="post" action="checkDB.jsp">
              <div class="form-label-group">
                <input type="text" id="id" name="id" class="form-control" placeholder="id" required autofocus>
              </div><br>

              <div class="form-label-group">
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
              </div>
              <br> <span style="color:red;"> 아이디 또는 비밀번호를 잘못 입력했습니다.<br> 입력하신 내용을 다시 확인해주세요. </span><br>
              <hr>
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="width:100%; role="button">Sign in</button>
              <hr class="my-4">
              <a href="findid.jsp">ID</a> 또는 <a href="findpw.jsp">Password</a>를 잊으셨나요?
              <button class="btn btn-lg btn-secondary btn-block text-uppercase" type="button" onclick="location.href='../Join/Join.jsp'" style="width:100%;">Join</button>
            </form>
          </div>
        </div>
      </div>
    </div>
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
    <p class="mb-1">2020E7335 © JinA Hospital</p>
  </footer>
</body>
</html>