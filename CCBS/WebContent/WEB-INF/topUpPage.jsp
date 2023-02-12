<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	
<style>
	.form-control{
		width: 20% !important;
	}
</style>	
	
	<link rel="stylesheet" href="resources/css/style2.css">
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
				<li class="menu-profile menu-item" style="color: white">CUSTOMER</li>
				<li class="menu-item"><a href="movieGridListView.jsp"
					class="link">Home</a></li>
				<li class="current menu-item "><a href="topUpPage.jsp" class="link">Top Up</a></li>
				<li class="menu-item"><a href="login.jsp" class="link">Sign Out</a></li>
			</ul>
		</nav>
	</header>
	
	<div class="container" style="margin: auto; color: white;">
  		<div style="display: flex; justify-content: center; align-items: center; font-size: 50px;">
  			<h1>Balance: </h1>
        	<span style="color: yellow; font-size: 80px;">123</span>
        </div>
        <br> <br>
		<form>
			<div class="row">
				<label for="topup" class="form-label">Amount to Top Up</label> <br>
				<input type="text" class="form-control" id="topup">
			</div>
		
			<br><br>
			<button type="reset" class="btn btn-secondary font-weight-bold rounded-pill">Cancel</button>
			<button type="submit" class="btn btn-success font-weight-bold rounded-pill ms-2">Save</button>
		</form>
	</div>
</body>
</html>