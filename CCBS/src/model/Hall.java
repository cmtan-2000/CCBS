package model;

import java.sql.Blob;

public class Hall {
	private String air_cond;
	private String sound_sys;
	private String hall_type;
	private Blob photo;
	
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	public String getAir_cond() {
		return air_cond;
	}
	public void setAir_cond(String air_cond) {
		this.air_cond = air_cond;
	}
	public String getSound_sys() {
		return sound_sys;
	}
	public void setSound_sys(String sound_sys) {
		this.sound_sys = sound_sys;
	}
	public String getHall_type() {
		return hall_type;
	}
	public void setHall_type(String hall_type) {
		this.hall_type = hall_type;
	}
	
}
