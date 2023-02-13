<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org">
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
	<form action="CCBS/admin/salesReport">
		<label class="label-filter">Filter:</label>
			<select name="filter" id="filter" class="filter">
				<option value="getDayDetails">Day</option>
				<option value="getWeekDetails">Week</option>
				<option value="getMonthDetails">Month</option>
			</select>
		<label class="label-branchid">Branch Name:</label>
			<input type="text" id="brch_name" name="brch_name" placeholder="Insert Branch Name">
		<label class="label-branchid">Company Name:</label>
			<input type="text" id="cpy_name" name="cpy_name" placeholder="Insert Company Name">
			<input type="submit" value="SEARCH" name="search">
	</form>
		
	<button value="PRINT" class="bttn-print">PRINT</button>
	<h2>Sales Report</h2>

</body>
</html>