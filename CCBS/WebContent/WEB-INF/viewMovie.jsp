<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Wakanda Forever</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
}

body {
	margin: auto;
}

p, span, small, h1, h2, h3, h4, h5 {
	color: white;
}

.blue-word {
	color: blue;
	font-weight: 600;
	padding-left: 8px;
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
	height: 50px;
	display: table;
	margin-left: 20px;
}

.watch-movie-button span {
	font-size: 27px;
	color: black;
	display: table-cell;
	vertical-align: middle;
	padding: 18px 55px;
	font-weight: bold;
}
</style>
</head>

<body style="background: ">
	<jsp:include page="header3.jsp"></jsp:include>

	<div class="container">
		<a> </a>
		<div class="float-right watch-movie-button mt-5">
			<a href="/CCBS/movie/${movie.getMovie_id()}/view"> <span><i
					class="fas fa-ticket-alt" aria-hidden="true"></i> Watch Now</span>
			</a>

		</div>
		<div class="row">
			<div class="col-md-4 pr-3">
				<img height="100%" width="100%" style="object-fit: contain"
					src="${movie.getPoster()}">

			</div>
			<div class="col-md-8">
				<div class="p-1">
					<div class="row">
						<h2 class="font-weight-bold pt-5">${movie.getName()}</h2>
						<p>
							<small>${movie.getYear()} ${movie.getGenre()}
								${movie.getDuration()}</small><br />
						</p>
						<p class="pl-3">
							<c:forEach items="${movie.getTags()}" var="tag" varStatus="loop">
								<span class="movie-badge"><small>${tag}</small></span>
							</c:forEach>
						</p>
						<p style="width: 100%; overflow-wrap: elipsis">${movie.getDescription()}</p>
						<p>
							Director <span class="blue-word">${movie.getDirector()}</span>
						</p>
						<p>
							Writers
							<c:forEach items="${movie.getStory_by()}" var="storyBy"
								varStatus="loop">
								<span class="blue-word">${storyBy}</span> (screenplay by)
							</c:forEach>
						</p>
						<p>
							Casts
							<c:forEach items="${movie.getCasts()}" var="cast"
								varStatus="loop">
								<span class="blue-word">${cast}</span> (screenplay by)
							</c:forEach>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>