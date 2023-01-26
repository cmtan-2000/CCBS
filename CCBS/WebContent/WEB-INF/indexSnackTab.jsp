<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">

<!-- CSS -->
<link rel="stylesheet" href="css/modal.css">

<!-- Font awesome -->
<script src="https://kit.fontawesome.com/6f995c3af2.js"
	crossorigin="anonymous"></script>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />

<title>Company Homepage</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
	font-weight: bold;
}

.btn-primary, .btn-danger {
/* 	padding: 1px 25px; */
/* 	font-weight: bold; */
	color: white;
}

td {
	border: 0 !important;
}

td[colspan='4'] {
	border-bottom: 3px solid black !important;
}

.button-rows {
	display: flex;
	flex-direction: column;
	gap: 15px;
	align-items: end;
}

.snack-title {
	font-size: 23px;
}
</style>
</head>
<body>
	<div style="color: #BBCFD0;">
		<button class="btn btn-primary font-weight-bold rounded-pill right"
			onclick="toggleDialog('addFoodAndBeverageDialog')"><i class="fas fa-plus"></i> Add Food and Beverage</button>
		<br>
		<div class="container mt-5">
			<table class="table table-border">
				<tr>
					<td colspan="4"><b class="snack-title">Combo</b></td>
				</tr>
				<%
					String[] combo = new String[]{"Signature Popcorn (Small) + 1x Regular Drink/Mineral Water",
							"Big Depper + 1x Regular Drink / Mineral Water",
							"Golden Horn Chips (Small) + 1x Regular Drink/ Mineral Water",
							"5pcs Hot Minis + 1x RegularDrink / Mineral Water"};
					double[] comboPrice = new double[]{9.9, 9.9, 9.9, 9.9};
					for (int i = 0; i < combo.length; i++) {
						out.println(String.format("<tr>" + "<td>" + combo[i] + "</td>" + "<td>RM %.2f</td>"
								+ "<td><button class='btn btn-primary rounded-pill' onclick='toggleDialog(\"addFoodAndBeverageDialog\")'><i class='fas fa-edit'></i> Edit</button></td>"
								+ "<td><button data-bs-toggle=\"modal\" data-bs-target=\"#deleteCfmModal\" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>" + "</tr>", comboPrice[i]));
					}
				%>
				<tr>
					<td colspan="4"><b class="snack-title">Food</b></td>
				</tr>
				<%
					String[] food = new String[]{"Large Size Onion Ring", "Medium PopCorn", "Medium PopCorn"};
					double[] foodPrice = new double[]{9.9, 9.9, 9.9};
					for (int i = 0; i < food.length; i++) {
						out.println(String.format("<tr>" + "<td>" + food[i] + "</td>" + "<td>RM %.2f</td>"
								+ "<td><button class='btn btn-primary rounded-pill' onclick='toggleDialog(\"addFoodAndBeverageDialog\")'><i class='fas fa-edit'></i> Edit</button></td>"
								+ "<td><button data-bs-toggle=\"modal\" data-bs-target=\"#deleteCfmModal\" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>" + "</tr>", foodPrice[i]));
					}
				%>
				<tr>
					<td colspan="4"><b class="snack-title">Drink</b></td>
				</tr>
				<%
					String[] drink = new String[]{"Sprite", "MountainDew"};
					double[] drinkPrice = new double[]{4.9, 2.9};
					for (int i = 0; i < drink.length; i++) {
						out.println(String.format("<tr>" + "<td>" + drink[i] + "</td>" + "<td>RM %.2f</td>"
								+ "<td><button class='btn btn-primary rounded-pill' onclick='toggleDialog(\"addFoodAndBeverageDialog\")'><i class='fas fa-edit'></i> Edit</button></td>"
								+ "<td><button data-bs-toggle=\"modal\" data-bs-target=\"#deleteCfmModal\" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>" + "</tr>", drinkPrice[i]));
					}
				%>

			</table>
		</div>
	</div>
</body>
</html>