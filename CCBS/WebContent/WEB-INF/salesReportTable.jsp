<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	href="<c:url value='/resources/images/CCBS.ico' /> ">
<style>
p, td, th, h5 {
	color: white;
}
</style>
</head>
<body style="background: black;">
	<%
		Object auth = session.getAttribute("loggedIn");
		Object userRole = session.getAttribute("userRole");
		String redirectURL = "login";
		if (auth == null)
			response.sendRedirect(redirectURL);
		if (userRole != "admin") {
	%>
	<script>
		alert("not authorized");
		history.go(-1);
	</script>
	<%
		}
	%>
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="container">
		<form class="d-flex justify-content-end" method="get" action="">
			<select id="selectInput" onchange="myFunction()" class="form-select w-25 mb-5">
				<option>Day</option>
				<option>Month</option>
				<option>Year</option>
			</select>
		</form>

		<div id="day">
			<h5>Day</h5>
			<table class="table table-dark border-1 mt-2">
				<thead>
					<tr>
						<th>#</th>
						<th>Movie Name</th>
						<th>Price/Ticket</th>
						<th>Quantity</th>
						<th>Total Sales(RM)</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ticket}" var="details" varStatus="loop">
						<tr>
							<td>${loop.index+1 }</td>
							<td>${details.get("movieName") }</td>
							<td>${details.get("movie_price") }</td>
							<c:set var="seats" value="${fn:split(details.get('seat'),',') }" />
							<c:set var="seatsLength" value="${fn:length(seats[0]) }" />
							<td>${seatsLength }</td>
							<td>${seatsLength*Double.parseDouble(details.get("movie_price")) }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div id="month">
			<c:forEach begin="1" end="12" varStatus="loop">
				<c:set var="monthVal"
					value="<fmt:formatNumber minIntegerDigits='2' value='${loop.index+1}' />" />
				<c:set var="tickets"
					value="${ticket.stream().filter(p -> fn:split(p.get('ticketDate'),'-')[1] == monthVal).toList()}" />
				<h5 class="mt-5 mb-0">${loop.index+1 }Month</h5>
				<table class="table table-dark border-1 mt-2">
					<thead>
						<tr>
							<th>#</th>
							<th>Movie Name</th>
							<th>Price/Ticket</th>
							<th>Quantity</th>
							<th>Total Sales(RM)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="details" items="${tickets }" varStatus="ii">
							<tr>
								<td>${ii+1 }</td>
								<td>${details.get("movieName") }</td>
								<td>${details.get("movie_price") }</td>
								<c:set var="seats" value="${fn:split(details.get('seat'),',') }" />
								<c:set var="seatsLength" value="${fn:length(seats[0]) }" />
								<td>${seatsLength }</td>
								<td>${seatsLength*Double.parseDouble(details.get("movie_price")) }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
		</div>


		<div id="year" style="display: none;">
			<c:forEach begin="2023" end="2023" varStatus="loop">
				<c:set var="tickets"
					value="${ticket.stream().filter(p -> fn:split(p.get('ticketDate'),'-')[1] == loop.index).toList()}" />
				<h5 class="mt-5 mb-0">Year ${loop.index }</h5>
				<table class="table table-dark border-1 mt-2">
					<thead>
						<tr>
							<th>#</th>
							<th>Movie Name</th>
							<th>Price/Ticket</th>
							<th>Quantity</th>
							<th>Total Sales(RM)</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="details" items="${ticket }" varStatus="i">
							<tr>
								<td>${i+1 }</td>
								<td>${details.get("movieName") }</td>
								<td>${details.get("movie_price") }</td>
								<c:set var="seats" value="${fn:split(details.get('seat'),',') }" />
								<c:set var="seatsLength" value="${fn:length(seats[0]) }" />
								<td>${seatsLength }</td>
								<td>${seatsLength*Double.parseDouble(details.get("movie_price")) }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:forEach>
		</div>
	</div>

	<script>
		function myFunction() {
			input = document.getElementById("selectInput").value;
			console.log(input);
			if (input == 'day') {
				document.getElementById('year').style.display = "none";
				document.getElementById('month').style.display = "none";
				document.getElementById('day').style.display = "block";
			}
			if (input == 'month') {
				document.getElementById('year').style.display = "none";
				document.getElementById('month').style.display = "block";
				document.getElementById('day').style.display = "none";
			}
			if (input == 'year') {
				document.getElementById('year').style.display = "block";
				document.getElementById('month').style.display = "none";
				document.getElementById('day').style.display = "none";
			}
		}
	</script>
</body>
</html>