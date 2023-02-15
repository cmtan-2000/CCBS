<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> <!-- photos -->
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/6f995c3af2.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/resources/images/CCBS.ico' /> ">
<title>Movie Home Page</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
}

img {
	object-fit: cover;
	height: 70vh;
}

p, span, small, h1, h2, h3, h4, h5 {
	color: white;
}

body {
	overflow-x: hidden;
}

.movie-badge {
	background: #fff;
	border-radius: 60px;
	padding: 0 15px 3px;
}

.movie-badge small {
	color: #000;
}

.watch-movie-button {
	background: yellow;
	border-radius: 10px;
	display: table;
	padding: 11px 33px;
}

.watch-movie-type-button {
	background: white;
	border-radius: 10px;
	display: table;
	padding: 11px 25px;
}

.watch-movie-type-button span, .watch-movie-button span {
	font-size: 15px;
	color: black;
	display: table-cell;
	vertical-align: middle;
	font-weight: 900;
}

select, input[type=date] {
	border: 0;
	font-weight: bold;
	background: lightgray;
	border-radius: 3px;
	display: block;
	padding: 2px 5px;
}

select:focus-visible {
	border: 0;
	outline: 0;
}

label {
	font-weight: bold;
}

.card-title * {
	color: black !important;
}

.card-body {
	position: relative;
	overflow: hidden;
}

.card-body::after {
	content: "";
	position: absolute;
	height: 100%;
	width: 15px;
	left: 100%;
	top: 0%;
	background: #3b3b3b;
}

.dividor-style {
	position: relative;
}

.dividor-style::after {
	content: "";
	position: absolute;
	width: auto;
	height: 7px;
	background: red;
	position: absolute;
	width: auto;
	height: 10px;
	background: red;
	border-radius: 10px;
	top: 50%;
	transform: translate(0, -50%);
	left: 120%;
}

.movie-timeslots {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	grid-gap: 10px;
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
		if (userRole != "user") {
	%>
	<script>
		alert("not authorized");
		history.go(-1);
	</script>
	<%
		}
	%>
		<jsp:useBean id="movie" class="model.Movie" scope="session"/>
	<div>
		<div class="row">
			<div class="col-4">
				<div style="margin: auto; background: black;">
					<div class="px-5">
						<h5 class="font-weight-bold pt-5">${movie.getName() }</h5>
						<p>
							<small>${movie.getYear()} <c:forEach
									items="${movie.getGenre()}" var="genre" varStatus="loop">
									<small>${genre}</small>
								</c:forEach> ${movie.getDuration()}
							</small>
						</p>
						<p>
							<c:forEach items="${movie.getTags()}" var="tag" varStatus="loop">
								<span class="movie-badge"><small>${tag}</small></span>
							</c:forEach>
						</p>
						<img height="100%" style="object-fit: cover; width: 100%"
							src="${movie.getPoster()}">

						<button class="btn watch-movie-button mt-3">
							<span><i class="fas fa-ticket-alt" aria-hidden="true"></i>
								Watch Now</span>
						</button>
					</div>
				</div>
			</div>

			<!-- selection -->
			<div class="col-8">
				<form class="d-flex flex-wrap mt-5 px-5" style="gap: 12px;"
					method="get" action="/CCBS/movie/${movie.getMovie_id()}/view">
					<div>
						<label class="form-label">Cinema</label> <select name="cinema" class="form-select">
							<option selected>Choose Cinema</option>
							<option value="GSC">GSC</option>
							<option value="TGV">TGV</option>
							<option value="MBO">MBO</option>
						</select>
					</div>
					<div>
						<label class="form-label">Location</label> <select name="city" class="form-select">
							<option value="Johor Bahru" selected>Johor Bahru</option>
							<option value="Kluang">Kluang</option>
							<option value="Skudai">Skudai</option>
							<option value="Tangkak">Tangkak</option>
							<option value="Batu Pahat">Batu Pahat</option>
							<option value="Kota Tinggi">Kota Tinggi</option>
							<option value="Mersing">Mersing</option>
							<option value="Muar">Muar</option>
							<option value="Pontian">Pontian</option>
							<option value="Segamat">Segamat</option>
						</select>
					</div>
					<div>
						<label class="form-label">State</label> <select name="state" class="form-select">
							<option value="Johor">Johor</option>
							<option value="Melaka">Melaka</option>
							<option value="Pahang">Pahang</option>
							<option value="Sarawak">Sarawak</option>
							<option value="Sabah">Sabah</option>
							<option value="Perak">Perak</option>
							<option value="Negeri Sembilan">Negeri Sembilan</option>
							<option value="Perlis">Perlis</option>
							<option value="Kedah">Kedah</option>
							<option value="Kelantan">Kelantan</option>
							<option value="Kuala Lumpur">Kuala Lumpur</option>
							<option value="Terengganu">Terengganu</option>
							<option value="Labuan">Labuan</option>
						</select>
					</div>
					<div>
						<label class="form-label">Date</label> <input type="date" name="date" class="form-control"
							value="2023-01-22" />
					</div>
					<div class="align-self-end"><input type="submit" value="submit" class="btn btn-primary" /></div>
				</form>

				<!-- movies showtime in each mall -->
				<c:forEach items="${branchMovie}" var="branch" varStatus="loop">
					<div class="row mt-4 mx-5">
						<div class="card" style="background: grey;">
							<div class="card-body">
								<div class="card-title" style="color: black;">
									<div class="d-flex">
										<div class="px-4 py-2"
											style="background: white; border-radius: 2px;">
											<b><c:out value="${branch.getValue()[0].brch_name}" /></b><br>
											<small>${branch.getValue()[0].brch_addr} ${branch.getValue()[0].brch_post} ${branch.getValue()[0].brch_city}</small>
										</div>
									</div>
									<div class="pt-3">
										<span class="dividor-style"><b>Showtimes: </b></span>
									</div>
								</div>
								<div class="card-text">
									<div class="movie-timeslots pt-2 pb-3">
										<c:forEach items="${branch.getValue()}" var="showTime">
											<a href="/CCBS/movie/${showTime.movie_id}/${showTime.hall_type}/${showTime.schedule_id}/1/seatBooking"><button type="button"
													class="btn btn-warning font-weight-bold">
													<c:out value="${showTime.showtime_time} ${showTime.hall_type}" />
												</button></a>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</body>
</html>