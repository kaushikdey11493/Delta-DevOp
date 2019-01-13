package com.delta.admincontrollers.models;

import java.util.List;
import org.springframework.stereotype.Component;

@Component
public class CompanyList
{
	private List<Company> list;

	public List<Company> getList() {
		return list;
	}

	public void setList(List<Company> list) {
		this.list = list;
	}
	
}
