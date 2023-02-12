<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
<!-- CSS -->
<link rel="stylesheet" href="resources/css/modal.css">

<!-- Font awesome -->
<script src="https://kit.fontawesome.com/6f995c3af2.js"
	crossorigin="anonymous"></script>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />

<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
<title>Edit Food And Beverages</title>
</head>
<body>
	<form class="container p-5" style="background: white;" method="POST" action="/CCBS/company/fab/create">
		<c:choose>
			<c:when test="${empty fab}">
				<span class="float-end times-button" onclick="closeDialog('addFoodAndBeverageDialog')" style="cursor:pointer;">
				<i class="fas fa-times" aria-hidden="true"></i></span>
			</c:when>
		</c:choose>
		
		<div class="d-flex">
			<label for="package">Package: </label>
			<select name="package" class="py-1 px-4 form-control"
				<c:choose>
					<c:when test="${not empty fab}">
						disabled
					</c:when>
				</c:choose>
			>
				<option value="combo" selected>Combo</option>
				<option value="food">Food</option>
				<option value="drink">Drink</option>
			</select>
		</div>
		<div class="row mt-3">
			<div class="col-6">
				<label>Name</label>
				<input name="name" value="${fab.getName()}" class="mt-3 form-control" /> 
			</div>
			<div class="col-6">
				<label for="quantity">Price</label>
				<div class="input-group mb-3 mt-3 ">
				  	<div class="input-group-prepend">
				    	<span class="input-group-text" id="basic-addon1">RM</span>
				  	</div>
					<input name="price" value="${fab.getPrice()}" class="form-control" required min="0" step="0.1"/> 
				</div>
				<label for="quantity">Quantity</label>
				<input name="quantity" value="${fab.getStock_quantity()}" class="mt-3 form-control" required min="0" step="1"/> 
			</div>
		</div>
		<input type="hidden" name="formType" value='${param.formType == "create" ? "create" : "edit"}'>
		<c:choose>
			<c:when test="${not empty fab}">
				<input type="hidden" name="id" value="${fab.getFab_id()}">
				<input type="hidden" name="package" value="${fabType}">
			</c:when>
		</c:choose>

		<button class="btn btn-primary font-weight-bold rounded-pill" type="submit"
			onclick="closeDialog('addFoodAndBeverageUpdate')">
			<c:choose>
				<c:when test="${not empty fab}">
					Update
				</c:when>
				<c:otherwise>
					Insert
				</c:otherwise>
			</c:choose>
		</button>
	</form>
	
	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>