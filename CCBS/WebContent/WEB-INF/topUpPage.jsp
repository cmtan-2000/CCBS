<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
<title>Top Up Page</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">


<style>
body {
  font-family: "Poppins", sans-serif;
}

.site-container {
  display: flex;
  align-items: center;
  color: wheat;
  padding: 10px 0px;
  margin-left: 30px;
}

.site-title {
  margin: 0px;
  font-size: 20px;
  text-transform: uppercase;
  font-weight: bold;
}

.cinema-logo {
  padding: 10px;
}

.site-header {
  background-color: #111113;
  padding: 5px 0;
  margin-bottom: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.main-navigation {
  float: right;
  margin-right: 30px;
}

.main-navigation .menu {
  list-style: none;
  margin: 0;
  padding: 0;
}

.main-navigation .menu-item {
  display: inline-block;
  padding: 0 10px;
}

.main-navigation .menu-item a {
  padding: 10px 0;
  border-bottom: 3px solid transparent;
  font-size: 12px;
  font-size: 0.75em;
  text-transform: uppercase;
  font-weight: 600;
  -webkit-transition: 0.3s ease;
  transition: 0.3s ease;
}

.main-navigation .menu-item.current a,
.main-navigation .menu-item:hover a {
  border-bottom: 3px solid #ac8074;
  color: #ac8074;
}

a.link,
a.link:hover {
  text-decoration: none;
  color: wheat;
}
</style>

<script src="https://kit.fontawesome.com/7b75b44b76.js"
	crossorigin="anonymous"></script>

</head>

<body style="background: black">
	<header class="site-header .collapse.navbar-collapse">
		<div class="site-container">
			<a href="#" id="branding"></a><i
				class="fa-solid fa-film fa-2x cinema-logo"></i>
			<h1 class="site-title">Miner Cinema</h1>
			</a>
		</div>

		<nav class="main-navigation">
			<ul class="menu">
				<li class="menu-profile menu-item" style="color: white"><a href="/CCBS/profile/${user.getUser_id()}"
					class="link">CUSTOMER</a></li>
				<li class="menu-item menu-item"><a href="<c:url value='/movie'/>"
					class="link">Home</a></li>
				<li class="menu-item current"><a href="/CCBS/wallet/${user.getUser_id()}"
					class="link">Top Up</a></li>
				<li class="menu-item"><a href="<c:url value='/logout'/>" class="link">Sign Out</a></li>
			</ul>
		</nav>
	</header>
	
	<jsp:useBean id="user" class="model.User" scope="session"/>
	
	<div class="container" style="margin: auto; color: white;">
  		<div style="display: flex; justify-content: center; align-items: center; font-size: 50px;">
  			<h1>Balance: </h1>
        	<span style="color: yellow; font-size: 80px;">${user.amount}</span>
        </div>
        <br> <br>
        
		<form action="/CCBS/wallet/${user.getUser_id()}" method="post">
			<div class="row">
				<label for="topup" class="form-label">Amount to Top Up</label> <br>
				<input type="text" class="form-control w-25" id="topupAmount" name="topupAmount" required>
				<input type="hidden" name="update" value=true>
			</div>
		
			<br><br>
			<button type="reset" class="btn btn-secondary font-weight-bold rounded-pill">Cancel</button>
			<button type="submit" class="btn btn-success font-weight-bold rounded-pill ms-2">Update</button>
		</form>
	</div>
</body>
</html>