<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link rel="stylesheet" href="resources/css/style.css">
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
	<div class="company__header">
		<a class="btn btn-primary right mt-5" href="/CCBS/admin/salesReport">Generate
			Sales Report</a>

	</div>

	<!-- All related Model  -->

	<div id="addBranch" class="model hidden" style="width: 30%">
		<p>
			Company: <input type="text" name="company" value="" />
		</p>
		<input type="file" name="filepicture" />
		<p>
			Location: <br>
			<textarea id="location" name="location" rows="3" cols="40"></textarea>
		</p>
		<div class="row" style="align-self: flex-end; margin: 0">
			<button id="addBranch" onclick="cancelModel(this.id)" class="btn btn-light">Cancel</button>
			<button style="margin-left: 10px" class="btn btn-success">Create</button>
		</div>
	</div>

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

		<div class="row" style="align-self: flex-end; margin: 0">
			<button id="request" onclick="cancelModel(this.id)">Cancel</button>
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
				style="margin-right: 20px">Cancel</button>
			<button onclick="cancelModel(this.id)" style="">Update</button>
		</div>

		<b>Last updated: 11 November 2022</b>
	</div>

	<div id="cover" class="cover hidden"></div>

	<!-- All related Model -->
	<div class="w-100">
		<div class="container">
			<%!int noCinema = 2;%>
			<%
				for (int h = 0; h < noCinema; h++) {
			%>
			<div class="card shadow mt-3">
				<div class="card-body">
					<p class="font-weight-bold card-title" style="font-size: 21;">
						Name_Cinema
						<%=h + 1%></p>
					<hr>
					<div class="branch-grid">
						<%!int noBranch = 3;%>
						<%
							for (int i = 0; i < noBranch; i++) {
						%>
						<div class="branch">
							<p class="font-weight-bold" style="font-size: 15;">
								Branch
								<%=i + 1%>
							</p>
							<div>
								<%!int noHall = 12;%>
								<%
									for (int j = 0; j < noHall; j++) {
								%>
								<button onclick="onHallDetail()"
									class="btn btn-outline-primary border-3 font-weight-bold">
									H<%=j + 1%></button>
								<%
									}
								%>
							</div>
						</div>
						<%
							}
						%>
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