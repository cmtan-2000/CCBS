package model;

public class Branch {
	private int brch_id;
	private int user_id;
	private String brch_name;
	private String brch_addr;
	private String brch_post;
	private String brch_city;
	private String state;
	
	
	public int getBrch_id() {
		return brch_id;
	}
	public void setBrch_id(int brch_id) {
		this.brch_id = brch_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBrch_addr() {
		return brch_addr;
	}
	public String getBrch_post() {
		return brch_post;
	}
	public void setBrch_post(String brch_post) {
		this.brch_post = brch_post;
	}
	public void setBrch_addr(String brch_addr) {
		this.brch_addr = brch_addr;
	}
	public String getBrch_city() {
		return brch_city;
	}
	public void setBrch_city(String brch_city) {
		this.brch_city = brch_city;
	}
	public String getBrch_name() {
		return brch_name;
	}
	public void setBrch_name(String brch_name) {
		this.brch_name = brch_name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	
	
}
