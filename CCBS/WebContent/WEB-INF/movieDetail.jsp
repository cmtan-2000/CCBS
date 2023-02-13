<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/modal.css"/>" />

<script src="https://kit.fontawesome.com/6f995c3af2.js"
	crossorigin="anonymous"></script>
	
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/CCBS.ico' /> ">
<title>MovieDetail Page</title>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap')
	;

* {
	font-family: 'Poppins', sans-serif;
}

</style>
</head>
<body>
	<div class="modal-backdrop" id="backdrop"></div>
	<div class="d-flex flex-row justify-content-center align-items-center mt-5">
		<div class="d-flex flex-column me-4">
			<img class="mb-3 rounded" src="${movie.getPoster()}" width="250px">
			<div class="d-flex justify-content-evenly">
				<button onclick="toggleDialog('insertMovieDialog')" type="button" class="btn btn-dark col-md-5 rounded-pill align-self-center">Edit</button>
				<button type="submit" class="btn btn-dark col-md-5 rounded-pill align-self-center" onclick="deleteAlert(${movie.getMovie_id()})">Delete</button>
			</div>

		</div>
		<div class="d-flex flex-column col-md-6">
			<h2>${movie.getName()}</h2>
			<h6>Duration: ${movie.getDuration()}</h6>
			<form action="" method="">
				<div class="form-group d-flex flex-row justify-content-between">
					<label for="filterBranch" class="col-form-label">filter Branch: </label>
					<div class="col-sm-6 d-flex flex-row">
						<select id="filterBranch" class="form-control">
							<option selected value="branchA">Branch A</option>
							<option value="branchB">Branch B</option>
							<option value="branchC">Branch C</option>
							<option value="branchD">Branch D</option>
						</select>
						<button type="submit" class="btn btn-dark mx-3 rounded-pill">Search</button>
					</div>
				</div>
			</form>
			<table class="table mt-2">
				<thead class="table-dark">
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">ShowTime</th>
				      <th scope="col">Hall</th>
				      <th scope="col">Price(RM)</th>
				      <th scope="col">Type</th>
				    </tr>
				</thead>
				<tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
					</tr>
					<tr>
				      <th scope="row">4</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
					</tr>
					<tr>
				      <th scope="row">5</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
					</tr>
					<tr>
				      <th scope="row">6</th>
				      <td>${movie.getShowtime()}</td>
				      <td>${movie.getHall_id()}</td>
				      <td>${movie.getPrice()}</td>
				      <td>${movie.getHall_type()}</td>
					</tr>
				</tbody>
			</table>
		
		</div>
	</div>
	
	<!-- Modal -->
	<div class="dialog" id="insertMovieDialog">
		<jsp:include page="insertMovieModal.jsp">
		    <jsp:param name="formType" value="edit"/>
		    <jsp:param name="id" value="${movie.getMovie_id() }"/>
	    </jsp:include>
	</div>
	
	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
		
	<script>
		function deleteAlert(id){
			if (confirm('Are you sure you want to delete this thing into the database?')) {
				  window.location.href="/CCBS/company/movie/delete/"+id;
				} 
		}
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
		
</body>
</html>