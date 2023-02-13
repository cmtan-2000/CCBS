<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot password</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">

<style>
body {
	background-color: black;
	font-family: 'Poppins', sans-serif;
}

.title {
	color: yellow;
}

.page-wrapper {
	margin: 80px 300px;
	color: white;
}
</style>

</head>
<body class="background">
	<div class="page-wrapper">
		<div class="container">
			<h1 class="title mb-4">Password recovery</h1>

			<form action="passwordRecovery_success" method="post">
				<div class="row mb-4">
					<div class="col">
						Username <input type="text" name="userName" class="form-control"
							placeholder="example123" required />
					</div>
				</div>

				<div class="row mb-4">
					<div class="col">
						New password<input type="password" name="newPassword"
							class="form-control" placeholder="******" required />
					</div>
				</div>

				<div class="row mb-4">
					<div class="col">
						Security question <select name="securityQuestion"
							class="form-select" required>
							<option value="hobby">What is your hobby?</option>
							<option value="favFood">What is your favourite food?</option>
							<option value="primarySchool">What is your primary
								school?</option>
						</select> <input type="text" class="form-control mt-2" name="securityAns"
							placeholder="Answer" required />
					</div>
				</div>
				<input type="submit" class="btn btn-success" value="Submit"/>
			</form>
		</div>
	</div>
</body>
</html>