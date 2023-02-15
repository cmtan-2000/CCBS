<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="<c:url value="resources/css/style.css"></c:url>">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='resources/images/CCBS.ico' /> ">


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
}

body {
	margin: 0 auto;
	overflow: hidden;
}

.company__header {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.container {
	position: absolute;
	width: 80%;
	height: 100%;
	background-color: none;
}

.cinemaContainer {
	overflow-y: scroll;
	height: 90%;
}
/* 
.cinemaContainer::-webkit-scrollbar{
    width:2px;
    background-color: grey
}
.cinemaContainer::-webkit-scrollbar-thumb{
    background: black
}
 */
/* button {
	background-color: white;
	border: 0.2px;
	color: black;
	padding: 15px 32px;
	text-align: center;
	display: inline-block;
	font-size: 16px;
	border-radius: 5px;
	box-shadow: 0 5px 2px 0 rgba(0, 0, 0, 0.2), 0 6px 2px 0
		rgba(0, 0, 0, 0.19);
	font-weight: bolder;
} */
.TabSelect {
	margin-left: 50px;
}

.TabSelect .tab {
	background-color: grey;
	box-shadow: none;
	font-size: 20px;
	margin-right: 10px
}

.TabSelect .active {
	background-color: #BBCFD0;
}

.bottomContainer .cinema {
	margin: 0 auto 20px auto;
}

.bottomContainer .cinema h2 {
	font-size: 40px;
}

.bottomContainer .cinema hr {
	height: 2px;
	border-width: 0;
	color: gray;
	background-color: gray
}

.bottomContainer .cinema .cinemaRow {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	width: max-content
}

.bottomContainer .branch {
	width: 330px;
	background-color: green;
	margin: 0 25px 0 0;
	minheight: 200px;
	maxheight: 300px;
}

.bottomContainer .MovieContainer {
	width: 95%;
	height: 90%;
	margin: 20px auto 20px auto;
	display: flex;
	flex-wrap: wrap
}

.model {
	display: flex;
	flex-direction: column;
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	z-index: 10;
}

.cover {
	position: fixed;
	width: 100%;
	height: 100%;
	background-color: black;
	opacity: 0.80;
	left: 0;
	top: 0;
	z-index: 1;
}

.hidden {
	display: none
}

.branch-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	padding: 20px;
}
</style>
<script>
	function onAddCompany() {
		console.log('Add company')
		var addComID = document.getElementById("addCom");
		var coverID = document.getElementById("cover");
		addComID.classList.remove("hidden");
		coverID.classList.remove("hidden");
	}

	function addBranch() {
		var addBranchID = document.getElementById("addBranch");
		var coverID = document.getElementById("cover");
		addBranchID.classList.remove("hidden");
		coverID.classList.remove("hidden");
	}

	function cancelModel(modelTarget) {
		var targetID = document.getElementById(modelTarget);
		var coverID = document.getElementById("cover");
		targetID.classList.add("hidden");
		coverID.classList.add("hidden");
	}

	function onHallDetail() {
		var hallDetailID = document.getElementById("hallDetail");
		var coverID = document.getElementById("cover");
		hallDetailID.classList.remove("hidden");
		coverID.classList.remove("hidden");

	}
</script>

</head>

<body style="overflow: auto;">
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="" style="display:flex; justify-content: flex-end; align-items: center">
			<button class="btn btn-primary" style="margin-right: 20px"
			 data-bs-toggle="modal" data-bs-target="#requestModal">
			<i class="fas fa-plus"></i> Request List</button>
	
		<a class="btn btn-primary" href="/CCBS/admin/salesReport">Generate
			Sales Report</a>
	</div>

	<!-- All related Model  -->
	<div id="request" class="model hidden" style="width: 40%">
		<div>
			GSC
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 10px">
				Hall 13
				<div class="wrap">
					<button>View</button>
					<button>Approve</button>
					<button>Reject</button>
				</div>
			</div>
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 10px">
				Hall 14
				<div class="wrap">
					<button>View</button>
					<button>Approve</button>
					<button>Reject</button>
				</div>
			</div>
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 10px">
				Hall 15
				<div class="wrap">
					<button>View</button>
					<button>Approve</button>
					<button>Reject</button>
				</div>
			</div>
		</div>

		<div>
			TGV
			<div
				style="display: flex; flex-direction: row; justify-content: space-between; margin-bottom: 10px">
				Hall 13
				<div class="wrap">
					<button>View</button>
					<button>Approve</button>
					<button>Reject</button>
				</div>
			</div>
		</div>

		<div class="mt-3" style="align-self: flex-end; margin: 0">
			<button id="request" onclick="cancelModel(this.id)"
				class="btn btn-light">Cancel</button>
		</div>
	</div>


	<div id="hallDetail" class="model hidden" style="width: 20%">
		<p>GSC Setia City Mall</p>
		<div>
			<div class="row" style="margin: 0; justify-content: space-between">
				<b>Air Conditioner</b> <select id="rate">
					<option value="bad">BAD</option>
					<option value="moderate">MODERATE</option>
					<option value="good" selected>GOOD</option>
				</select>
			</div>
			<div class="row" style="margin: 0; justify-content: space-between">
				<b>Sound System</b> <select id="rate">
					<option value="bad">BAD</option>
					<option value="moderate">MODERATE</option>
					<option value="good" selected>GOOD</option>
				</select>
			</div>
			<div class="row" style="margin: 0; justify-content: space-between">
				<b>Seat Cushion</b> <select id="rate">
					<option value="bad">BAD</option>
					<option value="moderate">MODERATE</option>
					<option value="good" selected>GOOD</option>
				</select>
			</div>
			<div class="row" style="margin: 0; justify-content: space-between">
				<b>CleanNess</b> <select id="rate" value="good">
					<option value="bad">BAD</option>
					<option value="moderate">MODERATE</option>
					<option value="good" selected>GOOD</option>
				</select>
			</div>
		</div>
		<div class="row"
			style="margin: 0; flex-direction: row; align-self: flex-end">
			<button id="hallDetail" onclick="cancelModel(this.id)"
				class="btn btn-light">Cancel</button>
			<button onclick="cancelModel(this.id)" class="btn btn-success">Update</button>
		</div>

		<b>Last updated: 11 November 2022</b>
	</div>

	<div id="cover" class="cover hidden"></div>

	<!-- All related Model -->
	<div class="w-100">
		<div class="container mt-5">
			<div class="card shadow mt-3">
				<div class="card-body">
					<p class="font-weight-bold card-title" style="font-size: 21;">
						TGV</p>
					<hr>
					<div class="branch-grid">
						<c:forEach items="${branchHall}" var="hall" varStatus="loop">
							<div class="branch">
								<p class="font-weight-bold" style="font-size: 15;">
									${hall.get("brch_name") }</p>
								<div>
									<button onclick="onHallDetail()"
										class="btn btn-outline-primary border-3 font-weight-bold">
										H${loop.index }</button>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="requestModal" tabindex="-1"
		aria-labelledby="requestModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="requestModalLabel">Add Branch</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>	
				</div>
				<div class="modal-body">
					<form action="./branch/add" method="post">
						<div class="form-group">
								<c:forEach items="${ hallPendList }" var="hall" varStatus="loop">
									<div class=" <c:out value="${ hall.getHall_id() }"/>" style="display: flex;
									justify-content: space-between; margin-bottom: 10px" >
										 Hall <c:out value="${ hall.getHall_id() }"></c:out>
										<div class="wrap" style="    justify-content: space-around;display: flex;width: 50%">
											<form action="">
												<input type="hidden" name="hall_id" value="${hall.getHall_id()}">
												<button type="submit">View</button>
											</form>
											
											<form action="./hall/approve">
												<input type="hidden" name="hall_id" value="${hall.getHall_id()}">
												<button type="submit">Approve</button>
											</form>
											<form action="./hall/reject">
												<input type="hidden" name="hall_id" value="${hall.getHall_id()}">
												<button type="submit">Reject</button>
											</form>
										</div>
									</div>
								</c:forEach>				
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

</body>
</html>