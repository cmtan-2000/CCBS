<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value="resources/images/CCBS.ico" /> ">

</head>
<body>
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="container">

		<form class="d-flex justify-content-end" method="get" action="">
			<input type="date" name="date" class="form-control col-2">
		</form>

		<table class="table table-light border-1 mt-5">
			<thead>
				<tr>
					<th>#</th>
					<th>Movie Name</th>
					<th>Price/Ticket</th>

					<th>Total Price</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ticket }" var="details" varStatus="loop">
					<tr>
						<td>${loop.index+1 }</td>
						<td>${details.get("movieName") }</td>
						<td>${details.get("movie_price") }</td>
						<c:set value="${details.get('seat').split(',')}" var="quantity"></c:set>

						<td>${Double.parseDouble(details.get("movie_price")) }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>