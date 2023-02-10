package model;

public class SalesReport {
	private int branch_id;
	private int user_id;
	private String branch_name;
	private String dispMode;
	
	public int getBranch_id() {
		return branch_id;
	}
	public void setBranch_id(int branch_id) {
		this.branch_id = branch_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getDispMode() {
		return dispMode;
	}
	public void setDispMode(String dispMode) {
		this.dispMode = dispMode;
	}
	
	
}
