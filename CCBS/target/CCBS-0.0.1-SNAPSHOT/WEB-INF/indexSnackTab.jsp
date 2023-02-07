<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<button class="btn btn-primary font-weight-bold rounded-pill right" onclick="toggleDialog('addFoodAndBeverageDialog')">
			<i class="fas fa-plus"></i> Add Food and Beverage
		</button>
		<br>
		<div class="container mt-5">
			<table class="table table-border">
				<tr>
					<td colspan="4"><b class="snack-title">Combo</b></td>
				</tr>
				<c:forEach var="combo" items="${FABList.get('combo')}">
					<tr>
						<td><c:out value="${combo.getName()}" /></td>
						<td><c:out value="RM ${combo.getPrice()}" /></td>
						<td><a href="/CCBS/company/fab/edit/combo/${combo.getFab_id()}" target="_blank" class="btn btn-primary font-weight-bold rounded-pill"><i class="fas fa-edit"></i> Edit</a></td>
						<td><button data-bs-toggle="modal" data-bs-target="#deleteCfmModal" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><b class="snack-title">Food</b></td>
				</tr><c:forEach var="food" items="${FABList.get('food')}">
					<tr>
						<td><c:out value="${food.getName()}" /></td>
						<td><c:out value="RM ${food.getPrice()}" /></td>
						<td><a href="/CCBS/company/fab/edit/food/${food.getFab_id()}" target="_blank" class="btn btn-primary font-weight-bold rounded-pill"><i class="fas fa-edit"></i> Edit</a></td>
						<td><button data-bs-toggle="modal" data-bs-target="#deleteCfmModal" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4"><b class="snack-title">Drink</b></td>
				</tr>
				<c:forEach var="drink" items="${FABList.get('drink')}">
					<tr>
						<td><c:out value="${drink.getName()}" /></td>
						<td><c:out value="RM ${drink.getPrice()}" /></td>
						<td><a href="/CCBS/company/fab/edit/drink/${drink.getFab_id()}" target="_blank" class="btn btn-primary font-weight-bold rounded-pill"><i class="fas fa-edit"></i> Edit</a></td>
						<td><button data-bs-toggle="modal" data-bs-target="#deleteCfmModal" class='btn btn-danger rounded-pill'><i class='fa-solid fa-trash-can'></i> Delete</button></td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>