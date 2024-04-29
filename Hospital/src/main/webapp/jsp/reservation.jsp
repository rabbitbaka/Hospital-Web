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

<link rel="stylesheet" href="../css/custom.css">
<link rel="shortcut icon" href="../image/favicon.ico"
	type="image/x-icon" />
<title>진료예약</title>

<script type="text/javascript">
	function checkFun() {

		var f = document.reservation_form;

		// 유효성 검사 --------------------------------------------
		// 성함은 문자만 입력
		var regExpName = /^[a-zA-Z가-힣]+$/;
		if (!regExpName.test(document.reservation_form.name.value)) {
			alert("성함을 문자로만 입력 가능합니다. ");
			f.name.focus();
			return false;
		}

		// 생년월일 6자리, 숫자로만 입력
		var regExpBirth = /^\d{6}$/;
		if (!regExpBirth.test(document.reservation_form.birth.value)) {
			alert("6자리 숫자로만 입력 가능합니다.");
			f.birth.focus();
			return false;
		}

		// 번호는 숫자로만 입력
		var regExpPhone = /^[0-9]*$/;
		if (!regExpPhone.test(document.reservation_form.phone2.value)) {
			alert("번호는 숫자만 입력 가능합니다.");
			f.phone2.focus();
			return false;
		}
		if (!regExpPhone.test(document.reservation_form.phone3.value)) {
			alert("번호는 숫자만 입력 가능합니다.");
			f.phone3.focus();
			return false;
		}

		//---------------------------------------------------------------

		//성함 입력 여부
		if (document.reservation_form.name.value == "") {
			alert("성함을 입력해 주세요.");
			f.name.select();
			return false;
		}

		//생년월일 입력 여부
		if (document.reservation_form.birth.value == "") {
			alert("생년월일을 입력해 주세요.");
			f.birth.select();
			return false;
		}

		//통신사 입력 여부
		var choice = document.getElementsByName("choice")[0].value;
		if (choice == "choice") {
			alert("통신사를 선택해 주세요.");
			return false;
		}

		// 전화번호 입력 여부
		if (document.reservation_form.phone2.value == "") {
			alert("전화번호를 입력해 주세요.");
			f.phone2.select();
			return false;
		}
		if (document.reservation_form.phone3.value == "") {
			alert("전화번호를 입력해 주세요.");
			f.phone3.select();
			return false;
		}

		// 성별 입력 여부
		var gender = document.getElementsByName("gender");
		var isChecked = false;
		for (var i = 0; i < gender.length; i++) {
			if (gender[i].checked) {
				isChecked = true;
				break;
			}
		}

		if (!isChecked) {
			alert("성별을 선택해 주세요.");
			return false;
		}

		//아픈 부위 체크 여부
		var checkboxes = document.getElementsByName("check");
		var isChecked = false;
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				isChecked = true;
				break;
			}
		}
		if (!isChecked) {
			alert("아프신 부위를 체크해 주세요.");
			return false;
		}

		else
			return true;
	}
</script>
</head>

<body>
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background-color: #e3f2fd;">

		<div class="container-fluid ">
			<a class="navbar-brand" href="Start.jsp"> <img
				src="../image/icon.png" width="43" height="43"
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
					<li class="nav-item"><a class="nav-link" href="Start.jsp">
							메인 </a></li>
					<li class="nav-item"><a class="nav-link" href="map.jsp">지도</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="treatment.jsp">진료안내</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="reservation.jsp">진료예약</a></li>
					<%
					if (session.getAttribute("UserId") != null) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="./message/message.jsp">게시판</a></li>
					<%
					}
					%>
				</ul>
				<div id="top_menu">
					<%
					if (session.getAttribute("UserId") != null) {
					%>
					<a> <%=(String) session.getAttribute("UserName")%>님 환영합니다!
					</a> | <a href="./Login/Logout.jsp">LOGOUT</a><br>
					<div align="right">
						<a href="./MyPage/MyPage.jsp">MyPage<img
							src="../image/usericon.png" width="32" height="30"></a>
					</div>
					<%
					} else {
					%>
					<a href="./Login/Login.jsp">LOGIN</a> | <a href="./Join/Join.jsp">JOIN</a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</nav>
	<br>
	<br>

	<div class="container">
		<div class="jumbotron">
			<h1>
				<img src="../image/reser.png" width="50" height="50"> 진료 예약 <br>
			</h1>
		</div>
	</div>

	<center>
		<form name="reservation_form" action="reservation_Check.jsp"
			method="post" onsubmit="return checkFun()">
			<fieldset style="width: 800px; background-color: #e3f2fd;">
				<br>
				<legend> <h1> 비회원 진료 예약 </h1></legend>
				<p>
				<hr>
				<br> 고객 성함 <br> <input type="text" name="name" size="20"><br>
				<br> 생년 월일 (ex 011102) <br> <input type="text"
					name="birth" maxlength="6" size="20"><br> <br>
				연락처 <br> <select name="choice"
					style="width: 60px; height: 20.5px">
					<option value="choice">선택</option>
					<option value="KT">KT</option>
					<option value="SKT">SKT</option>
					<option value="LGU+">LGU+</option>
				</select> &nbsp&nbsp <select name="phone1">
					<option value="010">010</option>
					<option value="032">032</option>
					<option value="02">02</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select> &nbsp - &nbsp <input type="text" maxlength="4" size="4"
					name="phone2"> &nbsp - &nbsp <input type="text"
					maxlength="4" size="4" name="phone3"><br> <br> 성별
				<br> <input type="radio" name="gender" value="남성">남
				&nbsp <input type="radio" name="gender" value="여성">여 <br>
				<br> 어디가 아프신가요? <br> <input type="checkbox" name="check"
					value="뇌">뇌 &nbsp <input type="checkbox" name="check"
					value="척추	">척추 &nbsp <input type="checkbox" name="check"
					value="관절">관절 &nbsp <input type="checkbox" name="check"
					value="내과">내과 <br> <br> 아프신 부분 상세 (선택) <br>
					
				<textarea name="introduction" cols="80" rows="4"></textarea>
				<br> <br> 날짜 및 시간 <br> <select name="year" id="year"></select>
				년 <select name="month" id="month"></select>
				월 <select name="day" id="day"></select> 일&nbsp/&nbsp <select
					name="hour" id="hour"></select> 시 <select name="minute" id="minute"></select>
				분

				<script>
					// 현재 시간을 구하기
					const now = new Date();
					const currentYear = now.getFullYear();
					const currentMonth = now.getMonth() + 1;
					const currentDay = now.getDate();
					const currentHour = now.getHours();
					const currentMinute = now.getMinutes();

					// 연도 선택 박스 생성
					const yearSelect = document.querySelector('#year');
					for (let i = currentYear; i <= currentYear + 2; i++) {
						const option = document.createElement('option');
						option.value = i;
						option.textContent = i;
						yearSelect.appendChild(option);
					}

					const monthSelect = document.querySelector('#month');
					for (let i = currentMonth; i <= 12; i++) {
						const option = document.createElement('option');
						option.value = i;
						option.textContent = i;
						monthSelect.appendChild(option);
					}

					// 일 선택 박스 생성
					const daySelect = document.querySelector('#day');
					monthSelect.addEventListener('change', updateDayOptions); // 월 선택이 변경될 때마다 일 박스 업데이트

					// 페이지 로딩 시 초기 일 박스 설정
					updateDayOptions();

					function updateDayOptions() {
						const selectedYear = currentYear;
						const selectedMonth = parseInt(monthSelect.value);
						const days = new Date(selectedYear, selectedMonth, 0)
								.getDate();

						daySelect.innerHTML = '';

						if (selectedMonth === currentMonth) {
							const today = new Date();
							const currentDay = today.getDate();
							for (let i = currentDay; i <= days; i++) {
								const option = document.createElement('option');
								option.value = i;
								option.textContent = i;
								daySelect.appendChild(option);
							}
						} else {
							for (let i = 1; i <= days; i++) {
								const option = document.createElement('option');
								option.value = i;
								option.textContent = i;
								daySelect.appendChild(option);
							}
						}
					}
					// 시 선택 박스 생성
					const hourSelect = document.querySelector('#hour');
					for (let i = currentHour + 1; i <= 24; i++) {
						const option = document.createElement('option');
						option.value = i;
						option.textContent = i < 10 ? '0' + i : i;
						hourSelect.appendChild(option);
					}

					// 분 선택 박스 생성
					const minuteSelect = document.querySelector('#minute');
					for (let i = 0; i < 60; i++) {
						const option = document.createElement('option');
						option.value = i;
						option.textContent = i < 10 ? '0' + i : i;
						minuteSelect.appendChild(option);
					}
				</script>

				<hr>

				<div align="right">
					<input class="btn btn-primary btn-pull" type="submit"
						value=" 등록하기 " role="button"> &nbsp <input
						class="btn btn-primary btn-pull" type="reset" value=" 다시작성 "
						role="button">
				</div>
				<br>

			</fieldset>
		</form>
		<br> <br>
	</center>
	<footer class="my-5 pt-5 text-muted text-center text-small">
		<p class="mb-1">2020E7335 © JinA Hospital</p>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>
</body>
</html>


