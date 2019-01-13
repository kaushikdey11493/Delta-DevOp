package com.delta.admincontrollers.models;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope(value="prototype")
public class OrderList 
{
	private List<OrderDetail> list;

	public List<OrderDetail> getList() {
		return list;
	}

	public void setList(List<OrderDetail> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "OrderList [list=" + list + "]";
	}
	
}
