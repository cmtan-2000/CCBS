<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style2.css"/>">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
</head>
<body class="login_body">

	<div id="center">
		<div class="login_header">
			<label>Login</label>
		</div>
		<form method="POST" action="./login">
			<div class="username_input">
				<input type="text" name="username" id="username" required><br>
				<span></span> <label>Username</label>
			</div>
			<div class="password_input">
				<input type="password" name="password" id="password" required><br>
				<span></span> <label>Password</label>
			</div>
			<div class="forgot_password">
				<a href="forgotpassword.jsp">Forgot password?</a>
			</div>


			<input class="btn btn-primary font-weight-bold rounded-pill login_submit" type="submit" value="LOGIN">
			<br><br>

			<!-- <p>
			<label>User Name</label>
			<input type="text" name="username" required><br>
			</p>
			<p>
			<label>Password</label>
			<input type="password" name="password" required><br>
			</p> -->

		</form>
	</div>

</body>
</html>