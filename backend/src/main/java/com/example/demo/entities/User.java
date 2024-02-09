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
}
