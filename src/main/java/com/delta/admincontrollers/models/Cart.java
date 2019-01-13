package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.validator.constraints.Length;

@Entity
public class Cart
{
	@Column(length=100)
	private String uid;
	@Column(length=300)
	private String pid;
	@Id @Column(length=20)
	private String id;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Cart [uid=" + uid + ", pid=" + pid + ", id=" + id + "]";
	}
	
	
}
