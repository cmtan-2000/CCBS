<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="java.time.LocalDateTime, java.text.SimpleDateFormat, java.util.Date, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.schedule-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px;
}
</style>

</head>
<body>
	<div class="container p-5" style="background: white;">
		<span class="float-end times-button"
			onclick="closeDialog('manageSchedulDialog')" style="cursor: pointer;"><i
			class="fas fa-times"></i></span>
		<h2>Branch GSC Setia City Hall</h2>
		<p>Hall 13</p>

		<div class="schedule-grid">
			<%
			 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");  
				LocalDateTime date = LocalDateTime.now();
				String[][] scheduleArray = new String[][] { { "Avatar: The Way of Water", "Deluxe" },
						{ "Black Adam", "Dual Max" }, { "Adam's Family", "Classic" }, { "SAO", "Deluxe" },
						{ "Jujutsu Kaisen: RE", "3D" }, };
				String duration = "10am";
				for (int i = 0; i < 6; i++) {
			%>
			<div class="card">
				<div class="card-body">
					<p class="card-title"><%=dtf.format(date.plusDays(i))%></p>
					<div class="card-text">
						<table class="table table-sm table-striped">
							<thead>
								<th>Timeslot</th>
								<th>Name</th>
								<th>Type</th>
							</thead>
							<tbody>
								<%
									for (int j = 0; j < scheduleArray.length; j++) {
								%>
								<tr>
									<td><%=duration%></td>
									<td><%=scheduleArray[j][0]%></td>
									<td><%=scheduleArray[j][1]%></td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
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