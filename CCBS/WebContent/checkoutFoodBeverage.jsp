<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<div
		style="display: flex; flex-direction: row; justify-content: center">
		<button style="margin-right: 20px; margin-top:50px; height: fit-content" class="btn btn-secondary font-weight-bold mt-5">Exit</button>
		<div
			style="width: 70%; height: 100%; padding: 20px 50px; background-color: #2a2a2a">
			<div class="foodBeverage">
				Food And Beverage
				<p class="combo">
					Combo<br>
				<hr>
				<div class="foodRow">
					<label>Signature PopCorn (Small) + 1x Regular Drink/Mineral
						Water</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant1"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Big Depper + 1x Regular Drink/Mineral Water</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant2"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Golden Horn Chips (Small) + 1x Regular Drink/Mineral
						Water</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant3"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Signature PopCorn (Small) + 1x Regular Drink/Mineral
						Water</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant4"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				</p>
				<p class="food">
					Food<br>
				<hr>
				<div class="foodRow">
					<label>Large Size Onion Ring</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant5"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Extra Large Size French Fries</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant6"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Medium PopCorn</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant7"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				</p>
				<p class="drink">
					Drink<br>
				<hr>
				<div class="foodRow">
					<label>Sprite</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant8"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Mountain Dew</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant9"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				<div class="foodRow">
					<label>Medium PopCorn</label>
					<div class="qtyPrice">
						<b>Qty: <input value=0 min="0" type="number" name="quant10"
							style="width: 50px" /></b> <b>RM 9.90</b>
					</div>
				</div>
				</p>
			</div>
			<div style="display: flex; flex-direction: row-reverse;">
				<form action="./CheckoutController" method="post">
					<input type="submit" class="btn btn-success font-weight-bold" value="Confirm"/>
				</form>
			</div>

		</div>
	</div>
</body>
</html>