package com.example.demo.pojo;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.example.demo.entities.Login;
import com.example.demo.entities.Role;

public class DummyUser {


	private String first_name;
	
	private String last_name;

	private String contact_number;
	
	private String email;

	int role;
	
	Login log;
	
	private String shop_name;
	
	private int experience;

	private float rates;

	private String status;
	
	private String password;

	private String username;

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getContact_number() {
		return contact_number;
	}

	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public Login getLog() {
		return log;
	}

	public void setLog(Login log) {
		this.log = log;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public int getExperience() {
		return experience;
	}

	public void setExperience(int experience) {
		this.experience = experience;
	}

	public float getRates() {
		return rates;
	}

	public void setRates(float rates) {
		this.rates = rates;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public DummyUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DummyUser(String first_name, String last_name, String contact_number, String email, int role, Login log,
			String shop_name, int experience, float rates, String status, String password, String username) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.contact_number = contact_number;
		this.email = email;
		this.role = role;
		this.log = log;
		this.shop_name = shop_name;
		this.experience = experience;
		this.rates = rates;
		this.status = status;
		this.password = password;
		this.username = username;
	}

	@Override
	public String toString() {
		return "DummyUser [first_name=" + first_name + ", last_name=" + last_name + ", contact_number=" + contact_number
				+ ", email=" + email + ", role=" + role + ", log=" + log + ", shop_name=" + shop_name + ", experience="
				+ experience + ", rates=" + rates + ", status=" + status + ", password=" + password + ", username="
				+ username + "]";
	}
	
	
}
