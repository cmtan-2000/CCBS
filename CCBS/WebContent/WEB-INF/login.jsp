<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" errorPage="errorLogin.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="resources/css/style2.css">

<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
<style>

body {
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

/* header */
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

/* login */
.login_body {
	margin: 0;
	padding: 0;
	background: linear-gradient(to top, #c79081 0%, #dfa579 100%);
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
}

#center {
	margin: auto;
	background-color: white;
	border-radius: 10px;
	width: 30%;
	padding: 20px;
	box-shadow: 15px -7px 20px rgba(79, 69, 59, 0.2);
}

.login_header {
	display: block;
	text-align: center;
	width: 100%;
	font-size: 40px;
	border-bottom: 1px solid silver;
	font-weight: bolder
}


.username_input,
.password_input {
	position: relative;
	margin: 20px 20px 20px;
}

.username_input input,
.password_input input {
	padding: 0px 5px;
	border: none;
	outline: none;
	height: 40px;
	font-size: 17px;
}

.username_input label,
.password_input label {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translate(0, -50%);
	color: silver;
	pointer-events: none;
	font-size: 17px;
}

.username_input span::before,
.password_input span::before {
	content: '';
	position: absolute;
	top: 40px;
    left: 0;
    width: 100%;
    height: 2px;
    background: silver;
}

.username_input input:focus ~ label, 
.username_input input:valid ~ label,
.password_input input:focus ~ label,
.password_input input:valid ~ label {
	top: -5px;
    color: rgba(255, 0, 0, 0.6);
    transition: .5s;
}

.username_input input:focus ~ span::before,
.username_input input:valid ~ span::before,
.password_input input:focus ~ span::before,
.password_input input:valid ~ span::before {
    width: 100%;
    background: rgba(255, 0, 0, 0.6);
    transition: .5s;
}

.loginlink {
	text-decoration: none;
	color: rgb(136, 135, 135);
	margin: 20px 30px 35px 20px;
	font-size: 15px;
}

.login_submit {
    width: 100%;
}

/*index.jsp*/
.company__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.company__alltab {
  margin: 0px -12px;
}

.company__alltab ul li {
  list-style: none;
  display: inline;
  padding: 1.05rem 3rem;
  border-radius: 10px 10px 0px 0px !important;
  background-color: #d4d4d4;
  color: black;
  font-weight: bold;
  cursor: pointer;
}

.company__alltab ul li.selected {
  background-color: #bbcfd0;
}

.company__movietab,
.visible_contents {
  position: relative;
}

/* add ".right" to generalize position of button */
.right {
  position: absolute;
  right: 4rem;
}

#visible_contents {
  background-color: #bbcfd0;
  border-radius: 0px 10px 10px 10px !important;
  line-height: 1.6rem;
  margin: 0px 40px 40px 40px;
  padding: 50px 3rem;
}

.hidden_contents {
  display: none;
}

.input-group {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 3rem 0 3rem 0;
}

/* all page add this as most outer container*/
.outer__container {
  padding: 0px 30px 120px 30px important!;
}

.movie__poster {
  width: 165px;
  height: 248px;
}

td {
	border: 0 !important;
}

td[colspan='4'] {
	border-bottom: 3px solid black !important;
}

.snack-title {
	font-size: 23px;
}

/* bootstrap open modal */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  padding-top: 100px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0, 0, 0); /* Fallback color */
  background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

body{
	padding-right: 0 !important;
    overflow: scroll !important;
}


/* Delete confirmation modal */
.modal-confirm {
	color: #636363;
	width: 400px;
}

.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}

.modal-confirm .modal-header {
	border-bottom: none;
	position: relative;
}

.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}

.modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}

.modal-confirm .modal-body {
	color: #999;
}

.modal-confirm .modal-footer {
	border: none;
	text-align: center;
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}

.modal-confirm .modal-footer a {
	color: #999;
}

.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}

.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}

.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}

.modal-confirm .btn-secondary {
	background: #c1c1c1;
}

.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus
	{
	background: #a8a8a8;
}

.modal-confirm .btn-danger {
	background: #dc3545;
}

.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	background: #ee3535;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}

.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
	width: 100vw;
	height: 100vh;
	background-color: #000;
	opacity: 0.5;
	display: none;
}

.dialog {
	position: absolute;
	width: auto;
	height: auto;
	background: #fff;
	top: 50%;
	transform: translate(-50%, -50%);
	left: 50%;
	min-width: 850px;
	display: none;
	z-index: 1050;    
	max-height: 500px;
    overflow-y: auto;
}

.modal-content{
	max-height: 500px;
    overflow-y: auto;
    margin-top: -50px;
}

.times-button {
	background: lightgray;
	height: 25px;
	width: 25px;
	text-align: center;
	border-radius: 30px;
	float: float-end;
}


.badge-style {
	border-radius: 30px;
	padding:2px 10px;
}

.badge-style.badge-lightblue {
	background: lightblue;
}

.badge-style.badge-lime {
	background: lime;
}

.badge-style.badge-white {
	background: #f0f0f0;
}


</style>


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
		<form method="POST" action="login_success">
			<div class="username_input">
				<input type="text" name="username" id="username" required><br>
				<span></span> <label>Username</label>
			</div>
			<div class="password_input">
				<input type="password" name="password" id="password" required><br>
				<span></span> <label>Password</label>
			</div>
			<div class="loginlink">
				<a style="text-decoration: none;" href="<c:url value='/forgotPassword'/>">Forgot password?</a>
			</div>

			<input class="btn btn-primary font-weight-bold rounded-pill login_submit" type="submit" value="LOGIN" style="margin-bottom: 5px;">
			
			<hr>
			<span class="mt-3">Dont have an account? <a style="text-decoration: none;" href="<c:url value='/register'/>"/>Create now!</a></span>
			
		</form>
		
	</div>

</body>
</html>