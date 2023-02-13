<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="salesTable.jsp">
		<label class="label-filter">Filter:</label>
			<select name="filter" id="filter" class="filter">
				<option value="Day">Day</option>
				<option value="Month">Month</option>
				<option value="Year">Year</option>
			</select>
		<label class="label-branchid">Filter:</label>
			<input type="text" id="branch_id" name="branch_id" placeholder="Insert Branch ID">
			<input type="submit" value="SUBMIT" name="branch_id">
	</form>
		
	<button value="PRINT" class="bttn-print">PRINT</button>
	<h2>Sales Report</h2>
		<table class="basic-info">
			<tr>
				<td>Branch</td>
				<td>:</td>
				<td>Mid Valley Megamall</td>
			</tr>
		</table>
		<table class="sales-report">
				<tr>
					<th id="t1">Report Component</th>
					<th id="t2">Total (RM)</th>
				</tr>
				<tr>
					<td id="t1">Day</td>
					<td id="t2">4360</td>
				</tr>
				<tr>
					<td id="t1">Month</td>
					<td id="t2">44140</td>
				</tr>
				<tr>
					<td id="t1">Year</td>
					<td id="t2">74360</td>
				</tr>
		</table>

</body>
</html>