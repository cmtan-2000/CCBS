<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    <link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
	
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
                    <td colspan="2">${ticket.getMovieName()}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Showtime</td>
                    <td colspan="2">${ticket.getShowTime()}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Show date</td>
                    <td colspan="2">${ticket.getShowDate()}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Seats</td>
                    <td colspan="2">${ticket.getSeat()}</td>
                </tr>
                <tr>
                    <td class="tb_checkout">Ticket info</td>
                    <td>${ticket.getTicketType()}</td>
                    <td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${ticket.getMoviePrice()}" /></td>
                    <td>x${ticket.getSeatCount()}</td>
                </tr>

                <tr>
                    <td class="tb_checkout">Food and beverage</td>
                    <c:choose>
                    	<c:when test="${ticket.getFoodID() != 0}">
                   			<td>${ticket.getFoodName()}</td>
                   			<td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${ticket.getFoodPrice()}" /></td>
                    		<td>x${ticket.getFoodAmount()}</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td>-</td>
                    	</c:otherwise>
                    </c:choose>
                </tr>
                
                <tr>
                    <td></td>
                    <c:choose>
                    	<c:when test="${ticket.getDrinkID() != 0}">
                   			<td>${ticket.getDrinkName()}</td>
                   			<td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${ticket.getDrinkPrice()}" /></td>
                    		<td>x${ticket.getDrinkAmount()}</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td>-</td>
                    	</c:otherwise>
                    </c:choose>
                </tr>
                
                <tr>
                    <td></td>
                    <c:choose>
                    	<c:when test="${ticket.getComboID() != 0}">
                   			<td>${ticket.getComboName()}</td>
                   			<td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${ticket.getComboPrice()}" /></td>
                    		<td>x${ticket.getComboAmount()}</td>
                    	</c:when>
                    	<c:otherwise>
                    		<td>-</td>
                    	</c:otherwise>
                    </c:choose>
                </tr>
                
                <tr>
                    <td class="tb_checkout" colspan="2">Total</td>
                    <td>RM<fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${ticket.getTotalPrice()}" /></td>
                </tr>
               </table>
            <a class="btn btn-success float-end mt-4" href="<c:url value='/checkout/showPayment'/>" role="button">Confirm checkout</a>
        </div>
    </div>
    
</body>
</html>