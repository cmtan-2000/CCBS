package model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private int user_id;
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	private String userName, password, name, phoneNo, address, state, town;
	private Double amount;
	
	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Blob getPhotoFile() { 
		return photoFile;
	}

	public void setPhotoFile(Blob photoFile) {
		this.photoFile = photoFile;
	}

	private int type;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date dob;
	
	private Blob photoFile;
	
	public User() {}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String getUserName() {
		return this.userName;
	}
	
	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return this.password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
}