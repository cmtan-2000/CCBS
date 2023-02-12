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
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	margin-top: 75px;
}
</style>
</head>

<body style="background: black;">
	<jsp:include page="header3.jsp"></jsp:include>
	<div class="gridshow_movie">
		<c:forEach items="${movieList}" var="movie" varStatus="loop">
			<a href="/CCBS/movie/${movie.getMovie_id()}">
				<img src="${movie.getPoster() }" />
			</a>
		</c:forEach>
	</div>
</body>
</html>