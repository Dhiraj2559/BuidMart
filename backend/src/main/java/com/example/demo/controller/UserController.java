package com.example.demo.controller;

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
    	
    	Role r=rl.getRole(cr.getRole());
    	Login c=lservice.saveLogin(new Login(cr.getUsername(),cr.getPassword(),r));
		User a=uservice.saveUser(new User(cr.getFirst_name(),cr.getLast_name(),cr.getContact_number(),cr.getEmail(),r,c));
		System.out.println(cr.getFirst_name()+""+cr.getLast_name()+""+cr.getContact_number());
	    return a;
	    
	}
    
    
    @PostMapping("/login")
    public int userlogin(@RequestBody DummyUser n)
    {
    	int chk=lservice.getLoginByUsername(n.getUsername(),n.getPassword());
    	System.out.println(chk);
    	return chk;
    }
   
   
    @GetMapping("/getUserById" )
    public User getUserByID(@RequestParam int id)
    {
    	return uservice.getUserById(id);
    }

}
