package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class UserInfo
{
	@Id @Column(length=100)
	String email;
	@Column(length=100)
	String name;
	@Column(length=15)
	String phone;
	@Column(length=100)
	String password;
	@Column(length=100)
	String country;
	@Column(length=100)
	String state;
	@Column(length=100)
	String city;
	@Column(length=100)
	String town;
	@Column(length=100)
	String street_no;
	@Column(length=5)
	String house_no;
	@Column(length=300)
	String nearby;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getStreet_no() {
		return street_no;
	}
	public void setStreet_no(String street_no) {
		this.street_no = street_no;
	}
	public String getHouse_no() {
		return house_no;
	}
	public void setHouse_no(String house_no) {
		this.house_no = house_no;
	}
	public String getNearby() {
		return nearby;
	}
	public void setNearby(String nearby) {
		this.nearby = nearby;
	}
	@Override
	public String toString() {
		return "userinfo [email=" + email + ", name=" + name + ", phone=" + phone + ", password=" + password
				+ ", country=" + country + ", state=" + state + ", city=" + city + ", town=" + town + ", street_no="
				+ street_no + ", house_no=" + house_no + ", nearby=" + nearby + "]";
	}
	
	
}
