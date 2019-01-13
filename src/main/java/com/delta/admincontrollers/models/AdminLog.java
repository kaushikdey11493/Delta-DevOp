package com.delta.admincontrollers.models;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AdminLog
{
	String email;
	@Id
	String date_time;
	
	public AdminLog() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminLog(String email, String date_time)
	{
		this.email = email;
		this.date_time = date_time;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	@Override
	public String toString() {
		return "AdminLog [email=" + email + ", date_time=" + date_time + "]";
	}
	
}
