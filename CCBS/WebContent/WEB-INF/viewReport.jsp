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
    
    .getD {
    	margin: 0px auto;
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
	<form action="{filter}" th:object="${report}" class="getD">
		<label class="label-filter">Filter:</label>
			<select name="filter" id="filter" class="filter" th:field="{filter}">
				<option value="getDayDetails">Day</option>
				<option value="getWeekDetails">Week</option>
				<option value="getMonthDetails">Month</option>
			</select>
		<label class="label-branchid">Branch Name:</label>
			<input type="text" id="brch_name" name="brch_name" placeholder="Insert Branch Name" th:field="{brch_name}">
		<label class="label-branchid">Company Name:</label>
			<input type="text" id="cpy_name" name="cpy_name" placeholder="Insert Company Name" th:field="{cpy_name}">
			<input type="submit" value="SEARCH" name="search">
	</form>
		
	<button value="PRINT" class="bttn-print">PRINT</button>
	<h2>Sales Report</h2>
		<table class="basic-info">
			<tr>
				<td>Branch</td>
				<td>:</td>
				<td th:text="${report.brch_name}"></td>
			</tr>
			<tr>
				<td>Company Name</td>
				<td>:</td>
				<td th:text="${report.cpy_name}"></td>
			</tr>
		</table>
		<table class="sales-report">
				<tr>
					<th id="t1">Report Component</th>
					<th id="t2">Total (RM)</th>
				</tr>
				<tr>
					<td id="t1">Movie Ticket</td>
					<td id="t2">${detail[0]}</td>
				</tr>
				<tr>
					<td id="t1">Snack And Beverage</td>
					<td id="t2">${detail[0]}</td>
				</tr>
		</table>

</body>
</html>