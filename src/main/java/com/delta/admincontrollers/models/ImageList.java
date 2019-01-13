package com.delta.admincontrollers.models;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ImageList
{
	List<Image> list;

	public List<Image> getList() {
		return list;
	}

	public void setList(List<Image> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ImageList [list=" + list + "]";
	}
	
}
