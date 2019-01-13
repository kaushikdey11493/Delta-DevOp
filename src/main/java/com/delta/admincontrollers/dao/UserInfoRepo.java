package com.delta.admincontrollers.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import com.delta.admincontrollers.models.UserInfo;

@Component
public interface UserInfoRepo extends JpaRepository<UserInfo, String>
{

}
