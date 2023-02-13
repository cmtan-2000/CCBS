package model;

//import java.util.ArrayList;

import com.google.gson.Gson;

public class Seat {
	Gson gson = new Gson();	
	
	//private ArrayList<String> seatSoldList;
	
	public String[][] seat = {
			{"A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11", "A12", "A13", "A14", "A15", "A16"},
			{"B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09", "B10", "B11", "B12", "B13", "B14", "B15", "B16"},
			{"C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", "C09", "C10", "C11", "C12", "C13", "C14", "C15", "C16"},
			{"D01", "D02", "D03", "D04", "D05", "D06", "D07", "D08", "D09", "D10", "D11", "D12", "D13", "D14", "D15", "D16"},
			{"E01", "E02", "E03", "E04", "E05", "E06", "E07", "E08", "E09", "E10", "E11", "E12", "E13", "E14", "E15", "E16"},
			{"F01", "F02", "F03", "F04", "F05", "F06", "F07", "F08", "F09", "F10", "F11", "F12", "F13", "F14", "F15", "F16"},
			{"G01", "G02", "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", "G11", "G12", "G13", "G14", "G15", "G16"},
			{"H01", "H02", "H03", "H04", "H05", "H06", "H07", "H08", "H09", "H10", "H11", "H12", "H13", "H14", "H15", "H16"},
			{"I01", "I02", "I03", "I04", "I05", "I06", "I07", "I08", "I09", "I10", "I11", "I12", "I13", "I14", "I15", "I16"},
			{"J01", "J02", "J03", "J04", "J05", "J06", "J07", "J08", "J09", "J10", "J11", "J12", "J13", "J14", "J15", "J16"},
			{"K01", "K02", "K03", "K04", "K05", "K06", "K07", "K08", "K09", "K10", "K11", "K12", "K13", "K14", "K15", "K16"}};
	
	public String[][] getSeat() {
		return seat;
	}

	public void setSeat(String[][] seat) {
		this.seat = seat;
	}
	
	





	public String seatJson = gson.toJson(seat);

	public String[][] seatMap = gson.fromJson(seatJson, String[][].class);
	private int hall_id;
	
//	public int getSize() {
//		return jsonObject.length();
//	}
	
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

	public int getHall_id() {
		return hall_id;
	}

	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
}
