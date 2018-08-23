package com.fsoft.model;

public class BillingInfo {
	String email;
	String fullname;
	String address;
	String phone;
	Integer postCode;
	String country;

	public BillingInfo() {
		super();
	}

	public BillingInfo(String email, String fullname, String address, String phone, Integer postCode, String country) {
		super();
		this.email = email;
		this.fullname = fullname;
		this.address = address;
		this.phone = phone;
		this.postCode = postCode;
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getPostCode() {
		return postCode;
	}

	public void setPostCode(Integer postCode) {
		this.postCode = postCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
}
