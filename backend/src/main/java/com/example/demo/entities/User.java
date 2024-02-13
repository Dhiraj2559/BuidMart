package com.example.demo.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY )
	private int id;
	
	@Column
	private String first_name;
	
	@Column
	private String last_name;

	@Column
	private String contact_number;
	
	@Column
	private String email;

	@ManyToOne
	@Cascade(value = CascadeType.ALL)
	@JoinColumn(name="role_id")
	Role role;
	
	@OneToOne
	@Cascade(value = CascadeType.ALL)
	@JoinColumn(name="login_id")
	Login log;
	
	@Column
	private String shop_name;
	
	@Column
	private int experience;
	
	@Column
	private float rates;
	
	@Column
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
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

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String first_name, String last_name, String contact_number, String email, Role role, Login log,
			String shop_name, int experience, float rates, String status) {
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
	}

	public User(String first_name1, String last_name1, String contact_number1, String email, Role role, Login log) {
		// TODO Auto-generated constructor stub
		super();
		this.first_name = first_name1;
		this.last_name = last_name1;
		this.contact_number = contact_number1;
		this.email = email;
		this.role = role;
		this.log = log;
	}

	public User(String first_name, String last_name, String contact_number, String email, Role role, Login log,
			String shop_name) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.contact_number = contact_number;
		this.email = email;
		this.role = role;
		this.log = log;
		this.shop_name = shop_name;
	}
	public User(String first_name, String last_name, String contact_number, String email, Role role, Login log,
			int experience, float rates, String status) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.contact_number = contact_number;
		this.email = email;
		this.role = role;
		this.log = log;
		this.experience = experience;
		this.rates = rates;
		this.status = status;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", first_name=" + first_name + ", last_name=" + last_name + ", contact_number="
				+ contact_number + ", email=" + email + ", role=" + role + ", log=" + log + ", shop_name=" + shop_name
				+ ", experience=" + experience + ", rates=" + rates + ", status=" + status + "]";
	}
	
	
}
