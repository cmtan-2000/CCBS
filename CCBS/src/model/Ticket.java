package model;

import java.sql.Date;

public class Ticket {
	private String movieName;
	private Date showDate;
	private Date ticketDate;
	private String showTime;
	private String movieType;
	private Double moviePrice;
	private Double foodPrice;
	private Double drinkPrice;
	private String foodName;
	private String drinkName;
	private int foodAmount;
	private int drinkAmount;
	private String ticketType;
	private double totalPrice;
	private String seat;
	private int seatCount;
	private String comboName;
	private double comboPrice;
	private int comboAmount;
	
	public String getComboName() {
		return comboName;
	}
	public void setComboName(String comboName) {
		this.comboName = comboName;
	}
	public double getComboPrice() {
		return comboPrice;
	}
	public void setComboPrice(double comboPrice) {
		this.comboPrice = comboPrice;
	}
	public int getComboAmount() {
		return comboAmount;
	}
	public void setComboAmount(int comboAmount) {
		this.comboAmount = comboAmount;
	}
	public Date getTicketDate() {
		return ticketDate;
	}
	public void setTicketDate(Date ticketDate) {
		this.ticketDate = ticketDate;
	}
	
	public int getSeatCount() {
		return seatCount;
	}
	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Date getShowDate() {
		return showDate;
	}
	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}
	public String getShowTime() {
		return showTime;
	}
	public void setShowTime(String showTime) {
		this.showTime = showTime;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public Double getMoviePrice() {
		return moviePrice;
	}
	public void setMoviePrice(Double moviePrice) {
		this.moviePrice = moviePrice;
	}
	public Double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(Double foodPrice) {
		this.foodPrice = foodPrice;
	}
	public Double getDrinkPrice() {
		return drinkPrice;
	}
	public void setDrinkPrice(Double drinkPrice) {
		this.drinkPrice = drinkPrice;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getDrinkName() {
		return drinkName;
	}
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	public int getFoodAmount() {
		return foodAmount;
	}
	public void setFoodAmount(int foodAmount) {
		this.foodAmount = foodAmount;
	}
	public int getDrinkAmount() {
		return drinkAmount;
	}
	public void setDrinkAmount(int drinkAmount) {
		this.drinkAmount = drinkAmount;
	}
	public String getTicketType() {
		return ticketType;
	}
	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}
}