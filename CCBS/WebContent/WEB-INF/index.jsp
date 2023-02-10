<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style2.css"/>" />
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" />

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


<title>Company Homepage</title>

</head>
<body>
	
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="modal-backdrop" id="backdrop"></div>
	<div class="company__header">
		<img src="<c:url value="/resources/images/GSC-Cinema-Logo.png" />"
			style="width: 210px;">
	</div>

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

			<!-- <a target="_blank" href="./movie-history.jsp">
				<button type="button" class="btn btn-primary font-weight-bold rounded-pill ">
				<i class="fas fa-plus"></i> History</button>
			</a> -->
		</div>
		<br>
		<!--poster after click, will open up add movie history -->
		<div class="container mt-lg-5">
			<div class="row">
				<c:forEach items="${movieList}" var="movie" varStatus="loop">
					<div class="col">
						<a id="movie${loop.index+1}" target="_blank"
							href="/CCBS/company/movie/${loop.index+1}"> <img
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
				<c:forEach items="${branchList}" var="branch" varStatus="loop">		
					<tr>
						<td colspan="4"><b class="snack-title"> <c:out value="${ branch.getBrch_name() }"></c:out> </b></td>
				
					</tr>
				<%
					String[] hall = new String[]{"Hall 13", "Hall 14", "Hall 15", "Hall 16"};
					String[] status = new String[]{"Pending", "Pending", "Approved", "Pending"};
					String dialog = "\"" + "manageSchedulDialog" + "\"";

					for (int i = 0; i < hall.length; i++) {
						out.println("<tr>" + "<td>" + hall[i] + "</td>" + "<td>" + status[i] + "</td>"
								+ "<td width=\"15%\"><button class='btn btn-primary font-weight-bold rounded-pill' onclick='toggleDialog(\"manageSchedulDialog\")'>"
								+ "<i class=\"fas fa-edit\"></i> Manage</button></td>"
								+ "<td><button class='btn btn-danger font-weight-bold rounded-pill' data-bs-toggle=\"modal\" data-bs-target=\"#deleteCfmModal\"><i class='fa-solid fa-trash-can'></i> Delete</button></td>"
								+ "</tr>");
					}
				%>
				</c:forEach>
			</table>
		</div>
	</div>


	<!-- Modal for Add Branch -->
	<div class="modal fade" id="branchModal" tabindex="-1"
		aria-labelledby="branchModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="branchModalLabel">Add Branch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
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
				<div class="modal-body">
					<form action="" method="">
						<div class="form-group">
							<label for="branch" class="col-sm-5 col-form-label w-50">Branch</label>
							<div class="col-sm-10">
								<select id="branch" class="form-control">
									<option selected value="L1">Location 1</option>
									<option value="L2">Location 2</option>
									<option value="L3">Location 3</option>
									<option value="L4">Location 4</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hallType" class="col-sm-5 col-form-label w-50">Hall
								Type</label>
							<div class="col-sm-10">
								<select id="hallType" class="form-control">
									<option selected value="2D">2D Hall</option>
									<option value="DolbyAtmosHall">Dolby Atmos Hall</option>
									<option value="IMAX">IMAX</option>
									<option value="D-BOX">D-BOX</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="airConditioner" class="col-sm-5 col-form-label w-50">Air
								Conditioner</label>
							<div class="col-sm-10">
								<select id="airConditioner" class="form-control">
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
								<select id="soundSystem" class="form-control">
									<option selected value="DolbyAtmosSound">Dolby Atmos
										Cinema Sound</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="hallPicture" class="col-sm-5 col-form-label w-50">Hall
								picture</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="hallPicture" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-secondary font-weight-bold rounded-pill"
						data-bs-dismiss="modal">Close</button>
					<button type="button"
						class="btn btn-success font-weight-bold rounded-pill">Submit</button>
				</div>
			</div>
		</div>
	</div>

	<div id="visible_contents"></div>

	<div class="dialog" id="addFoodAndBeverageDialog">
		<jsp:include page="addSnackModal.jsp"></jsp:include>
	</div>

	<div class="dialog" id="insertMovieDialog">
		<jsp:include page="insertMovieModal.jsp"></jsp:include>
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