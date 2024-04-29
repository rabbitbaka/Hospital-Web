
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
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>

<jsp:useBean id="user" class="member.User" scope="session"/>
<jsp:setProperty name="user" property="*" />

<link rel="stylesheet" href="../../css/custom.css">
<link rel="shortcut icon" href="../../image/favicon.ico" type="image/x-icon" />

<title>병원 일기</title>
</head>

<style>
a {
  text-decoration: none;
  color: black;
}

.bd-sidebar {
  position: sticky;
  top: 4rem;
  z-index: 1000;
  height: 100vh;
  background: #e3f2fd;
  border-right: 1px solid rgba(0,0,0,.1);
  overflow-y: auto;
  min-width: 160px;
  max-width: 280px;
}
.bd-sidebar .nav {
  display: block;
}
.bd-sidebar .nav>li>a {
  display: block;
  padding: .25rem 1.5rem;
  font-size: 90%;
  }
hr {
  border: none;
  height: 1px;
  background-color: black;
 }
.text {
  display: inline-block;
  width: 100px;
  padding: 5px 10px;
  border: 1px solid black;
  color: black;
  text-align: center;
}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>

<div class="container-fluid">
  <div class="row flex-nowrap">
    <div class="col-3 bd-sidebar">
      <ul class="nav">
     	  <li><a> </a></li><br><br><br>
     	  <li> <a href="../Start.jsp" style="text-decoration: none; color: black;"> <img src="../../image/icon.png" width="43" height="43" style="margin-left: 10px; margin-bottom: 15px;">&nbsp<h1 style="display: inline;">병원 일기 </h1></a>
     	  <li>
     	  <hr style="height: 1px; background-color: black;">
     	  <br>
        <li><a href="MyPage.jsp" style="text-decoration: none; color: black;" >내 정보</a></li> <br>
        <li><a href="Mymodify.jsp" style="text-decoration: none; color: black;">내 정보 변경</a></li> <br>
        <hr style="height: 1px; background-color: black;">
        <li><a href="Signout.jsp"style="text-decoration: none; color: black;">회원 탈퇴</a></li> <br>
      </ul>
      <br>
    </div>
    <main class="col-9 py-md-3 pl-md-5 bd-content" role="main" >
	<div class="container"  style="background-color: #E8EAF8; height: 90vh;">
		<br>
			<div class="col-md-7 col-lg-8">
        <h1 class="mb-3">내 정보</h1>
        <form class="needs-validation" novalidate="" action="Mymodify_send.jsp">
       
          <div class="row g-3">
            <div class="col-sm-6">
              <label for="Id" class="form-label">Id</label>
              <input type="text" class="form-control" name="id" id="id" placeholder="" value="<%=session.getAttribute("UserId")%>" required="">
            </div>
            <div class="col-sm-6">
              <label for="Password" class="form-label">Password</label>
              <input type="text" class="form-control" name="password" id="password" placeholder="" value="<%=session.getAttribute("UserPw")%>" required="">
            </div>
            <div class="row g-3">
            <div class="col-sm-6">
              <label for="Name" class="form-label">Name</label>
              <input type="text" class="form-control" name="name" id="name" placeholder="" value="<%=session.getAttribute("UserName") %>" required="">
            </div>
            <div class="col-12">
              <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
              <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" value="<%=session.getAttribute("UserEmail")%>">
            </div>
            </div>
          </div>

          <hr class="my-4">

          <button class="w-100 btn btn-primary btn-lg" type="submit">정보 변경하기</button>
        </form>
      </div>
	</div>
    </main>
  </div>
</div>
</html>