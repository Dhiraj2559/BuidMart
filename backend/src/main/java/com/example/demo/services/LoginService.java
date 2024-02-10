package com.example.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Login;
import com.example.demo.entities.User;
import com.example.demo.pojo.DummyUser;
import com.example.demo.repositories.Login_repo;

@Service
public class LoginService {

	@Autowired
	Login_repo lrepo;
	
	public Login saveLogin(Login u)
	{
		return lrepo.save(u);
	}
	
	public int getLoginByUsername(String uname,String pass)
	{
		System.out.println(uname+" "+pass);
		DummyUser re= lrepo.getUserByUsername(uname,pass);
		int res;
		if(re.getRole()==1)
			res=1;
		if(re.getRole()==2)
			res=2;
		if(re.getRole()==3)
			res=3;
		else res=8;
		 return res;
	}
	
}
