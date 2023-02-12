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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<style>
body {
	background-color: black;
	font-family: 'Poppins', sans-serif;
}

.page-wrapper {
	margin: 40px 300px;
	color: white;
}

.wrapper {
	margin: 0px 90px;
}

.header-register {
	color: yellow;
}

.checkmark__circle {
	stroke-dasharray: 166;
	stroke-dashoffset: 166;
	stroke-width: 2;
	stroke-miterlimit: 10;
	stroke: #7ac142;
	fill: none;
	animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards
}

.checkmark {
	width: 56px;
	height: 56px;
	border-radius: 50%;
	display: block;
	stroke-width: 2;
	stroke: #fff;
	stroke-miterlimit: 10;
	margin: 7% auto;
	box-shadow: inset 0px 0px 0px #7ac142;
	animation: fill .4s ease-in-out .4s forwards, scale .3s ease-in-out .9s
		both
}

.checkmark__check {
	transform-origin: 50% 50%;
	stroke-dasharray: 48;
	stroke-dashoffset: 48;
	animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.8s forwards
}

        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }

        @keyframes scale {

            0%,
            100% {
                transform: none;
            }

            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }

        @keyframes fill {
            100% {
                box-shadow: inset 0px 0px 0px 30px #7ac142;
            }
        }
</style>
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