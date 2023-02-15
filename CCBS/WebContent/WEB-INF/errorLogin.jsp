<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.User" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Error Login</title>
	<link rel="stylesheet" href="resources/css/errorLogin.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
</head>
<body >
	<%
		Object auth = session.getAttribute("loggedIn");
		Object userRole = session.getAttribute("userRole");
		String redirectURL = "login";
		if (auth == null)
			response.sendRedirect(redirectURL);
	%>
	<div class="center">
		<h1 class="error_header">Error Login</h1>
		<p class="error_1">Sorry your userName or password is incorrect or no input!</p>
		<p class="error_2">Please try again!</p>
		<br>
		<a class="btn btn-outline-primary" href="<c:url value='/login'/>" role="button">Back to Login</a>
	</div>
	
</body>
</html>