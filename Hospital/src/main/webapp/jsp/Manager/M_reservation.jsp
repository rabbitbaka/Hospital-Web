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

<jsp:useBean id="user" class="member.User" scope="session" />
<jsp:setProperty name="user" property="*" />

<link rel="stylesheet" href="../../css/custom.css">
<link rel="shortcut icon" href="../../image/favicon.ico"
	type="image/x-icon" />

<%@ page import="java.sql.*"%>
<%@ include file="../dbConn.jsp"%>

<title>병원 일기</title>
</head>

<style>
.delete {
	background-color: #E91E63;
	border: none;
	padding: 5px 10px;
	color: #fff;
	font-weight: bold;
}
</style>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #e3f2fd;">

		<div class="container-fluid ">
			<a class="navbar-brand" href="Manager.jsp">
				<h1>관리자 페이지</h1>
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="Manager.jsp"> 회원관리 </a></li>
					<li class="nav-item"><a class="nav-link" href="M_message.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="M_reservation.jsp">예약정보</a></li>
				</ul>
				<div id="top_menu">
					<a href="../Login/Logout.jsp">LOGOUT</a><br>
				</div>
			</div>
		</div>
	</nav>
	<br>
	<br>

	<% 
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("SELECT name, birth, number, gender, sick, intro, days, reservation_date FROM hospital.reservation");

	int count = 1;
	%>
	<center>
		<h1>예약 관리</h1>
		<div class="container">
			<hr>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>관리</th>
						<th>번호</th>
						<th>이름</th>
						<th>생일</th>
						<th>번호</th>
						<th>성별</th>
						<th>아픈부위</th>
						<th>상세</th>
						<th>예약일</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td>
							<button class="delete" type="button"
								onClick="location.href='reservation_delete.jsp?name=<%=rs.getString("name")%>'">취소</button>
						</td>
						<td><%=count%></td>
						<td><%=rs.getString("name")%></td>
						<td><%=rs.getString("birth")%></td>
						<td><%=rs.getString("number")%></td>
						<td><%=rs.getString("gender")%></td>
						<td><%=rs.getString("sick")%></td>
						<td><%=rs.getString("intro")%></td>
						<td><%=rs.getString("days")%></td>
						<td><%=rs.getString("reservation_date")%></td>
					</tr>
				</tbody>
				<%
				count++;
				}
				rs.close();
				sm.close();
				conn.close();
				%>
			</table>
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