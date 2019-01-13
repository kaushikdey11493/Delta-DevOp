package com.delta.admincontrollers.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Category 
{
	@Id @Column(length=200)
	private String catid;
	@Column(length=300)
	private String catname;
	@Column(length=300)
	private String imgsrc;
	@Column(length=300)
	private String parent;
	public String getCatid() {
		return catid;
	}
	public void setCatid(String catid) {
		this.catid = catid;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	@Override
	public String toString() {
		return "Category [catid=" + catid + ", catname=" + catname + ", imgsrc=" + imgsrc + ", parent=" + parent + "]";
	}
	
	
}
