<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Seat"%>
<%@ page import="model.Movie"%>
<%@ page import="model.Hall"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<c:url value="/resources/css/movie-seat-booking.css" />"
	rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/resources/images/CCBS.ico' /> ">
<title>Movie Seat Booking</title>
</head>
<body>

	<script type="text/javascript">
		function addSelectedSeat(seatValue, price) {
			var oriVal = document.getElementById("seat").value;

			var count = parseInt(document.getElementById("count").textContent);
			console.log(count);
			if(oriVal.includes(seatValue)) {
				document.getElementById("seat").value =  oriVal.replace(" " + seatValue, "");
				document.getElementById("count").textContent = (--count).toString();
				document.getElementById("total").textContent = (parseInt(count) * price).toFixed(2).toString();
				document.getElementById(seatValue).className = "seat" 
			}
			else {
				document.getElementById("seat").value =  oriVal + " " +seatValue + " ";
				document.getElementById("count").textContent = (++count).toString();
				document.getElementById("total").textContent = (parseInt(count) * price).toFixed(2).toString();
				document.getElementById(seatValue).className = "seat selected";
			}
			console.log(oriVal+seatValue);
		}

	</script>

	<c:set value="${sessionScope.seatSelected }" var="seatSelected" />
	<c:set value="${sessionScope.noseatSelected }" var="noseatSelected" />

	<h3 id="movie" style="font-weight: bold;">${movie.name}</h3>

	<form action="/CCBS/movie/seatBooking/submit" method="get">
		<!-- 	Seats: -->
		<input type="hidden" id="seat" name="seat"
			value="<c:out value="${seatSelected}"/>">

		<div class="showcase__submit">
			<div class="center__showcase">
				<ul class="showcase">
					<li>
						<div class="seat"></div> <small>Available</small>
					</li>
					<li>
						<div class="seat selected"></div> <small>Selected</small>
					</li>
					<li>
						<div class="seat sold"></div> <small>Sold</small>
					</li>
				</ul>
			</div>
			<input class="btn_seating_submit btn btn-success" type="submit"
				value="Confirm">
		</div>

		<!-- cinema screen -->
		<div class="container">
			<div class="screen">
				<p>Screen</p>
			</div>

			<%
				String[] rows = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" };
				String[] cols = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
						"16" };

				pageContext.setAttribute("rows", rows);
			%>

			<c:forEach var="row" items="${scArr}" varStatus="loop1">
				<div class="row">
					<c:forEach var="col" items="${row}" varStatus="loop2">
						<c:set value="${rows[loop1.index]}${loop2.index+1}" var="id" />
						<div id="${id}"
							class="seat <c:if test='${seatSelected.contains(id)}'>selected</c:if>"
							onclick="addSelectedSeat('${id}', ${price})">
							<span class="seatVal">${id}</span>
						</div>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</form>

	<!-- Button trigger modal -->
	<button type="button" class="btn btn-secondary" data-bs-toggle="modal"
		data-bs-target="#exampleModal">Hall Condition</button>

	<!-- Modal -->
	<%-- <div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">
						<b>Hall Type: ${hallBean.hall_type}</b>
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:set var="image2" value="${image2}" />
					<c:set var="imageBase64"
						value="${Base64.getEncoder().encodeToString(IOUtils.toByteArray(image2))}" />
					<img src="data:image/jpg;base64,${imageBase64}"
						class="img-thumbnail" style="max-width: 100%; height: auto;">

					<div style="padding-top: 1.5rem;">
						<p>Air Conditioner: ${hallBean.air_cond}</p>
						<p>Sound system: ${hallBean.sound_sys}</p>
					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> --%>

	<p class="text">
		You have selected <span id="count"> <c:choose>
				<c:when test="${not empty noseatSelected}">
					<c:out value="${noseatSelected-1 }" />
				</c:when>
				<c:otherwise>
		    0
		  </c:otherwise>
			</c:choose>
		</span> seat for a price of RM <span id="total"> <c:choose>
				<c:when test="${not empty noseatSelected}">
					<c:out value="${(noseatSelected-1)*price }" />
				</c:when>
				<c:otherwise>
		    0
		  </c:otherwise>
			</c:choose>
		</span>
	</p>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>