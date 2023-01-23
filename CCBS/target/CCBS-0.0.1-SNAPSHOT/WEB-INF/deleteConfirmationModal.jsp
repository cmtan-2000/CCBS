<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

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

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="./css/style2.css" />

<!-- Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

</head>

<body>

	<!-- Delete confirmation modal -->
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header flex-column">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>
				<h4 class="modal-title w-100">Are you sure?</h4>

			</div>
			<div class="modal-body">
				<p>Do you really want to delete this record? This process cannot
					be undone.</p>
			</div>
			<div class="modal-footer justify-content-center">
				<button type="button"
					class="btn btn-secondary font-weight-bold rounded-pill"
					data-bs-dismiss="modal">Cancel</button>
				<button type="button"
					class="btn btn-danger font-weight-bold rounded-pill"
					data-bs-dismiss="modal">Delete</button>
			</div>
		</div>
	</div>
	</div>
</body>
</html>