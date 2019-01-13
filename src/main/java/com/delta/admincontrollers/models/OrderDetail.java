package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class OrderDetail 
{
	@Column(length=100)
	private String uid;
	@Column(length=300)
	private String pid;
	@Column(length=100)
	private String orderdate;
	@Column(length=100)
	private String deliverydate;
	@Id @Column(length=20)
	private String oid;
	@Column(length=8,precision=2)
	private double price;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getDeliverydate() {
		return deliverydate;
	}
	public void setDeliverydate(String deliverydate) {
		this.deliverydate = deliverydate;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "OrderDetail [uid=" + uid + ", pid=" + pid + ", orderdate=" + orderdate + ", deliverydate="
				+ deliverydate + ", oid=" + oid + ", price=" + price + "]";
	}
		
}
