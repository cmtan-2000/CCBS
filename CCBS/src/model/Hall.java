package model;

import java.sql.Blob;

public class Hall {
	private int hall_id;
	private Blob hall_picture;
	public String getHall_condition() {
		return hall_condition;
	}
	public void setHall_condition(String hall_condition) {
		this.hall_condition = hall_condition;
	}
	public String getHall_status() {
		return hall_status;
	}
	public void setHall_status(String hall_status) {
		this.hall_status = hall_status;
	}
	private String hall_condition;
	private String hall_status;

	public int getHall_id() {
		return hall_id;
	}
	public void setHall_id(int hall_id) {
		this.hall_id = hall_id;
	}
	public int getBrch_id() {
		return brch_id;
	}
	public void setBrch_id(int brch_id) {
		this.brch_id = brch_id;
	}
	public String getHall_type() {
		return hall_type;
	}
	public void setHall_type(String hall_type) {
		this.hall_type = hall_type;
	}
	public String getSeat_type() {
		return seat_type;
	}
	public void setSeat_type(String seat_type) {
		this.seat_type = seat_type;
	}
	public String getAir_cond() {
		return air_cond;
	}
	public void setAir_cond(String air_cond) {
		this.air_cond = air_cond;
	}
	public String getSound_sys() {
		return Sound_sys;
	}
	public void setSound_sys(String sound_sys) {
		Sound_sys = sound_sys;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	private int brch_id;
	private String hall_type;
	private String seat_type;
	private String air_cond;
	private String Sound_sys;
	private Blob image;
	public void setPhoto(Blob hallPhoto) {
		// TODO Auto-generated method stub
		this.hall_picture = hallPhoto;
	}
	
	
}