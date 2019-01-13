package com.delta.admincontrollers.models;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value="prototype")
public class CartList
{
	private List<Cart> list;

	public List<Cart> getList() {
		return list;
	}

	public void setList(List<Cart> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "CartList [list=" + list + "]";
	}
		
}
