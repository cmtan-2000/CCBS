<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
<title>Insert title here</title>

<style>
.schedule-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}
</style>

</head>
<body>
	
	<div class="container p-5" style="background: white;">
		<span class="float-end times-button"
			onclick="closeDialog('manageSchedulDialog')" style="cursor: pointer;"><i
			class="fas fa-times"></i></span>
		<h2>Branch GSC Setia City Hall</h2>
		<p>Hall <c:out value="${hall_Id }"></c:out></p>

		<div class="schedule-grid">
			<%
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
				LocalDateTime date = LocalDateTime.now();
			
				for (int i = 0; i < 1; i++) {
			%>
			<div class="card">
				<div class="card-body">
					<p class="card-title"><%=dtf.format(date.plusDays(i))%></p>
					<div class="card-text">
					<form action="../schedule/add" method="post">
					
						<table class="table table-sm table-striped">
							<thead>
								<th>Date</th>
								<td>MovieShow</th>
							</thead>
								<tbody>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
									<tr>
										<td><input type="date" name="showtime_sdate" value=""/></td>
										<td><select name="movie_id" id="mySelect">
											<c:forEach items="${movieList }" var="movie" varStatus="loop">
												<option value="${movie.getMovie_id() }"><c:out value="${movie.getMovie_id() }"></c:out> + <c:out
													value="${movie.getName()}"></c:out></option><c:out value="${movie.getName()}"/>
											</c:forEach>
										</select></td>
										<input type="hidden" name="showtime_date" value="${ dtf.format(date.plusDays(i)) }">
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="hall_id" value="${ hall_id }">
							<button type="submit" value="insert">Insert</button>
						</form>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>