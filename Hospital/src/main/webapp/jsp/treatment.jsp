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
<title> 진료 안내 </title>
<script>
function showImageTable(num) {
  // 모든 이미지와 테이블을 숨김
  document.getElementById("imageTable1").style.display = "none";
  document.getElementById("imageTable2").style.display = "none";
  document.getElementById("imageTable3").style.display = "none";
  document.getElementById("imageTable4").style.display = "none";
  
  // 선택한 이미지와 테이블을 보이게 함
  if (num === 1) {
    document.getElementById("imageTable1").style.display = "block";
  } else if (num === 2) {
    document.getElementById("imageTable2").style.display = "block";
  } else if (num === 3) {
    document.getElementById("imageTable3").style.display = "block";
  }else if (num === 4) {
    document.getElementById("imageTable4").style.display = "block";
  }
}
</script>
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
					<li class="nav-item"><a class="nav-link" href="map.jsp">지도</a>
					</li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="treatment.jsp">진료안내</a>
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
	</nav> <br><br>

<div class="container">
		<div class="jumbotron">
			<h1> <img src="../image/health.png" width="50" height="50"> 진료 안내 </h1>
			<p> 아프신 부위가 어디신가요? 진료가 필요하신 곳을 선택하시면, 자세한 내용을 볼수 있습니다.</p>
		</div>
	</div>
	<hr> <br>
	
<center>
<button onclick="showImageTable(1)" type="button" class="btn btn-outline-info btn-lg">
  <img src="../image/뇌.png" alt="image" width="30" height="30">
  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;뇌</span>
</button>
&nbsp; <button onclick="showImageTable(2)" type="button" class="btn btn-outline-info btn-lg">
  <img src="../image/척추.png" alt="image" width="30" height="30">
  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;척추</span>
</button>
&nbsp; <button onclick="showImageTable(3)" type="button" class="btn btn-outline-info btn-lg">
  <img src="../image/관절.png" alt="image" width="30" height="30">
  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관절</span>
</button>
&nbsp; <button onclick="showImageTable(4)" type="button" class="btn btn-outline-info btn-lg">
  <img src="../image/내과.png" alt="image" width="30" height="30">
  <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내과</span>
</button>

<br>
<br>
<br>
</center>


<style>
.left-table {
  float: left;
  width: 35%;
}

.right-table {
  float: right;
  width: 35%;
}

.left_image {
  float: left;
  margin-left: 10%; 
}

.right_image {
  float: right;
  margin-right: 35%
  
}

 /* float 요소의 부모 요소를 포함시키기 위해 clearfix 적용 */
.wrapper {
  overflow: auto;
}
</style>

<!-- 첫 번째 이미지와 테이블 -->
<div id="imageTable1" style="display:none;">
	&nbsp;<img class="left_image" src="../image/docter1.png" width="100" height="100">
	<span style="font-size: 20px;">이경희 </span>대표원장
	<img class="right_image" src="../image/docter2.png" width="100" height="100">
  <span style="position: absolute; right: 22%;"><a style="font-size: 20px;">장진아</a> 뇌 전문의</span>
  
	<br>
	<br>
	<br>
	<br>
	<table class="left-table" style="margin-left: 10%;">
	<caption>2023 진료표</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th scope="col">토</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">오전</th>
        <td>●</td>
        <td>●</td>
        <td>● </td>
        <td> </td>
        <td> </td>
        <td>문의</td>
    </tr>
    <tr>
      <th scope="row">오후</th>
        <td> </td>
        <td> </td>
        <td> </td>
        <td>●</td>
        <td>●</td>
        <td>문의</td>
    </tr>
  </tbody>
  </table>

	<table class="right-table" style="margin-right: 10%;">
	<caption>2023 진료표</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th scope="col">토</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">오전</th>
        <td> </td>
        <td> </td>
        <td> </td>
        <td>●</td>
        <td>●</td>
        <td>문의</td>
    </tr>
    <tr>
      <th scope="row">오후</th>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td> </td>
        <td> </td>
        <td>문의</td>
    </tr>
  </tbody>
  </table>
  <br> <br> <br> <br> <br> <br>
  <hr>
  <br>
</div>

<!-- 두 번째 이미지와 테이블 -->
<div id="imageTable2" style="display:none;">
  <img style="margin-left: 10%;" src="../image/docter3.png" width="100" height="100">
  <span style="font-size: 20px;"> 홍길동 </span>척추 전문의
	<br>
	<br>
	<table class="left-table" style="margin-left: 10%;">
	<caption>2023 진료표</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th scope="col">토</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">오전</th>
        <td>●</td>
        <td>●</td>
        <td> </td>
        <td>●</td>
        <td> </td>
        <td>문의</td>
    </tr>
    <tr>
      <th scope="row">오후</th>
        <td> </td>
        <td> </td>
        <td>●</td>
        <td> </td>
        <td>●</td>
        <td>문의</td>
    </tr>
  </tbody>
  </table>
  <br> <br> <br> <br> <br> <br>
  <hr>
  <br>
</div>
<div id="imageTable3" style="display:none;">
  <img style="margin-left: 10%;" src="../image/docter4.png" width="100" height="100">
  <span style="font-size: 20px;"> 이수찬 </span>관절 전문의
	<br>
	<br>
	<table class="left-table" style="margin-left: 10%;">
	<caption>2023 진료표</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th scope="col">토</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">오전</th>
        <td>●</td>
        <td> </td>
        <td> </td>
        <td>●</td>
        <td>●</td>
        <td>문의</td>
    </tr>
    <tr>
      <th scope="row">오후</th>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td> </td>
        <td>문의</td>
    </tr>
  </tbody>
  </table>
  <br> <br> <br> <br> <br> <br>
  <hr>
  <br>
</div>
<div id="imageTable4" style="display:none;">
  <img style="margin-left: 10%;" src="../image/docter5.png" width="100" height="100">
  <span style="font-size: 20px;"> 장진희 </span>내과 전문의
	<br>
	<br>
	<table class="left-table" style="margin-left: 10%;">
	<caption>2023 진료표</caption>
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">월</th>
      <th scope="col">화</th>
      <th scope="col">수</th>
      <th scope="col">목</th>
      <th scope="col">금</th>
      <th scope="col">토</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <th scope="row">오전</th>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>문의</td>
    </tr>
    <tr>
      <th scope="row">오후</th>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>●</td>
        <td>문의</td>
    </tr>
  </tbody>
  </table>
  <br> <br> <br> <br> <br> <br>
  <hr>
  <br>
</div>
	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© 2023 2020E7335 JinA Hospital</p>
  </footer>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
	
</body>
</html>