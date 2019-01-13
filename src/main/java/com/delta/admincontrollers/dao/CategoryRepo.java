package com.delta.admincontrollers.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.Category;

@Component
public interface CategoryRepo extends JpaRepository<Category, String>
{
	List<Category> findByParent(String id);

}
