<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Checkout Page</title>
	<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap" rel="stylesheet">
	
	<style>
        body.background {
            background-color: black;
            font-family: 'Poppins', sans-serif;
            height: 100vh;
        }

        .page-wrapper {
            margin: 80px 300px;
        }

        .title {
            color: yellow;
            margin-bottom: 40px;
        }

        .table,
        td {
            font-size: 20px;
            color: white;
            border: none;
        }

        .tb_checkout {
            color: peru;
        }
    </style>
</head>
<body class="background">
	<div class="page-wrapper">
        <div class="container">
            <h1 class="title">Checkout</h1>
						
			<jsp:useBean id="ticket" class="model.Ticket" scope="session"/>
            <table class="table">
                <tr>
                    <td class="tb_checkout">Movie name</td>
                    <td colspan="2">${ticket.movieName}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Showtime</td>
                    <td colspan="2">${ticket.showTime}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Show date</td>
                    <td colspan="2">${ticket.showDate}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Seats</td>
                    <td colspan="2">${ticket.seat}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Ticket info</td>
                    <td>${ticket.ticketType}</td>
                    <td>RM${ticket.moviePrice}</td>
                    <td>x${ticket.seatCount}</td>
                </tr>

                <tr>
                    <td class="tb_checkout">Food and beverage</td>
                    <td>${ticket.foodName}</td>
                    <td>RM${ticket.foodPrice}</td>
                    <td>x${ticket.foodAmount}</td>
                </tr>
                <tr>
                    <td></td>
                    <td>${ticket.drinkName}</td>
                    <td>RM${ticket.drinkPrice}</td>
                    <td>x${ticket.drinkAmount}</td>
                </tr>
                <tr>
                    <td class="tb_checkout" colspan="2">Total</td>
                    <td>RM${ticket.totalPrice}</td>
                </tr>
               </table>
            <a class="btn btn-success float-end mt-4" href="<c:url value='/checkout/showPayment'/>" role="button">Confirm checkout</a>
        </div>
    </div>
</body>
</html>