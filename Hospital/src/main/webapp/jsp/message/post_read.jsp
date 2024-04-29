<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="../dbConn.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../css/custom.css">
<link rel="stylesheet" href="../../css/table2.css">
<link rel="shortcut icon" href="../../image/favicon.ico"
	type="image/x-icon" />
<title>병원 일기 게시판</title>
</head>

<style>
.modify, .delete {
	border: none;
	padding: 5px 10px;
	color: #fff;
	font-weight: bold;
}

.modify {
	background-color: #03A9F4;
}

.delete {
	background-color: #E91E63;
}
</style>
<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #e3f2fd;">

		<div class="container-fluid ">
			<a class="navbar-brand" href="../Start.jsp"> <img
				src="../../image/icon.png" width="43" height="43"
				style="margin-left: 30px; margin-bottom: 15px;">&nbsp
				<h1 style="display: inline;">병원 일기</h1>
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="../Start.jsp">
							메인 </a></li>
					<li class="nav-item"><a class="nav-link" href="../map.jsp">지도</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="../treatment.jsp">진료안내</a></li>
					<li class="nav-item"><a class="nav-link"
						href="../reservation.jsp">진료예약</a></li>
					<%
					if (session.getAttribute("UserId") != null) {
					%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="message.jsp">게시판</a></li>
					<%
					}
					%>
				</ul>
				<div id="top_menu">
					<%
					if (session.getAttribute("UserId") != null) {
					%>
					<a> <%=(String) session.getAttribute("UserName")%>님 환영합니다!
					</a> | <a href="../Login/Logout.jsp">LOGOUT</a><br>
					<div align="right">
						<a href="../MyPage/MyPage.jsp">MyPage<img
							src="../../image/usericon.png" width="32" height="30"></a>
					</div>
					<%
					} else {
					%>
					<a href="../Login/Login.jsp">LOGIN</a> | <a href="../Join/Join.jsp">JOIN</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<center>
		<h1>게시판 보기</h1>
		<%
		try {
			request.setCharacterEncoding("UTF-8");
			String num = request.getParameter("num");
			String insertQuery = "SELECT * FROM hospital.post WHERE num=" + num;
			PreparedStatement psmt = conn.prepareStatement(insertQuery);
			ResultSet result = psmt.executeQuery();
		%>
		<table>
			<%
			while (result.next()) {
			%>
			<thead>
				<tr>
					<th>제목</th>
					<th><%=result.getString("title")%></th>
					<th>작성자</th>
					<th><%=result.getString("writer")%></th>
					<th>작성일</th>
						<%
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String formattedDate = formatter.format(result.getTimestamp("reg_date"));
						%>
						<th><%= formattedDate %></th>
					</td>
				</tr>
			<tbody>
				<tr>
					<td></td>
					<td colspan="6"><br> <br><%=result.getString("content")%><br>
						<br> <br></td>
				</tr>
			</tbody>
			<%
			}
			%>
		</table>
		<br> <br>
		<%
		} catch (Exception ex) {
		out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
		}
		%>
		<hr>
		<div class="container">
			<div class="card my-4">
				<div class="card-body">
					<!-- 댓글 폼 -->

					<form action="post_content_send.jsp">
						<div class="form-group">
							<input type="hidden" name="num"
								value="<%=request.getParameter("num")%>"> <input
								type="hidden" name="name"
								value="<%=(String) session.getAttribute("UserName")%>">
							<textarea name="content" class="form-control" rows="3"
								placeholder="댓글을 작성하세요"></textarea>
						</div>
						<button type="submit" class="btn btn-primary">댓글 작성</button>
					</form>
				</div>
			</div>


			<div class="card my-2">
				<div class="card-body">
					<!-- 댓글 리스트 -->
					<%
					try {
						String p_num = request.getParameter("num");
						String selectQuery = "SELECT * FROM hospital.comments WHERE p_num = ? ORDER BY num DESC";
						PreparedStatement psmt = conn.prepareStatement(selectQuery);
						psmt.setString(1, p_num);
						ResultSet result = psmt.executeQuery();

						boolean hasComments = false; // 댓글 유무를 확인하기 위한 변수

						while (result.next()) {
							hasComments = true; // 댓글이 존재함을 표시
					%>
					<div class="media" style="text-align: left;">
						<%
						if ("관리자".equals(session.getAttribute("UserName"))
								|| session.getAttribute("UserName").equals(result.getString("name"))) {
						%>
						<button class="delete" type="button" value="삭제"
							onClick="location.href='comment_delete.jsp?num=<%=result.getString("num")%>&p_num=<%=result.getString("p_num")%>'">삭제</button>
						<%
						}
						%>
						<div class="media-body" style="margin-left: 30px; max-width: 90%;">
							<h5 class="mt-0"><%=result.getString("name")%>
								<a style="color: gray; font-size: small;"><%=result.getString("reg_date")%></a>
							</h5>
							<%=result.getString("content")%>
						</div>
					</div>
					<hr>
					<%
					}

					if (!hasComments) {
					%>
					<p>댓글이 존재하지 않습니다.</p>
					<%
					}
					} catch (Exception ex) {
					out.println("이건 댓글 오류 메시지 : " + ex.getMessage());
					}
					%>
				</div>
			</div>

		</div>

		</div>
		<%
    	if (session.getAttribute("UserName")=="관리자"){
    		%>
    				<button class="btn btn-primary btn-pull" type=button
			onclick="location.href='../Manager/M_message.jsp'">목록으로</button>
    	<%} else
    	{
    		%>
    				<button class="btn btn-primary btn-pull" type=button
			onclick="location.href='message.jsp'">목록으로</button>
    		<%
    	}
    %>
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