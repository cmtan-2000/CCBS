<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>

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

    .header-logout {
        color: yellow;
    }
</style>
</head>
<body class="background">
    <div class="page-wrapper">
        <div class="wrapper">
            <h1 class="header-logout">You have logged out.</h1>
            <br> <br>
            <a class="btn btn-primary float-end ms-5" href="<c:url value='/login'/>">Back to login</a>
        </div>
    </div>
    <% session.invalidate(); %>
</body>
</html>