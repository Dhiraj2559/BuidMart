package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entities.Login;
import com.example.demo.entities.Role;
import com.example.demo.entities.User;
import com.example.demo.pojo.DummyUser;
import com.example.demo.services.LoginService;
import com.example.demo.services.Role_Service;
import com.example.demo.services.UserService;
@RestController
@CrossOrigin(origins = "http://localhost:3000")
public class UserController {
	
    @Autowired
	UserService uservice;
    
    @Autowired
    LoginService lservice;
    
    @Autowired
    Role_Service rl;
    
    @PostMapping("/userRegister")
	public User registerCustomer(@RequestBody DummyUser cr)
	{
    	User a=null;
    	Role r=rl.getRole(cr.getRole());
    	Login c=lservice.saveLogin(new Login(cr.getUsername(),cr.getPassword(),r));
    	if(cr.getRole()==1)
    	{
		a=uservice.saveUser(new User(cr.getFirst_name(),cr.getLast_name(),cr.getContact_number(),cr.getEmail(),r,c));
    	}
    	else if(cr.getRole()==2)
    	{
		 a=uservice.saveUser(new User(cr.getFirst_name(),cr.getLast_name(),cr.getContact_number(),cr.getEmail(),r,c,cr.getShop_name()));
    	}
    	else if(cr.getRole()==3)
    	{
		 a=uservice.saveUser(new User(cr.getFirst_name(),cr.getLast_name(),cr.getContact_number(),cr.getEmail(),r,c,cr.getExperience(),cr.getRates(),cr.getStatus()));
    	}
		System.out.println(cr.getFirst_name()+""+cr.getLast_name()+""+cr.getContact_number());
	    return a;
	    
	}
    
    @PostMapping("/checkLogin")
    public User checkLogin(@RequestBody Login l)
    {
    	String uname=l.getUsername();
    	String pass=l.getPassword();

    	Login u=lservice.getLoginByUsername(uname, pass);
    	
    	User logged=uservice.getUserByLoginId(u.getId());
    	System.out.println(logged);
    	return logged;
    }
    
    @GetMapping("/getVendors")
	   public List<User> getVendors()
	   {
		   return uservice.getAllVendors();
	   }
    
    @GetMapping("/getVendorByUid")
	 public User getVendorById(@RequestParam int uid )
	 {
	   
		 return uservice.getUserById(uid);
	 }
    
    @GetMapping("/getVendorEmails")
	   public String[] getVendEmails()
	   {
	    	return uservice.getVendEmails();
	   }
    
    @GetMapping("/getUserById" )
    public User getUserByID(@RequestParam int id)
    {
    	return uservice.getUserById(id);
    }
    
    @GetMapping("/getCustEmails")
	   public String[] getCustEmails()
	    {
	    	return uservice.getCustEmails();
	   }
	    
	 
	 @GetMapping("/getCustomers")
	 public List<User> getAllCustomers()
	 {
		 return uservice.getAllCustomers();
	 }
	 
	 
	 @GetMapping("/getCustomerByUid")
	 public User getCustById(@RequestParam int uid )
	 {
		 return uservice.getUserById(uid);
	 }

}
