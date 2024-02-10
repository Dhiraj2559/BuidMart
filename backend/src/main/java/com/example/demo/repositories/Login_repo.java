package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Login;
import com.example.demo.pojo.DummyUser;

public interface Login_repo extends JpaRepository<Login, Integer>{
	
	@Query(value = "select * from login where username=:uname and password=:pass",nativeQuery = true)
	public DummyUser getUserByUsername(String uname,String pass);

}
