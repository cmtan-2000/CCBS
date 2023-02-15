<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.List"%>
<%@ page import="bdUtil.HallDAO"%>
<%@ page import="bdUtil.MovieDAO"%>
<%@ page import="model.Hall"%>
<%@ page import="model.Movie"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='resources/images/CCBS.ico' /> ">

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style2.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Font -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet" />

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />


<title>Home Page</title>
<style>
.grid-display {
	display: grid;
	grid-template-columns: repeat(6, 1fr);
	grid-gap: 20px 0px;
}
</style>
</head>
<body>
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="modal-backdrop" id="backdrop"></div>

	<br>
	<br>
	<!-- for users to navigate and click the tabs -->
	<div class="company__alltab" style="margin: 0px 8px">
		<ul>
			<li class="selected" id="movietab" onclick="change_tab(this.id)">
				Movie</li>
			<li class="notselected" id="snacktab" onclick="change_tab(this.id)">
				Snack</li>
			<li class="notselected" id="halltab" onclick="change_tab(this.id)">
				Branch</li>
		</ul>
	</div>

	<div class="company__movietab hidden_contents" id="movietab_desc">

		<div
			style="justify-content: flex-end; display: flex; flex-direction: row;">
			<button type="button"
				class="btn btn-primary font-weight-bold rounded-pill right"
				onclick="toggleDialog('insertMovieDialog')">
				<i class="fas fa-plus"></i> Add Movie
			</button>
		</div>
		<br>
		<!--poster after click, will open up add movie history -->
		<div class="container mt-lg-5">
			<div class="grid-display">
				<c:forEach items="${movieList}" var="movie" varStatus="loop">
					<div>
						<a id="movie${movie.getMovie_id()}" target="_blank"
							href="/CCBS/company/movie/${movie.getMovie_id()}"> <img
							src="<c:url value="${movie.getPoster()}" />"
							class="movie__poster" /></a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<!-- Snack tab -->
	<div class="hidden_contents" id="snacktab_desc">
		<jsp:include page="indexSnackTab.jsp" />
	</div>


	<!-- Branch tab -->
	<div class="hidden_contents" id="halltab_desc">
		<div class="right d-flex justify-content-between">
			<!-- Add branch for cinema company -->
			<button class="btn btn-primary font-weight-bold rounded-pill"
				style="margin-right: 8px;" data-bs-toggle="modal"
				data-bs-target="#branchModal">
				<i class="fas fa-plus"></i> Add Branch
			</button>

			<!--Add hall modal/jsp for cinema company-->
			<button class="btn btn-primary font-weight-bold rounded-pill"
				data-bs-toggle="modal" data-bs-target="#exampleModal">
				<i class="fas fa-plus"></i> Add Hall
			</button>
		</div>

		<!-- the list, need to chg, insert data backend -->
		<div class="container mt-5">
			<table class="table table-border">
				<c:forEach items="${ compBrchList }" var="branch" varStatus="loop">
					<tr>
						<td colspan="4"><b class="snack-title"> <c:out
									value="${ branch.getBrch_name() }">
								</c:out> <c:out value="${branch.getBrch_id()}"></c:out></b></td>

					</tr>

					<c:forEach items="${ hallList }" var="hall" varStatus="loop">
						<c:if test="${branch.getBrch_id() == hall.getBrch_id() }">
							<tr>
								<td>Hall <c:out value="${ hall.getHall_id() }"></c:out></td>
								<td>Status: <c:out value="${ hall.getHall_status() }"></c:out></td>
								<td width="15%">
									<!-- <button class='btn btn-primary font-weight-bold rounded-pill' onclick='toggleDialog("manageSchedulDialog")'>
									<i class="fas fa-edit"></i> Manage</button></td> -->

									<div class="d-flex justify-content-between">
										<!-- Add branch for cinema company -->
										<form action="branch/test" method="post">		
											<input type="hidden" name="hall_id" value="${ hall.getHall_id() }">
											<input type="hidden" name="hall_type" value="${ hall.getHall_type() }">								
											<button class='btn btn-primary font-weight-bold rounded-pill' onclick='toggleDialog("manageSchedulDialog")'>
										</form>
											<i class="fas fa-edit"></i> Manage</button>
									</div>
								<td>

									<form action="hall/deleteHall" method="POST">
										<input type="hidden" name="currentID"
											value="${hall.getHall_id()}" />
										<button type="submit"
											onclick="return confirm('Are you sure you want to delete this record?');"
											class='btn btn-danger font-weight-bold rounded-pill'
											data-bs-toggle="modal" data-bs-target="#deleteCfmModal">
											<i class='fa-solid fa-trash-can'></i> Delete
										</button>
									</form>

								</td>

							</tr>
						</c:if>
					</c:forEach>
					<c:if test="${empty hallList}">
						<p>The result is empty. There might be an issue with the
							calculation.</p>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- Modal for Manage Schedule -->
	<div class="modal fade" id="manageModal" tabindex="-1"
		aria-labelledby="manageModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="manageModalLabel">Manage Schedule
					</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					Hall ID:
					<p id="id"></p>
					Hall Type:
					<p id="name"></p>


					<div class="" style="">
						<%
							MovieDAO movies = new MovieDAO();
							List<Movie> movieList = movies.getAll();
							for (Movie m : movieList) {
								System.out.println(m.getName());
							}

							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
							LocalDateTime date = LocalDateTime.now();
							String[][] scheduleArray = new String[][]{{"Avatar: The Way of Water", "Deluxe"},
									{"Black Adam", "Dual Max"}, {"Adam's Family", "Classic"}, {"SAO", "Deluxe"},
									{"Jujutsu Kaisen: RE", "3D"},};
							String duration = "10am";
							for (int i = 0; i < 6; i++) {
						%>
						<%-- <select id="mySelect">
							<option value=" " selected>Please select an option</option>
							<c:forEach items="${movieList}" var="movie" varStatus="loop">
								<option value="${movie.getMovie_id() }"><c:out
										value="${movie.getName()}"></c:out></option>
							</c:forEach>
						</select>
						<button id="removeButton" value="Insert"></button>
 --%>
						<br>
						<br>
						<div id="selects"></div>

						<div class="card">
							<div class="card-body">
								<p class="card-title"><%=dtf.format(date.plusDays(i))%></p>
								<div class="card-text">
									<form action="branch/manageSchedule" method="post">
								
										<table class="table table-sm table-striped">
										<thead>
											<th>Timeslot</th>
											<th>Name</th>
										</thead>
										<tbody>
											<tr>
												<td><input name="time" type="number" readonly></td>
												<td><select name="movie_id" id="mySelect">
														<option value=" " selected>Please select an
															option</option>
														<c:forEach items="${movieList}" var="movie"
															varStatus="loop">
															<option value="${movie.getMovie_id() }"><c:out
																	value="${movie.getName()}"></c:out></option>
														</c:forEach>
												</select></td>
											</tr>
											<tr>
												<td><input name="time" type="number" readonly></td>
												<td><select name="movie_id" id="mySelect">
														<option value=" " selected>Please select an
															option</option>
														<c:forEach items="${movieList}" var="movie"
															varStatus="loop">
															<option value="${movie.getMovie_id() }"><c:out
																	value="${movie.getName()}"></c:out></option>
														</c:forEach>
												</select></td>
											</tr>
										</tbody>
										</table>
										<input type="hidden" id="mhall_id" name="hall_id"/>
										<button type="submit">Insert Schedule</button>
									</form>
								</div>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Modal for Add Branch -->
	<!-- Modal for Add Branch -->
	<div class="modal fade" id="branchModal" tabindex="-1"
		aria-labelledby="branchModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="branchModalLabel">Add Branch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>sche
				</div>
				<div class="modal-body">
					<form action="./branch/add" method="post">
						<div class="form-group">
							<label for="branchName" class="col-sm-5 col-form-label w-50">Branch
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchName" name="branchName"/>
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="col-sm-5 col-form-label w-50">Address</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="address" name="address"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="branchPostcode" class="col-sm-5 col-form-label w-50">Postcode</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchPostcode" name="branchPostcode" />
							</div>
						</div>
						<div class="form-group">
							<label for="branchCity" class="col-sm-5 col-form-label w-50">City</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchCity" name="branchCity" />
							</div>
						</div>
						<div class="form-group">
							<label for="branchState" class="col-sm-5 col-form-label w-50">State</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchState" name="branchState"/>
							</div>
						</div>
						
						<div class="modal-footer">
					<button type="button"
						class="btn btn-secondary font-weight-bold rounded-pill"
						data-bs-dismiss="modal">Close</button>
					<button type="submit"
						class="btn btn-success font-weight-bold rounded-pill">Submit</button>
				</div>
				
				
					</form>
				</div>
				
			</div>
		</div>
	</div>


	<!-- Modal for Add Hall-->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Hall</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="hall/add" method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="form-group">
							<label for="branch" class="col-sm-5 col-form-label w-50">Branch</label>
							<div class="col-sm-10">
								<select id="branch" class="form-control" required name="brchId">
									<c:forEach items="${ compBrchList }" var="branch"
										varStatus="loop">
										<option value="${branch.getBrch_id()}"><c:out
												value="${ branch.getBrch_name() }"></c:out></option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="branch" class="col-sm-5 col-form-label w-50">Seat
								Type</label>
							<div class="col-sm-10">
								<select id="hallSeat" class="form-control" required
									name="hallSeat">
									<option value="standardSeat" selected>Standard Seat</option>
									<option value="beanieSeat">Beanie Seat</option>
									<option value="coupleSeat">Couple Seat</option>
									<option value="premiumSeat">Premium Seat</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hallType" class="col-sm-5 col-form-label w-50">Hall
								Type</label>
							<div class="col-sm-10">
								<select id="hallType" class="form-control" name="hallType">
									<option value="Classic" selected>Classic</option>
									<option value="DualMax">DualMax</option>
									<option value="Premium">Premium</option>
									<option value="2D">2D</option>
									<option value="3D">3D</option>
									<option value="Deluxe">Deluxe</option>
									
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="airConditioner" class="col-sm-5 col-form-label w-50">Air
								Conditioner</label>
							<div class="col-sm-10">
								<select id="airConditioner" class="form-control" name="hallAir">
									<option selected value="taurus">Taurus Tech</option>
									<option value="eurus">Eurus</option>
									<option value="ocean">Ocean TechMe</option>
									<option value="aquarius">AQUARIUS</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="soundSystem" class="col-sm-5 col-form-label w-50">Sound
								system</label>
							<div class="col-sm-10">
								<select id="soundSystem" class="form-control" name="hallSound">
									<option selected value="DolbyAtmosSound">Dolby Atmos
										Cinema Sound</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hallPicture" class="col-sm-5 col-form-label w-50">Hall
								picture</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="hallPicture"
									name="file" accept="image/png, image/gif, image/jpeg" />
							</div>
						</div>
						<div class="form-group">
							<label for="SeatNo" class="col-sm-5 col-form-label w-50">No.
								Seat</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="SeatNo"
									name="SeatNo" readonly />
							</div>
						</div>

					</div>

					<div class="modal-footer">
						<button type="button"
							class="btn btn-secondary font-weight-bold rounded-pill"
							data-bs-dismiss="modal">Close</button>
						<button type="submit"
							class="btn btn-success font-weight-bold rounded-pill">Submit</button>
					</div>
				</form>

			</div>
		</div>
	</div>


	<div id="visible_contents"></div>

	<div class="dialog" id="addFoodAndBeverageDialog">
		<jsp:include page="addSnackModal.jsp">
			<jsp:param name="formType" value="create" />
		</jsp:include>
	</div>

	<div class="dialog" id="insertMovieDialog">
		<jsp:include page="insertMovieModal.jsp">
			<jsp:param name="formType" value="create" />
		</jsp:include>
	</div>

	<div class="dialog" id="manageSchedulDialog">
		<jsp:include page="manageSchedulDialog.jsp"></jsp:include>
	</div>

	<!-- Modal for delete confirmation -->
	<div id="deleteCfmModal" class="modal fade">
		<jsp:include page="deleteConfirmationModal.jsp"></jsp:include>
	</div>

	<script>
		document.getElementById(id).className = "selected";
	</script>


	<script>
	$(document).ready(function () {
		  $('#manageModal').on('show.bs.modal', function (event) {
		    var button = $(event.relatedTarget);
		    var id = button.data('id');
		    var name = button.data('name');
		    var modal = $(this);
		    modal.find('#id').text(id);
			modal.find('#name').text(name);
			modal.find('#mhall_id').val(id);
	  		});
		});
	
		// movie tab
		document.getElementById("visible_contents").innerHTML = document
				.getElementById("movietab_desc").innerHTML;

		function change_tab(id) {
			document.getElementById("visible_contents").innerHTML = document
					.getElementById(id + "_desc").innerHTML;
			document.getElementById("movietab").className = "notselected";
			document.getElementById("snacktab").className = "notselected";
			document.getElementById("halltab").className = "notselected";

			document.getElementById(id).className = "selected";
		}

		modal.on('show.bs.modal', function() {
			$('body').addClass('modal-padding-overlap');
		});
	</script>

	<script type="text/javascript">
		function toggleDialog(modalId) {
			var dialog = document.getElementById(modalId);
			console.log(dialog);
			console.log(modalId);
			var backdrop = document.getElementById("backdrop");
			if (dialog.style.display == 'none' || dialog.style.display == "") {
				dialog.style.display = "block";
				backdrop.style.display = "block";
			} else {
				dialog.style.display = "none";
				backdrop.style.display = "none";
			}
		}
		function closeDialog(modalId) {
			var dialog = document.getElementById(modalId);
			var backdrop = document.getElementById("backdrop");
			dialog.style.display = "none";
			backdrop.style.display = "none";
		}
	</script>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>