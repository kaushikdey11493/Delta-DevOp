package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Employee
{
	@Id @Column(length=100)
	private String email;
	@Column(length=100)
	private String name;
	@Column(length=15)
	private String phone;
	@Column(length=100)
	private String address;
	@Column(length=100)
	private String password;
	@Column(length=100)
	private String jobid;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getJobid() {
		return jobid;
	}
	public void setJobid(String jobid) {
		this.jobid = jobid;
	}
	@Override
	public String toString() {
		return "Employee [email=" + email + ", name=" + name + ", phone=" + phone + ", address=" + address
				+ ", password=" + password + ", jobid=" + jobid + "]";
	}
}
