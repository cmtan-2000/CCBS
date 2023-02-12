<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="java.util.Base64"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">

<style>
body.background {
	background-color: black;
	font-family: 'Poppins', sans-serif;
}

.page-wrapper {
	margin: 80px 300px;
	color: white;
}

.title {
	color: yellow;
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

<body class="background">
<header class="site-header .collapse.navbar-collapse">
		<div class="site-container">
			<a href="#" id="branding"></a><i
				class="fa-solid fa-film fa-2x cinema-logo"></i>
			<h1 class="site-title">Miner Cinema</h1>
			</a>
		</div>

		<nav class="main-navigation">
			<ul class="menu">
				<li class="menu-profile current menu-item" style="color: white"><a href="/CCBS/profile/${user.getUser_id()}"
					class="link">CUSTOMER</a></li>
				<li class="menu-item menu-item"><a href="<c:url value='/movie'/>"
					class="link">Home</a></li>
				<li class="menu-item"><a href="/CCBS/wallet/${user.getUser_id()}"
					class="link">Top Up</a></li>
				<li class="menu-item"><a href="<c:url value='/login'/>" class="link">Sign Out</a></li>
			</ul>
		</nav>
	</header>	
	
	<div class="page-wrapper">
		<div class="container">
			<h1 class="title">Profile</h1>

			<jsp:useBean id="user" class="model.User" scope="session" />
			
			<div>
				<table>
					<tr>
						<td width="17%" colspan="3">Name</td>
						<td width="60%"><c:out value="${user.name}" /></td>
						<td rowspan="4"><c:set var="image1" value="${image1}" /> <c:set
								var="imageBase64"
								value="${Base64.getEncoder().encodeToString(IOUtils.toByteArray(image1))}" />
							<img src="data:image/jpg;base64,${imageBase64}"
							class="img-thumbnail" style="width: 200px"></td>
					</tr>
					<tr>
						<td width="17%" colspan="3">Date of Birth</td>
						<td width="60%"><c:out value="${user.dob}" /></td>
					</tr>
					<tr>
						<td width="17%" colspan="3">Phone no</td>
						<td width="60%"><c:out value="${user.phoneNo}" /></td>
					</tr>
					<tr>
						<td width="17%" colspan="3">Address</td>
						<td width="60%"><c:out value="${user.address}" /></td>
					</tr>
				</table>
			</div>

		</div>
	</div>
</body>
</html>