<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Movie Grid List</title>
<style type="text/css">
img:hover {
	transform: scale(1.2);
}

img {
	width: 200px;
	height: 300px;
}

.gridshow_movie {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	margin-top: 75px;
}
</style>
</head>

<body style="background:">
	<jsp:include page="header3.jsp"></jsp:include>
	<div class="gridshow_movie">
		<!-- <a href=""><img src="/images/Mechamato-poster.jpg" /></a> <a href=""><img
			src="images/SAO-poster.jpeg" /></a> <a href="viewMovie.jsp"><img
			src="images/Wakanda-poster.jpg" /></a> <a href=""><img
			src="images/black-adam-poster.jpg" /></a> -->
		<c:forEach items="${movieList}" var="movie" varStatus="loop">
			<a href="/CCBS/movie/${movie.getMovie_id()}"><img src="${movie.getPoster() }" /></a>
		</c:forEach>
	</div>


</body>

</html>