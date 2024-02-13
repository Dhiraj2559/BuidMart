package com.example.demo.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Login;
import com.example.demo.entities.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
	UserRepository urepo;
    
   
	public User saveUser(User u)
	{
		return urepo.save(u);
	}
	
	public User getUserById(int id)
	{
		System.out.println(id);
		 Optional<User> or=urepo.findById(id);
		 User r=null;
		 try
		 {
			 if(or!=null)
			 {
				 r=or.get();
			 }
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return r;
	}

	public User getUserByLoginId(int id) {
		return urepo.getUserByLoginId(id);
	}

	public List<User> getAllVendors() {
		
		return urepo.findAllVendors();
	}


	public String[] getVendEmails() {
		
		return urepo.getVendorEmails();
	}

	public String[] getCustEmails() {
		// TODO Auto-generated method stub
		return urepo.getCustomerEmails();
	}

	public List<User> getAllCustomers() {
		
		return urepo.findAllCustomers();
	}
	
	
}
