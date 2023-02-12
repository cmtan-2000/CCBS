<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
label {
	font-weight: bold;
}
</style>

<form action="/CCBS/company/movie/create" method="POST">
	<span class="float-end times-button"
		onclick="closeDialog('insertMovieDialog')" style="cursor: pointer;"><i
		class="fas fa-times"></i></span>
		
	<div class="row">
		<div class="col-6">
			<div class="card mt-3">
				<div class="card-body">
					<label for="name" class="form-label">Name </label> <input
						name="name" placeholder="Enter Movie Name" class="form-control" value="${movie.getName()}" required>
					<label for="description" class="form-label mt-3">Description </label>
					<textarea rows="5" name="description" class="form-control"
						placeholder="Enter tags and seperate using coma (,)" required>${movie.getDescription() }</textarea>
					<!-- <img src="images/SAO-poster.jpeg" style="width: 19vw" /> -->
					<label for="poster" class="form-label mt-3">Poster Image Link </label> <input
						class="form-control" type="url" name="poster" value="${movie.getPoster() }" required>
					<label for="duration" class="form-label mt-3">Duration </label> <input
						class="form-control" type="text" name="duration" value="${movie.getDuration() }" required>
					<label for="year" class="form-label mt-3">Year of Production </label> <input
						class="form-control" type="number" name="year" value="${movie.getYear() }" minlength="4" required>
				</div>
			</div>
		</div>
		
		<div class="col-6">
		<div class="card mt-3">
			<div class="card-body">
				<label for="tags" class="form-label">Movie Tags</label> (multiple)
				<select class="form-select" name="tags" multiple required>
					<option disabled selected>Select Tags</option>
					<c:forEach items="${allTags}" var="tags"
						varStatus="loop"><option>${tags}</option>
					</c:forEach>
				</select>
				<label for="genre" class="form-label mt-3">Movie Genre</label> 
				<select class="form-select" name="genre" required>
					<option disabled selected>Select Genre</option>
					<c:forEach items="${allGenres}" var="genre"
						varStatus="loop"><option value="${genre }">${genre}</option>
					</c:forEach>
				</select>
			</div>
		</div>
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
								<td><b>Premium</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="premiumPrice" value="${moviePrices.premium }" min="0" step="0.1" required/></td>
							</tr>
							<tr>
								<td><b>Classic</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="classicPrice" value="${moviePrices.classic }" min="0" step="0.1" required /></td>
							</tr>
							<tr>
								<td><b>Deluxe</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="deluxePrice" value="${moviePrices.deluxe }" min="0" step="0.1" /></td>
							</tr>
							<tr>
								<td><b>Dual Max</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="dualmaxPrice"  value="${moviePrices.dualMax }" min="0" step="0.1" /></td>
							</tr>
							<tr>
								<td><b>3D</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="3dPrice" value="${moviePrices.threeD }" min="0" step="0.1" /></td>
							</tr>
							<tr>
								<td><b>2D</b></td>
								<td><input class="form-control form-control-sm"
									type="number" name="2dPrice" value="${moviePrices.twoD }" min="0" step="0.1" /></td>
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
						placeholder="Enter Director" value="${movie.getDirector()}" required /></td>
				</tr>
				<tr>
					<td><b>Screenplay by</b></td>
					<!-- <td><span class="badge-style badge-white">James Cameron</span>	<span class="badge-style badge-white">Rick Jaffa</span>	<span class="badge-style badge-white">Amanda Silver</span> <br></td> -->
					<td><textarea type="text" class="form-control"
							name="screenplay"
							placeholder="Enter Screenplay and seperate using coma (,)" required>${movie.getStoryBy()}</textarea></td>
				</tr>
				<tr>
					<td><b>Story by</b></td>
					<td><textarea type="text" class="form-control"
							placeholder="Enter Casts and seperate using coma (,)" name="cast" required>${movie.getCast()}</textarea></td>
				</tr>
			</table>

			<input type="hidden" name="formType" value="${param.formType}">
			<c:choose>
				<c:when test="${not empty param.id }">
					<input type="hidden" name="id" value="${param.id}">
				</c:when>
			</c:choose>
			<input class="btn btn-success float-right" type="submit"
				value="Insert" onClick="submitForm(this)">
			</input>
		</div>
	</div>
</form>