package com.delta.admincontrollers.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.Product;

@Component
public interface ProductRepo extends JpaRepository<Product, String>
{

	List<Product> findByCid(String id);
	List<Product> findByCategory(String cat);
	
}
