<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Error Login</title>
	<link rel="stylesheet" href="resources/css/errorLogin.css">
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
</head>
<body>
	<div class="center">
		<h1 class="error_header">Error Login</h1>
		<p class="error_1">Sorry your userName or password is incorrect or no input!</p>
		<p class="error_2">Please try again!</p>
	</div>
	
</body>
</html>