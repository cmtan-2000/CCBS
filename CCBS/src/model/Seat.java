package model;

import com.google.gson.Gson;

public class Seat {
	Gson gson = new Gson();
	
	public String[][] seat = {{"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"},{"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"}};;
	public String seatJson = gson.toJson(seat);
	
	public String[][] seatMap = gson.fromJson(seatJson, String[][].class);

	public String getSeatJson() {
		return seatJson;
	}

	public void setSeatJson(String seatJson) {
		this.seatJson = seatJson;
	}

	public String[][] getSeatMap() {
		return seatMap;
	}

	public void setSeatMap(String[][] seatMap) {
		this.seatMap = seatMap;
	}
	
}
