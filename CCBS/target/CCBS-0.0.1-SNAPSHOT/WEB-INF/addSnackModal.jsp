<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
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
			<select name="package"  class="py-1 px-4 form-control" onchange="toggleInputField(event)">
				<option value="combo" selected>Combo</option>
				<option value="food">Food</option>
				<option value="drink">Drink</option>
			</select>
		</div>
		<div class="row">
			<div class="col-6">
				<label>Name</label>
				<!-- <div class="input-group mb-3">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1">@</span>
				  </div>
				  <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
				</div> -->
				<input name="combo" value="${fab.getName()}" class="mt-3 form-control"/> 
				<input name="drink" value="${fab.getName()}" class="mt-3 form-control"/>
				<input name="food" value="${fab.getName()}" class="mt-3 mb-3 form-control" style="visibility: hidden;display:none"/> 
			</div>
			<div class="col-6">
				<label for="price">Price</label>
				<input name="price" value="${fab.getPrice()}" class="mt-3 form-control" required min="0" step="0.1"/> 
				
				<label for="quantity">Quantity</label>
				<input name="quantity" value="${fab.getStock_quantity()}" class="mt-3 form-control" required min="0" step="1"/> 
			</div>
		</div>
		<input type="hidden" value="${param.formType=='create' ? param.formType: 'edit'}">
		<c:choose>
			<c:when test="${not empty fab}">
				<input type="hidden" name="id" value="${fab.getFab_id()}">
			</c:when>
		</c:choose>

		<button class="btn btn-primary font-weight-bold rounded-pill" type="submit"
			onclick="closeDialog('addFoodAndBeverageDialog')">Insert</button>
	</form>
	
	<script type="text/javascript">
		function toggleInputField(e){
			var a = document.getElementsByName('food')[0];
			var b = document.getElementsByName('drink')[0];
			var c = document.getElementsByName('combo')[0];
			if(e.target.value.toString() == 'combo') {
				a.style.display = 'none';
				b.style.display = 'block';
				c.style.display = 'block';
				a.style.visibility = 'hidden';
				b.style.visibility = 'initial';
				c.style.visibility = 'initial';
			}
			else if(e.target.value.toString() == 'food') {
				console.log("food");
				a.style.display = 'block';
				b.style.display = 'none';
				c.style.display = 'none';
				a.style.visibility = 'initial';
				b.style.visibility = 'hidden';
				c.style.visibility = 'hidden';
			}
			else if(e.target.value.toString() == 'drink') {
				console.log("drink");
				a.style.display = 'none';
				b.style.display = 'block';
				c.style.display = 'none';
				a.style.visibility = 'hidden';
				b.style.visibility = 'initial';
				c.style.visibility = 'hidden';
			}else {
				console.log("none");
			}
		}
	</script>
	
	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>