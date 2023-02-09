package model;

import bdUtil.FABDAO;

public class FAB {

	private int fab_id;
	private int user_id;
	private String name;
	private double price;
	private int stock_quantity;

	FABDAO fabDAO = new FABDAO();

	public FAB() {
	}

	public FAB(int fab_id, int user_id, String name, double price, int stock_quantity) {
		this.fab_id = fab_id;
		this.user_id = user_id;
		this.name = name;
		this.price = price;
		this.stock_quantity = stock_quantity;
	}

	public int getFab_id() {
		return fab_id;
	}

	public void setFab_id(int fab_id) {
		this.fab_id = fab_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock_quantity() {
		return stock_quantity;
	}

	public void setStock_quantity(int stock_quantity) {
		this.stock_quantity = stock_quantity;
	}

	public FABDAO getFabDAO() {
		return fabDAO;
	}

	public void setFabDAO(FABDAO fabDAO) {
		this.fabDAO = fabDAO;
	}
	
	
}