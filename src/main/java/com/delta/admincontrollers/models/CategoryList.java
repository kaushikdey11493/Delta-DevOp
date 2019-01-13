package com.delta.admincontrollers.models;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class CategoryList
{
	private List<Category> list;

	public List<Category> getList() {
		return list;
	}

	public void setList(List<Category> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "CategoryList [list=" + list + "]";
	}
	
}
