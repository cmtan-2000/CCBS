<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
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
    display: grid;
    margin-top: 75px;
    max-width: 80vw;
    overflow-x: auto;
    overflow-y: hidden;
    grid-template-columns: repeat(7, 1fr);
    grid-gap: 0 30px;
    grid-auto-flow: column;
    padding: 50px;
}

.gridshow_movie::-webkit-scrollbar {
  display: none;
}
</style>
</head>

<body style="background: black;">
	<jsp:include page="header3.jsp"></jsp:include>
	<div class="d-flex justify-content-center">
		<div class="gridshow_movie">
			<c:forEach items="${movieList}" var="movie" varStatus="loop">
				<a href="/CCBS/movie/${movie.getMovie_id()}">
					<img src="${movie.getPoster() }" />
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>