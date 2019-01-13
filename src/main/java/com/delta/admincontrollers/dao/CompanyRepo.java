package com.delta.admincontrollers.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.Company;

@Component
public interface CompanyRepo extends JpaRepository<Company, String>
{
	
}
