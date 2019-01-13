package com.delta.admincontrollers.models;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class LogList
{
	private List<AdminLog> list;

	public List<AdminLog> getList() {
		return list;
	}

	public void setList(List<AdminLog> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "LogList [list=" + list + "]";
	}
	
}
