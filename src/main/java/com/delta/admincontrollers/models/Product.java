package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Product
{
	@Id @Column(length=300)
	private String pid;
	@Column(length=300)
	private String pname;
	@Column(length=100)
	private String cid;
	@Column(length=700)
	private String pdetails;
	@Column(length=8,precision=2)
	private double price;
	@Column(length=8,precision=2)
	private double dprice;
	@Column(length=100)
	private String empid;
	@Column(length=100)
	private String category;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPdetails() {
		return pdetails;
	}
	public void setPdetails(String pdetails) {
		this.pdetails = pdetails;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getDprice() {
		return dprice;
	}
	public void setDprice(double dprice) {
		this.dprice = dprice;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", cid=" + cid + ", pdetails=" + pdetails + ", price="
				+ price + ", dprice=" + dprice + ", empid=" + empid + ", category=" + category
				+ "]";
	}
	
	
	 
}
