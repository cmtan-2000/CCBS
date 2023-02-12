<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie's History</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/7b75b44b76.js" crossorigin="anonymous"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="resources/style2.css">
</head>

<body>
	<jsp:include page="header2.jsp"></jsp:include>

    <div class="input-group">
        <div class="form-outline" style="display: flex;">
            <input type="search" id="search" class="form-control" placeholder="Search Movie" />
            <button type="submit" class="btn btn-primary"> <i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </div>

    <!-- table of Movie History -->

    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Movie</th>
                <th scope="col">Location</th>
                <th scope="col">Showtime</th>
                <th scope="col">Hall</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <!-- use for loop here -->
                <td>Black Panther: Wakanda Forever</td>
                <td>GSC Setia City Mall</td>
                <td>11:45am</td>
                <td>H12</td>
            </tr>
            <tr>
                <td>Black Panther: Wakanda Forever</td>
                <td>GSC Setia City Mall</td>
                <td>12:45pm</td>
                <td>H1</td>
            </tr>
            <tr>
                <td>Black Panther: Wakanda Forever</td>
                <td>GSC Setia City Mall</td>
                <td>12:45pm</td>
                <td>H2</td>
            </tr>
            <tr>
                <td>Black Panther: Wakanda Forever</td>
                <td>GSC Setia City Mall</td>
                <td>12:45pm</td>
                <td>H4</td>
            </tr>
        </tbody>
    </table>

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <!-- Font awesome -->
    <script src="https://kit.fontawesome.com/6f995c3af2.js" crossorigin="anonymous"></script>
</body>

</html>