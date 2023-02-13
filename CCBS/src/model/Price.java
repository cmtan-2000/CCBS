package model;

public class Price {
	private double twoD; //2D
	private double threeD;//3d
	private double dualMax;
	private double deluxe;
	private double premium;
	private double classic;
	
	public Price() {}
	
	public Price(double twoD, double threeD, double dualMax, double deluxe, double premium, double classic) {
		super();
		this.twoD = twoD;
		this.threeD = threeD;
		this.dualMax = dualMax;
		this.deluxe = deluxe;
		this.premium = premium;
		this.classic = classic;
	}

	public double getTwoD() {
		return twoD;
	}

	public void setTwoD(double twoD) {
		this.twoD = twoD;
	}

	public double getThreeD() {
		return threeD;
	}

	public void setThreeD(double threeD) {
		this.threeD = threeD;
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

	public double getClassic() {
		return classic;
	}

	public void setClassic(double classic) {
		this.classic = classic;
	}
	
}