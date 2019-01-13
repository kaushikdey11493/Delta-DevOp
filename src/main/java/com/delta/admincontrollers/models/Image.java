package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Image
{
	@Column(length=300)
	private String pid;
	@Id @Column(length=300)
	private String imgsrc;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	@Override
	public String toString() {
		return "Image [pid=" + pid + ", imgsrc=" + imgsrc + "]";
	}
	
}
