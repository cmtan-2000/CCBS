<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container p-5" style="background: white;">
		<span class="float-end times-button" onclick="closeDialog('addFoodAndBeverageDialog')" style="cursor:pointer;"><i class="fas fa-times" aria-hidden="true"></i></span>
		<p>
			<b>Package:</b> <span class="py-1 px-4"
				style="background: lightblue; border-radius: 3px;">Combo</span>
		</p>
		<input readonly disabled name="combo" value="Medium Popcorn" /> <br>
		<br> <input readonly disabled name="food"
			value="Small Sized Drink" /> <br> <br> <input disabled
			readonly name="drink" value="Onion Ring" /><br> <br>

		<hr style="height: 3px; background: black;">

		<div class="button-rows">
			<button class="btn" style="background: lightgray">
				<b>RM14.90</b>
			</button>

			<button class="btn btn-primary font-weight-bold rounded-pill"
				onclick="closeDialog('addFoodAndBeverageDialog')">Insert</button>
		</div>
	</div>
</body>
</html>