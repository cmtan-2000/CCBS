<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Sales Report</title>
</head>
<style>
	.filter {
    	border-radius: 10px;
    }
    
    .basic-info {
    	margin-top: 3%;
    	margin-left: 10%;
    	margin-bottom: 3%;
    	border-left-style: solid;
    }
    
	.sales-report {
		margin: 0px auto;
        border-style: solid;
        padding: 4px;
        border-spacing: 5px;
	}
	
	.bttn-print {
		float: right;
	}
	
	h2 {
		text-align: center;
	}
	
	
</style>
<body>
	<form action="SalesReportController">
		<label class="label-filter">Filter:</label>
			<select name="filter" id="filter" class="filter">
				<option value="Day">Day</option>
				<option value="Month">Month</option>
				<option value="Year">Year</option>
			</select>
		<label class="label-branchid">Filter:</label>
			<input type="text" id="branch_id" name="branch_id" placeholder="Insert Branch ID">
			<input type="submit" value="SEARCH" name="branch_id">
	</form>
		
	<button value="PRINT" class="bttn-print">PRINT</button>
	<h2>Sales Report</h2>
	<table class="basic-info">
		<tr>
			<td>Branch</td>
			<td>:</td>
			<td></td>
		</tr>
		<tr>
			<td>Table Displayed In</td>
			<td>:</td>
			<td></td>
		</tr>
	</table>
	<table class="sales-report">
			<tr>
				<th id="t1">Sales Component</th>
				<th id="t2">Total (RM)</th>
			</tr>
			<tr>
				<td id="t1">Movie Ticket</td>
				<td id="t2"></td>
			</tr>
			<tr>
				<td id="t1">Snack &amp; Beverage</td>
				<td id="t2"></td>
			</tr>
			<tr>
				<td id="t1">Total</td>
				<td id="t2"></td>
			</tr>
	</table>
</body>
</html>