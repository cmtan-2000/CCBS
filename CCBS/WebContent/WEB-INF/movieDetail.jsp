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

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="shortcut icon" type="image/x-icon" href="<c:url value='resources/images/CCBS.ico' /> ">
<title>MovieDetail Page</title>
</head>
<body>
	<div class="d-flex flex-row justify-content-center align-items-center mt-5">
		<div class="d-flex flex-column me-4">
			<img class="mb-3 rounded" src="${movie.getPoster()}" width="250px">
			<div class="d-flex justify-content-evenly">
				<button id="hall__btn" data-bs-toggle="modal" data-bs-target="#movieEditModal" type="button" class="btn btn-dark col-md-5 rounded-pill align-self-center">Edit</button>
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
				      <td>11:45am</td>
				      <td>H12</td>
				      <td>25</td>
				      <td>Deluxe</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>12:45am</td>
				      <td>H1</td>
				      <td>25</td>
				      <td>3D</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>1:45pm</td>
				      <td>H2</td>
				      <td>25</td>
				      <td>Deluxe</td>
					</tr>
					<tr>
				      <th scope="row">4</th>
				      <td>2:45pm</td>
				      <td>H2</td>
				      <td>25</td>
				      <td>Premium</td>
					</tr>
					<tr>
				      <th scope="row">5</th>
				      <td>3:45pm</td>
				      <td>H2</td>
				      <td>25</td>
				      <td>DualMax</td>
					</tr>
					<tr>
				      <th scope="row">6</th>
				      <td>4:45pm</td>
				      <td>H2</td>
				      <td>25</td>
				      <td>2D</td>
					</tr>
				</tbody>
			</table>
		
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="movieEditModal" tabindex="-1"
		aria-labelledby="movieEditModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="movieEditModalLabel">Edit Movie</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<jsp:include page="insertMovieModal.jsp">
					    <jsp:param name="formType" value="edit"/>
					    <jsp:param name="id" value="${movie.getMovie_id() }"/>
				    </jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-success">Update</button>
				</div>
			</div>
		</div>
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
		
</body>
</html>