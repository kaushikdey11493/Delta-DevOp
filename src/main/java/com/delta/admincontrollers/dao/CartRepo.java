package com.delta.admincontrollers.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.Cart;

@Component
public interface CartRepo extends JpaRepository<Cart, String>
{
	public List<Cart> findByUid(String uid);

}
