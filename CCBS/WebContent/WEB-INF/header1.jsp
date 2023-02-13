<!-- header for ADMIN -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1">
	
<!-- Font awesome -->
<script src="https://kit.fontawesome.com/7b75b44b76.js"
	crossorigin="anonymous"></script>

<!-- Poppins -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet" />

<!-- CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/style2.css'/>" type="text/css" >
</head>
<body>
	<header class="site-header">
		<div class="site-container">
			<a href="#" id="branding"></a><i
				class="fa-solid fa-film fa-2x cinema-logo"></i>
			<h1 class="site-title">Miner Cinema</h1>
			</a>
		</div>
		</div>
		<nav class="main-navigation">
			<ul class="menu">
				<li class="menu-profile menu-item" style="color: white"><a href="/CCBS/profile/${user.getUser_id()}"
					class="link">ADMIN</a></li>
				<li class="menu-item current menu-item"><a href="/admin"
					class="link">Home</a></li>
				<li class="menu-item"><a href="<c:url value='/logout'/>" class="link">Sign Out</a></li>
			</ul>
		</nav>
	</header>
</body>
</html>