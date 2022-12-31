
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<script src="https://kit.fontawesome.com/6f995c3af2.js" crossorigin="anonymous"></script>
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

<body style="background: black">
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
	<a>
	
	</a>
		<div class="float-right watch-movie-button mt-5">
			<a href="./movieHomePage.jsp">
			<span><i class="fas fa-ticket-alt" aria-hidden="true"></i>   Watch
				Now</span>
			</a>
			
		</div>
		<div class="row">
			<div class="col-md-4 pr-3">
				<img height="100%" width="100%" style="object-fit: contain"
					src="https://m.media-amazon.com/images/M/MV5BNTM4NjIxNmEtYWE5NS00NDczLTkyNWQtYThhNmQyZGQzMjM0XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg">

			</div>
			<div class="col-md-8">
				<div class="p-1">
					<div class="row">
						<h2 class="font-weight-bold pt-5">Black Panther: Wakanda
							Forever</h2>
						<p>
							<small>2022 [] PG-13 [] 161 mins</small><br />
						</p>
						<p class="pl-3">
							<%
								String[] labels = new String[] { "Action", "Adventure", "Drama" };
								for (String label : labels) {
							%>
							<span class="movie-badge"><small><%=label%></small></span>
							<%
								}
							%>
						</p>
						<p style="width: 100%; overflow-wrap: elipsis">Lorem ipsum
							dolor sit amet, consectetur adipiscing elit. Integer nec odio.
							Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla
							quis sem at nibh elementum imperdiet. Duis sagittis ipsum.
							Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris
							massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti
							sociosqu ad litora torquent per conubia nostra, per inceptos
							himenaeos. Curabitur sodales ligula in libero. Sed dignissim
							lacinia nunc. Director Ryan Coogler Writers Ryan Coogler
							(screenplay by) - Joe Robert Cole (screenplay by) Stars Letitia
							Wright - Lupita Nyong’o - Danai Gurira</p>
						<p>
							Director <span class="blue-word">RyanCoogler</span>
						</p>
						<p>
							Writers <span class="blue-word">RyanCoogler</span> (screenplay
							by) - <span class="blue-word">Joe Robert Cole</span> (screenplay
							by)
						</p>
						<p>
							Starts <span class="blue-word">Letitia Wright Lupita</span> <span
								class="blue-word">Lupita Nyong'o</span> <span class="blue-word">Danai
								Gurira</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>