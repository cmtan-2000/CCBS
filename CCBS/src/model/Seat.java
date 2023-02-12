package model;

import com.google.gson.Gson;

public class Seat {
	Gson gson = new Gson();
	
	public String[][] seat = {
			{"A01", "A02", "A03", "A04", "A05", "A06", "A07", "A08", "A09", "A10", "A11"},
			{"B01", "B02", "B03", "B04", "B05", "B06", "B07", "B08", "B09", "B10", "B11"},
			{"C01", "C02", "C03", "C04", "C05", "C06", "C07", "C08", "C09", "C10", "C11"},
			{"D01", "D02", "D03", "D04", "D05", "D06", "D07", "D08", "D09", "D10", "D11"},
			{"E01", "E02", "E03", "E04", "E05", "E06", "E07", "E08", "E09", "E10", "E11"},
			{"F01", "F02", "F03", "F04", "F05", "F06", "F07", "F08", "F09", "F10", "F11"},
			{"G01", "G02", "G03", "G04", "G05", "G06", "G07", "G08", "G09", "G10", "G11"},
			{"H01", "H02", "H03", "H04", "H05", "H06", "H07", "H08", "H09", "H10", "H11"},
			{"I01", "I02", "I03", "I04", "I05", "I06", "I07", "I08", "I09", "I10", "I11"},
			{"J01", "J02", "J03", "J04", "J05", "J06", "J07", "J08", "J09", "J10", "J11"},
			{"K01", "K02", "K03", "K04", "K05", "K06", "K07", "K08", "K09", "K10", "K11"}};
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
