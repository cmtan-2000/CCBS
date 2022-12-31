<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.header {
  padding: 20px;
  text-align: center;
  background: #1abc9c;
  color: white;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
</style>
<script>
	function onTopUp() {
		console.log('Top Up')
		var TopupID = document.getElementById("topUp");
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

</script>
<body>
<div class="header">
  <div>Miner Cinema</div>
  <div>
  	<button onclick="onTopUp()"style="width: 25%; align-self: flex-end; padding: 25px 90px">Top Up</button>
  	<a href="./login.jsp"><button>Logout</button></a>
  	
  	<div id="topUp" class="model hidden" style="width: 20%;">
			<p>
				Balance: 
			</p>
			<p>
				Amount Top Up: <br>
				<input type="number" name="topup">
			</p>
			<div class="row" style="align-self: flex-end; margin: 0">
				<button id="topUp" onclick="cancelModel(this.id)">Cancel</button>
				<button style="margin-left: 10px">Top Up</button>
			</div>
	</div>
	
	<div id="cover" class="cover hidden"></div>
	
	
  	
  </div>
</div>
</body>
</html>