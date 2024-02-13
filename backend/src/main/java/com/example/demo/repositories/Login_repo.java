package com.example.demo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.entities.Login;
import com.example.demo.pojo.DummyUser;

public interface Login_repo extends JpaRepository<Login, Integer>{
	
	@Query(value = "select * from login where username like :uname and password like :pass",nativeQuery = true)
	public Login getUserByUsername(String uname,String pass);

	/*@Query(value = "select id from login where username=:uname and password=:pass",nativeQuery = true)
	public int getUserByUsernamepass(String uname,String pass);
	
	@Query("select u from Login u where username like :uname and password like :pass")
	public Login getUserByUserpass(String uname,String pass);

	//@Query("select u from Login u where username like :uname")
	public Login findByUsername(String uname);*/
}
