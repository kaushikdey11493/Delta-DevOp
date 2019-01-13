package com.delta.admincontrollers.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.Employee;

@Component
public interface EmployeeRepo extends JpaRepository<Employee, String>
{
	List<Employee> findByJobid(String jobid);
}
