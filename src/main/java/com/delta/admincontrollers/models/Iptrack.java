package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Iptrack 
{
	@Id @Column(length=20)
	private String id;
	@Column(length=50)
	private String ipaddress;
	@Column(length=50)
	private String date;
	@Column(length=100)
	private String detail;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "Iptrack [id=" + id + ", ipaddress=" + ipaddress + ", date=" + date + ", detail=" + detail + "]";
	}
	
}
