package model;

import bdUtil.SalesReportDAO;

public class SalesReport {
	private String brch_name;
	private String cpy_name;
	private String filter;
	private String name;
	private String date;
	private double ticket_ttl;
	private double snackBeverage_ttl;
	
	SalesReportDAO sReportDAO = new SalesReportDAO();
	
	SalesReport(){
		
	}
	
	public SalesReport(double ticket_ttl, double snackBeverage_ttl, String date, String name) {
		this.ticket_ttl = ticket_ttl;
		this.snackBeverage_ttl = snackBeverage_ttl;
		this.date = date;
		this.name = name;
	}
	
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
		return ticket_ttl;
	}
	public void setTicket_total(double ticket_total) {
		this.ticket_ttl = ticket_total;
	}
	public double getSnackBvg_total() {
		return snackBeverage_ttl;
	}
	public void setSnackBvg_total(double snackBvg_total) {
		this.snackBeverage_ttl = snackBvg_total;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	public double getTicket_ttl() {
		return ticket_ttl;
	}

	public void setTicket_ttl(double ticket_ttl) {
		this.ticket_ttl = ticket_ttl;
	}

	public double getSnackBeverage_ttl() {
		return snackBeverage_ttl;
	}

	public void setSnackBeverage_ttl(double snackBeverage_ttl) {
		this.snackBeverage_ttl = snackBeverage_ttl;
	}
	
	
}
