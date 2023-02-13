package model;

import bdUtil.DetailDAO;

public class Detail {
	private String showtime_time;
	private String showtime_date;
	private String price;
	private String hall_type;
	private String seatSold;
	private String seats;
	private int hall_id;
	private int movie_id;
	private int schedule_id;
	
	DetailDAO movDAO = new DetailDAO();

	Detail() {

	}
	
	public Detail(int schedule_id, int hall_id, int movie_id, String showtime_time, String showtime_date, String seatSold, String seats) {
		this.schedule_id = schedule_id;
		this.hall_id = hall_id;
		this.movie_id = movie_id;
		this.showtime_time = showtime_time;
		this.showtime_date = showtime_date;
		this.seatSold = seatSold;
		this.seats = seats;
	}

	public String getShowtime_time() {
		return showtime_time;
	}

	public void setShowtime_time(String showtime_time) {
		this.showtime_time = showtime_time;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getHall_type() {
		return hall_type;
	}

	public void setHall_type(String hall_type) {
		this.hall_type = hall_type;
	}

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}

	public int getMovie_id() {
		return movie_id;
	}

	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}

	public String getShowtime_date() {
		return showtime_date;
	}

	public void setShowtime_date(String showtime_date) {
		this.showtime_date = showtime_date;
	}

	public String getSeatSold() {
		return seatSold;
	}

	public void setSeatSold(String seatSold) {
		this.seatSold = seatSold;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public int getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
}