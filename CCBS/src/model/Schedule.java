package model;

import java.sql.Time;
import java.util.Date;

public class Schedule {
	private int hall_id;
	private int movie_id;
	private int showtime_time;
	private String showtime_date;
	private String seatSold;
	private String seats;
	
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
	public int getShowtime_time() {
		return showtime_time;
	}
	public void setShowtime_time(int showtime_time) {
		this.showtime_time = showtime_time;
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
}
