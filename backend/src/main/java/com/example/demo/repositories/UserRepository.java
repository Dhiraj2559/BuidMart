package com.example.demo.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.Login;
import com.example.demo.entities.User;
@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("select u from User u where login_id =:id")
	public User getUserByLoginId(int id);

	@Query(value="select * from users where shop_name is not null",nativeQuery = true)
	public List<User> findAllVendors();
	
	@Query("select v.email from User v where role_id=2")
	 public String[] getVendorEmails();

	@Query("select v.email from User v where role_id=1")
	public String[] getCustomerEmails();

	@Query(value="select * from users where role_id=1",nativeQuery = true)
	public List<User> findAllCustomers();

}
