<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin_Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300&display=swap"
	rel="stylesheet">
</head>

<style>

.company__header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}


body {
	margin: 0 auto;
}

h1 {
	color: navy;
	margin-left: 20px;
}

.container {
	position: absolute;
	width: 80%;
	height: 100%;
	background-color: none;
}

/* 
button {
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

.TabSelect{
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

.bottomContainer .TabSelect .tab {
	background-color: grey;
	box-shadow: none;
	font-size: 20px;
}

.bottomContainer .TabSelect .active {
	background-color: #BBCFD0;
}

.bottomContainer .cinema {
	width: 95%;
	margin: 0 auto 20px auto;
}

.bottomContainer .cinema h2 {
	margin: 0px 0px 10px 16px;
	font-size: 40px;
}

.bottomContainer .cinema hr {
	height: 2px;
	border-width: 0;
	color: gray;
	background-color: gray
}

.bottomContainer .cinema .row {
	display: flex;
	flex-direction: row;
	background-color: grey;
	width: 100%
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

.model{
display: flex;
flex-direction: column;
position: absolute;
left: 50%;
top: 50%;
transform: translate(-50%, -50%);
background-color: white;
padding: 20px;
z-index: 1
}
.cover{
position: absolute; width: 100%; height: 100%; background-color: black; opacity: 0.80; left: 0; top: 0
}
.hidden{
display: none
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

function cancelModel(modelTarget) {
	var targetID = document.getElementById(modelTarget);
	var coverID = document.getElementById("cover");
	targetID.classList.add("hidden");
	coverID.classList.add("hidden");
}

function onAddMovie(){
	var coverID = document.getElementById("cover");
	coverID.classList.remove("hidden");
	var addMovieID = document.getElementById("addMovie");
	addMovieID.classList.remove("hidden");
}


</script>
<body>
	<jsp:include page="header1.jsp"></jsp:include>
	<div class="company__header">
        <img src="images/GSC-Cinema-Logo.png" style="width: 210px;"'>
        <button>Generate Sales Report</button>
        
    </div>
	<div class="" style="padding: 20px">
	<div style="display: flex; flex-direction: column">
		<button onclick="onAddCompany()"
			style="width: 25%; align-self: flex-end; padding: 25px 90px">Add
			Company</button>

<!-- All related Model -->
		<div id="addCom" class="model hidden" style="width: 20%;" >
			<p>Id: <input type="text" name="comid" value="">	</p>
			<p>Company: <input type="text" name="company"></p>
			<div class="row" style="align-self: flex-end; margin: 0">
			<button id="addCom" onclick="cancelModel(this.id)">Cancel</button>
			<button style="margin-left: 10px
			">Create</button>
			</div>
		</div>
		
		<div id="addMovie" class="model hidden" style="width: 80%">
			<input type="text" name="movieName" value="" placeholder="movieName">
			<div class="row" style="align-self: flex-start; margin: 0">
				<input type="text" name="movieYear" value="" placeholder="movieYear">
				<input type="text" name="movieCategory" value="" placeholder="category">
				<input type="text" name="movieDuration" value="" placeholder="duration">
			</div>
			<div class="row" style="margin: 0; justify-content: space-between">
				<div class="column" style="display: flex; flex-direction: column; width: 75%">
					<textarea id="location" name="movieDescription" rows="3" cols="20" placeholder="Description" style=""></textarea>
					<input type="text" name="movieDirector" value="" placeholder="Director" style="width: 60%">
					<textarea id="screenplayby" name="screenplayby" rows="3" cols="20" style="width: 60%" placeholder="screenplay by: name end with ,"></textarea>
					<textarea id="storyby" name="storyby" rows="3" cols="20" style="width: 60%" placeholder="storyby: name end with ,"></textarea>
					<textarea id="tag" name="tag" rows="3" cols="20" style="width: 60%" placeholder="tag end with ,"></textarea>
				</div>
				<div class="column" style="display: flex; flex-direction: column; justify-content: space-between; align-items: center">
					<input type="file" name="pictureMovie">
					<img src="" width="260px" height="300px">
				</div>
			 </div>
			
			<div class="row" style="display: flex; flex-direction: row; align-self: flex-end; margin: 0">
				<button id="addMovie" onclick="cancelModel(this.id)">Cancel</button>
				<button style="margin-left: 20px">Insert</button>
			</div>
			
		</div>
		
		<div id="cover" class="cover hidden"></div>
<!-- All related Model -->

		<div class="TabSelect"
				style="display: flex;">
				<a href="adminDashboard.jsp"><button class="tab">Company</button></a>
				<a href="adminMovie.jsp"><button class="tab active">Movie</button></a>
			</div>
			
		<div class="bottomContainer"
			style="border-radius: 10px; background-color: #BBCFD0;padding: 20px;">
			
			<div class="row"
				style="display: flex; flex-direction: row; justify-content: flex-end; margin-right: 20px">
				<button onclick="onAddMovie()">Add Movie</button>
			</div>
			<div class="MovieContainer">
			<% 
				String noMovie[] = new String[] {"/images/black-adam-poster.jpg", "/images/Mechamato-poster.jpg", "/images/SAO-poster.jpeg", "/images/Wakanda-poster.jpg" };
			%>
				<% for(int h=0; h<noMovie.length; h++) {%>
					<img :src="${noMovie[h]}" alt="${noMovie[h]}" width="160px" height="240px" style="margin-right:60px; margin-bottom: 30px">
					
			<%} %>
			</div>
			
		</div>

	</div>
</body>
</html>