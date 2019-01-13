package com.delta.admincontrollers.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.OrderDetail;

@Component
public interface OrderDetailRepo extends JpaRepository<OrderDetail, String>
{
	List<OrderDetail> findByUid(String uid);
}
