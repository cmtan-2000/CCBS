<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Purchase Food</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='resources/images/CCBS.ico' /> ">

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
	color: white;
}

body {
	background-color: black
}

hr {
	height: 3px;
	background-color: black
}

.foodRow {
	margin: 0;
	display: flex;
	flex-direction: row;
	justify-content: space-between
}

.qtyPrice {
	width: 20%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

input {
	background-color: white;
	color: black;
	border-radius: 5px
}
</style>
</head>
<body>
	<form action="/CCBS/displayFoodDrinks/insertTicket" method="post">
		<div
			style="display: flex; flex-direction: row; justify-content: center">

			<div
				style="width: 70%; height: 100%; padding: 20px 50px; background-color: #2a2a2a">
				<div class="foodBeverage">
					Food And Beverage
					<p class="combo">
						Combo<br>
					<hr>
					<c:forEach var="combo" items="${FABList.get('combo')}">
						<div class="foodRow">
							<label>${combo.getName() }</label>
							<div class="qtyPrice">
								<b>Qty: <input value=0 min="0" type="number" name="quant1"
									style="width: 50px" />
								</b> <b>RM <fmt:formatNumber type="number" maxFractionDigits="2"
										minFractionDigits="2" value="${combo.getPrice()}" /></b>
							</div>
						</div>
					</c:forEach>
					</p>
					<p class="food">
						Food<br>
					<hr>
					<c:forEach var="food" items="${FABList.get('food')}">
						<div class="foodRow">
							<label>${food.getName()}</label>
							<div class="qtyPrice">
								<b>Qty: <input value=0 min="0" type="number" name="quant1"
									style="width: 50px" />
								</b> <b>RM <fmt:formatNumber type="number" maxFractionDigits="2"
										minFractionDigits="2" value="${food.getPrice()}" /></b>
							</div>
						</div>
					</c:forEach>
					</p>
					<p class="drink">
						Drink<br>
					<hr>
					<c:forEach var="drink" items="${FABList.get('drink')}">
						<div class="foodRow">
							<label>${drink.getName()}</label>
							<div class="qtyPrice">
								<b>Qty: <input value=0 min="0" type="number" name="quant1"
									style="width: 50px" />
								</b> <b>RM <fmt:formatNumber type="number" maxFractionDigits="2"
										minFractionDigits="2" value="${drink.getPrice()}" /></b>
							</div>
						</div>
					</c:forEach>
					</p>
				</div>
				<div style="display: flex; flex-direction: row-reverse;">

					<input type="submit" class="btn btn-success font-weight-bold"
						value="Confirm" />

				</div>
			</div>
		</div>
	</form>
</body>
</html>