<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/afterRegNPayment.css" />"
	rel="stylesheet">
</head>

<body class="background">
	<div class="page-wrapper">
		<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
			viewBox="0 0 52 52">
            <circle class="checkmark__circle" cx="26" cy="26" r="25"
				fill="none" />
            <path class="checkmark__check" fill="none"
				d="M14.1 27.2l7.1 7.2 16.7-16.8" />
        </svg>
		<div class="wrapper">
			<h1 class="header-register">Your new account is created!</h1>
			<h4 class="header-content">Now you may proceed relogin to your
				account to book the movie tickets</h4>
			<br> <br>
			<a class="btn btn-primary float-end" href="<c:url value='/login'/>">Back to login</a>
		</div>
	</div>
</body>

</html>