<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Checkout Page</title>
	<link rel="stylesheet" type="text/css" href="css/checkout.css">
</head>
<body>
	<div class="header">
		<label>Checkout</label>
	</div>
	<div class="grid-container">
		<div class="grid-item item1">
        	<b style="font-size: 20px">Movie: Black Panther: Wakanda Forever</b><br>
        	Seat: B5, B6, B7, B8
        </div>
        <div class="grid-item item2">Quantity</div>
        <div class="grid-item item3">Adult</div>
		<div class="grid-item item4">
        	RM10 
            <input type="number" min="0" value="0" name="adultQuantity" style="width: 40px">
        </div>
        <div class="grid-item item5"> </div>
        <div class="grid-item item6">Child</div>
        <div class="grid-item item7">
        	RM4&nbsp&nbsp
            <input type="number" min="0" value="0" name="childQuantity" style="width: 40px">
        </div>
        <div class="grid-item item	8"><hr></div>
        <div class="grid-item item9"><b style="font-size: 20px">&nbsp&nbsp&nbsp Total</b></div>
        <div class="grid-item item10">
        	RM 
        </div>
      	<div class="grid-item item11" align="right">
      		<form action="./PaymentController" method="post">
      			<input type="submit" value="CONFIRM" name="confirm">
      		</form>
        </div>
	</div>
	


</body>
</html>