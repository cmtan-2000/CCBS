<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Seat"%>
<%@ page import="model.Movie"%>
<%@ page import="model.Hall"  %>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="java.util.Base64"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<c:url value="/resources/css/movie-seat-booking.css" />" rel="stylesheet">

<script src="<c:url value="/resources/js/movie-seat-booking.js" />"></script>

<title>Movie Seat Booking</title>
</head>
<body>
	<jsp:useBean id="seatBean" class="model.Seat" scope="session"/>
	<jsp:useBean id="movieBean" class="model.Movie" scope="session"/>
	<jsp:useBean id="hallBean" class="model.Hall" scope="session"/>
	
	<span style="margin-top: 8%;">
   		<p id="movie" value="${movieBean.movie_price}">${movieBean.name}</p>
	</span>
	
  <form action="movie/{movie_id}/{type}/{schedule_id}/{user_id}/seatBooking" method="post">
    <div class="showcase__submit">
      <div class="center__showcase">
        <ul class="showcase">
          <li>
            <div class="seat"></div>
            <small>Available</small>
          </li>
          <li>
            <div class="seat selected"></div>
            <small>Selected</small>
          </li>
          <li>
            <div class="seat sold"></div>
            <small>Sold</small>
          </li>
        </ul>
      </div>
      <input class="btn_seating_submit btn btn-success" type="submit" value="Confirm">
    </div>

    <!-- cinema screen -->
    <div class="container">
      <div class="screen">
        <p>Screen</p>
      </div>
		
	<script>
		<%
			String seatSold = (String)getServletContext().getAttribute("seatSold");
		%>
		let jsSeat = "<%= seatSold %>";
		let seatArray = jsSeat.split(",");

		window.addEventListener("load", (e) => {
			seatArray.forEach((item) => {
				let seatSold = document.getElementById(item);
				seatSold.classList.add("sold");
			});

			  if (
			    e.target.classList.contains("seat") &&
			    !e.target.classList.contains("sold")
			  ) {
			    e.target.classList.toggle("selected");

			    updateSelectedCount();
			  }
			}
		);
	</script>
		
      <!-- row 1 -->	        
        <div class="row">
        <div class="seat" name="seat"><input type="hidden" name="seat" value="${seatBean.seat[0][0]}"></div>
        
        <div class="seat" name="seat">
        	<input type="hidden" name="seat" value="${seatBean.seat[0][1]}">
        </div>
        
        <c:set var="row" value="10" />
        <c:set var="column" value="10" />
        <c:forEach items="row" var="rowV" varStatus="loop">
	        <c:forEach items="column" var="colV" varStatus="loop">
	        	<c:out value='seat${loop.index}${colV}'/>
	        	<%-- <div class="seat"><input type="hidden" name="seat${rowV}${colV}" value="${seatBean.seat[rowV][colV]}"></div> --%>
	        </c:forEach>
        </c:forEach>
        
       <%--  <div class="seat" name="seat"><input type="hidden" name="seat" value="${seatBean.seat[0][2]}"></div>
        <div class="seat" name="seat" value="${seatBean.seat[0][3]}"></div>
        <div class="seat" name="seat" value="${seatBean.seat[0][4]}"></div>
        <div class="seat" name="seat" value="${seatBean.seat[0][5]}"></div>
        <div class="seat" name="seat" value="${seatBean.seat[0][6]}"></div>
        <div class="seat" name="seat" value="${seatBean.seat[0][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[0][15]}"></div> --%>
      </div>

      <!-- row 2 -->
      <%-- <div class="row">
        <div class="seat" name="seat" id="${seatBean.seat[1][0]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][1]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][2]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][3]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][4]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][5]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][6]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[1][15]}"></div>
      </div>

      <!-- row 3 -->
      <div class="row">
        <div class="seat" name="seat" id="${seatBean.seat[2][0]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][1]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][2]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][3]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][4]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][5]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][6]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[2][15]}"></div>
      </div>

      <!-- row 4 -->
      <div class="row">
        <div class="seat" name="seat" id="${seatBean.seat[3][0]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][1]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][2]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][3]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][4]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][5]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][6]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[3][15]}"></div>
      </div>

      <!-- row 5 -->
      <div class="row">
        <div class="seat" name="seat" id="${seatBean.seat[4][0]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][1]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][2]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][3]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][4]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][5]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][6]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[4][15]}"></div>
      </div>

      <!-- row 6 -->
      <div class="row">
        <div class="seat" name="seat" id="${seatBean.seat[5][0]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][1]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][2]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][3]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][4]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][5]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][6]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][7]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][8]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][9]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][10]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][11]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][12]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][13]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][14]}"></div>
        <div class="seat" name="seat" id="${seatBean.seat[5][15]}"></div>
      </div>

      <!-- row 7 -->
      <div class="row">
        <div class="seat" id="${seatBean.seat[6][0]}"></div>
        <div class="seat" id="${seatBean.seat[6][1]}"></div>
        <div class="seat" id="${seatBean.seat[6][2]}"></div>
        <div class="seat" id="${seatBean.seat[6][3]}"></div>
        <div class="seat" id="${seatBean.seat[6][4]}"></div>
        <div class="seat" id="${seatBean.seat[6][5]}"></div>
        <div class="seat" id="${seatBean.seat[6][6]}"></div>
        <div class="seat" id="${seatBean.seat[6][7]}"></div>
        <div class="seat" id="${seatBean.seat[6][8]}"></div>
        <div class="seat" id="${seatBean.seat[6][9]}"></div>
        <div class="seat" id="${seatBean.seat[6][10]}"></div>
        <div class="seat" id="${seatBean.seat[6][11]}"></div>
        <div class="seat" id="${seatBean.seat[6][12]}"></div>
        <div class="seat" id="${seatBean.seat[6][13]}"></div>
        <div class="seat" id="${seatBean.seat[6][14]}"></div>
        <div class="seat" id="${seatBean.seat[6][15]}"></div>
      </div>

      <!-- row 8 -->
      <div class="row">
        <div class="seat" id="${seatBean.seat[7][0]}"></div>
        <div class="seat" id="${seatBean.seat[7][1]}"></div>
        <div class="seat" id="${seatBean.seat[7][2]}"></div>
        <div class="seat" id="${seatBean.seat[7][3]}"></div>
        <div class="seat" id="${seatBean.seat[7][4]}"></div>
        <div class="seat" id="${seatBean.seat[7][5]}"></div>
        <div class="seat" id="${seatBean.seat[7][6]}"></div>
        <div class="seat" id="${seatBean.seat[7][7]}"></div>
        <div class="seat" id="${seatBean.seat[7][8]}"></div>
        <div class="seat" id="${seatBean.seat[7][9]}"></div>
        <div class="seat" id="${seatBean.seat[7][10]}"></div>
        <div class="seat" id="${seatBean.seat[7][11]}"></div>
        <div class="seat" id="${seatBean.seat[7][12]}"></div>
        <div class="seat" id="${seatBean.seat[7][13]}"></div>
        <div class="seat" id="${seatBean.seat[7][14]}"></div>
        <div class="seat" id="${seatBean.seat[7][15]}"></div>
      </div>

      <!-- row 9 -->
      <div class="row">
        <div class="seat" id="${seatBean.seat[8][0]}"></div>
        <div class="seat" id="${seatBean.seat[8][1]}"></div>
        <div class="seat" id="${seatBean.seat[8][2]}"></div>
        <div class="seat" id="${seatBean.seat[8][3]}"></div>
        <div class="seat" id="${seatBean.seat[8][4]}"></div>
        <div class="seat" id="${seatBean.seat[8][5]}"></div>
        <div class="seat" id="${seatBean.seat[8][6]}"></div>
        <div class="seat" id="${seatBean.seat[8][7]}"></div>
        <div class="seat" id="${seatBean.seat[8][8]}"></div>
        <div class="seat" id="${seatBean.seat[8][9]}"></div>
        <div class="seat" id="${seatBean.seat[8][10]}"></div>
        <div class="seat" id="${seatBean.seat[8][11]}"></div>
        <div class="seat" id="${seatBean.seat[8][12]}"></div>
        <div class="seat" id="${seatBean.seat[8][13]}"></div>
        <div class="seat" id="${seatBean.seat[8][14]}"></div>
        <div class="seat" id="${seatBean.seat[8][15]}"></div>
      </div>

      <!-- row 10 -->
      <div class="row">
        <div class="seat" id="${seatBean.seat[9][0]}"></div>
        <div class="seat" id="${seatBean.seat[9][1]}"></div>
        <div class="seat" id="${seatBean.seat[9][2]}"></div>
        <div class="seat" id="${seatBean.seat[9][3]}"></div>
        <div class="seat" id="${seatBean.seat[9][4]}"></div>
        <div class="seat" id="${seatBean.seat[9][5]}"></div>
        <div class="seat" id="${seatBean.seat[9][6]}"></div>
        <div class="seat" id="${seatBean.seat[9][7]}"></div>
        <div class="seat" id="${seatBean.seat[9][8]}"></div>
        <div class="seat" id="${seatBean.seat[9][9]}"></div>
        <div class="seat" id="${seatBean.seat[9][10]}"></div>
        <div class="seat" id="${seatBean.seat[9][11]}"></div>
        <div class="seat" id="${seatBean.seat[9][12]}"></div>
        <div class="seat" id="${seatBean.seat[9][13]}"></div>
        <div class="seat" id="${seatBean.seat[9][14]}"></div>
        <div class="seat" id="${seatBean.seat[9][15]}"></div>
      </div> --%>
    </div>
  </form>

  <!-- Button trigger modal -->
  <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Hall Condition
  </button>

   <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel"><b>Hall Type: ${hallBean.hall_type}</b></h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        	<c:set var="image2" value="${image2}" />
        	<c:set var="imageBase64" value="${Base64.getEncoder().encodeToString(IOUtils.toByteArray(image2))}" />
        	<img src="data:image/jpg;base64,${imageBase64}" class="img-thumbnail" style="max-width: 100%; height:auto;">
          
          <div style="padding-top: 1.5rem;">
            <p>Air Conditioner: ${hallBean.air_cond}</p>
            <p>Sound system: ${hallBean.sound_sys}</p>
          </div>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

  <p class="text">
    You have selected <span id="count">0</span> seat for a price of RM <span id="total">0</span>
  </p>

  <!-- Bootstrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>
</html>