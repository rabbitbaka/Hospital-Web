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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../css/custom.css">
<link rel="shortcut icon" href="../../image/favicon.ico"
	type="image/x-icon" />
<title>병원 일기</title>
</head>

<style>
.underline-on-hover {
	text-decoration: none;
	color: #3592A1;
}

.underline-on-hover:hover {
	text-decoration: underline;
}

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

.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination .page-item {
	margin: 0 5px;
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
					<li class="nav-item"><a class="nav-link active" href="M_message.jsp">게시판</a></li>
					<li class="nav-item"><a class="nav-link"
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
	try {
		String search = request.getParameter("search");
		String keyword = request.getParameter("keyword"); // 검색어 받기

		// 검색어를 사용하여 데이터베이스에서 검색
		String searchQuery = "SELECT * FROM hospital.post WHERE " + search + " LIKE ? ";
		PreparedStatement psmt = conn.prepareStatement(searchQuery, ResultSet.TYPE_SCROLL_INSENSITIVE,
		ResultSet.CONCUR_READ_ONLY);
		psmt.setString(1, "%" + keyword + "%");
		ResultSet result = psmt.executeQuery();

		// 페이징 관련 변수 설정
		int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
		int perPage = 7; // 한 페이지에 표시할 데이터 개수
		int totalCount = 0; // 전체 데이터 개수
		int totalPages = 0; // 전체 페이지 수

		// 전체 데이터 개수 계산
		if (result.last()) {
			totalCount = result.getRow();
			result.beforeFirst();
		}

		// 전체 페이지 수 계산
		totalPages = (int) Math.ceil((double) totalCount / perPage);

		// 현재 페이지에 해당하는 데이터만 가져오기 위해 OFFSET과 LIMIT 적용
		int offset = (currentPage - 1) * perPage;
		int limit = perPage;
		String query = "SELECT * FROM hospital.post WHERE " + search + " LIKE ? ORDER BY num DESC LIMIT ?, ?";
		PreparedStatement pagingStatement = conn.prepareStatement(query);
		pagingStatement.setString(1, "%" + keyword + "%");
		pagingStatement.setInt(2, offset);
		pagingStatement.setInt(3, limit);
		ResultSet pagingResult = pagingStatement.executeQuery();
	%>
	<center>
		<div class="container">
			<h1>
				[<%=keyword%>] : 검색 결과 </h1>
			<br>
			<div align="right">
				<form style="display: flex;" method="GET" action="M_post_search.jsp"">
					<select name="search" class="form-select"
						aria-label="Default select example" style="width: 125px;">
						<option value="title" selected>검색 요소</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="reg_date">작성일</option>
					</select> &nbsp; <input style="width: 400px;" type="text"
						class="form-control" name="keyword" placeholder="검색어를 입력하세요">
					&nbsp; <input class="btn btn-primary btn-pull" type="submit"
						value="검색" role="button">
				</form>
			</div>
			<hr>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>관리</th>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					while (pagingResult.next()) {
					%>
					<tr>
						<td>
							<button class="modify" type="button" value="수정"
								onClick="location.href='../message/post_modify.jsp?num=<%=pagingResult.getString("num")%>'">수정</button>
							<button class="delete" type="button" value="삭제"
								onClick="location.href='../message/post_delete_send.jsp?num=<%=pagingResult.getString("num")%>'">삭제</button>
						</td>
						<td><%=pagingResult.getInt("num")%></td>
						<td><a class="underline-on-hover"
							href="../message/post_read.jsp?num=<%=pagingResult.getInt("num")%>"><%=pagingResult.getString("title")%></a></td>
						<td><%=pagingResult.getString("writer")%></td>
						<%
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String formattedDate = formatter.format(pagingResult.getTimestamp("reg_date"));
						%>
						<td><%= formattedDate %></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<hr>
			<br>
			<div align="right">
				<a class="btn btn-primary btn-pull" href="../message/post_new.jsp"
					role="button">글쓰기</a>
			</div>
		</div>
		<!-- 페이징 링크 생성 -->
		<div class="pagination">
			<%
			if (currentPage > 1) {
			%>
			<a class="page-link"
				href="?search=<%=search%>&keyword=<%=keyword%>&page=<%=currentPage - 1%>">&laquo;
				이전</a>
			<%
			}
			for (int i = 1; i <= totalPages; i++) {
			%>
			<a class="page-link <%if (i == currentPage) {%>active<%}%>"
				href="?search=<%=search%>&keyword=<%=keyword%>&page=<%=i%>"><%=i%></a>
			<%
			}
			if (currentPage < totalPages) {
			%>
			<a class="page-link"
				href="?search=<%=search%>&keyword=<%=keyword%>&page=<%=currentPage + 1%>">다음
				&raquo;</a>
			<%
			}
			%>
		</div>
		<%
		} catch (Exception ex) {
		out.println("오류가 발생했습니다. 오류 메시지: " + ex.getMessage());
		}
		%>
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
