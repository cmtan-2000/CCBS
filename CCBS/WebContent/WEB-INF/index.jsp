<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
body {
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

/* header */
.site-container {
	display: flex;
	align-items: center;
	color: wheat;
	padding: 10px 0px;
	margin-left: 30px;
}

.site-title {
	margin: 0px;
	font-size: 20px;
	text-transform: uppercase;
	font-weight: bold;
}

.cinema-logo {
	padding: 10px;
}

.site-header {
	background-color: #111113;
	padding: 5px 0;
	margin-bottom: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.main-navigation {
	float: right;
	margin-right: 30px;
}

.main-navigation .menu {
	list-style: none;
	margin: 0;
	padding: 0;
}

.main-navigation .menu-item {
	display: inline-block;
	padding: 0 10px;
}

.main-navigation .menu-item a {
	padding: 10px 0;
	border-bottom: 3px solid transparent;
	font-size: 12px;
	font-size: 0.75em;
	text-transform: uppercase;
	font-weight: 600;
	-webkit-transition: 0.3s ease;
	transition: 0.3s ease;
}

.main-navigation .menu-item.current a, .main-navigation .menu-item:hover a
	{
	border-bottom: 3px solid #ac8074;
	color: #ac8074;
}

a.link, a.link:hover {
	text-decoration: none;
	color: wheat;
}

/* login */
.login_body {
	margin: 0;
	padding: 0;
	background: linear-gradient(to top, #c79081 0%, #dfa579 100%);
	height: 100vh;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center
}

#center {
	margin: auto;
	background-color: white;
	border-radius: 10px;
	width: 30%;
	padding: 20px;
	box-shadow: 15px -7px 20px rgba(79, 69, 59, 0.2);
}

.login_header {
	display: block;
	text-align: center;
	width: 100%;
	font-size: 40px;
	border-bottom: 1px solid silver;
	font-weight: bolder
}

.username_input, .password_input {
	position: relative;
	margin: 20px 20px 20px;
}

.username_input input, .password_input input {
	padding: 0px 5px;
	border: none;
	outline: none;
	height: 40px;
	font-size: 17px;
}

.username_input label, .password_input label {
	position: absolute;
	top: 50%;
	left: 5px;
	transform: translate(0, -50%);
	color: silver;
	pointer-events: none;
	font-size: 17px;
}

.username_input span::before, .password_input span::before {
	content: '';
	position: absolute;
	top: 40px;
	left: 0;
	width: 100%;
	height: 2px;
	background: silver;
}

.username_input input:focus ~ label, .username_input input:valid ~ label,
	.password_input input:focus ~ label, .password_input input:valid ~
	label {
	top: -5px;
	color: rgba(255, 0, 0, 0.6);
	transition: .5s;
}

.username_input input:focus ~ span::before, .username_input input:valid 
	~ span::before, .password_input input:focus ~ span::before,
	.password_input input:valid ~ span::before {
	width: 100%;
	background: rgba(255, 0, 0, 0.6);
	transition: .5s;
}

.forgot_password {
	text-decoration: none;
	color: rgb(136, 135, 135);
	margin: 20px 30px 35px 20px;
	font-size: 15px;
}

.login_submit {
	width: 100%;
}

/*index.jsp*/
.company__header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.company__alltab {
	margin: 0px -12px;
}

.company__alltab ul li {
	list-style: none;
	display: inline;
	padding: 1.05rem 3rem;
	border-radius: 10px 10px 0px 0px !important;
	background-color: #d4d4d4;
	color: black;
	font-weight: bold;
	cursor: pointer;
}

.company__alltab ul li.selected {
	background-color: #bbcfd0;
}

.company__movietab, .visible_contents {
	position: relative;
}

/* add ".right" to generalize position of button */
.right {
	position: absolute;
	right: 4rem;
}

#visible_contents {
	background-color: #bbcfd0;
	border-radius: 0px 10px 10px 10px !important;
	line-height: 1.6rem;
	margin: 0px 40px 40px 40px;
	padding: 50px 3rem;
}

.hidden_contents {
	display: none;
}

.input-group {
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 3rem 0 3rem 0;
}

/* all page add this as most outer container*/
.outer__container {
	padding: 0px 30px 120px 30px important!;
}

.movie__poster {
	width: 165px;
	height: 248px;
}

td {
	border: 0 !important;
}

td[colspan='4'] {
	border-bottom: 3px solid black !important;
}

.snack-title {
	font-size: 23px;
}

/* bootstrap open modal */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

body {
	padding-right: 0 !important;
	overflow: scroll !important;
}

/* Delete confirmation modal */
.modal-confirm {
	color: #636363;
	width: 400px;
}

.modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}

.modal-confirm .modal-header {
	border-bottom: none;
	position: relative;
}

.modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}

.modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}

.modal-confirm .modal-body {
	color: #999;
}

.modal-confirm .modal-footer {
	border: none;
	text-align: center;
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}

.modal-confirm .modal-footer a {
	color: #999;
}

.modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}

.modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}

.modal-confirm .btn, .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}

.modal-confirm .btn-secondary {
	background: #c1c1c1;
}

.modal-confirm .btn-secondary:hover, .modal-confirm .btn-secondary:focus
	{
	background: #a8a8a8;
}

.modal-confirm .btn-danger {
	background: #dc3545;
}

.modal-confirm .btn-danger:hover, .modal-confirm .btn-danger:focus {
	background: #ee3535;
}

.trigger-btn {
	display: inline-block;
	margin: 100px auto;
}

.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1000;
	width: 100vw;
	height: 100vh;
	background-color: #000;
	opacity: 0.5;
	display: none;
}

.dialog {
	position: absolute;
	width: auto;
	height: auto;
	background: #fff;
	top: 50%;
	transform: translate(-50%, -50%);
	left: 50%;
	min-width: 850px;
	display: none;
	z-index: 1050;
	max-height: 500px;
	overflow-y: auto;
}

.modal-content {
	max-height: 500px;
	overflow-y: auto;
	margin-top: -50px;
}

.times-button {
	background: lightgray;
	height: 25px;
	width: 25px;
	text-align: center;
	border-radius: 30px;
	float: float-end;
}

.badge-style {
	border-radius: 30px;
	padding: 2px 10px;
}

.badge-style.badge-lightblue {
	background: lightblue;
}

.badge-style.badge-lime {
	background: lime;
}

.badge-style.badge-white {
	background: #f0f0f0;
}
</style>
<!-- CSS -->

<link rel="stylesheet" type="text/css" href="./css/style2.css" />
<link rel="stylesheet" href="css/modal.css">

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
				<tr>
					<td colspan="4"><b class="snack-title">GSC Setia City Mall</b></td>
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
					<form action="" method="">
						<div class="form-group">
							<label for="branchName" class="col-sm-5 col-form-label w-50">Branch
								Name</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchName" />
							</div>
						</div>
						<div class="form-group">
							<label for="address" class="col-sm-5 col-form-label w-50">Address</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="address"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="branchPostcode" class="col-sm-5 col-form-label w-50">Postcode</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchPostcode" />
							</div>
						</div>
						<div class="form-group">
							<label for="branchCity" class="col-sm-5 col-form-label w-50">City</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchCity" />
							</div>
						</div>
						<div class="form-group">
							<label for="branchState" class="col-sm-5 col-form-label w-50">State</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="branchState" />
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