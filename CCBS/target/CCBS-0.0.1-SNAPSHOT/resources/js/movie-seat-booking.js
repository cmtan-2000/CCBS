window.addEventListener("load", (e) => {
	
	const container = document.querySelector(".container");
	
	const seats = document.querySelectorAll(".row .seat:not(.sold)");
	const count = document.getElementById("count");
	const total = document.getElementById("total");
	const movieSelect = document.getElementById('movie');

	populateUI();
	console.log("movieSelect: " + movieSelect);
	console.log("movieSelect.value: " + movieSelect.getAttribute('value'));
	
	let ticketPrice = +movieSelect.getAttribute('value');	
	
	// Save selected movie index and price
	function setMovieData(movieIndex, moviePrice) {
	  localStorage.setItem("selectedMovieIndex", movieIndex);
	  localStorage.setItem("selectedMoviePrice", moviePrice);
	}

	seatArray.forEach((item) => {
		let seatSold = document.getElementById(item);
		console.log(item, seatSold);
		seatSold.classList.add("sold");
	});
	
	// Update total and count
	function updateSelectedCount() {
	  const selectedSeats = document.querySelectorAll(".row .seat.selected");
	  
//		console.log(seatedArray, document.getElementById("seat"));
//		
//		document.getElementById("seat").value = seatedArray;
//		
//		console.log(document.getElementById("seat").value);

	  const seatsIndex = [...selectedSeats].map((seat) => [...seats].indexOf(seat));
	  const seatArray = [...selectedSeats].map((seat) => seat.getAttribute("value"));

	  localStorage.setItem("selectedSeats", JSON.stringify(seatsIndex));

	  const selectedSeatsCount = selectedSeats.length;

	  count.innerText = selectedSeatsCount;
	  total.innerText = selectedSeatsCount * ticketPrice;
	  document.getElementById("seat").value = seatArray.toString();
	  
	  console.log(document.getElementById("seat").value);

	  setMovieData(movieSelect.selectedIndex, movieSelect.value);
	}

	// Get data from localstorage and populate UI
	function populateUI() {
	  const selectedSeats = JSON.parse(localStorage.getItem("selectedSeats"));

	  if (selectedSeats !== null && selectedSeats.length > 0) {
	    seats.forEach((seat, index) => {
	      if (selectedSeats.indexOf(index) > -1) {
	        console.log(seat.classList.add("selected"));
	      }
	    });
	  }

	  const selectedMovieIndex = localStorage.getItem("selectedMovieIndex");
	 
	  if (selectedMovieIndex !== null) {
	    movieSelect.selectedIndex = selectedMovieIndex;
	  }
	  
	  console.log(movieSelect.selectedIndex);
	}
	console.log(populateUI())
	// Movie select event
	movieSelect.addEventListener("change", (e) => {
	  ticketPrice = +e.target.value;
	  setMovieData(e.target.selectedIndex, e.target.value);
	  updateSelectedCount();
	});
	
	var seatedArray = [];

	// Seat click event
	container.addEventListener("click", (e) => {
	  if (
	    e.target.classList.contains("seat") &&
	    !e.target.classList.contains("sold")
	  ) {
	    e.target.classList.toggle("selected");
		if(!seatedArray.includes(e.target.getAttribute("value"))){
			seatedArray.push(e.target.getAttribute("value"));
		}
		else{
			let indexSeat = seatedArray.indexOf(e.target.getAttribute("value"));
			seatedArray.splice(indexSeat, 1);
		}
		
//	    e.target.innerHTML += '<input type="hidden" name="seat${row}${col}" value="${row}${col}">';
	    updateSelectedCount();
	  }
	});
	
	

	// Initial count and total set
	updateSelectedCount();
});

