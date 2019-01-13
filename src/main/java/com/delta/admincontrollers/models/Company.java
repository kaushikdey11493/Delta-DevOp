package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Company
{
	@Id @Column(length=100)
	private String cid;
	@Column(length=100)
	private String cname;
	@Column(length=200)
	private String cwebsite;
	@Column(length=11)
	private int noofpro;
	@Column(length=100)
	private String country;
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCwebsite() {
		return cwebsite;
	}
	public void setCwebsite(String cwebsite) {
		this.cwebsite = cwebsite;
	}
	public int getNoofpro() {
		return noofpro;
	}
	public void setNoofpro(int noofpro) {
		this.noofpro = noofpro;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Override
	public String toString() {
		return "Company [cid=" + cid + ", cname=" + cname + ", cwebsite=" + cwebsite + ", noofpro=" + noofpro
				+ ", country=" + country + "]";
	}
	
}
