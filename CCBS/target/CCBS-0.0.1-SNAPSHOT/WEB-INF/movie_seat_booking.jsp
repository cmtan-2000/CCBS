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

<script src="<c:url value="/resources/js/movie-seat-booking.js" />"></script>

<title>Movie Seat Booking</title>
</head>
<body>
	<jsp:useBean id="seatBean" class="model.Seat" scope="session" />
	<jsp:useBean id="movieBean" class="model.Movie" scope="session" />
	<jsp:useBean id="hallBean" class="model.Hall" scope="session" />

	<span style="margin-top: 13%;">
		<p id="movie" value="${movieBean.movie_price}">${movieBean.name}</p>
	</span>

	<form
		action="movie/{movie_id}/{type}/{schedule_id}/{user_id}/seatBooking"
		method="post">
		Seats: <input type="text" id="seat" name="seat" value="" readonly>
		<input type="hidden" id="seat" name="seatHidden" value="">
		
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

		<script>
			<%String seatSold = (String) getServletContext().getAttribute("seatSold");%>
			let jsSeat = "<%=seatSold%>";
			var seatArray = jsSeat.split(",");
		</script>

			<%
				String[] rows = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" };
				String[] cols = { "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15",
						"16" };
				int rowLength = rows.length;
				int colLength = cols.length;

				pageContext.setAttribute("rows", rows);
				pageContext.setAttribute("cols", cols);
				pageContext.setAttribute("rowLength", rowLength);
				pageContext.setAttribute("colLength", colLength);
			%>

			<c:forEach var="row" items="${rows}" begin="0" end="${rowLength}"
				varStatus="loop1">
				<div class="row">
					<c:forEach var="col" items="${cols}" begin="0" end="${colLength}"
						varStatus="loop2">
						<%-- <c:out value='seat${row}${col}'/> --%>

						<div id="${row}${col}" class="seat" value="${row}${col}">
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
	<div class="modal fade" id="exampleModal" tabindex="-1"
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
	</div>

	<p class="text">
		You have selected <span id="count">0</span> seat for a price of RM <span
			id="total">0</span>
	</p>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		
</body>
</html>