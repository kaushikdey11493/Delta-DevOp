package com.delta.admincontrollers.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.delta.admincontrollers.models.Iptrack;

public interface IptrackRepo extends JpaRepository<Iptrack, String>
{

}
