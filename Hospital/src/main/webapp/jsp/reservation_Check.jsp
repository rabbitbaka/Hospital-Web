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

<link rel="stylesheet" href="../css/custom.css">
<link rel="shortcut icon" href="../image/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="../css/table.css">

<jsp:useBean id="reservation" class="member.Reservation"/>
<jsp:setProperty name="reservation" property="*" />


<title> 진료 예약 확인 </title>
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
					<li class="nav-item"><a class="nav-link" href="treatment.jsp">진료안내</a>
					</li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="reservation.jsp">진료예약</a></li>
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
			<h1> <img src="../image/check.png" width="50" height="50"> 진료 예약 확인 <br> </h1>
			<a> 입력하신 정보가 정확한지 확인해주세요! </a>
		</div>
	</div>
	<hr> <br><br>

<%
	String name = reservation.getName();
	String birth = reservation.getBirth();
	
	String choice = reservation.getChoice();
	String ph01 = reservation.getPhone1();
	String ph02 = reservation.getPhone2();
	String ph03 = reservation.getPhone3();
	
	String sex = reservation.getGender();
	String[] sick = reservation.getCheck();
	String intro = reservation.getIntroduction();
	String year = reservation.getYear();
	String month = reservation.getMonth();
	String day = reservation.getDay();
	String hour = reservation.getHour();
	String minute = reservation.getMinute();
	
	session.setAttribute("name", name);
	session.setAttribute("birth", birth);
	session.setAttribute("choice", choice);
	session.setAttribute("ph01", ph01);
	session.setAttribute("ph02", ph02);
	session.setAttribute("ph03", ph03);
	session.setAttribute("sex", sex);
	session.setAttribute("sick", sick);
	session.setAttribute("intro", intro);
	session.setAttribute("year", year);
	session.setAttribute("month", month);
	session.setAttribute("day", day);
	session.setAttribute("hour", hour);
	session.setAttribute("minute", minute);
	
	int minute2 = 0;
	if(minute != null && !minute.isEmpty()){
			minute = "0" + minute;
	    minute2 = Integer.parseInt(minute);
	}
	String minuteStr = minute2 < 10 ? "0" + minute2 : String.valueOf(minute2);
	%>
    <table>
    <thead>
    <tr>
        <th>내용</th>
        <th>종류</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>이름</td>
        <td><%= name %></td>
    </tr>
    <tr>
        <td>생년월일</td>
        <td><%= birth %></td>
    </tr>
    <tr>
        <td>연락처</td>
        <td><%= choice %> <%= ph01 %>-<%= ph02 %>-<%= ph03 %></td>
    </tr>
    <tr>
        <td>성별</td>
        <td><%= sex %></td>
    </tr>
    <tr>
        <td>아픈 부위</td>
        <td>	<%
		if (sick != null)
		{
			for(int count=0; count <sick.length; count++)
				{
					out.println(" "+sick[count]);
				}
		}
	%></td>
    </tr>
    <tr>
				<td>아픈 부위(상세)</td>
    		<td><%= intro %></td>
    </tr>		
    <tr>
				<td>진료예약 날짜 및 시간</td>
    		<td><%= year %> . <%= month %> . <%= day %>&nbsp/&nbsp<%= hour %>&nbsp:&nbsp<%= minuteStr %></td>
    </tr>		
	
    </tbody>
</table>
<br>
<hr>
		<div align="right">
		<input class="btn btn-primary btn-pull" type="button" value=" 등록하기 " role="button" onclick="location.href='reservationDB.jsp'"> &nbsp
		<input class="btn btn-primary btn-pull" type="button" value=" 다시작성 " role="button" onclick="location.href='reservation.jsp'">
		</div><br>
		
	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">2020E7335 © JinA Hospital</p>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
    
</body>
</html>