<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file = "../dbConn.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>                     
             
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../css/custom.css">
<link rel="shortcut icon" href="../../image/favicon.ico" type="image/x-icon" />

<script type="text/javascript">
function checkFun()
{
	
	var f = document.form;
	if(f.title.value=="")
		{
		alert("제목을 입력해주세요!");
		f.title.select();
		return false;
		}
	
	if(f.contents.value=="")
	{
	alert("내용을 입력해주세요!");
	f.contents.select();
	return false;
	}
	
	else return true;
	
}
</script>

<title>게시판 글쓰기</title>  
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
					<li class="nav-item"><a class="nav-link" href="../reservation.jsp">진료예약</a></li>
			<% if (session.getAttribute("UserId") != null) { %>
      		<li class="nav-item"><a class="nav-link active" aria-current="page" href="message.jsp">게시판</a></li>
    	<% } %>
				</ul>
            <div id="top_menu">
            		<% if (session.getAttribute("UserId") != null) { %>
      					<a><%=(String) session.getAttribute("UserName")%>님 환영합니다!</a> |
                <a href="../Login/Logout.jsp">LOGOUT</a>
    						<% } else { %>
                <a href="../Login/Login.jsp">LOGIN</a> |
                <a href="../Join/Join.jsp">JOIN</a>
                <% } %>
            </div>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<center> <h1> 글 쓰기 </h1> </center>
        <main role="main" class="container">
            <form name="form" action="post_new_send.jsp" method="post" onsubmit="return checkFun()" >
                <div class="pt-1"></div>
                    <input type="text" name="title" placeholder="제목을 입력하세요" style="border-radius:5px; width:100%; padding:5px;">
                </div>
                <div class="pt-1">
                    <textarea id="summernote" name="contents"></textarea>
                </div>    
                <script>
                    $('#summernote').summernote({
                      placeholder: '내용을 입력해주세요',
                      tabsize: 2,
                      height: 300
                    });
                  </script>                     
                <div class="pt-1 text-right">
                    <button class="btn btn-primary btn-pull" type="submit">제출</button>
                </div>    
            </form>
        </main>        
	
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