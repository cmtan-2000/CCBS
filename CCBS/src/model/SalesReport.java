package model;

public class SalesReport {
	private String brch_name;
	private String cpy_name;
	private String filter;
	private double ticket_total;
	private double snackBvg_total;
	
	public String getBrch_name() {
		return brch_name;
	}
	public void setBrch_name(String brch_name) {
		this.brch_name = brch_name;
	}
	public String getCpy_name() {
		return cpy_name;
	}
	public void setCpy_name(String cpy_name) {
		this.cpy_name = cpy_name;
	}
	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
	public double getTicket_total() {
		return ticket_total;
	}
	public void setTicket_total(double ticket_total) {
		this.ticket_total = ticket_total;
	}
	public double getSnackBvg_total() {
		return snackBvg_total;
	}
	public void setSnackBvg_total(double snackBvg_total) {
		this.snackBvg_total = snackBvg_total;
	}
	
	
}
