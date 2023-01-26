<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form class="container p-5" style="background: white;" action=""
		method="POST">
		<span class="float-end times-button"
			onclick="closeDialog('insertMovieDialog')" style="cursor:pointer;"><i
			class="fas fa-times"></i></span>
		<h2>
			<b>Insert Movie</b>
		</h2>
		<%--<%
			String[] badges = new String[] { "2000", "PG-13", "311mins" };
			for (int i = 0; i < badges.length; i++) {
				out.println("<small><span class='badge-style badge-lime'>" + badges[i] + "</span></small>");
			}

			String[] tags = new String[] { "Action", "Drama", "Fantastic" };
			for (int i = 0; i < tags.length; i++) {
				out.println("<small><span class='badge-style badge-lightblue'>" + badges[i] + "</span></small>");
			}
		%> --%>


		<div class="row">
			<div class="col-6">
				<div class="card mt-3">
					<div class="card-body">
						<label for="formFile" class="form-label">Name </label> <input
							name="name" placeholder="Enter Movie Name" class="form-control">
						<label for="formFile" class="form-label mt-3">Description
						</label>
						<textarea rows="5" name="tags" class="form-control"
							placeholder="Enter tags and seperate using coma (,)"></textarea>
						<!-- <img src="images/SAO-poster.jpeg" style="width: 19vw" /> -->
						<label for="formFile" class="form-label mt-3">Poster </label> <input
							class="form-control" type="file" name="formFile">
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="card mt-3">
					<div class="card-body">
						<div class="card-title">Price</div>
						<table class="table table-striped table-sm">
							<thead>
								<th>Type</th>
								<th>Price</th>
							</thead>
							<tbody>
								<tr>
									<td><b>Deluxe</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="deluxePrice" /></td>
								</tr>
								<tr>
									<td><b>Dual Max</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="dualmaxPrice" /></td>
								</tr>
								<tr>
									<td><b>3D</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="3dPrice" /></td>
								</tr>
								<tr>
									<td><b>DA DB</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="dadbPrice" /></td>
								</tr>
								<tr>
									<td><b>Premium</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="premiumPrice" /></td>
								</tr>
								<tr>
									<td><b>Classic</b></td>
									<td><input class="form-control form-control-sm"
										type="number" name="classicPrice" /></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="card mt-3">
			<div class="card-body">
				<div class="card-title">Casts</div>
				<table class="table table-striped">
					<tr>
						<td><b>Director</b></td>
						<!-- <td><span class="badge-style badge-white">James Cameron</span></td> -->
						<td><input class="form-control" type="text" name="director"
							placeholder="Enter Director" /></td>
					</tr>
					<tr>
						<td><b>Screenplay by</b></td>
						<!-- <td><span class="badge-style badge-white">James Cameron</span>	<span class="badge-style badge-white">Rick Jaffa</span>	<span class="badge-style badge-white">Amanda Silver</span> <br></td> -->
						<td><textarea type="text" class="form-control"
								name="screenplay" placeholder="Enter Screenplay and seperate using coma (,)"></textarea></td>
					</tr>
					<tr>
						<td><b>Story by</b></td>
						<%-- <td>
							<% 
								String[] actors = new String[]{"James Cameron", "Rick Jaffa", "Amanda Silver", "Josh Friedman", "Shane Salerno"};
								for(int i=0;i<tags.length;i++){
									out.println("<span class='badge-style badge-white'>"+actors[i]+"</span>");
								}
							%>	
							</td> --%>
						<td><textarea type="text" class="form-control"
								placeholder="Enter Casts and seperate using coma (,)" name="cast"></textarea></td>
					</tr>
				</table>

				<button class="btn btn-success float-right" type="submit">Insert</button>
			</div>
		</div>
	</form>

</body>
</html>