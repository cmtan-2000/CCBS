package model;

public class Price {
	private double td;
	private double dualMax;
	private double deluxe;
	private double premium;
	private double daab;
	private double classic;
	
	public Price() {}
	
	public Price(double td, double dualMax, double deluxe, double premium, double daab, double classic) {
		super();
		this.td = td;
		this.dualMax = dualMax;
		this.deluxe = deluxe;
		this.premium = premium;
		this.daab = daab;
		this.classic = classic;
	}
	public double getTd() {
		return td;
	}
	public void setTd(double td) {
		this.td = td;
	}
	public double getDualMax() {
		return dualMax;
	}
	public void setDualMax(double dualMax) {
		this.dualMax = dualMax;
	}
	public double getDeluxe() {
		return deluxe;
	}
	public void setDeluxe(double deluxe) {
		this.deluxe = deluxe;
	}
	public double getPremium() {
		return premium;
	}
	public void setPremium(double premium) {
		this.premium = premium;
	}
	public double getDaab() {
		return daab;
	}
	public void setDaab(double daab) {
		this.daab = daab;
	}
	public double getClassic() {
		return classic;
	}
	public void setClassic(double classic) {
		this.classic = classic;
	}
	
}
