<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Payment Page</title>
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
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
    </style>
</head>
<body class="background">
    <div class="page-wrapper">
        <div class="wrapper">

        	<jsp:useBean id="ticket" class="model.Ticket" scope="session"/>
        	<jsp:useBean id="user" class="model.User" scope="session"/>

            <h1 style="color: yellow; margin-bottom: 30px;">Make payment</h1>
			
            <h5>Total amount to pay: RM${ticket.totalPrice}</h5>
            <p> <input type="text" class="form-control" placeholder="Enter amount"> </p>

			<a class="btn btn-success float-end mt-4" href="<c:url value='/checkout/makePayment/${user.user_id}'/>" role="button">Submit</a>
        </div>
    </div>
</body>
</html>