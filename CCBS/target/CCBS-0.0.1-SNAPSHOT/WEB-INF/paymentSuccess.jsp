<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Payment Result Page</title>
	<link rel="stylesheet" type="text/css" href="css/paymentSuccess.css">
</head>
<body>
	<div class="header">
		<label>Payment Successfully</label>
		<a href="./viewMovie.jsp"> 
			<input type="submit" value="RETURN" name="return" class="return">
		</a>
		
	</div>
	<div class="grid-container">
		<div class="grid-item item1">
        	<b style="font-size: 20px">Movie: Black Panther: Wakanda Forever</b><br>
        	Seat: B5, B6, B7, B8<br>
            Quantity: Adult 4
        </div>
        <div class="grid-item item2">
        	<input type="submit" value="PRINT" name="print">
        </div>
        <div class="grid-item item3">RM </div>
        <div class="grid-item item98"></div>
        <div class="grid-item item4">
        	<b style="font-size: 20px">Signature Popcorn (Small) + 1x Regular Drink / Mineral Water</b><br>
            Quantity: 3
        </div>
        <div class="grid-item item5">
        	<input type="submit" value="PRINT" name="print">
        </div>
        <div class="grid-item item6">RM </div>
</div>
</body>
</html>