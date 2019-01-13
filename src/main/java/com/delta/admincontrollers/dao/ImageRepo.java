package com.delta.admincontrollers.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.delta.admincontrollers.models.Image;

public interface ImageRepo extends JpaRepository<Image, String>
{
	public List<Image> findByPid(String pid);
	
	public void deleteByPid(String pid);
}
