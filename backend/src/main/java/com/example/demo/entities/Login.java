package com.example.demo.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="login")
public class Login {

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY )
	private int id;
	
	@Column
	private String password;
	
	@Column
	private String username;
	
	@ManyToOne
	@Cascade(value = CascadeType.ALL)
	@JoinColumn(name="role_id")
	Role role;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Login(int id, String password, String username, Role role) {
		super();
		this.id = id;
		this.password = password;
		this.username = username;
		this.role = role;
	}
	
	
}
