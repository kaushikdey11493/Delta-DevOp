package com.delta.admincontrollers.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.AdminLog;

@Component
public interface AdminLogRepo extends JpaRepository<AdminLog, String>
{

}
